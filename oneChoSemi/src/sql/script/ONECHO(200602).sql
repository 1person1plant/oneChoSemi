-- 테이블 삭제
DROP TABLE ITEMIMAGE;
DROP TABLE CARTLIST;
DROP TABLE NOTICE;
DROP TABLE QNA;
DROP TABLE REVIEW;
DROP TABLE statistic;
DROP TABLE WISHLIST;
DROP TABLE ORDERLIST;
DROP TABLE PAYMENT;
DROP TABLE IMAGE;
DROP TABLE ITEM;
DROP TABLE KEYWORD;
DROP TABLE DELIVERY;
DROP TABLE MEMBER;
DROP TABLE RANK;
-- 전 테이블 드롭 완료

-- 테이블 추가
--DROP TABLE member;

CREATE TABLE member (
	member_no NVARCHAR2(10) CONSTRAINT PK_MEMBER PRIMARY KEY,
	member_admin NVARCHAR2(2) DEFAULT 'N' NOT NULL CONSTRAINT CK_member_admin CHECK(member_admin in('Y', 'N')),
	member_id NVARCHAR2(30) NOT NULL,
	member_pwd NVARCHAR2(30) NOT NULL,
	member_name	NVARCHAR2(30) NOT NULL,
	member_phone1 NVARCHAR2(10) NOT NULL,
	member_phone2 NVARCHAR2(10) NOT NULL,
	member_phone3 NVARCHAR2(10) NOT NULL,
	member_email1 NVARCHAR2(30),
	member_email2 NVARCHAR2(30),
	member_postcode	NVARCHAR2(30),
	member_address1	NVARCHAR2(2000),
	member_address2	NVARCHAR2(2000),
	member_joinDate	DATE DEFAULT SYSDATE NOT NULL,
	member_status NVARCHAR2(2) DEFAULT 'N' NOT NULL CONSTRAINT CK_member_status CHECK(member_status in('Y', 'N')),
	member_exit	NVARCHAR2(500),
	member_point NUMBER,
	member_rank	NVARCHAR2(10) NOT NULL
);
alter table member add CONSTRAINT UQ_MEMBER_ID UNIQUE(member_id);

COMMENT ON COLUMN member.member_no IS '회원번호(M1~)';
COMMENT ON COLUMN member.member_admin IS '관리자:Y, 일반회원:N';
COMMENT ON COLUMN member.member_id IS '아이디,유니크';
COMMENT ON COLUMN member.member_pwd IS '비밀번호';
COMMENT ON COLUMN member.member_name IS '이름';
COMMENT ON COLUMN member.member_phone1 IS '연락처1';
COMMENT ON COLUMN member.member_phone2 IS '연락처2';
COMMENT ON COLUMN member.member_phone3 IS '연락처3';
COMMENT ON COLUMN member.member_email1 IS '이메일1';
COMMENT ON COLUMN member.member_email2 IS '이메일2';
COMMENT ON COLUMN member.member_postcode IS '우편번호';
COMMENT ON COLUMN member.member_address1 IS '주소';
COMMENT ON COLUMN member.member_address2 IS '상세주소';
COMMENT ON COLUMN member.member_joinDate IS '회원가입날짜';
COMMENT ON COLUMN member.member_status IS '탈퇴:Y 기본: N,회원상태';
COMMENT ON COLUMN member.member_exit IS '탈퇴사유';
COMMENT ON COLUMN member.member_point IS '포인트';
COMMENT ON COLUMN member.member_rank IS '등급번호(R1~R5)';

--DROP TABLE rank;

CREATE TABLE rank (
	rank_no	NVARCHAR2(10) CONSTRAINT PK_RANK PRIMARY KEY,
	rank_name NVARCHAR2(60),
	rank_pointRat NUMBER,
	rank_pointCap NUMBER,
	rank_pointMin NUMBER,
	rank_pointMax NUMBER
);

COMMENT ON COLUMN rank.rank_no IS '등급번호(R1~R5)';
COMMENT ON COLUMN rank.rank_name IS '등급이름(씨앗,새싹,가지,열매,나무)';
COMMENT ON COLUMN rank.rank_pointRat IS '등급적립율(1%~5%)';
COMMENT ON COLUMN rank.rank_pointCap IS '포인트사용한도(2000~10000)';
COMMENT ON COLUMN rank.rank_pointMin IS '등급업 최소 구매금액';
COMMENT ON COLUMN rank.rank_pointMax IS '등급업 최대 구매 금액';

--DROP TABLE review;

CREATE TABLE review (
	review_no NVARCHAR2(10) CONSTRAINT PK_REVIEW PRIMARY KEY,
	order_no NVARCHAR2(10) NOT NULL,
	item_no	NVARCHAR2(10) NOT NULL,
	member_no NVARCHAR2(10) NOT NULL,
	review_cDate DATE DEFAULT SYSDATE,
	review_rate	NUMBER,
	review_content NVARCHAR2(2000),
	review_uDate DATE DEFAULT SYSDATE,
	image_no NVARCHAR2(14)
);

COMMENT ON COLUMN review.review_no IS '리뷰번호(R1~ )';
COMMENT ON COLUMN review.order_no IS '주문번호(O1~ )';
COMMENT ON COLUMN review.item_no IS '상품번호(I1~ )';
COMMENT ON COLUMN review.member_no IS '회원번호';
COMMENT ON COLUMN review.review_cDate IS '리뷰등록일';
COMMENT ON COLUMN review.review_rate IS '평점';
COMMENT ON COLUMN review.review_content IS '리뷰내용';
COMMENT ON COLUMN review.review_uDate IS '리뷰수정일';
COMMENT ON COLUMN review.image_no IS '이미지번호(img1~) 고객용';

--DROP TABLE cartList;

CREATE TABLE cartList (
	cartList_no	NVARCHAR2(10) CONSTRAINT PK_CARTLIST PRIMARY KEY,
	item_no NVARCHAR2(10) NOT NULL,
	member_no NVARCHAR2(10) NOT NULL,
	cartList_count NUMBER
);

COMMENT ON COLUMN cartList.cartList_no IS '장바구니번호(C1~)';
COMMENT ON COLUMN cartList.item_no IS '상품번호';
COMMENT ON COLUMN cartList.member_no IS '회원번호(M1~)';
COMMENT ON COLUMN cartList.cartList_count IS '수량';

--DROP TABLE wishList;

CREATE TABLE wishList (
	wishList_no	NVARCHAR2(10) CONSTRAINT PK_WISHLIST PRIMARY KEY,
	item_no	NVARCHAR2(10) NOT NULL,
	member_no NVARCHAR2(10) NOT NULL,
	wishList_memo NVARCHAR2(500)
);

COMMENT ON COLUMN wishList.wishList_no IS '위시리스트번호(W1~)';
COMMENT ON COLUMN wishList.item_no IS '상품번호';
COMMENT ON COLUMN wishList.member_no IS '회원번호(M1~)';
COMMENT ON COLUMN wishList.wishList_memo IS '메모';

--DROP TABLE orderList;

CREATE TABLE orderList (
	order_no NVARCHAR2(10),
	item_no	NVARCHAR2(10),
	member_no NVARCHAR2(10) NOT NULL,
	order_date DATE DEFAULT SYSDATE NOT NULL,
	order_count	NUMBER NOT NULL,
	order_usePoint	NUMBER NOT NULL,
	order_name	NVARCHAR2(100) NOT NULL,
	order_phone1 NVARCHAR2(10) NOT NULL,
	order_phone2 NVARCHAR2(10) NOT NULL,
	order_phone3 NVARCHAR2(10) NOT NULL,
	order_postcode NVARCHAR2(30) NOT NULL,
	order_address1 NVARCHAR2(2000) NOT NULL,
	order_address2 NVARCHAR2(2000) NOT NULL,
	order_request NVARCHAR2(2000),
	order_dCost	NUMBER NOT NULL,
	order_cancelRequest	NVARCHAR2(2) DEFAULT 'N' CONSTRAINT CK_order_cancelRequest CHECK(order_cancelRequest in('Y', 'N')),
	order_cancelYN NVARCHAR2(2) DEFAULT 'N' CONSTRAINT CK_order_cancelYN CHECK(order_cancelYN in('Y', 'N')),
	delivery_code NVARCHAR2(10) NOT NULL,
	payment_code NVARCHAR2(10) DEFAULT 'P1' NOT NULL
);
ALTER TABLE orderList ADD CONSTRAINT PK_ORDERLIST PRIMARY KEY (
	order_no,
	item_no
);

COMMENT ON COLUMN orderList.order_no IS '주문번호(O1~ )';
COMMENT ON COLUMN orderList.item_no IS '상품번호(I1~)';
COMMENT ON COLUMN orderList.member_no IS '회원번호(M1~)';
COMMENT ON COLUMN orderList.order_date IS '주문일시';
COMMENT ON COLUMN orderList.order_count IS '주문수량';
COMMENT ON COLUMN orderList.order_usePoint IS '사용포인트';
COMMENT ON COLUMN orderList.order_name IS '수령자이름';
COMMENT ON COLUMN orderList.order_phone1 IS '수령자전화번호1';
COMMENT ON COLUMN orderList.order_phone2 IS '수령자전화번호2';
COMMENT ON COLUMN orderList.order_phone3 IS '수령자전화번호3';
COMMENT ON COLUMN orderList.order_postcode IS '수령자우편번호';
COMMENT ON COLUMN orderList.order_address1 IS '수령자주소';
COMMENT ON COLUMN orderList.order_address2 IS '수령자상세주소';
COMMENT ON COLUMN orderList.order_request IS '배송시요청사항';
COMMENT ON COLUMN orderList.order_dCost IS '배송비';
COMMENT ON COLUMN orderList.order_cancelRequest IS '기본: N , 취소 : Y';
COMMENT ON COLUMN orderList.order_cancelYN IS '기본: N , 승인 : Y (주문 삭제 효과)';
COMMENT ON COLUMN orderList.delivery_code IS 'D1 : 배송전, D2 : 배송중, D3 : 배송완료';
COMMENT ON COLUMN orderList.payment_code IS 'P1 : 입금 전, P2 : 입금 후';

--DROP TABLE qna;

CREATE TABLE qna (
	qna_no NVARCHAR2(10) CONSTRAINT PK_QNA PRIMARY KEY,
	member_no NVARCHAR2(10) NOT NULL,
	qna_title NVARCHAR2(100) NOT NULL,
	qna_cDate DATE,
	qna_content	NVARCHAR2(2000),
	qna_answer NVARCHAR2(2000),
	qna_category NVARCHAR2(20) NOT NULL,
    qna_password NVARCHAR2(20) NOT NULL,
	qna_YN NVARCHAR2(2) DEFAULT 'N' CONSTRAINT CK_qna_YN CHECK(qna_YN in('Y', 'N')),
	image_no NVARCHAR2(14)
);

COMMENT ON COLUMN qna.qna_no IS '글번호(Q1~)';
COMMENT ON COLUMN qna.member_no IS '회원번호(M1~)';
COMMENT ON COLUMN qna.qna_title IS '질문제목';
COMMENT ON COLUMN qna.qna_cDate IS '게시일';
COMMENT ON COLUMN qna.qna_content IS '내용';
COMMENT ON COLUMN qna.qna_answer IS '답변';
COMMENT ON COLUMN qna.qna_category IS '분류';
COMMENT ON COLUMN qna.qna_YN IS '답변 전 : N, 답변 : Y';
COMMENT ON COLUMN qna.image_no IS '이미지번호(img1~)';
COMMENT ON COLUMN qna.qna_password IS '비밀번호';

--DROP TABLE notice;

CREATE TABLE notice (
	notice_no NVARCHAR2(10) CONSTRAINT PK_NOTICE PRIMARY KEY,
	member_no NVARCHAR2(10) NOT NULL,
	notice_title NVARCHAR2(100) NOT NULL,
	notice_cDate DATE,
	notice_content NVARCHAR2(2000),
	image_no NVARCHAR2(14)
);

COMMENT ON COLUMN notice.notice_no IS '공지글번호(N1~)';
COMMENT ON COLUMN notice.member_no IS '회원번호(M1~)';
COMMENT ON COLUMN notice.notice_title IS '제목';
COMMENT ON COLUMN notice.notice_cDate IS '게시일';
COMMENT ON COLUMN notice.notice_content IS '내용';
COMMENT ON COLUMN notice.image_no IS '이미지번호(img1~)';

--DROP TABLE keyword;

CREATE TABLE keyword (
	keyword_no NVARCHAR2(10) CONSTRAINT PK_KEYWORD PRIMARY KEY,
	keyword_name NVARCHAR2(20)
);

COMMENT ON COLUMN keyword.keyword_no IS '키워드번호(K1~)';
COMMENT ON COLUMN keyword.keyword_name IS '중복 선택 (new, best, 공기정화, 반려동물 친화)';

--DROP TABLE item;

CREATE TABLE item (
	item_no NVARCHAR2(10) CONSTRAINT PK_ITEM PRIMARY KEY,
	item_name NVARCHAR2(50) NOT NULL,
	item_category NVARCHAR2(2000) NOT NULL,
	keyword_no NVARCHAR2(20) NOT NULL,
	item_price NUMBER NOT NULL,
	item_discount NUMBER NOT NULL,
	item_rate NUMBER,
	item_stock NUMBER NOT NULL,
	item_display NVARCHAR2(2) DEFAULT 'N' NOT NULL CONSTRAINT CK_item_display CHECK(item_display in('Y', 'N')),
	item_info NVARCHAR2(2000) NOT NULL,
	item_cDate DATE	DEFAULT SYSDATE	NOT NULL,
	item_uDate DATE DEFAULT SYSDATE,
	item_max NUMBER NOT NULL,
	item_sale NVARCHAR2(2) DEFAULT 'Y' CONSTRAINT CK_item_sale CHECK(item_sale in('Y', 'N'))
);

COMMENT ON COLUMN item.item_no IS '상품번호(I1~)';
COMMENT ON COLUMN item.item_name IS '상품명';
COMMENT ON COLUMN item.item_category IS '상품카테고리';
COMMENT ON COLUMN item.keyword_no IS '키워드번호(K1~)';
COMMENT ON COLUMN item.item_price IS '상품가격';
COMMENT ON COLUMN item.item_discount IS '할인값';
COMMENT ON COLUMN item.item_rate IS '평점';
COMMENT ON COLUMN item.item_stock IS '상품재고';
COMMENT ON COLUMN item.item_display IS '전시 : Y, 비전시 : N';
COMMENT ON COLUMN item.item_info IS '상품설명텍스트';
COMMENT ON COLUMN item.item_cDate IS '상품등록일';
COMMENT ON COLUMN item.item_uDate IS '최종수정일';
COMMENT ON COLUMN item.item_max IS '최대구매수량';
COMMENT ON COLUMN item.item_sale IS '판매중 : Y, 판매중지 : N';

--DROP TABLE statistic;

CREATE TABLE statistic (
	statistic_no NVARCHAR2(14) CONSTRAINT PK_STATISTIC PRIMARY KEY,
	statistic_visitCount NUMBER,
	statistic_toDayJoin NUMBER,
	statistic_cancelCount NUMBER,
	statistic_member NUMBER,
	statistic_dAsk NUMBER,
	statistic_iAsk NUMBER,
	statistic_cAsk NUMBER,
	statistic_sales NUMBER,
	statistic_dBefore	NUMBER,
	statistic_newOrder NUMBER,
	statistic_cDate DATE DEFAULT SYSDATE
);

COMMENT ON COLUMN statistic.statistic_no IS '일일통계(sta1-)';
COMMENT ON COLUMN statistic.statistic_visitCount IS '방문자수';
COMMENT ON COLUMN statistic.statistic_toDayJoin IS '금일가입';
COMMENT ON COLUMN statistic.statistic_cancelCount IS '취소요청';
COMMENT ON COLUMN statistic.statistic_member IS '전체회원';
COMMENT ON COLUMN statistic.statistic_dAsk IS '배송문의';
COMMENT ON COLUMN statistic.statistic_iAsk IS '상품문의';
COMMENT ON COLUMN statistic.statistic_cAsk IS '취소문의';
COMMENT ON COLUMN statistic.statistic_sales IS '금일매출';
COMMENT ON COLUMN statistic.statistic_dBefore IS '배송대기';
COMMENT ON COLUMN statistic.statistic_newOrder IS '신규주문';
COMMENT ON COLUMN statistic.statistic_cDate IS '등록일';

--DROP TABLE delivery;

CREATE TABLE delivery (
	delivery_code NVARCHAR2(10) DEFAULT 'D1' CONSTRAINT PK_DELIVERY PRIMARY KEY,
	delivery_status	NVARCHAR2(100)
);

COMMENT ON COLUMN delivery.delivery_code IS 'D1 : 배송전, D2 : 배송중, D3 : 배송완료(배송코드)';
COMMENT ON COLUMN delivery.delivery_status IS '배송전, 배송중, 배송완료(배송상태)';

--DROP TABLE payment;

CREATE TABLE payment (
	payment_code NVARCHAR2(10) DEFAULT 'P1' CONSTRAINT PK_PAYMENT PRIMARY KEY,
	payment_status NVARCHAR2(100)
);

COMMENT ON COLUMN payment.payment_code IS 'P1 : 입금 전, P2 : 입금 후(입금코드)';
COMMENT ON COLUMN payment.payment_status IS '입금 전, 입금 후(입금상태)';

--DROP TABLE image;

CREATE TABLE image (
	image_no NVARCHAR2(14) CONSTRAINT PK_IMAGE PRIMARY KEY,
	image_path NVARCHAR2(2000),
	image_name NVARCHAR2(2000)
);

COMMENT ON COLUMN image.image_no IS '이미지번호(img1~)';
COMMENT ON COLUMN image.image_path IS '이미지 경로';
COMMENT ON COLUMN image.image_name IS '이미지 명칭';

--DROP TABLE itemImage;

CREATE TABLE itemImage (
    itemImage_no NVARCHAR2(14) CONSTRAINT PK_ITEMIMAGE PRIMARY KEY,
    item_no   NVARCHAR2(10),
    image_no NVARCHAR2(14),
    itemImage_category NUMBER
);

COMMENT ON COLUMN itemImage.itmeImage_no IS '상품이미지 번호(Ii1~)';
COMMENT ON COLUMN itemImage.item_no IS '상품번호(I1~)';
COMMENT ON COLUMN itemImage.image_no IS '이미지번호(img1~)';
COMMENT ON COLUMN itemImage.itemImage_category IS '메인이미지:1,서브이미지:2';

ALTER TABLE member ADD CONSTRAINT FK_rank_TO_member FOREIGN KEY ( member_rank )
REFERENCES rank ( rank_no );

ALTER TABLE review ADD CONSTRAINT FK_orderList_TO_review FOREIGN KEY ( order_no, item_no )
REFERENCES orderList ( order_no, item_no );

ALTER TABLE review ADD CONSTRAINT FK_member_TO_review FOREIGN KEY ( member_no )
REFERENCES member ( member_no );

ALTER TABLE review ADD CONSTRAINT FK_image_TO_review FOREIGN KEY ( image_no )
REFERENCES image ( image_no );

ALTER TABLE cartList ADD CONSTRAINT FK_item_TO_cartList FOREIGN KEY ( item_no )
REFERENCES item ( item_no );

ALTER TABLE cartList ADD CONSTRAINT FK_member_TO_cartList FOREIGN KEY ( member_no )
REFERENCES member ( member_no );

ALTER TABLE wishList ADD CONSTRAINT FK_item_TO_wishList FOREIGN KEY ( item_no )
REFERENCES item ( item_no );

ALTER TABLE wishList ADD CONSTRAINT FK_member_TO_wishList FOREIGN KEY ( member_no )
REFERENCES member ( member_no );

ALTER TABLE orderList ADD CONSTRAINT FK_item_TO_orderList FOREIGN KEY ( item_no )
REFERENCES item ( item_no );

ALTER TABLE orderList ADD CONSTRAINT FK_member_TO_orderList FOREIGN KEY ( member_no )
REFERENCES member (	member_no );

ALTER TABLE orderList ADD CONSTRAINT FK_delivery_TO_orderList FOREIGN KEY ( delivery_code )
REFERENCES delivery ( delivery_code );

ALTER TABLE orderList ADD CONSTRAINT FK_payment_TO_orderList FOREIGN KEY ( payment_code )
REFERENCES payment ( payment_code );

ALTER TABLE qna ADD CONSTRAINT FK_member_TO_qna FOREIGN KEY ( member_no )
REFERENCES member ( member_no );

ALTER TABLE qna ADD CONSTRAINT FK_image_TO_qna FOREIGN KEY ( image_no )
REFERENCES image ( image_no );

ALTER TABLE notice ADD CONSTRAINT FK_member_TO_notice FOREIGN KEY ( member_no )
REFERENCES member ( member_no );

ALTER TABLE notice ADD CONSTRAINT FK_image_TO_notice FOREIGN KEY ( image_no )
REFERENCES image ( image_no );

ALTER TABLE item ADD CONSTRAINT FK_keyword_TO_item FOREIGN KEY ( keyword_no )
REFERENCES keyword ( keyword_no );

ALTER TABLE itemImage ADD CONSTRAINT FK_item_TO_itemImage FOREIGN KEY ( item_no )
REFERENCES item ( item_no );

ALTER TABLE itemImage ADD CONSTRAINT FK_image_TO_itemImage FOREIGN KEY ( image_no )
REFERENCES image ( image_no );

-- data 추가

REM INSERTING into ONECHO.RANK
SET DEFINE OFF;
Insert into ONECHO.RANK (RANK_NO,RANK_NAME,RANK_POINTRAT,RANK_POINTCAP,RANK_POINTMIN,RANK_POINTMAX) values ('R1','씨앗',1,2000,0,50000);
Insert into ONECHO.RANK (RANK_NO,RANK_NAME,RANK_POINTRAT,RANK_POINTCAP,RANK_POINTMIN,RANK_POINTMAX) values ('R2','새싹',2,4000,50001,200000);
Insert into ONECHO.RANK (RANK_NO,RANK_NAME,RANK_POINTRAT,RANK_POINTCAP,RANK_POINTMIN,RANK_POINTMAX) values ('R3','가지',3,6000,200001,500000);
Insert into ONECHO.RANK (RANK_NO,RANK_NAME,RANK_POINTRAT,RANK_POINTCAP,RANK_POINTMIN,RANK_POINTMAX) values ('R4','열매',4,8000,500001,1000000);
Insert into ONECHO.RANK (RANK_NO,RANK_NAME,RANK_POINTRAT,RANK_POINTCAP,RANK_POINTMIN,RANK_POINTMAX) values ('R5','나무',5,10000,1000001,999999999);

REM INSERTING into ONECHO.MEMBER
SET DEFINE OFF;
Insert into ONECHO.MEMBER (MEMBER_NO,MEMBER_ADMIN,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE1,MEMBER_PHONE2,MEMBER_PHONE3,MEMBER_EMAIL1,MEMBER_EMAIL2,MEMBER_POSTCODE,MEMBER_ADDRESS1,MEMBER_ADDRESS2,MEMBER_JOINDATE,MEMBER_STATUS,MEMBER_EXIT,MEMBER_POINT,MEMBER_RANK) values ('M1','Y','admin1','admin1','정유진','010','1234','5678','admin1','@oncho.com','12345','2','2',to_date('20/06/02','RR/MM/DD'),'N',null,2000,'R2');
Insert into ONECHO.MEMBER (MEMBER_NO,MEMBER_ADMIN,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE1,MEMBER_PHONE2,MEMBER_PHONE3,MEMBER_EMAIL1,MEMBER_EMAIL2,MEMBER_POSTCODE,MEMBER_ADDRESS1,MEMBER_ADDRESS2,MEMBER_JOINDATE,MEMBER_STATUS,MEMBER_EXIT,MEMBER_POINT,MEMBER_RANK) values ('M2','Y','admin2','admin2','강광산','010','1234','5678','admin2','@oncho.com','12345','2','2',to_date('20/06/02','RR/MM/DD'),'N',null,4000,'R2');
Insert into ONECHO.MEMBER (MEMBER_NO,MEMBER_ADMIN,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE1,MEMBER_PHONE2,MEMBER_PHONE3,MEMBER_EMAIL1,MEMBER_EMAIL2,MEMBER_POSTCODE,MEMBER_ADDRESS1,MEMBER_ADDRESS2,MEMBER_JOINDATE,MEMBER_STATUS,MEMBER_EXIT,MEMBER_POINT,MEMBER_RANK) values ('M3','Y','admin3','admin3','이아라','010','1234','5678','admin3','@oncho.com','12345','3','3',to_date('20/06/02','RR/MM/DD'),'N',null,8000,'R3');
Insert into ONECHO.MEMBER (MEMBER_NO,MEMBER_ADMIN,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE1,MEMBER_PHONE2,MEMBER_PHONE3,MEMBER_EMAIL1,MEMBER_EMAIL2,MEMBER_POSTCODE,MEMBER_ADDRESS1,MEMBER_ADDRESS2,MEMBER_JOINDATE,MEMBER_STATUS,MEMBER_EXIT,MEMBER_POINT,MEMBER_RANK) values ('M4','Y','admin4','admin4','김경남','010','1234','5678','admin4','@oncho.com','12345','4','4',to_date('20/06/02','RR/MM/DD'),'N',null,12000,'R4');
Insert into ONECHO.MEMBER (MEMBER_NO,MEMBER_ADMIN,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE1,MEMBER_PHONE2,MEMBER_PHONE3,MEMBER_EMAIL1,MEMBER_EMAIL2,MEMBER_POSTCODE,MEMBER_ADDRESS1,MEMBER_ADDRESS2,MEMBER_JOINDATE,MEMBER_STATUS,MEMBER_EXIT,MEMBER_POINT,MEMBER_RANK) values ('M5','Y','admin5','admin5','이수한','010','1234','5678','admin5','@oncho.com','12345','5','5',to_date('20/06/02','RR/MM/DD'),'N',null,16000,'R5');
Insert into ONECHO.MEMBER (MEMBER_NO,MEMBER_ADMIN,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE1,MEMBER_PHONE2,MEMBER_PHONE3,MEMBER_EMAIL1,MEMBER_EMAIL2,MEMBER_POSTCODE,MEMBER_ADDRESS1,MEMBER_ADDRESS2,MEMBER_JOINDATE,MEMBER_STATUS,MEMBER_EXIT,MEMBER_POINT,MEMBER_RANK) values ('M6','N','user1','user1','홍길동','010','2828','8282','user1','@naver.com','06234','서울특별시 강남구 테헤란로14길 6 (역삼동)','2층',to_date('20/06/02','RR/MM/DD'),'N',null,2000,'R1');
Insert into ONECHO.MEMBER (MEMBER_NO,MEMBER_ADMIN,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE1,MEMBER_PHONE2,MEMBER_PHONE3,MEMBER_EMAIL1,MEMBER_EMAIL2,MEMBER_POSTCODE,MEMBER_ADDRESS1,MEMBER_ADDRESS2,MEMBER_JOINDATE,MEMBER_STATUS,MEMBER_EXIT,MEMBER_POINT,MEMBER_RANK) values ('M7','N','user2','user2','홍길남','010','7568','5678','user2','@gmail.com','06234','서울특별시 강남구 테헤란로14길 6 (역삼동)','3층',to_date('20/06/03','RR/MM/DD'),'N',null,9000,'R2');

REM INSERTING into ONECHO.KEYWORD
SET DEFINE OFF;
Insert into ONECHO.KEYWORD (KEYWORD_NO,KEYWORD_NAME) values ('K1','NEW');
Insert into ONECHO.KEYWORD (KEYWORD_NO,KEYWORD_NAME) values ('K2','BEST');
Insert into ONECHO.KEYWORD (KEYWORD_NO,KEYWORD_NAME) values ('K3','공기정화');
Insert into ONECHO.KEYWORD (KEYWORD_NO,KEYWORD_NAME) values ('K4','반려동물 친화');
Insert into ONECHO.KEYWORD (KEYWORD_NO,KEYWORD_NAME) values ('K5','NEW,공기정화');
Insert into ONECHO.KEYWORD (KEYWORD_NO,KEYWORD_NAME) values ('K6','NEW,반려동물 친화');
Insert into ONECHO.KEYWORD (KEYWORD_NO,KEYWORD_NAME) values ('K7','NEW,공기정화,반려동물 친화');
Insert into ONECHO.KEYWORD (KEYWORD_NO,KEYWORD_NAME) values ('K8','BEST,공기정화');
Insert into ONECHO.KEYWORD (KEYWORD_NO,KEYWORD_NAME) values ('K9','BEST,반려동물 친화');
Insert into ONECHO.KEYWORD (KEYWORD_NO,KEYWORD_NAME) values ('K10','BEST,공기정화,반려동물 친화');

REM INSERTING into ONECHO.ITEM
SET DEFINE OFF;
Insert into ONECHO.ITEM (ITEM_NO,ITEM_NAME,ITEM_CATEGORY,KEYWORD_NO,ITEM_PRICE,ITEM_DISCOUNT,ITEM_RATE,ITEM_STOCK,ITEM_DISPLAY,ITEM_INFO,ITEM_CDATE,ITEM_UDATE,ITEM_MAX,ITEM_SALE) values ('I1','고무나무','PLANT','K3',30000,3000,4.3,999,'N','테스트 내용',to_date('20/06/02','RR/MM/DD'),to_date('20/06/02','RR/MM/DD'),3,'Y');
Insert into ONECHO.ITEM (ITEM_NO,ITEM_NAME,ITEM_CATEGORY,KEYWORD_NO,ITEM_PRICE,ITEM_DISCOUNT,ITEM_RATE,ITEM_STOCK,ITEM_DISPLAY,ITEM_INFO,ITEM_CDATE,ITEM_UDATE,ITEM_MAX,ITEM_SALE) values ('I2','TEST SAMPLE','PLANT','K9',29900,3000,4.9,999,'N','테스트 내용',to_date('20/06/02','RR/MM/DD'),to_date('20/06/02','RR/MM/DD'),2,'Y');

REM INSERTING into ONECHO.IMAGE
SET DEFINE OFF;
Insert into ONECHO.IMAGE (IMAGE_NO,IMAGE_PATH,IMAGE_NAME) values ('IMG1','/IMAGES/ITEM/','고무나무.jpg');
Insert into ONECHO.IMAGE (IMAGE_NO,IMAGE_PATH,IMAGE_NAME) values ('IMG2','/IMAGES/ITEM/','smim.jpg');
Insert into ONECHO.IMAGE (IMAGE_NO,IMAGE_PATH,IMAGE_NAME) values ('IMG3','/IMAGES/ITEM/','testsample.jpg');

REM INSERTING into ONECHO.ITEMIMAGE
SET DEFINE OFF;
Insert into ONECHO.ITEMIMAGE (ITEMIMAGE_NO,ITEM_NO,IMAGE_NO,ITEMIMAGE_CATEGORY) values ('II1','I1','IMG1',1);
Insert into ONECHO.ITEMIMAGE (ITEMIMAGE_NO,ITEM_NO,IMAGE_NO,ITEMIMAGE_CATEGORY) values ('II2','I1','IMG2',2);
Insert into ONECHO.ITEMIMAGE (ITEMIMAGE_NO,ITEM_NO,IMAGE_NO,ITEMIMAGE_CATEGORY) values ('II3','I2','IMG3',1);
Insert into ONECHO.ITEMIMAGE (ITEMIMAGE_NO,ITEM_NO,IMAGE_NO,ITEMIMAGE_CATEGORY) values ('II4','I2','IMG2',2);

REM INSERTING into ONECHO.CARTLIST
SET DEFINE OFF;
Insert into ONECHO.CARTLIST (CARTLIST_NO,ITEM_NO,MEMBER_NO,CARTLIST_COUNT) values ('C1','I1','M7',3);
Insert into ONECHO.CARTLIST (CARTLIST_NO,ITEM_NO,MEMBER_NO,CARTLIST_COUNT) values ('C4','I2','M7',1);
Insert into ONECHO.CARTLIST (CARTLIST_NO,ITEM_NO,MEMBER_NO,CARTLIST_COUNT) values ('C2','I1','M6',2);
Insert into ONECHO.CARTLIST (CARTLIST_NO,ITEM_NO,MEMBER_NO,CARTLIST_COUNT) values ('C3','I2','M6',2);

REM INSERTING into ONECHO.WISHLIST
SET DEFINE OFF;
Insert into ONECHO.WISHLIST (WISHLIST_NO,ITEM_NO,MEMBER_NO,WISHLIST_MEMO) values ('W1','I1','M7','찜!!');
Insert into ONECHO.WISHLIST (WISHLIST_NO,ITEM_NO,MEMBER_NO,WISHLIST_MEMO) values ('W2','I2','M6','친구선물');

REM INSERTING into ONECHO.DELIVERY
SET DEFINE OFF;
Insert into ONECHO.DELIVERY (DELIVERY_CODE,DELIVERY_STATUS) values ('D1','배송 전');
Insert into ONECHO.DELIVERY (DELIVERY_CODE,DELIVERY_STATUS) values ('D2','배송 중');
Insert into ONECHO.DELIVERY (DELIVERY_CODE,DELIVERY_STATUS) values ('D3','배송 완료');

REM INSERTING into ONECHO.PAYMENT
SET DEFINE OFF;
Insert into ONECHO.PAYMENT (PAYMENT_CODE,PAYMENT_STATUS) values ('P1','입금 전');
Insert into ONECHO.PAYMENT (PAYMENT_CODE,PAYMENT_STATUS) values ('P2','입금 후');

REM INSERTING into ONECHO.STATISTIC
SET DEFINE OFF;
Insert into ONECHO.STATISTIC (STATISTIC_NO,STATISTIC_VISITCOUNT,STATISTIC_TODAYJOIN,STATISTIC_CANCELCOUNT,STATISTIC_MEMBER,STATISTIC_DASK,STATISTIC_IASK,STATISTIC_CASK,STATISTIC_SALES,STATISTIC_DBEFORE,STATISTIC_NEWORDER,STATISTIC_CDATE) values ('STA1',312312,84,10,300000,23,3,7,124123,70,100,to_date('20/06/01','RR/MM/DD'));
Insert into ONECHO.STATISTIC (STATISTIC_NO,STATISTIC_VISITCOUNT,STATISTIC_TODAYJOIN,STATISTIC_CANCELCOUNT,STATISTIC_MEMBER,STATISTIC_DASK,STATISTIC_IASK,STATISTIC_CASK,STATISTIC_SALES,STATISTIC_DBEFORE,STATISTIC_NEWORDER,STATISTIC_CDATE) values ('STA2',100000,77,10,300077,12,8,7,523088,82,120,to_date('20/06/02','RR/MM/DD'));

REM INSERTING into ONECHO.ORDERLIST
SET DEFINE OFF;
Insert into ONECHO.ORDERLIST (ORDER_NO,ITEM_NO,MEMBER_NO,ORDER_DATE,ORDER_COUNT,ORDER_USEPOINT,ORDER_NAME,ORDER_PHONE1,ORDER_PHONE2,ORDER_PHONE3,ORDER_POSTCODE,ORDER_ADDRESS1,ORDER_ADDRESS2,ORDER_REQUEST,ORDER_DCOST,ORDER_CANCELREQUEST,ORDER_CANCELYN,DELIVERY_CODE,PAYMENT_CODE) values ('O1','I1','M6',to_date('20/06/02','RR/MM/DD'),3,0,'홍길동','010','1234','1234','98762','서울시 송파구 가락동 가락아파트','110동 101호',null,2500,'N','N','D1','P1');
Insert into ONECHO.ORDERLIST (ORDER_NO,ITEM_NO,MEMBER_NO,ORDER_DATE,ORDER_COUNT,ORDER_USEPOINT,ORDER_NAME,ORDER_PHONE1,ORDER_PHONE2,ORDER_PHONE3,ORDER_POSTCODE,ORDER_ADDRESS1,ORDER_ADDRESS2,ORDER_REQUEST,ORDER_DCOST,ORDER_CANCELREQUEST,ORDER_CANCELYN,DELIVERY_CODE,PAYMENT_CODE) values ('O2','I1','M7',to_date('20/06/02','RR/MM/DD'),3,0,'홍길동','010','1234','1234','98762','서울시 송파구 가락동 가락아파트','110동 101호',null,2500,'N','N','D1','P1');
Insert into ONECHO.ORDERLIST (ORDER_NO,ITEM_NO,MEMBER_NO,ORDER_DATE,ORDER_COUNT,ORDER_USEPOINT,ORDER_NAME,ORDER_PHONE1,ORDER_PHONE2,ORDER_PHONE3,ORDER_POSTCODE,ORDER_ADDRESS1,ORDER_ADDRESS2,ORDER_REQUEST,ORDER_DCOST,ORDER_CANCELREQUEST,ORDER_CANCELYN,DELIVERY_CODE,PAYMENT_CODE) values ('O3','I1','M6',to_date('20/06/02','RR/MM/DD'),1,0,'홍길동','010','1234','1234','98762','서울시 송파구 가락동 가락아파트','110동 101호',null,2500,'N','N','D1','P1');
Insert into ONECHO.ORDERLIST (ORDER_NO,ITEM_NO,MEMBER_NO,ORDER_DATE,ORDER_COUNT,ORDER_USEPOINT,ORDER_NAME,ORDER_PHONE1,ORDER_PHONE2,ORDER_PHONE3,ORDER_POSTCODE,ORDER_ADDRESS1,ORDER_ADDRESS2,ORDER_REQUEST,ORDER_DCOST,ORDER_CANCELREQUEST,ORDER_CANCELYN,DELIVERY_CODE,PAYMENT_CODE) values ('O3','I2','M6',to_date('20/06/02','RR/MM/DD'),1,0,'홍길동','010','1234','1234','98762','서울시 송파구 가락동 가락아파트','110동 101호',null,2500,'N','N','D1','P1');

REM INSERTING into ONECHO.REVIEW
SET DEFINE OFF;
Insert into ONECHO.REVIEW (REVIEW_NO,ORDER_NO,ITEM_NO,MEMBER_NO,REVIEW_CDATE,REVIEW_RATE,REVIEW_CONTENT,REVIEW_UDATE,IMAGE_NO) values ('R1','O1','I1','M7',to_date('20/06/02','RR/MM/DD'),5,'좋아 아주좋아요',to_date('20/06/02','RR/MM/DD'),'IMG3');
Insert into ONECHO.REVIEW (REVIEW_NO,ORDER_NO,ITEM_NO,MEMBER_NO,REVIEW_CDATE,REVIEW_RATE,REVIEW_CONTENT,REVIEW_UDATE,IMAGE_NO) values ('R3','O3','I1','M6',to_date('20/06/02','RR/MM/DD'),5,'공기가 달라요 ^^',to_date('20/06/02','RR/MM/DD'),'IMG3');

REM INSERTING into ONECHO.QNA
SET DEFINE OFF;
Insert into ONECHO.QNA (QNA_NO,MEMBER_NO,QNA_TITLE,QNA_CDATE,QNA_CONTENT,QNA_ANSWER,QNA_CATEGORY,QNA_PASSWORD,QNA_YN,IMAGE_NO) values ('Q1','M6','화분색 선택 가능한가요?',to_date('20/06/02','RR/MM/DD'),'화분색이 궁금해요',null,'상품','1234','N','IMG3');

COMMIT;
