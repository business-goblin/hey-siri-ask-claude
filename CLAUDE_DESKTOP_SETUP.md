# Claude Desktop Voice-Mode Setup

Before using the Siri shortcut, you need to configure voice-mode MCP in Claude Desktop.

## Prerequisites

- Claude Desktop installed
- `uvx` installed (comes with `uv` - install via `curl -LsSf https://astral.sh/uv/install.sh | sh`)
- OpenAI API key

## Configuration Steps

### 1. Get Your OpenAI API Key

1. Go to https://platform.openai.com/api-keys
2. Create a new API key
3. Copy the key (starts with `sk-proj-...`)

### 2. Create Claude Desktop Config File

Create or edit the file at:
```
~/Library/Application Support/Claude/claude_desktop_config.json
```

Add the following configuration:

```json
{
  "mcpServers": {
    "voicemode": {
      "command": "/Users/YOUR_USERNAME/.local/bin/uvx",
      "args": ["voice-mode"],
      "env": {
        "OPENAI_API_KEY": "your-openai-api-key-here"
      }
    }
  }
}
```

**Important:**
- Replace `YOUR_USERNAME` with your actual macOS username
- Replace `your-openai-api-key-here` with your actual OpenAI API key
- You can find your username by running `whoami` in Terminal

### 3. Find Your uvx Path

Run this command to find where `uvx` is installed:
```bash
which uvx
```

Use the full path in the config file (typically `/Users/YOUR_USERNAME/.local/bin/uvx`).

### 4. Restart Claude Desktop

1. Completely quit Claude Desktop (Cmd+Q)
2. Reopen it
3. The voice-mode MCP server should now appear in Settings → Developer → MCP Servers

### 5. Test Voice Mode

In Claude Desktop, type:
```
Let's have a voice conversation
```

If configured correctly, Claude will initiate a voice conversation.

## Troubleshooting

### Voice-mode not appearing in MCP servers list
- Check that the config file path is correct
- Verify the `uvx` path matches your system (`which uvx`)
- Make sure the JSON is valid (no trailing commas, proper quotes)

### "Command not found" errors
- Ensure `uvx` is installed: `uvx --version`
- Use the full path to `uvx` in the config

### API key errors
- Verify your OpenAI API key is valid
- Check that you have credits available in your OpenAI account
- Make sure the key has the correct permissions

## Alternative: Using Environment Variables

If you prefer not to store the API key in the config file, you can:

1. Set the environment variable in your shell:
   ```bash
   export OPENAI_API_KEY="your-api-key-here"
   ```

2. Add it to your `~/.zshrc` or `~/.bash_profile`:
   ```bash
   echo 'export OPENAI_API_KEY="your-api-key-here"' >> ~/.zshrc
   ```

3. Remove the `env` section from the config file (Claude Desktop will use the system environment variable)

## Next Steps

Once voice-mode is working in Claude Desktop, proceed to [SHORTCUTS_SETUP.md](SHORTCUTS_SETUP.md) to set up the Siri integration.
