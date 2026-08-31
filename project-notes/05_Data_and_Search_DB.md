# 05 · Data & Search DB


How the Search feature's data is structured, sourced, and kept current. Target DB size: **150–300 series** (currently ~10 collected).


## Search Results DB — current state

The spreadsheet is laid out as **rows = attributes, columns = series**. **10 series** are currently registered:

1. Solo Leveling (나 혼자만 레벨업)
2. Tower of God (신의 탑)
3. Omniscient Reader's Viewpoint (전지적 독자 시점)
4. The God of High School (갓 오브 하이스쿨)
5. Noblesse (노블레스)
6. True Beauty (여신강림)
7. Lookism (외모지상주의)
8. Sweet Home (스위트홈)
9. Weak Hero (약한영웅)
10. Eleceed (엘리시드)

### Column (attribute) groups & fill status

| Group | Attributes | Status |
|-------|-----------|--------|
| Core Information | Title, Cover Image, Author, Artist, Publisher, Original Run, Status, Release Schedule, Total/Current Chapter Count | Cover Image all blank ("-"); rest filled |
| Legal Platforms | Korean, English | Filled (detailed region/pricing columns not yet in the sheet) |
| Genre & Content Information | Primary Genre Tags, Category Tags, Content Warnings, Age Rating, Plot Summary | Filled |
| Ratings & Reception | Ratings & Rankings, Community Receptions, Awards | Only Ratings & Rankings filled; Receptions & Awards **blank** |
| Others | Adaptations, Similar Series | **All blank** |

**Sample (Solo Leveling):** Author Chugong · Artist Jang Sung-rak (DUBU) / REDICE STUDIO · Publisher D&C Media (KR) / Yen Press (EN) · Run Mar 4 2018 – Dec 29 2021 · Completed · 179 main + 21 side = 200 · KR: KakaoPage, Kakao Webtoon · EN: Tapas, Tappytoon, Manta · AniList 84% (#2 all-time popular manhwa) · MangaUpdates ~8.6/10 · Age Teen+ (13+).

Most series are Naver (KR) / Webtoon Entertainment (EN) published on WEBTOON (LINE Webtoon); Solo Leveling is the Kakao-side exception. Highest ratings: Eleceed & Weak Hero AniList 88%; ORV MangaUpdates ~8.8/10.

> So the sheet currently implements only part of the detail-page spec — Cover Image, Community Receptions, Awards, Adaptations, and Similar Series are still being collected.


## Data sourcing — hybrid approach

- Pull general metadata from existing **APIs**; collect/store manually in a spreadsheet where needed.
- Variable data (ratings, popularity rankings) → API. Static data (genre, author) → API or manual.
- **APIs:** AniList API · MangaUpdates API · Kitsu API · Official Platforms.


## Keeping data current — monitoring

Sources to monitor for changes: official platform newsletters/announcements, official Twitter/X accounts, Reddit (r/webtoons, r/manhwa), Google Alerts keywords, plus a monthly URL-validation pass and a "Report an Issue" function on the site.

### Change types to track

| Level | Examples |
|-------|----------|
| Platform-level (high priority) | Platform shutdown (watching Tapas's finances), M&A, domain/URL-structure changes (break all links), pricing-model changes, new/restricted regions, rebranding |
| Series-level (most frequent) | New license, removal/move between platforms, region-lock, free↔paid switch, simulpub; hiatus/resume/completion/cancellation/remake; English title change, author/artist swap, genre re-classification |
| URL-level | Page URL/slug change, HTTP→HTTPS, subdomain move |
| Business / legal | License lapse with no renewal (silent disappearance), legal disputes, loss of regional rights, unofficial→official transition, creator self-publishing |
| Easy to miss | Quiet removals, soft paywalls (e.g. only first 20 chapters free), unannounced region blocks, broken embeds/redirects |

### Monitoring priority tiers

- **High (immediate):** platform shutdown/acquisition, URL-structure change, anything affecting the top 50 searched series
- **Medium (within a week):** individual series removal/move, pricing-model change, new license for a series already in the DB
- **Low (within a month):** status changes (hiatus/completion), metadata changes, new license for a series not in the DB

### Google Alerts keywords (verbatim)

`LINE Webtoon new series` · `Tapas new series` · `Lezhin new license` · `Tappytoon new series` · `Manta webtoon new` · `Pocket Comics new series` · `webtoon licensed` · `manhwa licensed` · `manhwa english license` · `webtoon english release` · `LINE Webtoon update` · `Lezhin shutdown` (set "as it happens") · `Tapas Media news` · `webtoon piracy` · `manhwa piracy` · `illegal webtoon site`

(Most set weekly, English, all regions, "Only the best results".)


## Pricing-model taxonomy (for platform comparison)

Used to classify each legal platform on a series' detail page. (Korean-platform specifics are in [06 · Platform Pricing Comparison](./06_Platform_Pricing_Comparison.md).)

| Category | Model | Notes / examples |
|----------|-------|------------------|
| Free access | Fully free | Ad-supported, permanently free (early Webtoon, Tapas free titles) |
| | Wait for Free (WFF) | Unlocks after 24–72h wait (most common on WEBTOON / Tapas) |
| | First N chapters free | Fixed preview, then paywall (Tappytoon, Lezhin) |
| Pay-per-content | Coins / Tokens | Buy currency to unlock individual chapters (Lezhin) |
| | Early Access / Fast Pass | Pay to read ahead; later goes free (WEBTOON Fast Pass) |
| | One-time purchase | Buy whole series/volume outright |
| Subscription | All-you-can-read | Monthly flat, full catalog (Manta, Tapas Premium) |
| | Tiered subscription | Higher tier = more / faster access |
| | Creator subscription | Patreon-style, per-creator |
| Hybrid / mixed | Freemium | Some free + some coin/subscription |
| | Ad-removal paid tier | Free, pay to remove ads |
| | Bundle / Season pass | Discounted prepay per season/arc |
