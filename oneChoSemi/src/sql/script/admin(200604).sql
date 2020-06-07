--------------------------------------------------------
--  파일이 생성됨 - 목요일-6월-04-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence IMAGE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ONECHO"."IMAGE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 24 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence ITEMIMAGE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ONECHO"."ITEMIMAGE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 25 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence ITEM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ONECHO"."ITEM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 23 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table ITEMIMAGE
--------------------------------------------------------

  CREATE TABLE "ONECHO"."ITEMIMAGE" 
   (	"ITEMIMAGE_NO" NVARCHAR2(14), 
	"ITEM_NO" NVARCHAR2(10), 
	"IMAGE_NO" NVARCHAR2(14), 
	"ITEMIMAGE_CATEGORY" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "ONECHO"."ITEMIMAGE"."ITEM_NO" IS '상품번호(I1~)';
   COMMENT ON COLUMN "ONECHO"."ITEMIMAGE"."IMAGE_NO" IS '이미지번호(img1~)';
   COMMENT ON COLUMN "ONECHO"."ITEMIMAGE"."ITEMIMAGE_CATEGORY" IS '메인이미지:1,서브이미지:2';
--------------------------------------------------------
--  DDL for Table ITEM
--------------------------------------------------------

  CREATE TABLE "ONECHO"."ITEM" 
   (	"ITEM_NO" NVARCHAR2(10), 
	"ITEM_NAME" NVARCHAR2(50), 
	"ITEM_CATEGORY" NVARCHAR2(2000), 
	"KEYWORD_NO" NVARCHAR2(20), 
	"ITEM_PRICE" NUMBER, 
	"ITEM_DISCOUNT" NUMBER, 
	"ITEM_RATE" NUMBER, 
	"ITEM_STOCK" NUMBER, 
	"ITEM_DISPLAY" NVARCHAR2(2) DEFAULT 'N', 
	"ITEM_INFO" NVARCHAR2(2000), 
	"ITEM_CDATE" DATE DEFAULT SYSDATE, 
	"ITEM_UDATE" DATE DEFAULT SYSDATE, 
	"ITEM_MAX" NUMBER, 
	"ITEM_SALE" NVARCHAR2(2) DEFAULT 'Y'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "ONECHO"."ITEM"."ITEM_NO" IS '상품번호(I1~)';
   COMMENT ON COLUMN "ONECHO"."ITEM"."ITEM_NAME" IS '상품명';
   COMMENT ON COLUMN "ONECHO"."ITEM"."ITEM_CATEGORY" IS '상품카테고리';
   COMMENT ON COLUMN "ONECHO"."ITEM"."KEYWORD_NO" IS '키워드번호(K1~)';
   COMMENT ON COLUMN "ONECHO"."ITEM"."ITEM_PRICE" IS '상품가격';
   COMMENT ON COLUMN "ONECHO"."ITEM"."ITEM_DISCOUNT" IS '할인값';
   COMMENT ON COLUMN "ONECHO"."ITEM"."ITEM_RATE" IS '평점';
   COMMENT ON COLUMN "ONECHO"."ITEM"."ITEM_STOCK" IS '상품재고';
   COMMENT ON COLUMN "ONECHO"."ITEM"."ITEM_DISPLAY" IS '전시 : Y, 비전시 : N';
   COMMENT ON COLUMN "ONECHO"."ITEM"."ITEM_INFO" IS '상품설명텍스트';
   COMMENT ON COLUMN "ONECHO"."ITEM"."ITEM_CDATE" IS '상품등록일';
   COMMENT ON COLUMN "ONECHO"."ITEM"."ITEM_UDATE" IS '최종수정일';
   COMMENT ON COLUMN "ONECHO"."ITEM"."ITEM_MAX" IS '최대구매수량';
   COMMENT ON COLUMN "ONECHO"."ITEM"."ITEM_SALE" IS '판매중 : Y, 판매중지 : N';
--------------------------------------------------------
--  DDL for Table IMAGE
--------------------------------------------------------

  CREATE TABLE "ONECHO"."IMAGE" 
   (	"IMAGE_NO" NVARCHAR2(14), 
	"IMAGE_PATH" NVARCHAR2(2000), 
	"IMAGE_NAME" NVARCHAR2(2000)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "ONECHO"."IMAGE"."IMAGE_NO" IS '이미지번호(img1~)';
   COMMENT ON COLUMN "ONECHO"."IMAGE"."IMAGE_PATH" IS '이미지 경로';
   COMMENT ON COLUMN "ONECHO"."IMAGE"."IMAGE_NAME" IS '이미지 명칭';
--------------------------------------------------------
--  DDL for View V_ITEMIMAGE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ONECHO"."V_ITEMIMAGE" ("ITEM_NO", "mItemImgNo", "mainImgNo", "mainImgName", "mainPath", "sItemImgNo", "subImgNo", "subImgName", "subPath") AS 
  select I.item_no,M.itemimage_no "mItemImgNo", M.image_no "mainImgNo", M.IMAGE_NAME "mainImgName",M.image_path "mainPath",
S.itemimage_no "sItemImgNo",S.image_no "subImgNo",S.image_name "subImgName",S.image_path "subPath"
from item I
left join (SELECT IT.ITEM_NO,ITEMIMAGE_NO,IT.IMAGE_NO,IMAGE_NAME,IMAGE_PATH,ITEMIMAGE_CATEGORY
FROM ITEMIMAGE IT
left join image G on (IT.IMAGE_NO=G.IMAGE_NO)
WHERE itemimage_category=1) M on (I.item_no=M.item_no)
left join (SELECT MG.ITEM_NO, ITEMIMAGE_NO, MG.IMAGE_NO,IMAGE_NAME,IMAGE_PATH,ITEMIMAGE_CATEGORY
FROM ITEMIMAGE MG
left join image E on (MG.IMAGE_NO=E.IMAGE_NO)
WHERE itemimage_category=2) S on (I.item_no=S.item_no)
;
REM INSERTING into ONECHO.ITEMIMAGE
SET DEFINE OFF;
Insert into ONECHO.ITEMIMAGE (ITEMIMAGE_NO,ITEM_NO,IMAGE_NO,ITEMIMAGE_CATEGORY) values ('II1','I1','IMG1',1);
Insert into ONECHO.ITEMIMAGE (ITEMIMAGE_NO,ITEM_NO,IMAGE_NO,ITEMIMAGE_CATEGORY) values ('II2','I1','IMG2',2);
Insert into ONECHO.ITEMIMAGE (ITEMIMAGE_NO,ITEM_NO,IMAGE_NO,ITEMIMAGE_CATEGORY) values ('II3','I2','IMG3',1);
Insert into ONECHO.ITEMIMAGE (ITEMIMAGE_NO,ITEM_NO,IMAGE_NO,ITEMIMAGE_CATEGORY) values ('II4','I2','IMG2',2);
Insert into ONECHO.ITEMIMAGE (ITEMIMAGE_NO,ITEM_NO,IMAGE_NO,ITEMIMAGE_CATEGORY) values ('II5','I3','IMG4',1);
Insert into ONECHO.ITEMIMAGE (ITEMIMAGE_NO,ITEM_NO,IMAGE_NO,ITEMIMAGE_CATEGORY) values ('II6','I3','IMG5',2);
REM INSERTING into ONECHO.ITEM
SET DEFINE OFF;
Insert into ONECHO.ITEM (ITEM_NO,ITEM_NAME,ITEM_CATEGORY,KEYWORD_NO,ITEM_PRICE,ITEM_DISCOUNT,ITEM_RATE,ITEM_STOCK,ITEM_DISPLAY,ITEM_INFO,ITEM_CDATE,ITEM_UDATE,ITEM_MAX,ITEM_SALE) values ('I1','고무나무','PLANT','K3',30000,3000,4.3,999,'N','테스트 내용',to_date('20/06/02','RR/MM/DD'),to_date('20/06/02','RR/MM/DD'),3,'Y');
Insert into ONECHO.ITEM (ITEM_NO,ITEM_NAME,ITEM_CATEGORY,KEYWORD_NO,ITEM_PRICE,ITEM_DISCOUNT,ITEM_RATE,ITEM_STOCK,ITEM_DISPLAY,ITEM_INFO,ITEM_CDATE,ITEM_UDATE,ITEM_MAX,ITEM_SALE) values ('I2','TEST SAMPLE','PLANT','K9',29900,3000,4.9,999,'N','테스트 내용',to_date('20/06/02','RR/MM/DD'),to_date('20/06/02','RR/MM/DD'),2,'Y');
Insert into ONECHO.ITEM (ITEM_NO,ITEM_NAME,ITEM_CATEGORY,KEYWORD_NO,ITEM_PRICE,ITEM_DISCOUNT,ITEM_RATE,ITEM_STOCK,ITEM_DISPLAY,ITEM_INFO,ITEM_CDATE,ITEM_UDATE,ITEM_MAX,ITEM_SALE) values ('I3','스투키','PLANT','K4',20000,2000,null,100,'N','내 마리스',to_date('20/06/04','RR/MM/DD'),to_date('20/06/04','RR/MM/DD'),100,'Y');
REM INSERTING into ONECHO.IMAGE
SET DEFINE OFF;
Insert into ONECHO.IMAGE (IMAGE_NO,IMAGE_PATH,IMAGE_NAME) values ('IMG1','/IMAGES/ITEM/','고무나무.jpg');
Insert into ONECHO.IMAGE (IMAGE_NO,IMAGE_PATH,IMAGE_NAME) values ('IMG2','/IMAGES/ITEM/','smim.jpg');
Insert into ONECHO.IMAGE (IMAGE_NO,IMAGE_PATH,IMAGE_NAME) values ('IMG3','/IMAGES/ITEM/','testsample.jpg');
Insert into ONECHO.IMAGE (IMAGE_NO,IMAGE_PATH,IMAGE_NAME) values ('IMG4','경로','name');
Insert into ONECHO.IMAGE (IMAGE_NO,IMAGE_PATH,IMAGE_NAME) values ('IMG5','경로','name2');
REM INSERTING into ONECHO.V_ITEMIMAGE
SET DEFINE OFF;
Insert into ONECHO.V_ITEMIMAGE (ITEM_NO,"mItemImgNo","mainImgNo","mainImgName","mainPath","sItemImgNo","subImgNo","subImgName","subPath") values ('I2','II3','IMG3','testsample.jpg','/IMAGES/ITEM/','II4','IMG2','smim.jpg','/IMAGES/ITEM/');
Insert into ONECHO.V_ITEMIMAGE (ITEM_NO,"mItemImgNo","mainImgNo","mainImgName","mainPath","sItemImgNo","subImgNo","subImgName","subPath") values ('I1','II1','IMG1','고무나무.jpg','/IMAGES/ITEM/','II2','IMG2','smim.jpg','/IMAGES/ITEM/');
Insert into ONECHO.V_ITEMIMAGE (ITEM_NO,"mItemImgNo","mainImgNo","mainImgName","mainPath","sItemImgNo","subImgNo","subImgName","subPath") values ('I3','II5','IMG4','name','경로','II6','IMG5','name2','경로');
--------------------------------------------------------
--  DDL for Index PK_IMAGE
--------------------------------------------------------

  CREATE UNIQUE INDEX "ONECHO"."PK_IMAGE" ON "ONECHO"."IMAGE" ("IMAGE_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_ITEMIMAGE
--------------------------------------------------------

  CREATE UNIQUE INDEX "ONECHO"."PK_ITEMIMAGE" ON "ONECHO"."ITEMIMAGE" ("ITEMIMAGE_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_ITEM
--------------------------------------------------------

  CREATE UNIQUE INDEX "ONECHO"."PK_ITEM" ON "ONECHO"."ITEM" ("ITEM_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table ITEMIMAGE
--------------------------------------------------------

  ALTER TABLE "ONECHO"."ITEMIMAGE" ADD CONSTRAINT "PK_ITEMIMAGE" PRIMARY KEY ("ITEMIMAGE_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ITEM
--------------------------------------------------------

  ALTER TABLE "ONECHO"."ITEM" ADD CONSTRAINT "PK_ITEM" PRIMARY KEY ("ITEM_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "ONECHO"."ITEM" ADD CONSTRAINT "CK_ITEM_SALE" CHECK (item_sale in('Y', 'N')) ENABLE;
  ALTER TABLE "ONECHO"."ITEM" ADD CONSTRAINT "CK_ITEM_DISPLAY" CHECK (item_display in('Y', 'N')) ENABLE;
  ALTER TABLE "ONECHO"."ITEM" MODIFY ("ITEM_MAX" NOT NULL ENABLE);
  ALTER TABLE "ONECHO"."ITEM" MODIFY ("ITEM_CDATE" NOT NULL ENABLE);
  ALTER TABLE "ONECHO"."ITEM" MODIFY ("ITEM_INFO" NOT NULL ENABLE);
  ALTER TABLE "ONECHO"."ITEM" MODIFY ("ITEM_DISPLAY" NOT NULL ENABLE);
  ALTER TABLE "ONECHO"."ITEM" MODIFY ("ITEM_STOCK" NOT NULL ENABLE);
  ALTER TABLE "ONECHO"."ITEM" MODIFY ("ITEM_DISCOUNT" NOT NULL ENABLE);
  ALTER TABLE "ONECHO"."ITEM" MODIFY ("ITEM_PRICE" NOT NULL ENABLE);
  ALTER TABLE "ONECHO"."ITEM" MODIFY ("KEYWORD_NO" NOT NULL ENABLE);
  ALTER TABLE "ONECHO"."ITEM" MODIFY ("ITEM_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "ONECHO"."ITEM" MODIFY ("ITEM_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table IMAGE
--------------------------------------------------------

  ALTER TABLE "ONECHO"."IMAGE" ADD CONSTRAINT "PK_IMAGE" PRIMARY KEY ("IMAGE_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ITEMIMAGE
--------------------------------------------------------

  ALTER TABLE "ONECHO"."ITEMIMAGE" ADD CONSTRAINT "FK_IMAGE_TO_ITEMIMAGE" FOREIGN KEY ("IMAGE_NO")
	  REFERENCES "ONECHO"."IMAGE" ("IMAGE_NO") ENABLE;
  ALTER TABLE "ONECHO"."ITEMIMAGE" ADD CONSTRAINT "FK_ITEM_TO_ITEMIMAGE" FOREIGN KEY ("ITEM_NO")
	  REFERENCES "ONECHO"."ITEM" ("ITEM_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ITEM
--------------------------------------------------------

  ALTER TABLE "ONECHO"."ITEM" ADD CONSTRAINT "FK_KEYWORD_TO_ITEM" FOREIGN KEY ("KEYWORD_NO")
	  REFERENCES "ONECHO"."KEYWORD" ("KEYWORD_NO") ENABLE;
