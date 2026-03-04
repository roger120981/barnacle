# AGENTS

These instructions apply to this repo.

- Use Carbon components v2 (`TextDisplay`, `Container`, `Section`) instead of `content` or embeds.
- Register new commands/listeners in `src/index.ts`.
- Keep automod response templates in `src/config/automod-messages.json`.
- Commands must declare integration types/interaction contexts explicitly: snippet commands should allow user installs, moderation commands must stay guild-only.
