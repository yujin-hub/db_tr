use olive;


SELECT
	a.seq
    , a.property
    , b.seq
    , b.name
FROM CodeGroup a
-- LEFT JOIN Code b on a.seq = b.CodeGroup_seq
INNER JOIN Code b on a.seq = b.CodeGroup_seq
-- JOIN Code b on a.seq = b.CodeGroup_seq
;


-- 로그인
SELECT * FROM user WHERE id = "cuj" AND pw="hello"
; 

-- 회원가입


-- 상품 목록


-- 상품 상세


-- 구매

