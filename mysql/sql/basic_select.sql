use olive;

select
	a.ifmmSeq
    ,a.ifmmName
    ,a.ifmmId
    ,b.ifmaAddress1
from infrMember a
-- left join infrMemberAddress b on b.ifmmSeq = a.ifmmSeq
inner join infrMemberAddress b on b.ifmmSeq = a.ifmmSeq
-- join infrMemberAddress b on b.ifmmSeq = a.ifmmSeq
;


SELECT
	a.seq
	, a.user_seq
    , a.paytype
    , a.price
    , b.seq
    , b.name
FROM purchase a
LEFT JOIN user b on b.seq = a.user_seq
-- INNER JOIN user b on b.seq = a.user_seq
-- JOIN user b on b.seq = a.user_seq
;


SELECT
	a.seq
    , a.property
    , b.seq
    , b.name
FROM CodeGroup a
LEFT JOIN Code b on a.seq = b.CodeGroup_seq
-- INNER JOIN Code b on a.seq = b.CodeGroup_seq
-- JOIN Code b on a.seq = b.CodeGroup_seq
;






