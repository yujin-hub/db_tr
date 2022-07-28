use olive;

DROP TABLE item;
DROP TABLE brand_list;
DROP TABLE shipping_addr;
DROP TABLE user;

CREATE TABLE IF NOT EXISTS `olive`.`brand_list` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `div` TINYINT NOT NULL COMMENT '브랜드 리스트',
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `olive`.`item` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL COMMENT '상품이름',
  `brand` VARCHAR(45) NOT NULL COMMENT '브랜드명',
  `price` INT NOT NULL COMMENT '가격',
  `shipping` VARCHAR(45) NOT NULL COMMENT '배송정보',
  `select_item` VARCHAR(45) NOT NULL COMMENT '상품선택',
  `select_num` TINYINT NOT NULL COMMENT '수량',
  `total` INT NOT NULL COMMENT '금액합계',
  `info_item` VARCHAR(300) NOT NULL COMMENT '상품설명',
  `info_purchase` VARCHAR(300) NOT NULL COMMENT '구매정보',
  `brand_list_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_item_brand_list1_idx` (`brand_list_seq` ASC) VISIBLE,
  CONSTRAINT `fk_item_brand_list1`
    FOREIGN KEY (`brand_list_seq`)
    REFERENCES `olive`.`brand_list` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;

CREATE TABLE IF NOT EXISTS `olive`.`user` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `gender` TINYINT NOT NULL,
  `dob` DATE NOT NULL,
  `tel` VARCHAR(45) NOT NULL,
  `id` VARCHAR(45) NOT NULL,
  `pw` VARCHAR(45) NOT NULL,
  `pw_check` VARCHAR(45) NOT NULL,
  `addr` VARCHAR(60) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `skintype` TINYINT NULL,
  `interest` TINYINT NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `olive`.`shipping_addr` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `ship_name` VARCHAR(45) NOT NULL,
  `receiver` VARCHAR(45) NOT NULL,
  `tel` VARCHAR(45) NOT NULL,
  `addr` VARCHAR(60) NOT NULL,
  `user_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_shipping_addr_user1_idx` (`user_seq` ASC) VISIBLE,
  CONSTRAINT `fk_shipping_addr_user1`
    FOREIGN KEY (`user_seq`)
    REFERENCES `olive`.`user` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `olive`.`interest_list` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `div` TINYINT NOT NULL COMMENT '1: 스킨케어 2: 색조메이크업 3: 바디케어 4: 헤어',
  `item_seq` INT NOT NULL,
  `user_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_interest_list_item1_idx` (`item_seq` ASC) VISIBLE,
  INDEX `fk_interest_list_user1_idx` (`user_seq` ASC) VISIBLE,
  CONSTRAINT `fk_interest_list_item1`
    FOREIGN KEY (`item_seq`)
    REFERENCES `olive`.`item` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_interest_list_user1`
    FOREIGN KEY (`user_seq`)
    REFERENCES `olive`.`user` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `olive`.`purchase` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `ship_name` VARCHAR(45) NOT NULL,
  `receiver` VARCHAR(45) NOT NULL,
  `tel` VARCHAR(45) NOT NULL,
  `addr` VARCHAR(45) NOT NULL,
  `message` TINYINT NOT NULL,
  `paytype` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  `coupon` VARCHAR(45) NOT NULL,
  `total` INT NOT NULL,
  `item_seq` INT NOT NULL,
  `user_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_purchase_item1_idx` (`item_seq` ASC) VISIBLE,
  INDEX `fk_purchase_user1_idx` (`user_seq` ASC) VISIBLE,
  CONSTRAINT `fk_purchase_item1`
    FOREIGN KEY (`item_seq`)
    REFERENCES `olive`.`item` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_user1`
    FOREIGN KEY (`user_seq`)
    REFERENCES `olive`.`user` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `olive`.`purchase_item` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `item_name` INT NOT NULL,
  `brand` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  `select_num` TINYINT NOT NULL,
  `price_sale` INT NOT NULL,
  `purchase_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_purchase_item_purchase1_idx` (`purchase_seq` ASC) VISIBLE,
  CONSTRAINT `fk_purchase_item_purchase1`
    FOREIGN KEY (`purchase_seq`)
    REFERENCES `olive`.`purchase` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `olive`.`item_review` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `star_avg` VARCHAR(45) NOT NULL,
  `nickname` VARCHAR(45) NOT NULL,
  `star_personal` VARCHAR(45) NOT NULL,
  `date_w` DATE NOT NULL,
  `option` TINYINT NOT NULL,
  `write` VARCHAR(100) NOT NULL,
  `item_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_item_review_item1_idx` (`item_seq` ASC) VISIBLE,
  CONSTRAINT `fk_item_review_item1`
    FOREIGN KEY (`item_seq`)
    REFERENCES `olive`.`item` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `olive`.`select_item_list` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `div` TINYINT NOT NULL COMMENT '1:11호,2,12호,3,14호,4,15호,5,13호,6:8호',
  `item_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_select_item_list_item1_idx` (`item_seq` ASC) VISIBLE,
  CONSTRAINT `fk_select_item_list_item1`
    FOREIGN KEY (`item_seq`)
    REFERENCES `olive`.`item` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `olive`.`option_list` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `div` TINYINT NOT NULL COMMENT '1:11호,2,12호,3,14호,4,15호,5,13호,6:8호',
  `select_item_list_seq` INT NOT NULL,
  `item_review_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_option_list_select_item_list_idx` (`select_item_list_seq` ASC) VISIBLE,
  INDEX `fk_option_list_item_review1_idx` (`item_review_seq` ASC) VISIBLE,
  CONSTRAINT `fk_option_list_select_item_list`
    FOREIGN KEY (`select_item_list_seq`)
    REFERENCES `olive`.`select_item_list` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_option_list_item_review1`
    FOREIGN KEY (`item_review_seq`)
    REFERENCES `olive`.`item_review` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `olive`.`item_qna` (
  `seq` INT NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `question` VARCHAR(45) NOT NULL COMMENT '질문',
  `writer` VARCHAR(45) NOT NULL,
  `answer` VARCHAR(150) NOT NULL COMMENT '답',
  `reply` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL COMMENT '날짜',
  `item_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_item_qna_item1_idx` (`item_seq` ASC) VISIBLE,
  CONSTRAINT `fk_item_qna_item1`
    FOREIGN KEY (`item_seq`)
    REFERENCES `olive`.`item` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

INSERT INTO user (
		name
        , gender
        , dob
        , tel
        , id
        , pw
        , pw_check
        , addr
        , email
        , skintype
        , interest
	) 
VALUES (
        "YJ"
        , 1
        , '1999.04.05'
        , 11111111
        , "cuj"
        , "hello"
        , "hello"
        , "Seoul"
        , "cuj0405@naver.com"
        , 2
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
        , pw_check
        , addr
        , email
        , skintype
        , interest
	) 
VALUES (
		"MG"
        , 2
        , '1997.01.10'
        , 22222222
        , "dpawnl"
        ,"nice"
        ,"nice"
        , "Gwangju"
        , "gpawnl@gmail.com"
        , 3
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
        , pw_check
        , addr
        , email
        , skintype
        , interest
	) 
VALUES (
		"LE"
        , 2
        , '1995.12.18'
        , 33333333
        , "dpffl"
        , "happy"
        , "happy"
        , "Namyangju"
        , "dpffl@naver.com"
        , 2
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
        , pw_check
        , addr
        , email
        , skintype
        , interest
	) 
VALUES (
		"SE"
        , 2
		, '2000.08.25'
        , 44444444
        , "tmdl"
        , "home"
        , "home"
        , "Pohang"
        , "tmdl@naver.com"
        , 3
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
        , pw_check
        , addr
        , email
        , skintype
        , interest
	)
VALUES (
		"HS"
        , 1
        , '2002.03.07'
        , 55555555
        , "gustn"
        , "good"
        , "good"
        , "Chuncheon"
        , "gustn@gmail.com"
        , 1
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
        , pw_check
        , addr
        , email
        , skintype
        , interest
	) 
VALUES (
		"GH"
        , 1
        , '1996.03.27'
        , 66666666
        , "rhkdgns"
        , "weather"
        , "weather"
        , "Sokcho"
        , "rhkdgns@naver.com"
        , 1
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
        , pw_check
        , addr
        , email
        , skintype
        , interest
	) 
VALUES (
		"JW"
        , 2
        , '1995.11.09'
        , 77777777
        , "wjddn"
        , "sunny"
        , "sunny"
        , "Gangnueng"
        , "wjddn@naver.com"
        , 2
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
        , pw_check
        , addr
        , email
        , skintype
        , interest
	) 
VALUES (
		"SG"
        , 2
        , '2002.05.20'
        , 88888888
        , "tnrud"
        , "cloud"
        , "cloud"
        , "Incheon"
		, "tnrud@gmail.com"
        , 1
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
        , pw_check
        , addr
        , email
        , skintype
        , interest
	) 
VALUES (
		"HR"
        , 1
        , '2001.10.25'
        , 99999999
        , "gyfla"
        , "world"
        , "world"
        , "Suncheon"
        , "gyfla@naver.com"
        , 2
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
        , pw_check
        , addr
        , email
        , skintype
        , interest
	) 
VALUES (
		"YR"
        , 2
        , '1992.12.13'
        , 12345678
		, "dbfl"
        , "peach"
        , "peach"
        , "Ansan"
        , "dbfl@gmail.com"
        , 4
        , 1
	)
;

SELECT * FROM user;

INSERT INTO shipping_addr (
		receiver
        , ship_name
        , tel
        , addr
        , user_seq
	) 
VALUES (
		"YJ"
        , "home"
        , 11111111
        , "Gangnamgu"
        , 4
	)
;

INSERT INTO shipping_addr (
		receiver
        , ship_name
        , tel
        , addr
        , user_seq
	) 
VALUES (
		"YJ"
        , "home2"
        , 11111111
        , "Seochogu"
        , 4
	)
;

INSERT INTO shipping_addr (
		receiver
        , ship_name
        , tel
        , addr
        , user_seq
	) 
VALUES (
		"YJ"
        , "corp"
        ,  11111111
        , "Enpyeonggu"
        , 4
	)
;

INSERT INTO shipping_addr (
		receiver
        , ship_name
        , tel
        , addr
        , user_seq
	) 
VALUES (
		"MG"
        , "home"
        , 22222222
        , "Dobonggu"
        , 5
	)
;

INSERT INTO shipping_addr (
		receiver
        , ship_name
        , tel
        , addr
        , user_seq
	) 
VALUES (
		"MG"
        , "home2"
        , 22222222
        , "Mapogu"
        , 5
	)
;

INSERT INTO shipping_addr (
		receiver
        , ship_name
        , tel
        , addr
        , user_seq
	) 
    VALUES (
		"MG"
        , "corp"
        , 22222222
        , "Jongnogu"
        , 5
	)
;
        
INSERT INTO shipping_addr (
		receiver
        ,ship_name
        , tel
        , addr
        , user_seq
	) 
VALUES (
		"LE"
        , "home"
        ,  33333333
        , "Nowongu"
        , 6
	)
;

INSERT INTO shipping_addr (
		receiver
        , ship_name
        , tel
        , addr
        , user_seq
	) 
VALUES (
		"LE"
        , "home2"
        , 33333333
        , "Gangbukgu"
        , 6
	)
;

INSERT INTO shipping_addr (
		receiver
        , ship_name
        , tel
        , addr
        , user_seq
	) 
VALUES (
		"LE"
        , "corp"
        , 33333333
        , "Dongjakgu"
		, 6
	)
;

SELECT * FROM shipping_addr;


CREATE TABLE IF NOT EXISTS `olive`.`member2` (
  `seq` INT NOT NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;
