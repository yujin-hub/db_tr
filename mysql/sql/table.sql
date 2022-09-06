use olive;


CREATE TABLE IF NOT EXISTS `olive`.`brand_list` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `num` TINYINT NOT NULL COMMENT '브랜드 리스트',
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
		"KH"
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

INSERT INTO shipping_addr (
		receiver
        , ship_name
        , tel
        , addr
        , user_seq
	) 
VALUES (
		"SE"
        , "home"
        , 44444444
        , "Namyangju"
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
		"SE"
        , "home2"
        , 44444444
        , "Guri"
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
		"SE"
        , "corp"
        , 44444444
        , "Gemcheongu"
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
		"HS"
        , "home"
        , 55555555
        , "Itaewon"
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
		"HS"
        , "home2"
        , 55555555
        , "Incheon"
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
		"HS"
        , "corp"
        , 55555555
        , "Bundang"
		, 5
	)
;

SELECT * FROM shipping_addr;


CREATE TABLE IF NOT EXISTS `olive`.`member2` (
  `seq` INT NOT NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;


INSERT INTO brand_list (
		num
        , name
	)
VALUES (
		1
		, "클리오"
	)
;

INSERT INTO brand_list (
		num
        , name
	)
VALUES (
		2
        , "바이오더마"
	)
;

INSERT INTO brand_list (
		num
        , name
	)
VALUES (
		3
        , "비욘드"
	)
;

INSERT INTO brand_list (
		num
        , name
	)
VALUES (
		4
        , "데싱디바"
	)
;

INSERT INTO brand_list (
		num
        , name
	)
VALUES (
		5
        , "미쟝센"
	)
;


SELECT * FROM brand_list;


INSERT INTO item (
		name
        , brand
        , price
        , shipping
        , select_item
        , select_num
        , total
        , info_item
        , info_purchase
        , brand_list_seq
	)
VALUES (
		"킬커버쿠션"
        , "클리오"
        , 27000
        , "general"
        , "14호"
        , 2
        , 54000
        , "끈적함 없는 뽀송한 마무리감"
        , "성분: 정제수,,"
        , 1
	)
;

INSERT INTO item (
		name
        , brand
        , price
        , shipping
        , select_item
        , select_num
        , total
        , info_item
        , info_purchase
        , brand_list_seq
	)
VALUES (
		"킬브로우 펜슬"
        , "클리오"
        , 15000
        , "today"
        , "7호"
        , 1
        , 15000
        , "물에도 잘 번지지 않는 아이라이너"
        , "성분: 흑색 산화철,,"
        , 1
	)
;

INSERT INTO item (
		name
        , brand
        , price
        , shipping
        , select_item
        , select_num
        , total
        , info_item
        , info_purchase
        , brand_list_seq
	)
VALUES (
		"센시비오 H2O"
        , "바이오더마"
        , 32000
        , "today"
        , "none"
        , 1
        , 32000
        , "판매 1위 클렌징워터"
        , "성분: 정제수,,"
        , 2
	)
;

INSERT INTO item (
		name
        , brand
        , price
        , shipping
        , select_item
        , select_num
        , total
        , info_item
        , info_purchase
        , brand_list_seq
	)
VALUES (
		"아토덤 립스틱"
        , "바이오더마"
        , 10000
        , "general"
        , "1호"
        , 3
        , 30000
        , "입술이 건조한 분들께 추천"
        , "성분: 미네랄 오일,,"
        , 2
	)
;

INSERT INTO item (
		name
        , brand
        , price
        , shipping
        , select_item
        , select_num
        , total
        , info_item
        , info_purchase
        , brand_list_seq
	)
VALUES (
		"엔젤아쿠아 톤업크림"
        , "비욘드"
        , 28000
        , "general"
        , "none"
        , 2
        , 56000
        , "자연스럽게 밝아지는 톤업크림"
        , "성분: 글리세린,,"
        , 3
	)
;

INSERT INTO item (
		name
        , brand
        , price
        , shipping
        , select_item
        , select_num
        , total
        , info_item
        , info_purchase
        , brand_list_seq
	)
VALUES (
		"인텐스 바디에멀젼"
        , "비욘드"
        , 35000
        , "general"
        , "none"
        , 1
        , 35000
        , "안티에이징 바디토탈케어"
        , "성분: 글리세린,,"
        , 3
	)
;

INSERT INTO item (
		name
        , brand
        , price
        , shipping
        , select_item
        , select_num
        , total
        , info_item
        , info_purchase
        , brand_list_seq
	)
VALUES (
		"매직프레스 페디"
        , "데싱디바"
        , 9700
        , "general"
        , "23호"
        , 1
        , 9700
        , "지속력 좋은 네일팁"
        , "환불 및 반품 불가"
        , 4
	)
;

INSERT INTO item (
		name
        , brand
        , price
        , shipping
        , select_item
        , select_num
        , total
        , info_item
        , info_purchase
        , brand_list_seq
	)
VALUES (
		"매직프레스 매니"
        , "데싱디바"
        , 10800
        , "general"
        , "5호"
        , 2
        , 21600
        , "지속력 좋은 네일팁"
        , "환불 및 반품 불가"
        , 4
	)
;

INSERT INTO item (
		name
        , brand
        , price
        , shipping
        , select_item
        , select_num
        , total
        , info_item
        , info_purchase
        , brand_list_seq
	)
VALUES (
		"퍼펙트세럼 미스트"
        , "미쟝센"
        , 18000
        , "today"
        , "none"
        , 1
        , 18000
        , "상한 머릿결 케어"
        , "성분: 변성알코올,,"
        , 5
	)
;

INSERT INTO item (
		name
        , brand
        , price
        , shipping
        , select_item
        , select_num
        , total
        , info_item
        , info_purchase
        , brand_list_seq
	)
VALUES (
		"헬로버블 보색샴푸"
        , "미쟝센"
        , 22000
        , "today"
        , "none"
        , 3
        , 66000
        , "염색 컬러 빠짐 방지"
        , "성분: 소듐벤조에이트,,"
        , 5
	)
;

SELECT * FROM item;


INSERT INTO purchase (
		ship_name
        , receiver
        , tel
        , addr
        , message
        , paytype
        , price
        , coupon
        , total
        , item_seq
        , user_seq
	)
VALUES (
		"home"
        , "YJ"
        , 11111111
        , "Seoul"
        , "문앞"
        , "KBcard"
        , 21600
        , "2000원 할인"
        , 19600
        , 8
        , 1
	)
;

INSERT INTO purchase (
		ship_name
        , receiver
        , tel
        , addr
        , message
        , paytype
        , price
        , coupon
        , total
        , item_seq
        , user_seq
	)
VALUES (
		"home"
        , "MG"
        , 22222222
        , "Gwangju"
        , "문앞"
        , "SHcard"
        , 10000
        , "none"
        , 30000
        , 4
        , 2
	)
;
	
INSERT INTO purchase (
		ship_name
        , receiver
        , tel
        , addr
        , message
        , paytype
        , price
        , coupon
        , total
        , item_seq
        , user_seq
	)
VALUES (
		"home"
        , "MG"
        , 22222222
        , "Gwangju"
        , "문앞"
        , "SHcard"
        , 27000
        , "4000원 할인"
        , 50000
        , 1
        , 2
	)
;

INSERT INTO purchase (
		ship_name
        , receiver
        , tel
        , addr
        , message
        , paytype
        , price
        , coupon
        , total
        , item_seq
        , user_seq
	)
VALUES (
		"corp"
        , "LE"
        , 3333333
        , "Dongjakgu"
        , "none"
        , "SHcard"
        , 35000
        , "none"
        , 35000
        , 6
        , 3
	)
;

INSERT INTO item_qna(
		question
        , writer
        , answer
        , reply
        , date
        , item_seq
	)
VALUES (
		"배송 출발은 언제인가요?"
        , "cuj"
        , "내일 바로 출고됩니다."
        , "Manager"
        , '2022.07.13'
        , 1
	)
;

INSERT INTO item_qna(
		question
        , writer
        , answer
        , reply
        , date
        , item_seq
	)
VALUES (
		"배송이 완료 됐는데 배송완료 표시가 뜨지 않아요."
        , "dpawnl"
        , "바로 처리해드리겠습니다."
        , "Manager"
        , '2022.07.18'
        , 4
	)
;

INSERT INTO item_qna(
		question
        , writer
        , answer
        , reply
        , date
        , item_seq
	)
VALUES (
		"포인트 적립은 언제 되나요?"
        , "dpawnl"
        , "이번주 내로 적립될 예정입니다."
        , "Manager"
        , '2022.07.19'
        , 1
	)
;


SELECT * FROM brand_list;
SELECT * FROM shipping_addr;
SELECT * FROM purchase;
SELECT * FROM user;
SELECT * FROM item;
SELECT * FROM item_qna;


SELECT * FROM CodeGroup;
SELECT * FROM Code;


INSERT INTO CodeGroup(
		property
        , useNY
        , delNY
	)
VALUES (
		"skintype"
		, 1	
        , 0
	)
;

INSERT INTO CodeGroup(
		property
        , useNY
        , delNY
	)
VALUES (
		"message"
		, 1	
        , 0
	)
;

INSERT INTO Code(
		name
        , useNY
        , delNY
        , CodeGroup_seq
	)
VALUES (
		"건성"
		, 1	
        , 0
        , 1
	)
;

INSERT INTO Code(
		name
        , useNY
        , delNY
        , CodeGroup_seq
	)
VALUES (
		"지성"
		, 1	
        , 0
        , 1
	)
;

INSERT INTO Code(
		name
        , useNY
        , delNY
        , CodeGroup_seq
	)
VALUES (
		"복합성"
		, 1	
        , 0
        , 1
	)
;

INSERT INTO Code(
		name
        , useNY
        , delNY
        , CodeGroup_seq
	)
VALUES (
		"중성"
		, 1	
        , 0
        , 1
	)
;

INSERT INTO Code(
		name
        , useNY
        , delNY
        , CodeGroup_seq
	)
VALUES (
		"문 앞에 놔주세요"
		, 1	
        , 0
        , 2
	)
;

INSERT INTO Code(
		name
        , useNY
        , delNY
        , CodeGroup_seq
	)
VALUES (
		"경비실에 맡겨주세요"
		, 1	
        , 0
        , 2
	)
;

INSERT INTO Code(
		name
        , useNY
        , delNY
        , CodeGroup_seq
	)
VALUES (
		"배송 전에 연락주세요"
		, 1	
        , 0
        , 2
	)
;

INSERT INTO Code(
		name
        , useNY
        , delNY
        , CodeGroup_seq
	)
VALUES (
		"부재시 연락주세요"
		, 1	
        , 0
        , 2
	)
;

INSERT INTO Code(
		name
        , useNY
        , delNY
        , CodeGroup_seq
	)
VALUES (
		"직접입력"
		, 1	
        , 0
        , 2
	)
;

CREATE TABLE IF NOT EXISTS `olive`.`CodeGroup` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `property` VARCHAR(45) NOT NULL,
  `useNY` TINYINT NOT NULL,
  `delNY` TINYINT NOT NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `olive`.`Code` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `useNY` TINYINT NOT NULL,
  `delNY` TINYINT NOT NULL,
  `CodeGroup_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_Code_CodeGroup1_idx` (`CodeGroup_seq` ASC) VISIBLE,
  CONSTRAINT `fk_Code_CodeGroup1`
    FOREIGN KEY (`CodeGroup_seq`)
    REFERENCES `olive`.`CodeGroup` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `olive`.`itemOption` (
  `seq` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL COMMENT '호수',
  `item_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_itemOption_item1_idx` (`item_seq` ASC) VISIBLE,
  CONSTRAINT `fk_itemOption_item1`
    FOREIGN KEY (`item_seq`)
    REFERENCES `olive`.`item` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `olive`.`itemOptionDetail` (
  `seq` INT NOT NULL,
  `choice` VARCHAR(45) NOT NULL COMMENT '21호, 23호 등 한 아이템 당 호수',
  `itemOption_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_itemOptionDetail_itemOption1_idx` (`itemOption_seq` ASC) VISIBLE,
  CONSTRAINT `fk_itemOptionDetail_itemOption1`
    FOREIGN KEY (`itemOption_seq`)
    REFERENCES `olive`.`itemOption` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;


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


select  
	FORMAT((price * (100-discount)/100), 0) AS sale    
from item;   



SELECT 
			a.userSeq
			, a.userGrade
			, a.name
			, (SELECT b.name FROM Code b WHERE a.gender = b.codeseq) as gender
			, a.tel
			, a.email
			, DATE_FORMAT(a.accessDate,'%Y-%m-%d') as regDate
			, a.userDelNY
		FROM user a
		WHERE 1=1
			AND userDelNY = 0	
            ;


SELECT 
	a.userSeq
	, a.userGrade
	, a.name
	, (SELECT b.name FROM Code b WHERE a.gender = b.codeseq) as gender
	, a.tel
	, a.email
	, a.accessDate
	, a.userDelNY
FROM user a
WHERE 1=1
	AND userDelNY = 0		
;


SELECT 
			a.userSeq
			, a.userGrade
			, a.name
			, (SELECT b.name FROM Code b WHERE a.gender = b.codeseq) as gender
			, a.tel
			, a.email
			, DATE_FORMAT(a.accessDate,'%Y-%m-%d-%T') as accessDate
			, a.userDelNY
		FROM user a
		WHERE 1=1
			AND userDelNY = 0	
            ;
            

          
            
            
            
