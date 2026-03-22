# LoveShip.io — Usage Guide

> You fixed a production outage at 3am but forgot her birthday at 3pm.

## What is LoveShip?

LoveShip is your AI relationship assistant. It helps you understand your partner better, plan memorable dates, remember important details, and communicate more effectively — all powered by AI that learns your relationship over time.

## Getting Started

### 1. Setup (one time only)

Tell your AI:

> "Set up LoveShip"

You'll be asked:
- **Language**: Pick your preferred language (asked once, saved forever)
- **Data directory**: Where to store your data (default: `~/.loveship/`)
- **Your profile**: Name, gender, age, occupation
- **Partner profile**: Same for your partner (skip if you're in the pursuit phase)
- **Relationship status**: Pursuit, dating, married, or parenting
- **Preferences**: Dietary restrictions, love languages (top 3 for each of you), and no-go zones (topics to avoid)

To edit later, just say: "Edit my LoveShip profile"

### 2. Just Talk Naturally

No commands needed. Just tell LoveShip what you need:

#### Decode messages

When your partner sends something confusing:

> "What does she mean by 'I'm fine'?"
> "How should I respond to 'Do whatever you want'?"
> "She said 'It's not a big deal' — is it a big deal?"

You get:
- **Literal meaning** — what the words say
- **Emotional intent** — what they actually feel
- **Suggested responses** — 2-3 options ranked by your partner's love language

#### Plan a date

> "Plan a date in Taipei"
> "Find a restaurant in Tokyo, high budget, adventurous vibe"
> "Date ideas in San Francisco"

You get 3 curated spots with "why this works" tied to your partner's preferences.

#### Icebreakers, gifts & topics

> "Gift ideas for someone who loves hiking"
> "She's a veterinarian who volunteers at animal shelters — help me impress her"
> "Conversation starters for a second date"

You get:
- 3 icebreakers that don't suck
- 3 gift ideas at different price points
- 3 deep conversation topics

**Note**: LoveShip will NEVER suggest manipulative tactics. No PUA, negging, or mind games.

#### Save & recall memories

**Save a memory:**
> "Remember: she loves matcha lattes"
> "Remember his birthday is July 15th"
> "Save this: she mentioned wanting to visit Kyoto"

Memories are auto-tagged and dates are auto-detected.

**Recall a memory:**
> "What did I save about matcha?"
> "Recall birthday"
> "What restaurants did I save?"

#### Give feedback

After any suggestion, tell LoveShip how it did:

> "That worked great!" — Positive feedback
> "That didn't work" — Negative feedback
> "She's vegan now" — Correct a detail
> "She prefers quiet places, not crowded ones" — Refine preferences

## How Feedback Works

Feedback is how LoveShip gets smarter about your relationship:

- **Positive**: Tell LoveShip when something works. It learns to give more of the same.
- **Negative**: Tell LoveShip when something misses. It asks what went wrong (optional).
- **Corrections**: The most powerful type. When LoveShip detects a profile change, it shows you the proposed update and asks for confirmation. It NEVER auto-updates.

### Best Practices

1. **Be specific** — "she didn't like it" is less useful than "she said the restaurant was too loud"
2. **Feedback after real dates** — Tell LoveShip how the date actually went
3. **Update changes promptly** — Dietary changes, new allergies, or relationship milestones
4. **Use natural language** — Write as if you're telling a friend

## Progressive Accuracy

Your profile starts as a brief sketch. The more you use LoveShip:
- Memories accumulate details about your partner
- Feedback refines preferences and corrects mistakes
- Suggestions get increasingly personalized

The more you share and give feedback, the better LoveShip gets.

## Data & Privacy

- All data stored locally on your machine at `~/.loveship/`
- Nothing is sent to any server (except the AI API you choose to use)
- You can delete everything anytime: `rm -rf ~/.loveship/`
- Memories are append-only — LoveShip never deletes your entries

## Tips

- LoveShip auto-surfaces upcoming birthdays and anniversaries within 14 days
- Save small details — they add up and make suggestions much better
- If LoveShip detects a conflict with your profile, it will pause and ask before updating
- Just say "edit my LoveShip profile" anytime to update your settings
