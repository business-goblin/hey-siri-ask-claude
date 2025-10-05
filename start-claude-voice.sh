#!/bin/bash

# Siri-triggered Claude Voice Mode Launcher
# Activates Claude Desktop and starts a voice conversation

# Check if Claude Desktop is running
if ! pgrep -x "Claude" > /dev/null; then
    echo "Starting Claude Desktop..."
    open -a "Claude"
    # Wait for Claude to fully launch
    sleep 3
fi

# Activate Claude Desktop and start voice conversation
osascript <<EOF
tell application "Claude"
    activate
end tell

delay 0.5

tell application "System Events"
    tell process "Claude"
        -- Type the voice conversation trigger
        keystroke "Let's have a voice conversation"
        delay 0.5
        -- Press Enter to send
        key code 36
    end tell
end tell
EOF

echo "Voice conversation started!"
