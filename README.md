# Hey Siri, Ask Claude

Siri-triggered voice conversations with Claude Desktop using [voice-mode MCP](https://github.com/eddieoz/voice-mode).

Say "Hey Siri, ask Claude" and instantly start a hands-free voice conversation with Claude on macOS.

## What is voice-mode?

[voice-mode](https://github.com/eddieoz/voice-mode) is a Model Context Protocol (MCP) server that adds real-time voice conversation capabilities to Claude Desktop and Claude Code. It handles:

- Speech-to-text (Whisper via OpenAI API)
- Text-to-speech (OpenAI TTS)
- Automatic conversation flow
- Audio device management

This project simply adds Siri integration to trigger voice-mode conversations hands-free.

## Requirements

- macOS
- [Claude Desktop](https://claude.ai/download)
- OpenAI API key
- `uvx` installed ([uv installation](https://docs.astral.sh/uv/getting-started/installation/))
- Siri enabled

## Installation

### 1. Configure voice-mode in Claude Desktop

See [CLAUDE_DESKTOP_SETUP.md](CLAUDE_DESKTOP_SETUP.md) for detailed instructions.

**Quick version:**
```bash
# Create config file
cat > ~/Library/Application\ Support/Claude/claude_desktop_config.json << 'EOF'
{
  "mcpServers": {
    "voicemode": {
      "command": "/Users/YOUR_USERNAME/.local/bin/uvx",
      "args": ["voice-mode"],
      "env": {
        "OPENAI_API_KEY": "your-api-key-here"
      }
    }
  }
}
EOF
```

Replace `YOUR_USERNAME` and `your-api-key-here` with your values, then restart Claude Desktop.

### 2. Install the script

```bash
git clone https://github.com/business-goblin/hey-siri-ask-claude.git
cd hey-siri-ask-claude
./install.sh
```

Grant Accessibility permissions when prompted (**System Settings** → **Privacy & Security** → **Accessibility**).

### 3. Create Siri Shortcut

1. Open **Shortcuts** app
2. Create new shortcut → Add **"Run Shell Script"** action
3. Enter: `~/scripts/start-claude-voice.sh`
4. Name it: **Ask Claude**
5. Done!

See [SHORTCUTS_SETUP.md](SHORTCUTS_SETUP.md) for detailed steps and troubleshooting.

## Usage

```
"Hey Siri, ask Claude"
```

Claude Desktop opens and voice-mode starts automatically. Audio uses your current system output device.

## How It Works

1. Siri triggers Mac Shortcut
2. AppleScript launches Claude Desktop
3. Script types "Let's have a voice conversation" and presses Enter
4. voice-mode MCP handles the conversation
5. Speak naturally, Claude responds via TTS

## Customization

**Change Siri phrase:** Rename the shortcut in Shortcuts app

**Change conversation trigger:** Edit line 25 in `start-claude-voice.sh`:
```bash
keystroke "Let's have a voice conversation"
```

**Adjust timing:** Increase delays in script if needed (lines 11, 20, 26)

## Troubleshooting

**Voice-mode not working?** Check Claude Desktop Settings → Developer → MCP Servers for "voicemode"

**Script doesn't run?** Grant Accessibility permissions to Shortcuts and Terminal

**Siri doesn't recognize command?** Try renaming shortcut to something simpler like "Claude"

See [SHORTCUTS_SETUP.md](SHORTCUTS_SETUP.md) for more troubleshooting.

## About voice-mode

This project is a Siri launcher for [voice-mode](https://github.com/eddieoz/voice-mode), an excellent MCP server for voice conversations with Claude. voice-mode handles all the heavy lifting—speech recognition, synthesis, and conversation management. This repo just adds the convenience of Siri activation.

For more voice-mode features and configuration options, check out the [voice-mode documentation](https://github.com/eddieoz/voice-mode).

## License

MIT
