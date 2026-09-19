# Proseify — the book-writing engine for AI agents

<p align="center">
  <img src="assets/proseify-block.svg" width="88" alt="Proseify block mark" />
</p>

**Proseify** is a hosted MCP (Model Context Protocol) server that turns Claude Code, Codex, Cursor, or any MCP client into a disciplined book-writing machine — grounded in real literature instead of generic model defaults.

Give it a one-line premise. It picks the right genre recipe, pulls model passages from a curated public-domain library, plans the outline, drafts chapter by chapter, and scores its own work. You get a manuscript you can actually edit, not 40 pages of "it was a dark and stormy night."

**🔗 Website & key issuance:** https://proseify.xyz

[![Listed on mcpservers.org](https://mcpservers.org/badge.svg)](https://mcpservers.org/servers/dionisselami/proseify-mcp)

---

## Why genre-before-prose matters

Most "AI writes a book" tools generate immediately. The output reads the same way regardless of what you asked for — the same sentence lengths, the same dialogue rhythm, the same endings.

Proseify flips the order:

```
premise → genre recipe → corpus passages → outline → chapter drafts → scored revision
```

The genre recipe is derived from the actual tradition — pacing beats, dialogue ratio,
sentence-length profile, how endings are handled. The agent reads it *before*
touching prose. That single ordering decision is the difference between a horror book
that reads like the gothic tradition and a horror book that reads like ChatGPT.

## Tools exposed

| Tool | What it does |
|------|--------------|
| `list_genres` | 11 genres, growing library of books (theatre, horror, romance, adventure, literary, and more) |
| `search_corpus` | Full-text search across all chapters, with FTS5 syntax (quotes, AND/OR/NOT, wildcards) |
| `get_genre_recipe` | Pacing beats, dialogue ratio, and stylistic anchors derived from the tradition |
| `get_style_references` | Model passages from books matching a genre — the register you're aiming for |
| `plan_book` | Full chapter-by-chapter outline from a one-line premise |
| `write_book` | The one-shot flow: plan → draft → evaluate, all in one session |
| `evaluate_book` | Scores a drafted book against genre benchmarks so weak chapters get revised |

…plus supporting tools for chapter retrieval and corpus metadata.

## Setup (Claude Code, Codex, Cursor, and friends)

### 1. Get a key

Sign in at https://proseify.xyz (Google / GitHub / magic link), pick a plan.
Monthly from **$9**, or one-time **Founding Lifetime**. Your key is issued the moment the purchase clears.

### 2. Connect the MCP server

```json
{
  "mcpServers": {
    "proseify": {
      "type": "http",
      "url": "https://mcp.proseify.xyz/mcp",
      "headers": { "Authorization": "Bearer YOUR_KEY" }
    }
  }
}
```

(Use the client's native MCP config format for your agent — see
[the Agent SDK page](https://proseify.xyz/agent) for a filled-in block.)

### 3. Install the skill

```bash
npx skills add https://proseify.xyz --skill anti-prose-slop -y
```

The `anti-prose-slop` skill gives the agent the *writing workflow* — genre
recipe first, corpus grounding, chapter discipline, and a per-chapter
anti-slop editing pass — instead of just raw tool access.

### 4. Write

Tell the agent a premise:

> "I want a gothic horror novel about a lighthouse keeper finding a body that
> shouldn't exist. 32 chapters. Budget 50,000 words."

The agent picks the right recipe, searches the corpus for register, plans,
drafts, scores, and revises. You edit what it returns.

---

## The corpus

**a growing library of books / 11 genres**, drawn from Project Gutenberg and similar
public-domain collections — all verified against their original headers, so
there is no copyright ambiguity anywhere in the library. Commercial use of
output built on it is safe.

A partial list: works from Austen, Stevenson, Hugo,conrad, Verne,
the Brontës, Shelley, gothic masters, and more — selected, grouped by genre,
and indexed for search.

---

## Why "anti-prose-slop"?

Because the failure mode of AI-written prose isn't bad grammar — models are
word-perfect. It's *sameness*: "seemed to", "began to", stacked adverbs,
repeated sentence constructions, filter words, dialogue-as-exposition,
chapter openings that always start with weather. The skill that ships with
Proseify has a concrete per-chapter checklist against each of these, and
`evaluate_book` scores the result against genre norms so the agent can
self-revise rather than ship its first pass.

---

## Pricing

| Plan | Price | Requests |
|------|-------|----------|
| Starter | $9/mo | 120 req/min |
| Pro | $19/mo | 400 req/min |
| Studio | $49/mo | 9999 req/min |
| Founding Lifetime | one-time | 400 req/min, all genres |

Cancel any time from [your account](https://proseify.xyz/account) (opens our
payment provider's customer portal, signed in as you). See the [refund
policy](https://proseify.xyz/refunds) for the 14-day money-back window.

---

## License

MIT — see [LICENSE](./LICENSE). The public-domain corpus texts themselves are
public domain (mostly Project Gutenberg-sourced).

## Links

- **Site / sign-up:** https://proseify.xyz
- **Agent SDK (filled-in config for your key):** https://proseify.xyz/agent
- **Terms** · **Privacy** · **Refund policy** — footer of every page on the site
- **Support:** support@proseify.xyz
- **Published in the official MCP registry:** `io.github.Dionisselami/proseify-mcp`
