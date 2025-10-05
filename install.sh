#!/bin/bash

# Installation script for Hey Siri Ask Claude

INSTALL_DIR="$HOME/scripts"
SCRIPT_NAME="start-claude-voice.sh"

echo "Installing Hey Siri Ask Claude..."

# Create scripts directory if it doesn't exist
mkdir -p "$INSTALL_DIR"

# Copy script to installation directory
cp "$SCRIPT_NAME" "$INSTALL_DIR/"
chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

echo "✓ Script installed to $INSTALL_DIR/$SCRIPT_NAME"
echo ""
echo "Next steps:"
echo "1. Open the Shortcuts app on your Mac"
echo "2. Follow the instructions in SHORTCUTS_SETUP.md to create the Siri shortcut"
echo "3. Say 'Hey Siri, talk to Claude' to start a voice conversation!"
