-- olive database를 사용
USE olive;

-- 중요!!!!!!!
-- 테이블 수정 전에 반드시 ER 부터 수정!!!! 꼭!!!!!
-- 중요 별 백만개 *******************



-- 전체 컬럼 조회
SELECT * FROM user;

-- 컬럼 추가
ALTER TABLE member2 ADD COLUMN nickname VARCHAR(45);
ALTER TABLE member2 ADD COLUMN name VARCHAR(45);
ALTER TABLE member2 ADD COLUMN ID VARCHAR(45);
ALTER TABLE member2 ADD COLUMN nameEng VARCHAR(45) AFTER name;
ALTER TABLE member2 ADD COLUMN nameChn VARCHAR(45) AFTER name;
ALTER TABLE member2 ADD COLUMN dob DATE;
ALTER TABLE member2 ADD COLUMN gender TINYINT;

-- 컬럼 변경 (자료형을 바꾸는 경우 데이터가 작성되어 있으면 잘 안될수도)
ALTER TABLE member2 MODIFY COLUMN nickname varchar(100);

-- 컬럼 이름 변경
ALTER TABLE member2 CHANGE COLUMN nickname nick VARCHAR(45);

-- 컬럼 삭제
ALTER TABLE member2 DROP COLUMN nick;

-- row 삭제
DELETE FROM user WHERE seq = 10;

-- 데이터 수정
UPDATE user set 
	email = "dbfl@naver.com" 
	, id = "dbfl3"
where seq = 11;

SELECT * FROM user;


-- commit / rollback


SELECT * FROM user 
WHERE 1=1
 -- AND name like '%R'
 -- AND name like 'H%'
 -- AND name like '%R%'
	AND name like '%S%'
;

SELECT * FROM user 
WHERE 1=1
 -- AND skintype = 1
 -- AND skintype > 2
 -- AND skintype >= 2
 -- AND skintype between 2 and 4
	AND skintype < 3
;

SELECT * FROM purchase
WHERE 1=1
AND total is null
;

SELECT * FROM item;

SELECT * FROM item
WHERE 1=1
AND name like '%프레스%'
;

SELECT * FROM item
WHERE 1=1
AND total between 10000 and 25000
;


