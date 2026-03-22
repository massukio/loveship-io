# LoveShip.io

> 她傳了「隨便」，你回了「好」。從此你們三天沒說話。
>
> Your AI wingman for love — decodes cryptic texts, plans unforgettable dates, remembers everything you forgot, and makes sure you never show up empty-handed.

## Supported Tools

| Tool | Status |
|---|---|
| Claude Code | Full support |
| VS Code (GitHub Copilot) | Full support |
| Cursor | Full support |
| Codex | Full support |
| OpenClaw | Full support |

## Install

### macOS / Linux

```bash
git clone https://github.com/massukio/loveship-io.git
cd loveship-io
bash scripts/install.sh
```

### Windows

```powershell
git clone https://github.com/massukio/loveship-io.git
cd loveship-io
powershell -ExecutionPolicy Bypass -File scripts\install.ps1
```

The installer asks which tool you use and installs to the right location:

| Tool | Install Location | Format |
|---|---|---|
| Claude Code | `.claude/skills/loveship/` or `~/.claude/skills/loveship/` | Directory (SKILL.md + references/) |
| VS Code (Copilot) | `.github/skills/loveship/` or `~/.copilot/skills/loveship/` | Directory (SKILL.md + references/) |
| Cursor | `.cursor/skills/loveship/` or `~/.cursor/skills/loveship/` | Directory (SKILL.md + references/) |
| Codex | `.agents/skills/loveship/` or `~/.agents/skills/loveship/` | Directory (SKILL.md + references/) |
| OpenClaw | `skills/loveship/` or `~/.openclaw/skills/loveship/` | Directory (SKILL.md + references/) |

Each location gets `SKILL.md` (entry point) + `references/` (7 detail files).

## Documentation

| Language | Guide |
|---|---|
| English | [docs/usage.en.md](docs/usage.en.md) |
| 繁體中文 | [docs/usage.zh-TW.md](docs/usage.zh-TW.md) |
| 简体中文 | [docs/usage.zh-CN.md](docs/usage.zh-CN.md) |
| 日本語 | [docs/usage.ja.md](docs/usage.ja.md) |
| 한국어 | [docs/usage.ko.md](docs/usage.ko.md) |

## Getting Started

Just tell your AI: **"set up LoveShip"**

First run asks your preferred language (asked once, saved forever):

- English, 繁體中文, 简体中文, 日本語, 한국어, or any IETF tag

Then walks you through profiles, love languages, dietary quirks, and no-go zones.

## How It Works

Just talk naturally about your relationship. LoveShip detects your intent and handles the rest:

| What you need | Just say something like... |
|---|---|
| Decode a confusing message | "What does she mean by 'I'm fine'?" |
| Plan a date | "Plan a date in Taipei, moderate budget" |
| Gift ideas or icebreakers | "Gift ideas for someone who loves hiking" |
| Save a detail about your partner | "Remember: she loves matcha lattes" |
| Recall something you saved | "What did I save about restaurants?" |
| Correct or rate a suggestion | "That worked great" / "She's vegan now" |
| Edit your profile | "Edit my LoveShip profile" |

No slash commands needed — just talk. LoveShip figures out what you need.

## Progressive Accuracy

Your profile starts as a brief sketch. The more you use LoveShip:

- **Memories** accumulate details about your partner
- **Feedback** refines preferences and corrects mistakes
- Suggestions get increasingly personalized over time

## Architecture

```
skills/loveship/
  SKILL.md              → Entry point — routing, gates, reminders
  references/
    setup.md            → Profile wizard + config/memory/feedback schemas
    translate.md        → Message decoder logic
    plan-date.md        → Date planning + venue search
    impress.md          → Icebreakers, gifts, topics
    remember.md         → Memory vault save/recall
    feedback.md         → Learning loop + config mutation
    context.md          → Context loading + date reminders
scripts/                → Install scripts (sh + ps1)
docs/                   → Usage guides (5 languages)
```

## Your Data

All data stays local at `~/.loveship/` (configurable):

```
~/.loveship/
├── config.yaml      # Profiles + preferences + language
├── memories.yaml    # Everything you'd forget without us
└── feedback.yaml    # What your AI learned about your partner
```

## Language

- Skills are written in English
- Output language is set once during setup and saved to `config.yaml`
- All output respects `system.language` — responds entirely in your chosen language
- Memory tags are always English (machine-readable)
- Notes are stored in whatever language you type

## License

MIT
