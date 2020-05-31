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
-- �� ���̺� ���

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

COMMENT ON COLUMN member.member_no IS 'ȸ����ȣ(M1~)';
COMMENT ON COLUMN member.member_admin IS '������:Y, �Ϲ�ȸ��:N';
COMMENT ON COLUMN member.member_id IS '���̵�,����ũ';
COMMENT ON COLUMN member.member_pwd IS '��й�ȣ';
COMMENT ON COLUMN member.member_name IS '�̸�';
COMMENT ON COLUMN member.member_phone1 IS '����ó1';
COMMENT ON COLUMN member.member_phone2 IS '����ó2';
COMMENT ON COLUMN member.member_phone3 IS '����ó3';
COMMENT ON COLUMN member.member_email1 IS '�̸���1';
COMMENT ON COLUMN member.member_email2 IS '�̸���2';
COMMENT ON COLUMN member.member_postcode IS '�����ȣ';
COMMENT ON COLUMN member.member_address1 IS '�ּ�';
COMMENT ON COLUMN member.member_address2 IS '���ּ�';
COMMENT ON COLUMN member.member_joinDate IS 'ȸ�����Գ�¥';
COMMENT ON COLUMN member.member_status IS 'Ż��:Y �⺻: N,ȸ������';
COMMENT ON COLUMN member.member_exit IS 'Ż�����';
COMMENT ON COLUMN member.member_point IS '����Ʈ';
COMMENT ON COLUMN member.member_rank IS '��޹�ȣ(R1~R5)';

--DROP TABLE rank;

CREATE TABLE rank (
	rank_no	NVARCHAR2(10) CONSTRAINT PK_RANK PRIMARY KEY,
	rank_name NVARCHAR2(60),
	rank_pointRat NUMBER,
	rank_pointCap NUMBER,
	rank_pointMin NUMBER,
	rank_pointMax NUMBER
);

COMMENT ON COLUMN rank.rank_no IS '��޹�ȣ(R1~R5)';
COMMENT ON COLUMN rank.rank_name IS '����̸�(����,����,����,����,����)';
COMMENT ON COLUMN rank.rank_pointRat IS '���������(1%~5%)';
COMMENT ON COLUMN rank.rank_pointCap IS '����Ʈ����ѵ�(2000~10000)';
COMMENT ON COLUMN rank.rank_pointMin IS '��޾� �ּ� ���űݾ�';
COMMENT ON COLUMN rank.rank_pointMax IS '��޾� �ִ� ���� �ݾ�';

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

COMMENT ON COLUMN review.review_no IS '�����ȣ(R1~ )';
COMMENT ON COLUMN review.order_no IS '�ֹ���ȣ(O1~ )';
COMMENT ON COLUMN review.item_no IS '��ǰ��ȣ(I1~ )';
COMMENT ON COLUMN review.member_no IS 'ȸ����ȣ';
COMMENT ON COLUMN review.review_cDate IS '��������';
COMMENT ON COLUMN review.review_rate IS '����';
COMMENT ON COLUMN review.review_content IS '���䳻��';
COMMENT ON COLUMN review.review_uDate IS '���������';
COMMENT ON COLUMN review.image_no IS '�̹�����ȣ(img1~) ����';

--DROP TABLE cartList;

CREATE TABLE cartList (
	cartList_no	NVARCHAR2(10) CONSTRAINT PK_CARTLIST PRIMARY KEY,
	item_no NVARCHAR2(10) NOT NULL,
	member_no NVARCHAR2(10) NOT NULL,
	cartList_count NUMBER
);

COMMENT ON COLUMN cartList.cartList_no IS '��ٱ��Ϲ�ȣ(C1~)';
COMMENT ON COLUMN cartList.item_no IS '��ǰ��ȣ';
COMMENT ON COLUMN cartList.member_no IS 'ȸ����ȣ(M1~)';
COMMENT ON COLUMN cartList.cartList_count IS '����';

--DROP TABLE wishList;

CREATE TABLE wishList (
	wishList_no	NVARCHAR2(10) CONSTRAINT PK_WISHLIST PRIMARY KEY,
	item_no	NVARCHAR2(10) NOT NULL,
	member_no NVARCHAR2(10) NOT NULL,
	wishList_memo NVARCHAR2(500)
);

COMMENT ON COLUMN wishList.wishList_no IS '���ø���Ʈ��ȣ(W1~)';
COMMENT ON COLUMN wishList.item_no IS '��ǰ��ȣ';
COMMENT ON COLUMN wishList.member_no IS 'ȸ����ȣ(M1~)';
COMMENT ON COLUMN wishList.wishList_memo IS '�޸�';

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

COMMENT ON COLUMN orderList.order_no IS '�ֹ���ȣ(O1~ )';
COMMENT ON COLUMN orderList.item_no IS '��ǰ��ȣ(I1~)';
COMMENT ON COLUMN orderList.member_no IS 'ȸ����ȣ(M1~)';
COMMENT ON COLUMN orderList.order_date IS '�ֹ��Ͻ�';
COMMENT ON COLUMN orderList.order_count IS '�ֹ�����';
COMMENT ON COLUMN orderList.order_usePoint IS '�������Ʈ';
COMMENT ON COLUMN orderList.order_name IS '�������̸�';
COMMENT ON COLUMN orderList.order_phone1 IS '��������ȭ��ȣ1';
COMMENT ON COLUMN orderList.order_phone2 IS '��������ȭ��ȣ2';
COMMENT ON COLUMN orderList.order_phone3 IS '��������ȭ��ȣ3';
COMMENT ON COLUMN orderList.order_postcode IS '�����ڿ����ȣ';
COMMENT ON COLUMN orderList.order_address1 IS '�������ּ�';
COMMENT ON COLUMN orderList.order_address2 IS '�����ڻ��ּ�';
COMMENT ON COLUMN orderList.order_request IS '��۽ÿ�û����';
COMMENT ON COLUMN orderList.order_dCost IS '��ۺ�';
COMMENT ON COLUMN orderList.order_cancelRequest IS '�⺻: N , ��� : Y';
COMMENT ON COLUMN orderList.order_cancelYN IS '�⺻: N , ���� : Y (�ֹ� ���� ȿ��)';
COMMENT ON COLUMN orderList.delivery_code IS 'D1 : �����, D2 : �����, D3 : ��ۿϷ�';
COMMENT ON COLUMN orderList.payment_code IS 'P1 : �Ա� ��, P2 : �Ա� ��';

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

COMMENT ON COLUMN qna.qna_no IS '�۹�ȣ(Q1~)';
COMMENT ON COLUMN qna.member_no IS 'ȸ����ȣ(M1~)';
COMMENT ON COLUMN qna.qna_title IS '��������';
COMMENT ON COLUMN qna.qna_cDate IS '�Խ���';
COMMENT ON COLUMN qna.qna_content IS '����';
COMMENT ON COLUMN qna.qna_answer IS '�亯';
COMMENT ON COLUMN qna.qna_category IS '�з�';
COMMENT ON COLUMN qna.qna_YN IS '�亯 �� : N, �亯 : Y';
COMMENT ON COLUMN qna.image_no IS '�̹�����ȣ(img1~)';

--DROP TABLE notice;

CREATE TABLE notice (
	notice_no NVARCHAR2(10) CONSTRAINT PK_NOTICE PRIMARY KEY,
	member_no NVARCHAR2(10) NOT NULL,
	notice_title NVARCHAR2(100) NOT NULL,
	notice_cDate DATE,
	notice_content NVARCHAR2(2000),
	image_no NVARCHAR2(14) NOT NULL
);

COMMENT ON COLUMN notice.notice_no IS '�����۹�ȣ(N1~)';
COMMENT ON COLUMN notice.member_no IS 'ȸ����ȣ(M1~)';
COMMENT ON COLUMN notice.notice_title IS '����';
COMMENT ON COLUMN notice.notice_cDate IS '�Խ���';
COMMENT ON COLUMN notice.notice_content IS '����';
COMMENT ON COLUMN notice.image_no IS '�̹�����ȣ(img1~)';

--DROP TABLE keyword;

CREATE TABLE keyword (
	keyword_no NVARCHAR2(10) CONSTRAINT PK_KEYWORD PRIMARY KEY,
	keyword_name NVARCHAR2(20)
);

COMMENT ON COLUMN keyword.keyword_no IS 'Ű�����ȣ(K1~)';
COMMENT ON COLUMN keyword.keyword_name IS '�ߺ� ���� (new, best, ������ȭ, �ݷ����� ģȭ)';

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

COMMENT ON COLUMN item.item_no IS '��ǰ��ȣ(I1~)';
COMMENT ON COLUMN item.item_name IS '��ǰ��';
COMMENT ON COLUMN item.item_category IS '��ǰī�װ�';
COMMENT ON COLUMN item.keyword_no IS 'Ű�����ȣ(K1~)';
COMMENT ON COLUMN item.item_price IS '��ǰ����';
COMMENT ON COLUMN item.item_discount IS '���ΰ�';
COMMENT ON COLUMN item.item_rate IS '����';
COMMENT ON COLUMN item.item_stock IS '��ǰ���';
COMMENT ON COLUMN item.item_display IS '���� : Y, ������ : N';
COMMENT ON COLUMN item.item_info IS '��ǰ�����ؽ�Ʈ';
COMMENT ON COLUMN item.item_cDate IS '��ǰ�����';
COMMENT ON COLUMN item.item_uDate IS '����������';
COMMENT ON COLUMN item.item_max IS '�ִ뱸�ż���';
COMMENT ON COLUMN item.item_sale IS '�Ǹ��� : Y, �Ǹ����� : N';

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

COMMENT ON COLUMN stastic.stastic_no IS '�������(sta1-)';
COMMENT ON COLUMN stastic.stastic_visitCount IS '�湮�ڼ�';
COMMENT ON COLUMN stastic.stastic_toDayJoin IS '���ϰ���';
COMMENT ON COLUMN stastic.stastic_cancelCount IS '��ҿ�û';
COMMENT ON COLUMN stastic.stastic_member IS '��üȸ��';
COMMENT ON COLUMN stastic.stastic_dAsk IS '��۹���';
COMMENT ON COLUMN stastic.stastic_iAsk IS '��ǰ����';
COMMENT ON COLUMN stastic.stastic_cAsk IS '��ҹ���';
COMMENT ON COLUMN stastic.stastic_sales IS '���ϸ���';
COMMENT ON COLUMN stastic.stastic_dBefore IS '��۴��';
COMMENT ON COLUMN stastic.stastic_newOrder IS '�ű��ֹ�';
COMMENT ON COLUMN stastic.stastic_cDate IS '�����';

--DROP TABLE delivery;

CREATE TABLE delivery (
	delivery_code NVARCHAR2(10) DEFAULT 'D1' CONSTRAINT PK_DELIVERY PRIMARY KEY,
	delivery_status	NVARCHAR2(100)
);

COMMENT ON COLUMN delivery.delivery_code IS 'D1 : �����, D2 : �����, D3 : ��ۿϷ�(����ڵ�)';
COMMENT ON COLUMN delivery.delivery_status IS '�����, �����, ��ۿϷ�(��ۻ���)';

--DROP TABLE payment;

CREATE TABLE payment (
	payment_code NVARCHAR2(10) DEFAULT 'P1' CONSTRAINT PK_PAYMENT PRIMARY KEY,
	payment_status NVARCHAR2(100)
);

COMMENT ON COLUMN payment.payment_code IS 'P1 : �Ա� ��, P2 : �Ա� ��(�Ա��ڵ�)';
COMMENT ON COLUMN payment.payment_status IS '�Ա� ��, �Ա� ��(�Աݻ���)';

--DROP TABLE image;

CREATE TABLE image (
	image_no NVARCHAR2(14) CONSTRAINT PK_IMAGE PRIMARY KEY,
	image_path NVARCHAR2(2000),
	image_name NVARCHAR2(2000)
);

COMMENT ON COLUMN image.image_no IS '�̹�����ȣ(img1~)';
COMMENT ON COLUMN image.image_path IS '�̹��� ���';
COMMENT ON COLUMN image.image_name IS '�̹��� ��Ī';

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

COMMENT ON COLUMN itemImage.itmeImage_no IS '��ǰ�̹��� ��ȣ(Ii1~)';
COMMENT ON COLUMN itemImage.item_no IS '��ǰ��ȣ(I1~)';
COMMENT ON COLUMN itemImage.image_no IS '�̹�����ȣ(img1~)';


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