-- ���̺� ����
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
-- �� ���̺� ��� �Ϸ�

-- ���̺� �߰�
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
	image_no NVARCHAR2(14)
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
    qna_password NVARCHAR2(20) NOT NULL,
	qna_YN NVARCHAR2(2) DEFAULT 'N' CONSTRAINT CK_qna_YN CHECK(qna_YN in('Y', 'N')),
	image_no NVARCHAR2(14)
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
COMMENT ON COLUMN qna.qna_password IS '��й�ȣ';

--DROP TABLE notice;

CREATE TABLE notice (
	notice_no NVARCHAR2(10) CONSTRAINT PK_NOTICE PRIMARY KEY,
	member_no NVARCHAR2(10) NOT NULL,
	notice_title NVARCHAR2(100) NOT NULL,
	notice_cDate DATE,
	notice_content NVARCHAR2(2000),
	image_no NVARCHAR2(14)
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

COMMENT ON COLUMN statistic.statistic_no IS '�������(sta1-)';
COMMENT ON COLUMN statistic.statistic_visitCount IS '�湮�ڼ�';
COMMENT ON COLUMN statistic.statistic_toDayJoin IS '���ϰ���';
COMMENT ON COLUMN statistic.statistic_cancelCount IS '��ҿ�û';
COMMENT ON COLUMN statistic.statistic_member IS '��üȸ��';
COMMENT ON COLUMN statistic.statistic_dAsk IS '��۹���';
COMMENT ON COLUMN statistic.statistic_iAsk IS '��ǰ����';
COMMENT ON COLUMN statistic.statistic_cAsk IS '��ҹ���';
COMMENT ON COLUMN statistic.statistic_sales IS '���ϸ���';
COMMENT ON COLUMN statistic.statistic_dBefore IS '��۴��';
COMMENT ON COLUMN statistic.statistic_newOrder IS '�ű��ֹ�';
COMMENT ON COLUMN statistic.statistic_cDate IS '�����';

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
    itemImage_no NVARCHAR2(14) CONSTRAINT PK_ITEMIMAGE PRIMARY KEY,
    item_no   NVARCHAR2(10),
    image_no NVARCHAR2(14),
    itemImage_category NUMBER
);

COMMENT ON COLUMN itemImage.itmeImage_no IS '��ǰ�̹��� ��ȣ(Ii1~)';
COMMENT ON COLUMN itemImage.item_no IS '��ǰ��ȣ(I1~)';
COMMENT ON COLUMN itemImage.image_no IS '�̹�����ȣ(img1~)';
COMMENT ON COLUMN itemImage.itemImage_category IS '�����̹���:1,�����̹���:2';

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

-- data �߰�

REM INSERTING into ONECHO.RANK
SET DEFINE OFF;
Insert into ONECHO.RANK (RANK_NO,RANK_NAME,RANK_POINTRAT,RANK_POINTCAP,RANK_POINTMIN,RANK_POINTMAX) values ('R1','����',1,2000,0,50000);
Insert into ONECHO.RANK (RANK_NO,RANK_NAME,RANK_POINTRAT,RANK_POINTCAP,RANK_POINTMIN,RANK_POINTMAX) values ('R2','����',2,4000,50001,200000);
Insert into ONECHO.RANK (RANK_NO,RANK_NAME,RANK_POINTRAT,RANK_POINTCAP,RANK_POINTMIN,RANK_POINTMAX) values ('R3','����',3,6000,200001,500000);
Insert into ONECHO.RANK (RANK_NO,RANK_NAME,RANK_POINTRAT,RANK_POINTCAP,RANK_POINTMIN,RANK_POINTMAX) values ('R4','����',4,8000,500001,1000000);
Insert into ONECHO.RANK (RANK_NO,RANK_NAME,RANK_POINTRAT,RANK_POINTCAP,RANK_POINTMIN,RANK_POINTMAX) values ('R5','����',5,10000,1000001,999999999);

REM INSERTING into ONECHO.MEMBER
SET DEFINE OFF;
Insert into ONECHO.MEMBER (MEMBER_NO,MEMBER_ADMIN,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE1,MEMBER_PHONE2,MEMBER_PHONE3,MEMBER_EMAIL1,MEMBER_EMAIL2,MEMBER_POSTCODE,MEMBER_ADDRESS1,MEMBER_ADDRESS2,MEMBER_JOINDATE,MEMBER_STATUS,MEMBER_EXIT,MEMBER_POINT,MEMBER_RANK) values ('M1','Y','admin1','admin1','������','010','1234','5678','admin1','@oncho.com','12345','2','2',to_date('20/06/02','RR/MM/DD'),'N',null,2000,'R2');
Insert into ONECHO.MEMBER (MEMBER_NO,MEMBER_ADMIN,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE1,MEMBER_PHONE2,MEMBER_PHONE3,MEMBER_EMAIL1,MEMBER_EMAIL2,MEMBER_POSTCODE,MEMBER_ADDRESS1,MEMBER_ADDRESS2,MEMBER_JOINDATE,MEMBER_STATUS,MEMBER_EXIT,MEMBER_POINT,MEMBER_RANK) values ('M2','Y','admin2','admin2','������','010','1234','5678','admin2','@oncho.com','12345','2','2',to_date('20/06/02','RR/MM/DD'),'N',null,4000,'R2');
Insert into ONECHO.MEMBER (MEMBER_NO,MEMBER_ADMIN,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE1,MEMBER_PHONE2,MEMBER_PHONE3,MEMBER_EMAIL1,MEMBER_EMAIL2,MEMBER_POSTCODE,MEMBER_ADDRESS1,MEMBER_ADDRESS2,MEMBER_JOINDATE,MEMBER_STATUS,MEMBER_EXIT,MEMBER_POINT,MEMBER_RANK) values ('M3','Y','admin3','admin3','�̾ƶ�','010','1234','5678','admin3','@oncho.com','12345','3','3',to_date('20/06/02','RR/MM/DD'),'N',null,8000,'R3');
Insert into ONECHO.MEMBER (MEMBER_NO,MEMBER_ADMIN,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE1,MEMBER_PHONE2,MEMBER_PHONE3,MEMBER_EMAIL1,MEMBER_EMAIL2,MEMBER_POSTCODE,MEMBER_ADDRESS1,MEMBER_ADDRESS2,MEMBER_JOINDATE,MEMBER_STATUS,MEMBER_EXIT,MEMBER_POINT,MEMBER_RANK) values ('M4','Y','admin4','admin4','��泲','010','1234','5678','admin4','@oncho.com','12345','4','4',to_date('20/06/02','RR/MM/DD'),'N',null,12000,'R4');
Insert into ONECHO.MEMBER (MEMBER_NO,MEMBER_ADMIN,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE1,MEMBER_PHONE2,MEMBER_PHONE3,MEMBER_EMAIL1,MEMBER_EMAIL2,MEMBER_POSTCODE,MEMBER_ADDRESS1,MEMBER_ADDRESS2,MEMBER_JOINDATE,MEMBER_STATUS,MEMBER_EXIT,MEMBER_POINT,MEMBER_RANK) values ('M5','Y','admin5','admin5','�̼���','010','1234','5678','admin5','@oncho.com','12345','5','5',to_date('20/06/02','RR/MM/DD'),'N',null,16000,'R5');
Insert into ONECHO.MEMBER (MEMBER_NO,MEMBER_ADMIN,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE1,MEMBER_PHONE2,MEMBER_PHONE3,MEMBER_EMAIL1,MEMBER_EMAIL2,MEMBER_POSTCODE,MEMBER_ADDRESS1,MEMBER_ADDRESS2,MEMBER_JOINDATE,MEMBER_STATUS,MEMBER_EXIT,MEMBER_POINT,MEMBER_RANK) values ('M6','N','user1','user1','ȫ�浿','010','2828','8282','user1','@naver.com','06234','����Ư���� ������ �������14�� 6 (���ﵿ)','2��',to_date('20/06/02','RR/MM/DD'),'N',null,2000,'R1');
Insert into ONECHO.MEMBER (MEMBER_NO,MEMBER_ADMIN,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_PHONE1,MEMBER_PHONE2,MEMBER_PHONE3,MEMBER_EMAIL1,MEMBER_EMAIL2,MEMBER_POSTCODE,MEMBER_ADDRESS1,MEMBER_ADDRESS2,MEMBER_JOINDATE,MEMBER_STATUS,MEMBER_EXIT,MEMBER_POINT,MEMBER_RANK) values ('M7','N','user2','user2','ȫ�泲','010','7568','5678','user2','@gmail.com','06234','����Ư���� ������ �������14�� 6 (���ﵿ)','3��',to_date('20/06/03','RR/MM/DD'),'N',null,9000,'R2');

REM INSERTING into ONECHO.KEYWORD
SET DEFINE OFF;
Insert into ONECHO.KEYWORD (KEYWORD_NO,KEYWORD_NAME) values ('K1','NEW');
Insert into ONECHO.KEYWORD (KEYWORD_NO,KEYWORD_NAME) values ('K2','BEST');
Insert into ONECHO.KEYWORD (KEYWORD_NO,KEYWORD_NAME) values ('K3','������ȭ');
Insert into ONECHO.KEYWORD (KEYWORD_NO,KEYWORD_NAME) values ('K4','�ݷ����� ģȭ');
Insert into ONECHO.KEYWORD (KEYWORD_NO,KEYWORD_NAME) values ('K5','NEW,������ȭ');
Insert into ONECHO.KEYWORD (KEYWORD_NO,KEYWORD_NAME) values ('K6','NEW,�ݷ����� ģȭ');
Insert into ONECHO.KEYWORD (KEYWORD_NO,KEYWORD_NAME) values ('K7','NEW,������ȭ,�ݷ����� ģȭ');
Insert into ONECHO.KEYWORD (KEYWORD_NO,KEYWORD_NAME) values ('K8','BEST,������ȭ');
Insert into ONECHO.KEYWORD (KEYWORD_NO,KEYWORD_NAME) values ('K9','BEST,�ݷ����� ģȭ');
Insert into ONECHO.KEYWORD (KEYWORD_NO,KEYWORD_NAME) values ('K10','BEST,������ȭ,�ݷ����� ģȭ');

REM INSERTING into ONECHO.ITEM
SET DEFINE OFF;
Insert into ONECHO.ITEM (ITEM_NO,ITEM_NAME,ITEM_CATEGORY,KEYWORD_NO,ITEM_PRICE,ITEM_DISCOUNT,ITEM_RATE,ITEM_STOCK,ITEM_DISPLAY,ITEM_INFO,ITEM_CDATE,ITEM_UDATE,ITEM_MAX,ITEM_SALE) values ('I1','������','PLANT','K3',30000,3000,4.3,999,'N','�׽�Ʈ ����',to_date('20/06/02','RR/MM/DD'),to_date('20/06/02','RR/MM/DD'),3,'Y');
Insert into ONECHO.ITEM (ITEM_NO,ITEM_NAME,ITEM_CATEGORY,KEYWORD_NO,ITEM_PRICE,ITEM_DISCOUNT,ITEM_RATE,ITEM_STOCK,ITEM_DISPLAY,ITEM_INFO,ITEM_CDATE,ITEM_UDATE,ITEM_MAX,ITEM_SALE) values ('I2','TEST SAMPLE','PLANT','K9',29900,3000,4.9,999,'N','�׽�Ʈ ����',to_date('20/06/02','RR/MM/DD'),to_date('20/06/02','RR/MM/DD'),2,'Y');

REM INSERTING into ONECHO.IMAGE
SET DEFINE OFF;
Insert into ONECHO.IMAGE (IMAGE_NO,IMAGE_PATH,IMAGE_NAME) values ('IMG1','/IMAGES/ITEM/','������.jpg');
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
Insert into ONECHO.WISHLIST (WISHLIST_NO,ITEM_NO,MEMBER_NO,WISHLIST_MEMO) values ('W1','I1','M7','��!!');
Insert into ONECHO.WISHLIST (WISHLIST_NO,ITEM_NO,MEMBER_NO,WISHLIST_MEMO) values ('W2','I2','M6','ģ������');

REM INSERTING into ONECHO.DELIVERY
SET DEFINE OFF;
Insert into ONECHO.DELIVERY (DELIVERY_CODE,DELIVERY_STATUS) values ('D1','��� ��');
Insert into ONECHO.DELIVERY (DELIVERY_CODE,DELIVERY_STATUS) values ('D2','��� ��');
Insert into ONECHO.DELIVERY (DELIVERY_CODE,DELIVERY_STATUS) values ('D3','��� �Ϸ�');

REM INSERTING into ONECHO.PAYMENT
SET DEFINE OFF;
Insert into ONECHO.PAYMENT (PAYMENT_CODE,PAYMENT_STATUS) values ('P1','�Ա� ��');
Insert into ONECHO.PAYMENT (PAYMENT_CODE,PAYMENT_STATUS) values ('P2','�Ա� ��');

REM INSERTING into ONECHO.STATISTIC
SET DEFINE OFF;
Insert into ONECHO.STATISTIC (STATISTIC_NO,STATISTIC_VISITCOUNT,STATISTIC_TODAYJOIN,STATISTIC_CANCELCOUNT,STATISTIC_MEMBER,STATISTIC_DASK,STATISTIC_IASK,STATISTIC_CASK,STATISTIC_SALES,STATISTIC_DBEFORE,STATISTIC_NEWORDER,STATISTIC_CDATE) values ('STA1',312312,84,10,300000,23,3,7,124123,70,100,to_date('20/06/01','RR/MM/DD'));
Insert into ONECHO.STATISTIC (STATISTIC_NO,STATISTIC_VISITCOUNT,STATISTIC_TODAYJOIN,STATISTIC_CANCELCOUNT,STATISTIC_MEMBER,STATISTIC_DASK,STATISTIC_IASK,STATISTIC_CASK,STATISTIC_SALES,STATISTIC_DBEFORE,STATISTIC_NEWORDER,STATISTIC_CDATE) values ('STA2',100000,77,10,300077,12,8,7,523088,82,120,to_date('20/06/02','RR/MM/DD'));

REM INSERTING into ONECHO.ORDERLIST
SET DEFINE OFF;
Insert into ONECHO.ORDERLIST (ORDER_NO,ITEM_NO,MEMBER_NO,ORDER_DATE,ORDER_COUNT,ORDER_USEPOINT,ORDER_NAME,ORDER_PHONE1,ORDER_PHONE2,ORDER_PHONE3,ORDER_POSTCODE,ORDER_ADDRESS1,ORDER_ADDRESS2,ORDER_REQUEST,ORDER_DCOST,ORDER_CANCELREQUEST,ORDER_CANCELYN,DELIVERY_CODE,PAYMENT_CODE) values ('O1','I1','M6',to_date('20/06/02','RR/MM/DD'),3,0,'ȫ�浿','010','1234','1234','98762','����� ���ı� ������ ��������Ʈ','110�� 101ȣ',null,2500,'N','N','D1','P1');
Insert into ONECHO.ORDERLIST (ORDER_NO,ITEM_NO,MEMBER_NO,ORDER_DATE,ORDER_COUNT,ORDER_USEPOINT,ORDER_NAME,ORDER_PHONE1,ORDER_PHONE2,ORDER_PHONE3,ORDER_POSTCODE,ORDER_ADDRESS1,ORDER_ADDRESS2,ORDER_REQUEST,ORDER_DCOST,ORDER_CANCELREQUEST,ORDER_CANCELYN,DELIVERY_CODE,PAYMENT_CODE) values ('O2','I1','M7',to_date('20/06/02','RR/MM/DD'),3,0,'ȫ�浿','010','1234','1234','98762','����� ���ı� ������ ��������Ʈ','110�� 101ȣ',null,2500,'N','N','D1','P1');
Insert into ONECHO.ORDERLIST (ORDER_NO,ITEM_NO,MEMBER_NO,ORDER_DATE,ORDER_COUNT,ORDER_USEPOINT,ORDER_NAME,ORDER_PHONE1,ORDER_PHONE2,ORDER_PHONE3,ORDER_POSTCODE,ORDER_ADDRESS1,ORDER_ADDRESS2,ORDER_REQUEST,ORDER_DCOST,ORDER_CANCELREQUEST,ORDER_CANCELYN,DELIVERY_CODE,PAYMENT_CODE) values ('O3','I1','M6',to_date('20/06/02','RR/MM/DD'),1,0,'ȫ�浿','010','1234','1234','98762','����� ���ı� ������ ��������Ʈ','110�� 101ȣ',null,2500,'N','N','D1','P1');
Insert into ONECHO.ORDERLIST (ORDER_NO,ITEM_NO,MEMBER_NO,ORDER_DATE,ORDER_COUNT,ORDER_USEPOINT,ORDER_NAME,ORDER_PHONE1,ORDER_PHONE2,ORDER_PHONE3,ORDER_POSTCODE,ORDER_ADDRESS1,ORDER_ADDRESS2,ORDER_REQUEST,ORDER_DCOST,ORDER_CANCELREQUEST,ORDER_CANCELYN,DELIVERY_CODE,PAYMENT_CODE) values ('O3','I2','M6',to_date('20/06/02','RR/MM/DD'),1,0,'ȫ�浿','010','1234','1234','98762','����� ���ı� ������ ��������Ʈ','110�� 101ȣ',null,2500,'N','N','D1','P1');

REM INSERTING into ONECHO.REVIEW
SET DEFINE OFF;
Insert into ONECHO.REVIEW (REVIEW_NO,ORDER_NO,ITEM_NO,MEMBER_NO,REVIEW_CDATE,REVIEW_RATE,REVIEW_CONTENT,REVIEW_UDATE,IMAGE_NO) values ('R1','O1','I1','M7',to_date('20/06/02','RR/MM/DD'),5,'���� �������ƿ�',to_date('20/06/02','RR/MM/DD'),'IMG3');
Insert into ONECHO.REVIEW (REVIEW_NO,ORDER_NO,ITEM_NO,MEMBER_NO,REVIEW_CDATE,REVIEW_RATE,REVIEW_CONTENT,REVIEW_UDATE,IMAGE_NO) values ('R3','O3','I1','M6',to_date('20/06/02','RR/MM/DD'),5,'���Ⱑ �޶�� ^^',to_date('20/06/02','RR/MM/DD'),'IMG3');

REM INSERTING into ONECHO.QNA
SET DEFINE OFF;
Insert into ONECHO.QNA (QNA_NO,MEMBER_NO,QNA_TITLE,QNA_CDATE,QNA_CONTENT,QNA_ANSWER,QNA_CATEGORY,QNA_PASSWORD,QNA_YN,IMAGE_NO) values ('Q1','M6','ȭ�л� ���� �����Ѱ���?',to_date('20/06/02','RR/MM/DD'),'ȭ�л��� �ñ��ؿ�',null,'��ǰ','1234','N','IMG3');


--- VIEW ADD
-- īƮ����Ʈ ��
CREATE OR REPLACE VIEW MEMBER_CARTLIST AS
SELECT CARTLIST_NO, CA.ITEM_NO, ITEM_NAME, ITEM_PRICE, ITEM_MAX, MEMBER_NO, CARTLIST_COUNT, II.IMAGE_NO, IMAGE_NAME
FROM CARTLIST CA
JOIN (
      select I.item_no, itemimage_no, IMAGE_NO, ITEM_NAME, ITEM_PRICE, ITEM_MAX
      from item I
      join (SELECT *
            FROM ITEMIMAGE
            WHERE itemimage_category=1) M on (I.item_no=M.item_no)
      ) II on (CA.item_no=II.item_no)
JOIN IMAGE IM ON (II.IMAGE_NO = IM.IMAGE_NO);

-- ���� Ȯ��
CREATE OR REPLACE VIEW ORDERCHK AS
SELECT ORDER_NO, IMAGE_PATH, ITEM_NO, ITEM_NAME, ITEM_MAX, DELIVERY_STATUS
FROM ORDERLIST O
JOIN ITEM IT ON(IT.ITEM_NO = O.ITEM_NO)
JOIN ITEMIMAGE II ON(II.ITEM_NO = IT.ITEM_NO)
JOIN IMAGE IM ON(IM.IMAGE_NO = II.IMAGE_NO)
JOIN DELIVERY D ON(D.DELIVERY_CODE = O.DELIVERY_CODE);
ROLLBACK;

-- ���� Ȯ��
CREATE OR REPLACE VIEW WISHCHK AS
SELECT WISHLIST_NO, IMAGE_PATH, ITEM_NAME, WISHLIST_MEMO
FROM WISHLIST W
JOIN ITEM IT ON(IT.ITEM_NO = W.ITEM_NO)
JOIN ITEMIMAGE II ON(II.ITEM_NO = IT.ITEM_NO)
JOIN IMAGE IM ON(IM.IMAGE_NO = II.IMAGE_NO);



COMMIT;
