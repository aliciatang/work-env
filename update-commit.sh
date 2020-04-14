#!/bin/sh
set -e
review_id=$1

if [[ -z "$review_id" ]]; then
  review_id=$(git config branch.$(git rev-parse --abbrev-ref HEAD).reviewId)
  if [[ -z "$review_id" ]]; then
    read -p "Enter Review ID: " review_id
  fi
else
  review_id=$1
fi

git config --local "branch.$(git rev-parse --abbrev-ref HEAD).reviewid" "${review_id}"


review_json=$(mktemp)
reviewers_json=$(mktemp)

function delete_files {
  rm -f $review_json $reviewers_json
}
trap delete_files EXIT

rbt api-get /review-requests/$review_id > $review_json


groups=$(jq '.review_request.target_groups[].title' $review_json | jq -r -s '. | join(",")')
reviewers=$(jq '.review_request.target_people[].title' $review_json | jq -r -s '. | join(",")')
description=$(jq -r '.review_request.description' $review_json)
testing_done=$(jq -r '.review_request.testing_done' $review_json)
summary=$(jq -r '.review_request.summary' $review_json)
bugs_closed=$(jq -r '.review_request.bugs_closed[]' $review_json)

rbt api-get /review-requests/$review_id/reviews > $reviewers_json
accepted_by=$(jq '.reviews[] | select(.ship_it) | .links.user.title' $reviewers_json | jq -r -s '. | join(",")' | sort -u)

if [[ "$summary" == "$description" ]]; then
  description=""
else
  description="$description"
fi

git commit --amend -m "
$summary

$description


Testing Done:
$testing_done

JIRA: $bugs_closed

RB=$review_id
G=$groups
R=$reviewers
A=$accepted_by
"