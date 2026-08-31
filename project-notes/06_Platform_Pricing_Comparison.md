# 06 · Platform Pricing Comparison


Detailed pricing/revenue models for the major **Korean** webtoon platforms, used to populate the "Legal Platforms" comparison on each series' detail page. English-platform models are **TBD** in the source (placeholder only).


## At a glance

| Platform | Currency | Key free / rental mechanisms |
|----------|----------|------------------------------|
| Naver Webtoon | Cookies | Free rental pass, Watch-ad-for-free, 1-hour binge pass |
| Naver Series | Cookies | Free Pass, Time Deal, Daily-10pm-free, Watch-ad-for-free |
| Kakao Webtoon | Cash | Wait-for-free (hourly), Gift box, Auto-recharge |
| KakaoPage | Cash | Wait-for-free (기다무), 기다무+, Gift box, Bulk purchase |


## Naver Webtoon — currency: Cookies

**Free / rental mechanisms**
- **무료대여권 (free rental pass):** n issued every 24h; rents 1 chapter for 3 days; hold up to n; may not apply to the latest chapters.
- **광고보고무료 (watch-ad-for-free):** watch an ad → rent 1 chapter for 3 days; resets to n daily at midnight; may exclude the latest chapters.
- **몰아보기 1시간권 (1-hour binge pass):** read all chapters free for 1 hour; must be bought with cookies.

**By series status**
- **Ongoing:** *Normal Release* — one new chapter freed each week on a set day (3–5 chapters behind the latest); newly freed and earlier chapters are free. *Preview* — rent or buy future chapters ahead of schedule.
- **Completed:** n free preview chapters / rent (3d) or own / free rental pass (some titles) / watch-ad-for-free (some) / 1-hour binge pass (some).
- **Daily+:** n free preview chapters / rent (3d) or own / free rental pass (some) / watch-ad-for-free (some).


## Naver Series — currency: Cookies

Unlike Naver Webtoon, all models apply **regardless of series status**.

- **n free preview chapters**
- **Rent (3d) / own**
- **프리패스 (Free Pass)** (some titles): rents 1 chapter for 3 days. The Free Pass count is a **static variable shared across all eligible titles** — max 6, recharges 1 every 2h; may exclude latest chapters.
- **타임딜 (Time Deal):** a large batch of advance chapters free for a short window.
- **매일10시 무료 (daily 10pm free):** click → for a set period, receive n 3-day rental passes nightly at 10pm; must use within 24h of receiving; may exclude latest chapters.
- **광고보고무료 (watch-ad-for-free):** watch an ad → rent 1 chapter for 3 days; resets to n daily at midnight.


## Kakao Webtoon — currency: Cash (캐시)

**Free / rental mechanisms**
- **시간마다 무료 / 기다리면 무료 (wait-for-free, hourly):** from when you read a chapter, after the set wait (e.g. 3/12/24h) you get 1 free rental pass; rents 1 chapter for 3 days; hold up to 1; may exclude latest chapters.
- **선물함 (gift box):** for specific titles, periodically grants 3-day free rental passes or cash-draw tickets; use before expiry.
- **자동충전 (auto-recharge):** auto-recharging cash earns bonus cash (up to 10%) → lowers effective per-chapter cost.

**By series status**
- **Ongoing:** Normal Release (1 new chapter/week + some past chapters free) / paid preview (buy advance chapters via rental/ownership) / wait-for-free (past locked chapters unlock sequentially after waiting).
- **Completed:** n free preview chapters / rent (3d) or own / wait-for-free (some) / gift box (some).


## KakaoPage — currency: Cash (캐시)

**Free / rental mechanisms**
- **기다리면 무료 (기다무, wait-for-free):** from the exact time you read a chapter, after the set wait (e.g. 3/8/12/24h or 3 days) you get 1 free rental pass; rents 1 chapter for 3 days; hold up to 1 per title; may exclude latest chapters.
- **기다무 플러스 (기다무+):** for a selected pool of titles, 5 free rental passes auto-granted every 12h (usually fixed at 0:00 / 12:00); max 5, non-cumulative; rents 1 chapter for 3 days.
- **선물함 (gift box):** for promotional titles, periodically grants 3-day free rental passes; receive & use before expiry.
- **세트 구매 (bulk purchase):** buy rental/ownership passes by series/volume at a discount (usually 10–30% off).

**By series status**
- **Ongoing:** Normal Release (1 new chapter/week + base chapters free) / preview (buy rental/ownership with cash individually) / 기다무 (mid chapters between the free pool and the latest preview unlock sequentially via a wait timer).
- **Completed:** n free preview chapters / rent (3d) or own / 기다무 (some) / 기다무+ (some) / gift box (some) / bulk purchase.


## Comparison conclusions

- **Currency split:** Naver family = Cookies; Kakao family = Cash.
- **Status dependency:** Naver Webtoon, Kakao Webtoon, and KakaoPage all make pricing depend on **series status** (ongoing vs completed). **Naver Series is the exception** — all models apply regardless of status. This is its structural differentiator.
- **Free-rental recharge mechanics:**
  - Naver Webtoon: multiple (n) passes every 24h.
  - Naver Series Free Pass: 1 every 2h, max 6, **shared across titles**.
  - Kakao Webtoon / KakaoPage 기다무: max 1 **per title**.
  - KakaoPage 기다무+: 5 every 12h (fixed times).
- **Effective discount levers** exist only on the Kakao side: auto-recharge bonus cash (up to 10%, Kakao Webtoon), bulk-purchase discount (10–30%, KakaoPage).
- **Common constraint:** every free/rental mechanism repeats the caveat that **the latest chapters may be inaccessible** — newest chapters are monetized paid-first.


## Open item

- **English-language platforms** (WEBTOON, Tapas, Tappytoon, Lezhin, Manta, etc.): the source section is a placeholder only (`asdf`). FairToon plans to fill this in later. The pricing taxonomy in [05 · Data & Search DB](./05_Data_and_Search_DB.md) already provides the classification framework for them.
