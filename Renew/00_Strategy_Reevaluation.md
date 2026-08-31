# 00 · Strategy Re-evaluation


A rigorous re-evaluation of FairToon's mission and core strategy, requested 2026-06-25. The question on the table: **is a "legal-platform price / availability comparison & discovery tool" actually a suitable AND feasible strategy for the goal (reducing piracy)?**

Evaluated through four independent lenses (demand/behavior research, competitive landscape, an adversarial red-team, and alternative-strategy generation), each grounded in web evidence. The four converged.


## Verdict

**Price comparison as the *primary* value proposition fails on both axes — suitability and feasibility. Do not build the strategy around it.**

The underlying intent (steer readers to legal reading) is sound, but the *mechanism* is wrong. The strongest version of the project pivots the core from **"which platform is cheapest"** to **"where — and whether — you can legally read this, in your language/region"**, backed by a credible piracy-harm data resource and creator voices. Price becomes a secondary field, not the headline.


## Why price-comparison-as-primary fails

### 1. It serves the wrong audience (suitability)

Piracy's #1 driver is **free (₩0) + speed of latest chapters + all-in-one convenience** — not "I don't know where/how much to pay." A price-comparison tool helps people who **already intend to pay**; it optimizes *paid-A vs paid-B*, while the piracy user's real choice is *₩0 vs paid-anything*. The tool's beneficiary (already-legal readers) ≠ the mission's target (piracy users). The causal chain breaks at the first link. *(Evidence: strong.)*

### 2. Korean webtoons are mostly exclusive — so there's often nothing to compare

~66% of Korean webtoons are exclusive originals; Naver Series locks 1+ year exclusivity, adaptation deals suspend other-platform versions for 3–4 years. A given title usually lives on **one** platform. This is why **no competitor (Kenmei, Anime-Planet, MangaUpdates, MAL, Comick…) offers price comparison** — the precondition (same title on multiple platforms) rarely holds. The gap is structural, not an unspotted opportunity. The JustWatch model (same film on Netflix/Disney+/Amazon → comparison has value) **does not transfer** to exclusive webtoons. *(Evidence: strong.)*

### 3. The data is infeasible to maintain accurately, solo (feasibility)

Price/availability is the **fastest-decaying, most error-prone** data class (per-path cookie pricing, wait-for-free policies, delistings, service shutdowns, regional license churn). Established meta-services maintain it via official feeds (JustWatch: 6-hour ingest + verification — needs partnerships) or crowdsourcing (needs existing traffic) — **FairToon can use neither at launch**. A solo founder manually maintaining ~300 titles ≈ 15+ hrs/month forever, on top of everything else. And trust is asymmetric: **one wrong "cheaper here" and the site is "the site that lied"** (cf. JustWatch "85–90% wrong" complaints, Skyscanner price-mismatch regulatory action). *(Evidence: strong.)*

### 4. The mission outcome is essentially unmeasurable

"FairToon reduced piracy" cannot be proven — piracy traffic is outside measurement and causal attribution is impossible. Measurable metrics (visitors, clicks) track *site usage*, not *legal conversion*. A KPI set on "piracy reduction" is therefore partly fictional, which also corrodes a solo founder's motivation over 6 months. *(Evidence: structural argument.)*


## The 2026 market shift (important context)

The ground moved in the last ~12 months, and it cuts both ways:

- **Enforcement suddenly works (domestically).** Naver's "Toon Radar" delays illegal uploads → +23% paid revenue; one artist reported ~3× revenue after a pirate-site shutdown. Korea's emergency blocking shut 뉴토끼·마나토끼 (Apr–May 2026); legal-app installs jumped **+31% (Naver) to +77% (KakaoPage)**, copied-work volume fell ~80%. → The *domestic* piracy problem is increasingly being solved by **blocking/enforcement**, not by information tools.
- **But the problem is still huge globally.** 91% of takedown requests fail; webtoons = 77% of Korean infringement requests; the **English/international scanlation ecosystem is barely touched** — driven by genuine *legal-availability gaps* (no license, no translation, region locks). English scanlations reportedly ~5× official.

**Implication:** FairToon's defensible niche is **not** the domestic "cheapest platform" question (being solved by enforcement, and structurally weak), but the **international "is there ANY legal way to read this in my language, and where?"** question — a real, unserved gap.


## Where the real, defensible opportunity is

A high-school solo founder can win where incumbents structurally **won't**:

1. **Neutral, cross-platform legal guidance.** Naver/Kakao only say "read here"; nobody neutrally answers "for this title, in your region/language, the legal option is X (or: none exists yet)." A non-commercial student is the *credible* party to do this. **No competitor does it.**
2. **Patience-based data authority.** Piracy-harm / enforcement data is scattered and incumbents won't publish unflattering numbers. Aggregating public data into one cited resource is a "boring, persistent" job a student can own — and it earns SEO + press citations.
3. **Authentic peer / first-person voice.** Gen Z tunes out corporate "don't pirate" lectures; "a fellow teen, carrying real creators' voices" is trust incumbents can't buy.
4. **Portfolio fit.** For a college application, "a credible legal-guide + awareness resource, cleanly executed" is a far stronger, more *verifiable* narrative than an unprovable "I reduced piracy" claim.


## Proposed re-establishment


### Re-established mission (proposal)

From an unprovable outcome ("reduce piracy-site use") to a credible, achievable purpose:

> **Make legal webtoon reading easy to find and worth caring about** — help readers (especially international) discover where they can legally read a series in their language, and build a credible, data-backed resource on what piracy costs creators.

This keeps the spirit (pro-legal, pro-creator) but anchors success on things FairToon can actually deliver and measure: resource quality, reach, and creator engagement — not an unattributable piracy-reduction number.


### Re-established strategy (recommended)

A single site with three connected layers — **find → trust → care** — built in this priority:

1. **Legal Availability Finder (≈70%) — the spine.** Per title: *where can you legally read it, in which languages/regions, and is it free / wait-for-free / paid* (price shown as a secondary field, not the headline). Use a **"router" model** (point to official platforms; don't over-claim) with a visible **"last verified" timestamp** to defend trust. Build **low-volatility data first** (author, genre, status, official links); volatile price numbers last. Tilt toward the international/English gap.
2. **Piracy & Enforcement Data Dashboard (≈20%) — trust/authority.** A cited, visualized resource: "enforcement is working (revenue +23%, installs +31–77%)" alongside "but 91% of takedowns fail." Gives a reason to visit, SEO pull, and press-citation potential. Low maintenance after a one-time setup.
3. **Creator Voices (≈10%) — the heart.** Curate public creator statements + 1–2 original interviews. Behavior changes on "a creator I love is really being hurt," not on tables.


### What changes vs. the current Renew plan

| | Current Renew (price-first) | Proposed (availability + authority) |
|---|---|---|
| Headline value | Cheapest-platform comparison | Where/whether you can legally read it |
| Price data | Core, must be exhaustive & current | Secondary field, "last verified" |
| Audience tilt | Korea-first | International/English gap first |
| Data build order | Prices up front (high churn) | Low-volatility data first |
| Success definition | Piracy reduction (unmeasurable) | Resource quality, reach, creator engagement |
| Anti-piracy angle | Implicit in the tool | Explicit via data dashboard + creator voices |

The July-web / December-full timeline can stay; the **content** of what gets built in July shifts from a price engine to an availability finder + data dashboard.


## Honest caveats

- This pivot **mitigates but does not fully erase** the red-team's deepest point: a finder still mostly serves readers already willing to read legally. Its honest contribution is **awareness + guidance + reducing the international "no legal option I can find" friction** — not a guaranteed dent in piracy. Framing the mission around that (rather than an unprovable reduction) is the intellectually honest move.
- Even the availability angle is **strongest for international readers**; for the Korean domestic market, enforcement is already doing the heavy lifting.
- "Avoid the traps": community-building and direct creator-funding are high-appeal but near-certain failures for a solo, no-budget, 6-month scope — keep them out of v1.


## Decision asks (for CEO)

1. **Approve the pivot direction?** Demote price comparison to a secondary field; re-center on legal-availability finding + data authority + creator voices.
2. **Re-established mission wording** — approve the proposed mission, or adjust the framing (especially: are we comfortable reframing success away from "measurably reduce piracy" toward "credible legal-guide + awareness resource"?).
3. **Audience priority** — tilt v1 toward the international/English availability gap (recommended), or keep Korea-first?

On your direction, I will rewrite Renew 01 (Goals), 02 (KPIs), and 03 (Timeline) to match — the July/December anchors stay intact.
