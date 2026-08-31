# 04 · Website Plan


This is the primary spec, based on the **latest** "New Fairtoon Website Plan". The website pivoted from an earlier campaign-style design to a **search-engine-first** site; the pivot history is at the bottom of this document.


## Purpose & target users

| | |
|---|---|
| Core mission | Reduce piracy-site use by raising public awareness |
| Framing | **Self-interest based** ("it's harmful to you / your device"), not moralizing |
| Primary users | Readers who already want to read legally → solved by **Search** |
| Secondary users | Readers unaware the site exists → reached via **SEO / Articles** |
| Constraint | No marketing budget → original content + SEO is the growth engine |


## Sitemap

**Header (all pages):** Logo (TBD) · Home · Articles · Stay Safe · About · Search Bar · Language selector

**Languages:** Korean, English (2)

| Page | Function |
|------|----------|
| Home | Large central search bar |
| Initial Search Results | Card view of matching webtoon series |
| Specific Search Results | Full detail page for a clicked series |
| Articles | SEO + anti-piracy depth content (see below) |
| Stay Safe | Why piracy sites are dangerous, framed by self-interest |
| About | "Others" (not yet detailed) |
| Explore | **Not being developed for now** (parked) |

> The source plan notes its "Website Structure" tab is unfinished — don't implement it literally; add sections that fit well.


## The 4 main features

1. **Search** — the main feature
2. **Explore** — secondary / later (or may not be built)
3. **Articles**
4. **Stay Safe**


### Feature 1 — Search (main)

Search a specific series and get wiki-like, useful info — most importantly **which legal/official platforms** carry it, compared (access model, language availability, etc.). Goal: make legal reading convenient so piracy loses its edge. Wiki-style extras (synopsis, genre, rating) make it more appealing than a plain platform lookup.

**DB scope:** 150–300 series (flexible). Deliberately bounded for quality — *"150 accurate, up-to-date series beats 1000 incomplete ones."* Prioritized by popularity + ease of obtaining data.

**Card view (search results)** — Title (closest match) · Cover image · Author (not artist) · 2–3 primary genre tags · single community rating · legal platforms available (name + logo only).

**Full detail page — 6 blocks:**

1. **Core Information** — title (original Korean + all alternative titles), cover image, author & artist, publisher, original run, status (Ongoing / Completed / Hiatus / Cancelled), release schedule, total/current chapter count
2. **Legal Platforms** — platform name + logo, region availability, language availability, pricing model, latest chapter (original + translated) and last update date, direct link to the series, web/app/both
3. **Genre & Content Information** — primary genre tags, category tags (e.g. dungeon, level system), content warnings, age rating, plot summary (low-spoiler)
4. **Ratings & Reception** — AniList / MangaUpdates scores & rankings, positive/negative notes, awards
5. **Adaptations & Related Media** — related series, anime/drama, light novel, print volumes + how to access them
6. **Similar Series** — ~5 recommendations, each with a one-line reason


### Feature 2 — Articles

Two goals: **(a)** bring in organic search traffic (SEO); **(b)** deepen credibility as an anti-piracy resource (more than a search tool).

| Tier | Categories |
|------|-----------|
| **Tier 1 (core)** | Issue Deep Dives (piracy's causes, creator economics, how it operates) · Data & Visualization (original chart-based analysis: pricing comparisons, translation-lag tracking, piracy traffic) · Creator Perspectives (compiled public statements; interviews once the site has standing) · Stay Safe Extension (long-form version of Stay Safe) |
| **Tier 2 (additions, sparing)** | General Platform Comparisons · How Piracy Sites Make Money · Reader Behavior & Psychology |

**Operations:** launch with 5+ articles, then publish ~2× per month. Internal links site-wide → articles, and articles ↔ search results (convert readers ↔ search users).


### Feature 3 — Stay Safe

Discourage piracy-site use by explaining the danger to the reader. Self-interest framing; kept as its **own section** (separate from Articles) for visibility.

- **Common Threats** — malvertising, fake "update your player" prompts, notification-permission abuse, etc.
- **Device Safety Checklist** — manual self-check
- **If You've Already Been Exposed** — step-by-step recovery (remove extensions, revoke notification permissions, …)

Should differentiate by device type (iPhone, MacBook, Galaxy, …).


## Design / UX direction

- **Logo:** latest version TBD (earlier version used flaticon book icon `10433049`).
- **Reference look & feel:** Gemini share link `https://gemini.google.com/share/4bfece0272be` (see [09 · Resources](./09_Resources_Links.md)).
- **UX conventions (from earlier spec, still informative):**
  - Underlined bullets ⇒ force vertical ordering (A, B, C stacked, not side by side)
  - Blue highlight ⇒ must be **real** data · Red highlight ⇒ to be **made up** (placeholder)
  - Leave unspecified items blank in the prototype — never build empty filler pages
- **Reference tools:** Figma; external data sources — TV (JustWatch, IMDb), manga/webtoon (AniList, Anime-Planet, MangaUpdates, MyAnimeList, Kenmei)
- **Tech stack:** not named in the planning docs. (The actual preview is a single-file `index.html`; that is repo state, not part of the source spec.)


## Version history — the pivot

The earlier "Fairtoon Website Workflow" was a **different concept** — a campaign / activism site. The current plan deliberately pivoted to a **wiki-style legal-platform search engine + SEO Articles + Stay Safe**.

| | Old (campaign-style) | Current (search-first) |
|---|---------------------|------------------------|
| Navigation | Creator Voices / Risks of Piracy / Data Lab / How to Help / About Us | Home / Articles / Stay Safe / About |
| Search | Minor "Where to Read?" tool in the header | **Main feature** |
| Languages | EN / KO / **JP** (3) | EN / KO (2) — Japanese dropped |
| Home | Hero + creator quotes + interactive data + e-signature | Single large search bar |

**Parked / dropped features that may return** (from the old spec): Creator Voices (creator featured cards + interviews), Data Lab (dedicated data-visualization section), How to Help CTAs, **Electronic Signature** (anti-piracy pledge), **Report a Pirate**, **Interactive Revenue Calculator** (slider → estimated revenue loss). These were intentional campaign features; keep them as candidates for re-introduction later.
