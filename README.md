# Hey Siri, Ask Claude

A Siri-triggered voice conversation launcher for Claude Desktop on macOS. Start talking to Claude with just your voice—perfect for Mac Mini + AirPods setups.

## Overview

This project enables hands-free Claude Desktop voice conversations through Siri:

1. **Say**: "Hey Siri, talk to Claude" (to your AirPods/Mac)
2. **Script runs**: Opens Claude Desktop and types the conversation starter
3. **Voice chat begins**: Audio routes through your AirPods automatically

## Requirements

- macOS (tested on Mac Mini)
- [Claude Desktop](https://claude.ai/download)
- AirPods (or other Bluetooth audio device)
- Siri enabled on your Mac
- OpenAI API key (for voice services)
- `uvx` installed (comes with [`uv`](https://docs.astral.sh/uv/getting-started/installation/))

## Installation

### Step 1: Configure Claude Desktop

First, set up voice-mode MCP in Claude Desktop:

Follow the detailed instructions in [CLAUDE_DESKTOP_SETUP.md](CLAUDE_DESKTOP_SETUP.md)

Quick summary:
1. Get an OpenAI API key
2. Create `~/Library/Application Support/Claude/claude_desktop_config.json`
3. Add voice-mode MCP configuration
4. Restart Claude Desktop

### Step 2: Install the Script

1. Clone or download this repository
2. Run the installation script:
   ```bash
   ./install.sh
   ```
3. Grant Accessibility permissions when prompted

### Step 3: Create Siri Shortcut

Follow the [Shortcuts Setup Guide](SHORTCUTS_SETUP.md) to create the Siri shortcut

### Manual Install

1. Copy `start-claude-voice.sh` to `~/scripts/`:
   ```bash
   mkdir -p ~/scripts
   cp start-claude-voice.sh ~/scripts/
   chmod +x ~/scripts/start-claude-voice.sh
   ```

2. Follow the [Shortcuts Setup Guide](SHORTCUTS_SETUP.md)

## Setup

See [SHORTCUTS_SETUP.md](SHORTCUTS_SETUP.md) for detailed instructions on:
- Creating the Shortcuts app automation
- Configuring Siri permissions
- Troubleshooting common issues

## Usage

Once installed and configured:

```
"Hey Siri, ask Claude"
```

Claude Desktop will open and immediately start a voice conversation with audio through your AirPods.

## How It Works

1. **Siri** hears your command and triggers the Mac Shortcut
2. **Shortcut** runs `~/scripts/start-claude-voice.sh`
3. **Script** uses AppleScript to:
   - Launch Claude Desktop (if not running)
   - Activate the Claude window
   - Type "Let's have a voice conversation"
   - Press Enter to send the message
4. **Claude** receives the message and starts voice mode
5. **Audio** routes through your connected AirPods

## Customization

### Change the Siri phrase

Rename the shortcut in the Shortcuts app to any phrase you prefer:
- "Start Claude"
- "Voice Assistant"
- "AI Chat"

### Change the conversation starter

Edit `start-claude-voice.sh` at line 25:
```bash
keystroke "Let's have a voice conversation"
```

Replace with any text you want to send to Claude.

### Adjust timing

If Claude doesn't respond reliably, increase the delay values in the script:
```bash
sleep 3      # Wait after launching Claude (line 11)
delay 0.5    # Wait before typing (line 18)
delay 0.2    # Wait before pressing Enter (line 22)
```

## Troubleshooting

### Script doesn't execute
- Verify permissions: `ls -la ~/scripts/start-claude-voice.sh`
- Should show `-rwxr-xr-x`
- Re-run: `chmod +x ~/scripts/start-claude-voice.sh`

### Claude opens but doesn't start conversation
- Grant Accessibility permissions to **Shortcuts** and **Claude**
- Go to **System Settings** → **Privacy & Security** → **Accessibility**
- Increase delay values in the script

### Siri doesn't recognize the command
- Check that "Listen for 'Hey Siri'" is enabled in **System Settings**
- Try a simpler shortcut name
- Speak clearly and naturally

### Audio doesn't route to AirPods
- Ensure AirPods are connected before triggering
- Check macOS sound output settings
- Test Claude voice mode manually first

## Project Structure

```
hey-siri-ask-claude/
├── README.md                  # This file
├── SHORTCUTS_SETUP.md         # Detailed Shortcuts app configuration
├── start-claude-voice.sh      # Main launcher script
└── install.sh                 # Installation helper
```

## Contributing

Contributions welcome! Feel free to:
- Report bugs
- Suggest features
- Submit pull requests
- Share your customizations

## License

MIT License - feel free to use and modify as needed.

## Credits

Created for seamless voice interactions with Claude Desktop on Mac Mini + AirPods setups.
