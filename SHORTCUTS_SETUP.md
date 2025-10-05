# Mac Shortcuts Setup Guide

This guide will help you create a Siri shortcut to trigger Claude voice conversations.

## Prerequisites

- Claude Desktop installed and configured with voice-mode MCP
- AirPods connected to Mac Mini
- Siri enabled on your Mac

## Step-by-Step Instructions

### 1. Open Shortcuts App

Open the **Shortcuts** app on your Mac (found in Applications or use Spotlight Search).

### 2. Create New Shortcut

1. Click the **+** button in the top toolbar to create a new shortcut
2. In the search bar on the right, type "Run Shell Script"
3. Drag the **"Run Shell Script"** action into your workflow

### 3. Configure Shell Script Action

1. In the "Run Shell Script" action box, you'll see a text field
2. Clear any existing text
3. Enter the following path:
   ```
   ~/scripts/start-claude-voice.sh
   ```

### 4. Name Your Shortcut

1. Click on the shortcut name at the top (it will say "Shortcut Name" or similar)
2. Rename it to: **Ask Claude**
   - This name is what you'll say to Siri
   - Use a natural phrase that's easy to remember

### 5. Save and Test

1. Click **Done** or close the shortcut editor to save
2. Test it manually first:
   - Click the ▶ (play) button in the shortcut
   - Claude Desktop should open and start a voice conversation

### 6. Enable Siri Access

1. Go to **System Settings** → **Privacy & Security** → **Accessibility**
2. Make sure **Shortcuts** has permission
3. Also check **System Settings** → **Siri & Spotlight**
4. Ensure "Listen for 'Hey Siri'" is enabled

## Usage

Once set up, simply say:

**"Hey Siri, Ask Claude"**

Your AirPods will pick up the command → Mac Mini will run the script → Claude Desktop will open and start a voice conversation → audio will route through your AirPods.

## Troubleshooting

### Shortcut doesn't run
- Check that the script has execute permissions: `ls -la ~/scripts/start-claude-voice.sh`
- Should show `-rwxr-xr-x`

### Claude opens but doesn't start conversation
- Make sure Claude Desktop is the active window when the script runs
- Try increasing the `delay` values in the script if your Mac is slower

### Siri doesn't recognize the command
- Try renaming the shortcut to something simpler like "Claude" or "Ask Claude"
- Speak clearly and wait for Siri's listening tone

### Permission errors
- Grant Accessibility permissions to:
  - Terminal (if running script manually)
  - Shortcuts app
  - Claude Desktop

Go to **System Settings** → **Privacy & Security** → **Accessibility**

## Customization

### Change the activation phrase
Simply rename the shortcut in the Shortcuts app to whatever you want to say to Siri.

Examples:
- "Start Claude"
- "Voice Chat"
- "AI Assistant"

### Change what Claude says
Edit `start-claude-voice.sh` and modify the line:
```bash
keystroke "Let's have a voice conversation"
```

Replace with any text you want Claude to receive.
