-- ============================================================
-- Fairtoon · 카카오웹툰 표지 복구 — 59편
-- 2026-08-15. 18번(링크 정정)의 후속이다.
--
--   배경: 표지가 비어 있던 60편 중 59편이 18번에서 고친 그 작품들이었다.
--         작품 페이지가 403이라 링크도 표지도 함께 못 가져왔던 것이다.
--
--   출처: 각 작품 페이지의 og:image (kakaopagecdn /sharing/2x/ · 600x600).
--         기존 카카오웹툰 138편이 이미 쓰고 있는 것과 같은 형식이라 카드가 어긋나지 않는다.
--         59편 전부 실제로 내려받아 200·image/jpeg·서로 다른 이미지임을 확인했다.
--
--   실행: SQL Editor 에서 Run. 18번을 먼저 돌릴 필요는 없다(서로 독립).
--         여러 번 실행해도 안전하다.
--   ※ 단일 문장 CTE. Supabase SQL Editor에서 임시테이블은 쓰지 않는다.
-- ============================================================

with cov(work_id, title, cover) as (values
(59,'24분의 1 로맨스','https://kr-a.kakaopagecdn.com/P/C/2650/sharing/2x/e14aca43-c63d-434a-a996-ae407c4ebcbd.jpg'),
(66,'99대장','https://kr-a.kakaopagecdn.com/P/C/3862/sharing/2x/a3928b93-ac6b-4e43-be3d-94da92c2e8f7.jpg'),
(70,'DELETE','https://kr-a.kakaopagecdn.com/P/C/3717/sharing/2x/ab00ec14-02af-4721-83e5-51a1d82b3f43.jpg'),
(76,'RAINBOW','https://kr-a.kakaopagecdn.com/P/C/4122/sharing/2x/fc218865-3dee-479e-8db6-1c93e0b07c98.jpg'),
(78,'S급 집사','https://kr-a.kakaopagecdn.com/P/C/4580/sharing/2x/83ca8ca6-af60-493d-8fcf-fbef14ada310.jpg'),
(82,'가드패스','https://kr-a.kakaopagecdn.com/P/C/2511/sharing/2x/e4fbc33f-9093-4548-866d-024afa45170f.jpg'),
(88,'감정사는 조회수로 레벨업한다','https://kr-a.kakaopagecdn.com/P/C/3659/sharing/2x/328742c5-d45d-4419-997a-22b53e17628e.jpg'),
(97,'거인의 꽃','https://kr-a.kakaopagecdn.com/P/C/4344/sharing/2x/b6bd2a9c-ef50-4c03-90e1-0878ebe65531.jpg'),
(101,'검은 머리 아빠는 거두는 게 아니다','https://kr-a.kakaopagecdn.com/P/C/4599/sharing/2x/28b36d6a-e587-4741-b110-c164fdb3c04f.jpg'),
(138,'괴력 영애는 연약해지고 싶어','https://kr-a.kakaopagecdn.com/P/C/4650/sharing/2x/608e6bb2-63f6-4d52-bfb1-ee2011e9354e.jpg'),
(153,'귀짤 로맨스','https://kr-a.kakaopagecdn.com/P/C/3371/sharing/2x/50368f14-d063-42d2-a147-500422a86cda.jpg'),
(159,'그녀의 해피엔딩 공략기','https://kr-a.kakaopagecdn.com/P/C/4553/sharing/2x/4bcd6bbe-dfca-45ae-b09a-71b4e3fccd79.jpg'),
(163,'극락왕생','https://kr-a.kakaopagecdn.com/P/C/2680/sharing/2x/402c05f8-69ef-44ce-b755-e30b81904c8a.jpg'),
(165,'기간한정 대리결혼이지만 씩씩합니다','https://kr-a.kakaopagecdn.com/P/C/4873/sharing/2x/eda5339c-8c4d-4228-9785-da932b88e674.jpg'),
(184,'나를 죽인 황제의 딸로 살아남는 방법','https://kr-a.kakaopagecdn.com/P/C/4589/sharing/2x/4161aa31-4959-4934-b2f7-1d1855485f69.jpg'),
(211,'내가 버린 개에게 물렸을 때','https://kr-a.kakaopagecdn.com/P/C/3800/sharing/2x/e924969d-96e6-4d97-adc8-41b71a3ca332.jpg'),
(219,'냉혈','https://kr-a.kakaopagecdn.com/P/C/3929/sharing/2x/52bca1d4-2c32-4d57-ab02-58bc8ceceed7.jpg'),
(243,'당골의 신부','https://kr-a.kakaopagecdn.com/P/C/3228/sharing/2x/c0975d02-e698-4876-9a0f-f3703c399aca.jpg'),
(251,'대표님과 위장 가족이 되었습니다','https://kr-a.kakaopagecdn.com/P/C/4116/sharing/2x/3558809a-03d5-4703-9a16-5e65a06483ec.jpg'),
(254,'더 챌린저','https://kr-a.kakaopagecdn.com/P/C/2536/sharing/2x/46b53f37-c338-4ae3-a3f9-7a3d86e4f8b0.jpg'),
(257,'덕혜옹주를 도와줘','https://kr-a.kakaopagecdn.com/P/C/4918/sharing/2x/b8a6fe8c-d815-4d44-9bb0-618bca6be047.jpg'),
(262,'도사 아카데미 무위관','https://kr-a.kakaopagecdn.com/P/C/3850/sharing/2x/9a937e1b-53f2-46b3-b1ad-f6216a471eb5.jpg'),
(277,'디어 마이 파라다이스','https://kr-a.kakaopagecdn.com/P/C/4278/sharing/2x/9f9a81d6-cefe-48e1-b769-ebaaf9203e10.jpg'),
(287,'레드스톰 - 왕의 귀환','https://kr-a.kakaopagecdn.com/P/C/823/sharing/2x/377503a8-4b8b-45ce-abeb-6b1109a3a4ab.jpg'),
(298,'마교일진','https://kr-a.kakaopagecdn.com/P/C/4481/sharing/2x/f1ba93a1-7511-4bcd-9929-b8b74ff57831.jpg'),
(322,'먼지 덩어리 짱덕','https://kr-a.kakaopagecdn.com/P/C/4288/sharing/2x/9567cfb6-9d61-43d9-ac52-61a092eb0c27.jpg'),
(324,'멍냥패밀리','https://kr-a.kakaopagecdn.com/P/C/4621/sharing/2x/60f429d1-9c65-476b-801e-858aecf5a002.jpg'),
(345,'무색의 빛','https://kr-a.kakaopagecdn.com/P/C/4732/sharing/2x/54f5cec8-2a68-473f-a3f5-ed00e2b58d9a.jpg'),
(346,'무장 - 무투전','https://kr-a.kakaopagecdn.com/P/C/4064/sharing/2x/659ed8ef-3a0c-4258-9369-9bf63836a99e.jpg'),
(352,'미대괴담','https://kr-a.kakaopagecdn.com/P/C/4604/sharing/2x/dac033a3-56ea-47e3-8ed5-6010b8e18ca2.jpg'),
(366,'바퀴벌레 잔혹사','https://kr-a.kakaopagecdn.com/P/C/4602/sharing/2x/313d1ef3-436b-4f0e-b8a1-4672f7fefd18.jpg'),
(369,'반지하셋방','https://kr-a.kakaopagecdn.com/P/C/1347/sharing/2x/eacb00ec-9034-42cb-a533-7c7690741113.jpg'),
(384,'백일의 나홍이','https://kr-a.kakaopagecdn.com/P/C/4908/sharing/2x/890fc648-f5c5-4b0a-98b0-85ad52269034.jpg'),
(417,'붉은 달밤의 끝자락에서','https://kr-a.kakaopagecdn.com/P/C/4695/sharing/2x/31ed5640-4a35-49b5-b35b-7ae2cecd550a.jpg'),
(425,'블러드레인 제로','https://kr-a.kakaopagecdn.com/P/C/4690/sharing/2x/95cd4e13-903d-4130-941d-9b579e8e5db0.jpg'),
(431,'비엘로 빌런 탈출','https://kr-a.kakaopagecdn.com/P/C/4899/sharing/2x/5b38ed00-3640-4bf1-8f06-073358c7382c.jpg'),
(478,'샤이닝 썸머','https://kr-a.kakaopagecdn.com/P/C/3749/sharing/2x/7bbdeaf9-ba05-4fb0-9a64-b7fc99cfd715.jpg'),
(479,'샤크','https://kr-a.kakaopagecdn.com/P/C/2308/sharing/2x/d630b11e-d620-43be-b079-c3a6e98f6eae.jpg'),
(494,'세자, 죽이기','https://kr-a.kakaopagecdn.com/P/C/4629/sharing/2x/1f8598b5-ba61-4c20-ac1b-9a27cd26501f.jpg'),
(521,'슬프게도 이게 내 인생','https://kr-a.kakaopagecdn.com/P/C/1575/sharing/2x/7e518f86-dc68-4583-9d2f-99ca3b873d04.jpg'),
(557,'아무튼 로판 맞습니다','https://kr-a.kakaopagecdn.com/P/C/4834/sharing/2x/c3ca51e8-cb04-49cf-96e5-e69c82ba0b9f.jpg'),
(593,'어느 날 남주가 우리 집에 떨어졌다','https://kr-a.kakaopagecdn.com/P/C/4893/sharing/2x/30a1aee3-9007-4a89-a550-2a64b36d251e.jpg'),
(622,'연하남편의 미래를 위해 이혼장을 두고 나간 결과','https://kr-a.kakaopagecdn.com/P/C/4746/sharing/2x/e61fdc86-b004-4995-bf4f-3f5a2b2074e6.jpg'),
(623,'연하는 욕구불만 [15세 개정판]','https://kr-a.kakaopagecdn.com/P/C/4170/sharing/2x/be248ae1-fcd8-4cdc-8934-223e20da1f8c.jpg'),
(680,'위아영','https://kr-a.kakaopagecdn.com/P/C/4229/sharing/2x/dad3b610-2eb8-46cd-94c2-1959f8e95c8b.jpg'),
(684,'유니유니툰','https://kr-a.kakaopagecdn.com/P/C/4624/sharing/2x/47a5f4c5-8628-4f92-a98d-710ec2c01549.jpg'),
(700,'이세계 덤프트럭','https://kr-a.kakaopagecdn.com/P/C/3479/sharing/2x/be069842-e469-4722-a0dc-a3c590cbce43.jpg'),
(710,'인생이 레몬을 건네면 위스키를 더하라','https://kr-a.kakaopagecdn.com/P/C/4780/sharing/2x/ae9c8c03-ab3e-44d3-b786-b9708f58d1bb.jpg'),
(714,'일보신권','https://kr-a.kakaopagecdn.com/P/C/4220/sharing/2x/7eb312a0-fa08-4e49-a71d-c6be931730ff.jpg'),
(725,'재워주는 사이','https://kr-a.kakaopagecdn.com/P/C/2986/sharing/2x/c8466ca0-4c73-41d8-8df9-0f46042e4639.jpg'),
(742,'제목이 보이는데요','https://kr-a.kakaopagecdn.com/P/C/4702/sharing/2x/88973d51-f0eb-46fb-9673-2287ada0a067.jpg'),
(749,'존버닥터: 닥터 섬보이','https://kr-a.kakaopagecdn.com/P/C/3813/sharing/2x/06bc932a-2f48-4eaf-9e8f-b6a3e317f982.jpg'),
(775,'진짜 x됐다.','https://kr-a.kakaopagecdn.com/P/C/4535/sharing/2x/92c5d44a-d722-45e0-8be8-936f3394e478.jpg'),
(827,'칠흑이 삼킨 여름','https://kr-a.kakaopagecdn.com/P/C/4500/sharing/2x/28f8363b-8e67-47e9-a4fa-9036c2aa1e1f.jpg'),
(837,'퀴퀴한 일기','https://kr-a.kakaopagecdn.com/P/C/1295/sharing/2x/448a8742-fea6-43c7-a284-c8c469854e79.jpg'),
(873,'플렉스(FLEX)','https://kr-a.kakaopagecdn.com/P/C/3584/sharing/2x/771e9364-8066-416e-af49-0a973deaf8e0.jpg'),
(880,'하백의 신부 2','https://kr-a.kakaopagecdn.com/P/C/4680/sharing/2x/d12231fd-cd02-4a59-bfc8-212dba530619.jpg'),
(906,'홍택의 반격','https://kr-a.kakaopagecdn.com/P/C/4239/sharing/2x/85562cec-1cbf-4611-a5c3-be7130a84656.jpg'),
(910,'환생보스','https://kr-a.kakaopagecdn.com/P/C/3788/sharing/2x/adbd3d4b-d789-4417-a5e4-3d6834edca42.jpg')
)
update public.works w
   set cover_url = c.cover,
       updated_at = now()
  from cov c
 where w.id = c.work_id
   and w.cover_url is null;


-- 확인용 ① 표지 없는 작품 수 (기대값 1 — 카카오웹툰 외 1편이 남는다)
select count(*) as works_without_cover from public.works where cover_url is null;

-- 확인용 ② 이번에 채운 59편
select w.title_ko, w.cover_url
  from public.works w
 where w.cover_url like '%kakaopagecdn.com/P/C/%/sharing/%'
 order by w.title_ko;
