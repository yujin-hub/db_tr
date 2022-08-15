use olive;

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
SELECT 
	name
    , gender
    , dob
From user 
WHERE 
	id = "cuj" 
    AND pw="hello"
; 

-- 메인.실시간 top3 (구매수 컬럼 top3)




-- 메인.weekly special




-- 메인. 주목해야 할 브랜드 




-- 회원가입
INSERT INTO user (
		name
        , gender
        , dob
        , tel
        , id
        , pw
        , nickname
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
        , "유진"
        , "cuj0405@naver.com"
        , 15
        , 2
	)
;

-- 아이디/비밀번호 찾기
SELECT 
	id
FROM user
WHERE
	name = "Yujin"
    AND dob = '1999.04.05'
    AND tel = 11111111
;    

SELECT 
	pw
FROM user
WHERE
	id = "cuj"
    AND dob = '1999.04.05'
    AND tel = 11111111
; 






-- (로그인)
SELECT 
	name
    , gender
    , dob 
FROM user 
WHERE 
	id = "dpawnl"
    AND pw="nice"
; 

SELECT 
	name
    , gender
    , dob
FROM user 
WHERE 
	id = "dpffl" 
    AND pw="happy"
; 

SELECT 
	name
    , gender
    , dob 
FROM user 
WHERE 
	id = "tmdl" 
    AND pw="home"
; 

SELECT 
	name
    , gender
    , dob 
FROM user 
WHERE 
	id = "gustn" 
    AND pw="good"
; 

SELECT 
	name
    , gender
    , dob 
FROM user 
WHERE 
	id = "rhkdgns" 
    AND pw="weather"
; 

SELECT 
	name
    , gender
    , dob
FROM user 
WHERE 
	id = "wjddn" 
    AND pw="sunny"
; 

SELECT 
	name
    , gender
    , dob 
FROM user 
WHERE 
	id = "tnrud" 
    AND pw="cloud"
; 

SELECT 
	name
    , gender
    , dob 
FROM user 
WHERE 
	id = "gyfla" 
    AND pw="world"
; 

SELECT 
	name
    , gender
    , dob 
FROM user 
WHERE 
	id = "dbfl" 
    AND pw="peach"
; 

SELECT 
	name
    , gender
    , dob 
FROM user 
WHERE 
	id = "aoslwj" 
    AND pw="manager"
; 

SELECT 
	name
    , gender
    , dob 
FROM user 
WHERE 
	id = "rhksflwk" 
    AND pw="manager2"
; 
 
 
 -- (회원가입)
INSERT INTO user (
		name
        , gender
        , dob
        , tel
        , id
        , pw
        , nickname
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
        , "민규"
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
        , nickname
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
        , "한별"
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
        , nickname
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
        , "세은"
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
        , nickname
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
        , "효성"
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
        , nickname
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
        , "광훈"
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
        , nickname
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
        , "정우"
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
        , nickname
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
        , "승윤"
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
        , nickname
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
        , "효재"
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
        , nickname
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
        , "유리"
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
        , nickname
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
        , "매니저"
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
        , nickname
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
        , "매니저2"
        , "rhksflwk@gmail.com"
        , 16
        , 3
	)
;


-- 아이디/패스워드 찾기
SELECT 
	id
FROM user
WHERE
	name = "Mingyu"
    AND dob = '1997.01.10'
    AND tel = 22222222
;    

SELECT 
	id
FROM user
WHERE
	name = "Hanbyeol"
    AND dob = '1995.12.18'
    AND tel = 33333333
;  

SELECT 
	id
FROM user
WHERE
	name = "Seeun"
    AND dob = '2000.08.25'
    AND tel = 44444444
;  

SELECT 
	id
FROM user
WHERE
	name = "Hyosung"
    AND dob = '2002.03.07'
    AND tel = 55555555
;  

SELECT 
	id
FROM user
WHERE
	name = "Kwanghoon"
    AND dob = '1996.03.27'
    AND tel = 66666666
;  

SELECT 
	id
FROM user
WHERE
	name = "Jungwoo"
    AND dob = '1995.11.09'
    AND tel = 77777777
;  

SELECT 
	id
FROM user
WHERE
	name = "Seungyoon"
    AND dob = '2002.05.20'
    AND tel = 88888888
; 

SELECT 
	id
FROM user
WHERE
	name = "Hyojae"
    AND dob = '2001.10.25'
    AND tel = 99999999
; 

SELECT 
	id
FROM user
WHERE
	name = "Yuri"
    AND dob = '1992.12.13'
    AND tel = 12345678
; 

SELECT 
	id
FROM user
WHERE
	name = "Manager"
    AND dob = '1992.01.27'
    AND tel = 12341234
; 

SELECT 
	id
FROM user
WHERE
	name = "Manager2"
    AND dob = '1994.05.20'
    AND tel = 43214321
; 


SELECT 
	pw
FROM user
WHERE
	id = "dpawnl"
    AND dob = '1997.01.10'
    AND tel = 22222222
; 
   
SELECT 
	pw
FROM user
WHERE
	id = "dpffl"
    AND dob = '1995.12.18'
    AND tel = 33333333
;  

SELECT 
	pw
FROM user
WHERE
	id = "tmdl"
    AND dob = '2000.08.25'
    AND tel = 44444444
;  

SELECT 
	pw
FROM user
WHERE
	id = "gustn"
    AND dob = '2002.03.07'
    AND tel = 55555555
;  

SELECT 
	pw
FROM user
WHERE
	id = "rhkdgns"
    AND dob = '1996.03.27'
    AND tel = 66666666
;  

SELECT 
	pw
FROM user
WHERE
	id = "wjddn"
    AND dob = '1995.11.09'
    AND tel = 77777777
;  

SELECT 
	pw
FROM user
WHERE
	id = "tnrud"
    AND dob = '2002.05.20'
    AND tel = 88888888
; 

SELECT 
	pw
FROM user
WHERE
	id = "gyfla"
    AND dob = '2001.10.25'
    AND tel = 99999999
; 

SELECT 
	pw
FROM user
WHERE
	id = "dbfl"
    AND dob = '1992.12.13'
    AND tel = 12345678
; 

SELECT 
	pw
FROM user
WHERE
	id = "aoslwj"
    AND dob = '1992.01.27'
    AND tel = 12341234
; 

SELECT 
	pw
FROM user
WHERE
	id = "rhksflwk"
    AND dob = '1994.05.20'
    AND tel = 43214321
; 
