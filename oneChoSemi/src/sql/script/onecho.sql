DROP TABLE CARTLIST;
DROP TABLE NOTICE;
DROP TABLE QNA;
DROP TABLE REVIEW;
DROP TABLE STASTIC;
DROP TABLE WISHLIST;
DROP TABLE ORDERLIST;
DROP TABLE PAYMENT;
DROP TABLE IMAGE;
DROP TABLE ITEM;
DROP TABLE KEYWORD;
DROP TABLE DELIVERY;
DROP TABLE MEMBER;
DROP TABLE RANK;
DROP TABLE ITEMIMAGE;
-- 전 테이블 드롭

--DROP TABLE member;

CREATE TABLE member (
	member_no NVARCHAR2(10) CONSTRAINT PK_MEMBER PRIMARY KEY,
	member_admin NVARCHAR2(2) DEFAULT 'N' NOT NULL CONSTRAINT CK_member_admin CHECK(member_admin in('Y', 'N')),
	member_id NVARCHAR2(30) NOT NULL,
	member_pwd NVARCHAR2(30) NOT NULL,
	member_name	NVARCHAR2(30) NOT NULL,
	member_phone1 NUMBER NOT NULL,
	member_phone2 NUMBER NOT NULL,
	member_phone3 NUMBER NOT NULL,
	member_email1 NVARCHAR2(30),
	member_email2 NVARCHAR2(30),
	member_postcode	NUMBER,
	member_address1	NVARCHAR2(2000),
	member_address2	NVARCHAR2(2000),
	member_joinDate	DATE DEFAULT SYSDATE NOT NULL,
	member_status NVARCHAR2(2) DEFAULT 'N' NOT NULL CONSTRAINT CK_member_status CHECK(member_status in('Y', 'N')),
	member_exit	NVARCHAR2(500),
	member_point NUMBER,
	member_rank	NVARCHAR2(10) NOT NULL
);

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
	image_no NVARCHAR2(14) NOT NULL
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
	order_phone1 NUMBER NOT NULL,
	order_phone2 NUMBER NOT NULL,
	order_phone3 NUMBER NOT NULL,
	order_postcode NUMBER NOT NULL,
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
	qna_YN NVARCHAR2(2) DEFAULT 'N' CONSTRAINT CK_qna_YN CHECK(qna_YN in('Y', 'N')),
	image_no NVARCHAR2(14) NOT NULL
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

--DROP TABLE notice;

CREATE TABLE notice (
	notice_no NVARCHAR2(10) CONSTRAINT PK_NOTICE PRIMARY KEY,
	member_no NVARCHAR2(10) NOT NULL,
	notice_title NVARCHAR2(100) NOT NULL,
	notice_cDate DATE,
	notice_content NVARCHAR2(2000),
	image_no NVARCHAR2(14) NOT NULL
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

--DROP TABLE stastic;

CREATE TABLE stastic (
	stastic_no NVARCHAR2(14) CONSTRAINT PK_STASTIC PRIMARY KEY,
	stastic_visitCount NUMBER,
	stastic_toDayJoin DATE,
	stastic_cancelCount	NUMBER,
	stastic_member NUMBER,
	stastic_dAsk NUMBER,
	stastic_iAsk NUMBER,
	stastic_cAsk NUMBER,
	stastic_sales NUMBER,
	stastic_dBefore	NUMBER,
	stastic_newOrder NUMBER,
	stastic_cDate DATE DEFAULT SYSDATE
);

COMMENT ON COLUMN stastic.stastic_no IS '일일통계(sta1-)';
COMMENT ON COLUMN stastic.stastic_visitCount IS '방문자수';
COMMENT ON COLUMN stastic.stastic_toDayJoin IS '금일가입';
COMMENT ON COLUMN stastic.stastic_cancelCount IS '취소요청';
COMMENT ON COLUMN stastic.stastic_member IS '전체회원';
COMMENT ON COLUMN stastic.stastic_dAsk IS '배송문의';
COMMENT ON COLUMN stastic.stastic_iAsk IS '상품문의';
COMMENT ON COLUMN stastic.stastic_cAsk IS '취소문의';
COMMENT ON COLUMN stastic.stastic_sales IS '금일매출';
COMMENT ON COLUMN stastic.stastic_dBefore IS '배송대기';
COMMENT ON COLUMN stastic.stastic_newOrder IS '신규주문';
COMMENT ON COLUMN stastic.stastic_cDate IS '등록일';

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
	itmeImage_no NVARCHAR2(14),
	item_no	NVARCHAR2(10),
	image_no NVARCHAR2(14)
);
ALTER TABLE itemImage ADD CONSTRAINT PK_ITEMIMAGE PRIMARY KEY (
	itmeImage_no,
	item_no
);

COMMENT ON COLUMN itemImage.itmeImage_no IS '상품이미지 번호(Ii1~)';
COMMENT ON COLUMN itemImage.item_no IS '상품번호(I1~)';
COMMENT ON COLUMN itemImage.image_no IS '이미지번호(img1~)';


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