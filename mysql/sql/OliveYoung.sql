use olive;

SELECT * FROM itemOption;
SELECT * FROM itemOptionDetail;
SELECT * FROM item;
SELECT * FROM item_qna;
SELECT * FROM item_review;
SELECT * FROM user;
SELECT * FROM option_list;
SELECT * FROM select_item_list;
SELECT * FROM shipping_addr;
SELECT * FROM purchase;
SELECT * FROM purchase_item;
SELECT * FROM brand_list;
SELECT * FROM Code;
SELECT * FROM CodeGroup;


-- 코드그룹 , 코드
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

SELECT * FROM user WHERE id = "dpawnl" AND pw="nice"
; 

SELECT * FROM user WHERE id = "dpffl" AND pw="happy"
; 

SELECT * FROM user WHERE id = "tmdl" AND pw="home"
; 

SELECT * FROM user WHERE id = "gustn" AND pw="good"
; 

SELECT * FROM user WHERE id = "rhkdgns" AND pw="weather"
; 

SELECT * FROM user WHERE id = "wjddn" AND pw="sunny"
; 

SELECT * FROM user WHERE id = "tnrud" AND pw="cloud"
; 

SELECT * FROM user WHERE id = "gyfla" AND pw="world"
; 

SELECT * FROM user WHERE id = "dbfl" AND pw="peach"
; 

SELECT * FROM user WHERE id = "aoslwj" AND pw="manager"
; 

SELECT * FROM user WHERE id = "rhksflwk" AND pw="manager2"
; 


-- 회원가입
INSERT INTO user (
		name
        , gender
        , dob
        , tel
        , id
        , pw
        , email
        , emailseq
        , skintype
	) 
VALUES (
		"Yujin"
        , 22
        , '1999.04.05'
        , 11111111
        , "cuj"
		, "hello"
        , "cuj0405@naver.com"
        , 15
        , 2
	)
;

INSERT INTO user (
		name
        , gender
        , dob
        , tel
        , id
        , pw
        , email
        , emailseq
        , skintype
	) 
VALUES (
		"Mingyu"
        , 21
        , '1997.01.10'
        , 22222222
        , "dpawnl"
		, "nice"
        , "dpawnl@gmail.com"
        , 16
        , 3
	)
;

INSERT INTO user (
		name
        , gender
        , dob
        , tel
        , id
        , pw
        , email
        , emailseq
        , skintype
	) 
VALUES (
		"Hanbyeol"
        , 22
        , '1995.12.18'
        , 33333333
        , "dpffl"
		, "happy"
        , "dpffl@naver.com"
        , 15
        , 2
	)
;

INSERT INTO user (
		name
        , gender
        , dob
        , tel
        , id
        , pw
        , email
        , emailseq
        , skintype
	) 
VALUES (
		"Seeun"
        , 22
        , '2000.08.25'
        , 44444444
        , "tmdl"
		, "home"
        , "tmdl@naver.com"
        , 15
        , 3
	)
;

INSERT INTO user (
		name
        , gender
        , dob
        , tel
        , id
        , pw
        , email
        , emailseq
        , skintype
	) 
VALUES (
		"Hyosung"
        , 21
        , '2002.03.07'
        , 55555555
        , "gustn"
		, "good"
        , "gustn@gmail.com"
        , 16
        , 1
	)
;

INSERT INTO user (
		name
        , gender
        , dob
        , tel
        , id
        , pw
        , email
        , emailseq
        , skintype
	) 
VALUES (
		"Kwanghoon"
        , 21
        , '1996.03.27'
        , 66666666
        , "rhkdgns"
		, "weather"
        , "rhkdgns@naver.com"
        , 15
        , 1
	)
;

INSERT INTO user (
		name
        , gender
        , dob
        , tel
        , id
        , pw
        , email
        , emailseq
        , skintype
	) 
VALUES (
		"Jungwoo"
        , 22
        , '1995.11.09'
        , 77777777
        , "wjddn"
		, "sunny"
        , "wjddn@naver.com"
        , 15
        , 2
	)
;

INSERT INTO user (
		name
        , gender
        , dob
        , tel
        , id
        , pw
        , email
        , emailseq
        , skintype
	) 
VALUES (
		"Seungyoon"
        , 22
        , '2002.05.20'
        , 88888888
        , "tnrud"
		, "cloud"
        , "tnrud@gmail.com"
        , 16
        , 1
	)
;

INSERT INTO user (
		name
        , gender
        , dob
        , tel
        , id
        , pw
        , email
        , emailseq
        , skintype
	) 
VALUES (
		"Hyojae"
        , 21
        , '2001.10.25'
        , 88888888
        , "gyfla"
		, "world"
        , "gyfla@naver.com"
        , 15
        , 2
	)
;

INSERT INTO user (
		name
        , gender
        , dob
        , tel
        , id
        , pw
        , email
        , emailseq
        , skintype
	) 
VALUES (
		"Yuri"
        , 22
        , '1992.12.13'
        , 12345678
        , "dbfl"
		, "peach"
        , "dbfl@gmail.com"
        , 16
        , 4
	)
;

INSERT INTO user (
		name
        , gender
        , dob
        , tel
        , id
        , pw
        , email
        , emailseq
        , skintype
	) 
VALUES (
		"Manager"
        , 22
        , '1992.01.27'
        , 12341234
        , "aoslwj"
		, "manager"
        , "aoslwj@gmail.com"
        , 16
        , 2
	)
;

INSERT INTO user (
		name
        , gender
        , dob
        , tel
        , id
        , pw
        , email
        , emailseq
        , skintype
	) 
VALUES (
		"Manager2"
        , 21
        , '1994.05.20'
        , 43214321
        , "rhksflwk"
		, "manager2"
        , "rhksflwk@gmail.com"
        , 16
        , 3
	)
;


-- 상품 상세



-- 구매

