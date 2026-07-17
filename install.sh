#!/usr/bin/env bash
# Install the AI-First PO workflows into Claude Code.
#   ./install.sh                     -> global (~/.claude)
#   ./install.sh --project <path>    -> project-local (<path>/.claude)
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="$HOME/.claude"

if [[ "${1:-}" == "--project" ]]; then
  [[ -n "${2:-}" ]] || { echo "error: --project needs a path" >&2; exit 1; }
  DEST="$2/.claude"
fi

mkdir -p "$DEST/skills" "$DEST/agents"

echo "Installing to $DEST"
cp -R "$SRC/skills/." "$DEST/skills/"
cp "$SRC/agents/"*.md "$DEST/agents/"

echo
echo "Skills installed:"
ls "$SRC/skills" | sed 's/^/  - /'
echo "Agents installed:"
ls "$SRC/agents" | sed 's/\.md$//; s/^/  - /'
echo
echo "Done. Start a new Claude Code session so the new agents load."
echo "Skills are available immediately — try: /po-strategy"
