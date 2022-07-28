-- olive database를 사용
USE olive;

-- 중요!!!!!!!
-- 테이블 수정 전에 반드시 ER 부터 수정!!!! 꼭!!!!!
-- 중요 별 백만개 *******************



-- 전체 컬럼 조회
SELECT * FROM user;

-- 컬럼 추가
ALTER TABLE member2 ADD column nickname VARCHAR(45);
ALTER TABLE member2 ADD column name VARCHAR(45);
ALTER TABLE member2 ADD column ID VARCHAR(45);
ALTER TABLE member2 ADD column nameEng VARCHAR(45) AFTER name;
ALTER TABLE member2 ADD column nameChn VARCHAR(45) AFTER name;
ALTER TABLE member2 ADD column dob DATE;
ALTER TABLE member2 ADD column gender TINYINT;

-- 컬럼 변경 (자료형을 바꾸는 경우 데이터가 작성되어 있으면 잘 안될수도)
ALTER TABLE member2 MODIFY column nickname varchar(100);

-- 컬럼 이름 변경
ALTER TABLE member2 CHANGE column nickname nick VARCHAR(45);
