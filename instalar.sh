#!/usr/bin/env bash
set -e

DEST="$HOME/.local/bin"
mkdir -p "$DEST"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cp "$SCRIPT_DIR/bin/ai-statusline.cjs" "$DEST/ai-statusline.cjs"
cp "$SCRIPT_DIR/bin/ai-quota-fetcher.cjs" "$DEST/ai-quota-fetcher.cjs"
chmod +x "$DEST/ai-statusline.cjs" "$DEST/ai-quota-fetcher.cjs"

echo "Scripts instalados em: $DEST"
echo ""
echo "Cole nos arquivos de configuracao:"
echo "1) ~/.claude/settings.json:"
echo "   \"statusLine\": { \"type\": \"command\", \"command\": \"node $DEST/ai-statusline.cjs claude\" }"
echo ""
echo "2) ~/.gemini/antigravity-cli/settings.json:"
echo "   \"statusLine\": { \"type\": \"command\", \"command\": \"node $DEST/ai-statusline.cjs agy\", \"enabled\": true }"
