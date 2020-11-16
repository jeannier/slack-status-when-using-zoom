#!/usr/bin/env bash

# "User token", needs to start with "xoxp-"
token='xoxp-xxx-xxx-xxx-xxx'

# Checking if we're in a Zoom meeting
osascript -e 'tell application "System Events" to get the {title} of every window of (every process whose visible is true)'|grep -e "zoom share\|zoom floating\|Zoom Meeting\|Participants" --col
if [ $? -eq 0 ]; then
  display_name="John Doe [on a call]"
  status_emoji=':slack_call:'
else
  display_name="John Doe"
  status_emoji=''
fi

# Push the status to Slack
curl -s -X POST https://slack.com/api/users.profile.set \
--data-urlencode "profile={\"display_name\":\"${display_name}\", \"status_emoji\":\"${status_emoji}\", \"status_text\":\"\"}" \
--data-urlencode "token=${token}"
