use olive;

-- 코드그룹 , 코드
SELECT
	b.seq
    , b.codeGroup_seq
    , a.propertyKor
	, b.codeseq
    , b.anothercode
    , b.name
    , b.nameEng
    , b.useNY
    , b.regDate
    , b.modDate
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






-- defalutNY
SELECT 
	a.seq
	, a.name
    , a.info_item
    , b.num
    , b.name
FROM item a
INNER JOIN brand_list b on 1=1
	and a.brand_list_seq = b.seq
    and a.defaultNY = 1
;

-- subquery
SELECT
	a.seq
	, (SELECT b.id FROM user b where a.writer = b.seq) as id
    , a.question
    , a.answer
FROM item_qna a 
;

SELECT 
	a.seq
    , a.num
    , a.propertyKor
    , property
    , (SELECT count(*) FROM Code b WHERE a.num = b.codeGroup_seq GROUP BY a.num) as codeNum
    , a.regDate
    , a.modDate
    , a.useNY
    , a.delNY
From CodeGroup a
INNER JOIN Code b on 1 = 1
	and b.codeGroup_seq = a.seq
;


select * from Code;
select * from CodeGroup;



SELECT 
	COUNT(*) codeGroup_seq
From Code a
INNER JOIN CodeGroup b on a.codeGroup_Seq = b.seq
Group by a.codeGroup_Seq
;


-- order by
SELECT
	a.name
    , a.info_item
    , a.numPurchase
    , a.regist
    , b.num
    , b.name
FROM item a
LEFT JOIN brand_list b on 1=1
	and a.brand_list_seq = b.seq
ORDER BY 
	a. regist desc
;

SELECT
	a.name
    , a.info_item
    , a.numPurchase
    , b.num
    , b.name
FROM item a
LEFT JOIN brand_list b on 1=1
	and a.brand_list_seq = b.seq
ORDER BY 
	a. numPurchase desc
;


-- union (중복되는 데이터는 제거 (union all의 경우 중복된 데이터도 다 출력), 공통되지 않은 데이터의 경우 공백이나 의미 없는 컬럼으로 컬럼 갯수 맞출것)
SELECT 
	a.seq
    , a.name
    , a.discount
    , a.price
    , a.regist
    , b.name
FROM item a
LEFT JOIN brand_list b on 1=1
	and a.brand_list_seq = b.seq
WHERE 1=1
	and a.regist between "2021-01-01" and "2021-12-31"

union all

SELECT 
	a.seq
    , a.name
    , a.discount
    , a.price
    , a.regist
    , b.name
FROM item a
LEFT JOIN brand_list b on 1=1
	and a.brand_list_seq = b.seq
WHERE 1=1
	and a.regist between "2020-01-01" and "2020-12-31"
;




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





CREATE TABLE IF NOT EXISTS `olive`.`itemUploaded` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `type` TINYINT NOT NULL,
  `defaultNY` TINYINT NOT NULL,
  `sort` TINYINT NOT NULL,
  `originalName` VARCHAR(100) NOT NULL,
  `uuid` VARCHAR(100) NOT NULL,
  `ext` VARCHAR(45) NOT NULL,
  `size` BIGINT NOT NULL,
  `delNY` TINYINT NOT NULL,
  `pseq` BIGINT NOT NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB 
;


use olive;
select * from itemUploaded;
select * from item;
select * from Code;
select * from CodeGroup;
select * from user;
select * from shipping_addr;


SELECT 
			a.userSeq
			, a.userGrade
			, a.name
			, (SELECT b.name FROM Code b WHERE 1=1 AND a.gender = b.codeseq) as gen
			, a.tel
			, a.email
			, a.accessDate
			, a.userDelNY
		FROM user a
		WHERE 1=1;
        
select  
	FORMAT(price, 0) AS price    
from item;   



select aa.*
from (
SELECT a.seq 
, (SELECT b.name FROM brand_list b WHERE 1=1 AND a.brand_list_seq = b.num) as name 
, a.name , (SELECT FORMAT(a.price, 0)) as price , (SELECT FORMAT((a.price * (100-discount)/100), 
0)) as salePrice , a.regist , (SELECT FORMAT(a.numPurchase, 0)) as numPurchase , a.stock FROM 
item a
) as aa
where 1=1
and brand LIKE CONCAT('%','클리오','%')  ;


SELECT a.seq 
, (SELECT b.name FROM brand_list b WHERE 1=1 AND a.brand_list_seq = b.num) as name 
, a.name 
, (SELECT FORMAT(a.price, 0)) as price , (SELECT FORMAT((a.price * (100-discount)/100), 
0)) as salePrice , a.regist , (SELECT FORMAT(a.numPurchase, 0)) as numPurchase , a.stock FROM 
item a
where 1=1
and name LIKE CONCAT('%','클리오','%')
;

	SELECT aa.*
		FROM 
		 	( SELECT 
					a.seq
					, (SELECT b.name FROM brand_list b WHERE 1=1 AND a.brand_list_seq = b.num) as brand
					, a.name
					, (SELECT FORMAT(a.price, 0)) as price
					, (SELECT FORMAT((a.price * (100-discount)/100), 0)) as salePrice
					, a.regist
					, (SELECT FORMAT(a.numPurchase, 0)) as numPurchase
					, a.stock
				FROM item a ) AS aa
		WHERE 1=1
				;

SELECT 
				a.seq
				, (SELECT b.name FROM brand_list b WHERE 1=1 AND a.seq = b.seq) as brand
				, a.name
				, (SELECT FORMAT(a.price, 0)) as price
				, (SELECT FORMAT((a.price * (100-discount)/100), 0)) as salePrice
				, a.regist
				, (SELECT FORMAT(a.numPurchase, 0)) as numPurchase
				, a.stock
                FROM item a 
		LEFT JOIN brand_list b on a.seq = b.seq
		WHERE 1=1;
    
    
SELECT
		b.seq
		, b.codeGroup_seq
		, a.propertyKor
		, b.codeseq
		, b.anothercode
		, b.name
		, b.nameEng
		, b.useNY
		, b.regDate
		, b.modDate
FROM CodeGroup a
LEFT JOIN Code b on a.seq = b.CodeGroup_seq
WHERE 1=1;
   

use olive;
select * from itemUploaded;
select * from item;
select * from Code;
select * from CodeGroup;
select * from user;
select * from shipping_addr;
select * from brand_list;
select * from profileUploaded;


select 
	*
FROM item 
WHERE brand_list_seq = 11;

-- 실시간 top3
SELECT 
	*
FROM item
ORDER BY numPurchase DESC
LIMIT 3;


-- WEEKLY SPECIAL (랜덤)
SELECT 
	*
FROM item
ORDER BY RAND()
LIMIT 3;




CREATE TABLE `userUploaded` (
  `seq` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT NULL,
  `defaultNy` tinyint(4) DEFAULT NULL,
  `sort` tinyint(4) DEFAULT NULL,
  `path` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `originalName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuidName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `delNy` tinyint(4) NOT NULL,
  `pseq` bigint(20) NOT NULL,
  `regIp` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `regSeq` bigint(20) DEFAULT NULL,
  `regDeviceCd` int(11) DEFAULT NULL,
  `regDateTime` datetime DEFAULT NULL,
  `regDateTimeSvr` datetime DEFAULT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `itemUploaded` (
  `seq` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT NULL,
  `defaultNy` tinyint(4) DEFAULT NULL,
  `sort` tinyint(4) DEFAULT NULL,
  `path` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `originalName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuidName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `delNy` tinyint(4) NOT NULL,
  `pseq` bigint(20) NOT NULL,
  `regIp` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `regSeq` bigint(20) DEFAULT NULL,
  `regDeviceCd` int(11) DEFAULT NULL,
  `regDateTime` datetime DEFAULT NULL,
  `regDateTimeSvr` datetime DEFAULT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


SELECT 
				a.seq
				, (SELECT b.name FROM brand_list b WHERE 1=1 AND a.brand_list_seq = b.num) as brand
				, a.name
				, (SELECT FORMAT(a.price, 0)) as price
				, (SELECT FORMAT((a.price * (100-discount)/100), 0)) as salePrice
				, a.regist
				, (SELECT FORMAT(a.numPurchase, 0)) as numPurchase
				, a.stock
                FROM item a 
		LEFT JOIN brand_list b on a.seq = b.seq
		WHERE 1=1
        ;
