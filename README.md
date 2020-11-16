
# Description

This script will check if Zoom is currently in a call, and update your Slack status accordingly.

It's using the "osascript" command so it's only working on MacOS

Tested on Catalina with bash 5.0

# Setup

Copy slack-status-when-using-zoom.sh to ~/scripts and make it executable
```
mkdir ~/scripts
cp slack-status-when-using-zoom.sh ~/scripts
chmod +x ~/scripts/slack-status-when-using-zoom.sh
```

Copy slack-status-when-using-zoom.plist to ~/Library/LaunchAgents
```
cp slack-status-when-using-zoom.plist ~/Library/LaunchAgents
```

Edit slack-status-when-using-zoom.plist if the script is in a different folder

Enable the script to run every minutes :
```
launchctl load -w ~/Library/LaunchAgents/slack-status-when-using-zoom.plist
launchctl list slack-status-when-using-zoom
```

To allow osascript to run, edit : ```System Preferences > Security & Privacy > Privacy > Accessibility```

To create the "User token", as described on https://api.slack.com/authentication/token-types#user
- Go to : https://api.slack.com/apps > Create a Slack App > pick a name, and your workspace > Create App
- OAuth & Permissions > Scopes > User Token Scopes >  Add an OAuth Scopes  > users.profile:write
- OAuth & Permissions > Install App to Workspace > Allow
- OAuth & Permissions > OAuth Tokens & Redirect URLs > Tokens for Your Workspace > OAuth Access Token > copy the token starting with "xoxp-"
- Add the token to slack-status-when-using-zoom.sh

Edit your name in slack-status-when-using-zoom.sh
