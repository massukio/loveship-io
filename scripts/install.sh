#!/usr/bin/env bash
set -euo pipefail

# LoveShip.io Installer — macOS / Linux
# Supports: Claude Code, VS Code (Copilot), Cursor, Codex, OpenClaw

# Resolve repo root from this script's location
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
DATA_DIR="${HOME}/.loveship"
SKILL_DIR="$REPO_DIR/skills/loveship"
CWD="$(pwd)"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

echo ""
echo -e "${CYAN}${BOLD}🚢 LoveShip.io Installer${NC}"
echo -e "${CYAN}Your AI wingman for love${NC}"
echo -e "${CYAN}Using repo at: ${REPO_DIR}${NC}"
echo ""

# Create data directory
mkdir -p "$DATA_DIR"

# Step 1: Ask which tool
echo -e "${BOLD}Which tool do you use? (pick one or more, comma-separated)${NC}"
echo ""
echo "  1. Claude Code"
echo "  2. VS Code (GitHub Copilot)"
echo "  3. Cursor"
echo "  4. Codex"
echo "  5. OpenClaw"
echo "  6. All of the above"
echo ""
read -rp "Enter your choice (e.g., 1,3 or 6): " choice

# Step 2: Ask scope
echo ""
echo -e "${BOLD}Install scope:${NC}"
echo ""
echo -e "  a. ${BOLD}Personal${NC} — available in all your projects"
echo -e "  b. ${BOLD}Project${NC}  — only in this workspace/repo"
echo ""
read -rp "Choose (a/b, default: a): " scope
scope=$(echo "$scope" | tr -d ' ' | tr '[:upper:]' '[:lower:]')
[[ "$scope" != "b" ]] && scope="a"

# Copy full directory (SKILL.md + references/)
# Cleans up old references/ first to avoid stale files on reinstall
copy_skill_dir() {
  local target="$1"
  mkdir -p "$target"
  rm -rf "$target/references"
  cp "$SKILL_DIR/SKILL.md" "$target/SKILL.md"
  cp -r "$SKILL_DIR/references" "$target/references"
}

install_claude() {
  echo -e "${YELLOW}→ Setting up Claude Code...${NC}"
  if [[ "$scope" == "b" ]]; then
    local target="$CWD/.claude/skills/loveship"
    copy_skill_dir "$target"
    echo -e "${GREEN}  ✅ Claude Code — installed to .claude/skills/loveship/${NC}"
  else
    local target="${HOME}/.claude/skills/loveship"
    copy_skill_dir "$target"
    echo -e "${GREEN}  ✅ Claude Code — installed to ~/.claude/skills/loveship/${NC}"
  fi
}

install_vscode() {
  echo -e "${YELLOW}→ Setting up VS Code (GitHub Copilot)...${NC}"
  if [[ "$scope" == "b" ]]; then
    local target="$CWD/.github/skills/loveship"
    copy_skill_dir "$target"
    echo -e "${GREEN}  ✅ VS Code — installed to .github/skills/loveship/${NC}"
  else
    local target="${HOME}/.copilot/skills/loveship"
    copy_skill_dir "$target"
    echo -e "${GREEN}  ✅ VS Code — installed to ~/.copilot/skills/loveship/${NC}"
  fi
}

install_cursor() {
  echo -e "${YELLOW}→ Setting up Cursor...${NC}"
  if [[ "$scope" == "b" ]]; then
    local target="$CWD/.cursor/skills/loveship"
    copy_skill_dir "$target"
    echo -e "${GREEN}  ✅ Cursor — installed to .cursor/skills/loveship/${NC}"
  else
    local target="${HOME}/.cursor/skills/loveship"
    copy_skill_dir "$target"
    echo -e "${GREEN}  ✅ Cursor — installed to ~/.cursor/skills/loveship/${NC}"
  fi
}

install_codex() {
  echo -e "${YELLOW}→ Setting up Codex...${NC}"
  if [[ "$scope" == "b" ]]; then
    local target="$CWD/.agents/skills/loveship"
    copy_skill_dir "$target"
    echo -e "${GREEN}  ✅ Codex — installed to .agents/skills/loveship/${NC}"
  else
    local target="${HOME}/.agents/skills/loveship"
    copy_skill_dir "$target"
    echo -e "${GREEN}  ✅ Codex — installed to ~/.agents/skills/loveship/${NC}"
  fi
}

install_openclaw() {
  echo -e "${YELLOW}→ Setting up OpenClaw...${NC}"
  if [[ "$scope" == "b" ]]; then
    local target="$CWD/skills/loveship"
    copy_skill_dir "$target"
    echo -e "${GREEN}  ✅ OpenClaw — installed to skills/loveship/${NC}"
  else
    local target="${HOME}/.openclaw/skills/loveship"
    copy_skill_dir "$target"
    echo -e "${GREEN}  ✅ OpenClaw — installed to ~/.openclaw/skills/loveship/${NC}"
  fi
}

# Parse choices
IFS=',' read -ra CHOICES <<< "$choice"
for c in "${CHOICES[@]}"; do
  c=$(echo "$c" | tr -d ' ')
  case "$c" in
    1) install_claude ;;
    2) install_vscode ;;
    3) install_cursor ;;
    4) install_codex ;;
    5) install_openclaw ;;
    6) install_claude; install_vscode; install_cursor; install_codex; install_openclaw ;;
    *) echo -e "${RED}  ⚠ Unknown option: $c${NC}" ;;
  esac
done

echo ""
echo -e "${GREEN}${BOLD}✅ LoveShip installed!${NC}"
echo ""
echo -e "Just talk naturally about your relationship — LoveShip figures out what you need."
echo ""
echo -e "To get started, tell your AI: ${BOLD}\"set up LoveShip\"${NC}"
echo ""
