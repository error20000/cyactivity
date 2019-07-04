/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1 cyactivity
 Source Server Type    : Oracle
 Source Server Version : 110200
 Source Host           : 127.0.0.1:1521
 Source Schema         : CYACTIVITY

 Target Server Type    : Oracle
 Target Server Version : 110200
 File Encoding         : 65001

 Date: 04/07/2019 17:39:57
*/


-- ----------------------------
-- Table structure for DS_ACTIVE
-- ----------------------------
DROP TABLE "CYACTIVITY"."DS_ACTIVE";
CREATE TABLE "CYACTIVITY"."DS_ACTIVE" (
  "PID" NUMBER NOT NULL ,
  "APP_CODE" NVARCHAR2(64) ,
  "OPENID" NVARCHAR2(50) ,
  "CREATE_TIME" DATE ,
  "PLAT" NVARCHAR2(10) ,
  "PHONE" NVARCHAR2(20) ,
  "INVITE_CODE" NVARCHAR2(30) ,
  "USED_CODE" NVARCHAR2(30) ,
  "ACTIVITY_CODE" NVARCHAR2(64) ,
  "VERSION_CODE" NVARCHAR2(64) 
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "CYACTIVITY"."DS_ACTIVE"."PID" IS '主键';
COMMENT ON COLUMN "CYACTIVITY"."DS_ACTIVE"."APP_CODE" IS '应用代码';
COMMENT ON COLUMN "CYACTIVITY"."DS_ACTIVE"."OPENID" IS 'OPENID';
COMMENT ON COLUMN "CYACTIVITY"."DS_ACTIVE"."CREATE_TIME" IS '参加时间';
COMMENT ON COLUMN "CYACTIVITY"."DS_ACTIVE"."PLAT" IS '预约平台';
COMMENT ON COLUMN "CYACTIVITY"."DS_ACTIVE"."PHONE" IS '预约手机号';
COMMENT ON COLUMN "CYACTIVITY"."DS_ACTIVE"."INVITE_CODE" IS '邀请码';
COMMENT ON COLUMN "CYACTIVITY"."DS_ACTIVE"."USED_CODE" IS '使用的邀请码';
COMMENT ON COLUMN "CYACTIVITY"."DS_ACTIVE"."ACTIVITY_CODE" IS '活动代码 ';
COMMENT ON COLUMN "CYACTIVITY"."DS_ACTIVE"."VERSION_CODE" IS '活动版本 ';
COMMENT ON TABLE "CYACTIVITY"."DS_ACTIVE" IS '活动参与表';

-- ----------------------------
-- Records of DS_ACTIVE
-- ----------------------------
INSERT INTO "CYACTIVITY"."DS_ACTIVE" VALUES ('1', NULL, NULL, TO_DATE('2019-07-02 16:23:49', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '158811463091', 'fsdfsfsdfs', '2sfsafetttttt', NULL, NULL);
INSERT INTO "CYACTIVITY"."DS_ACTIVE" VALUES ('595679446606807040', 'tl3d', NULL, TO_DATE('2019-07-02 18:17:27', 'SYYYY-MM-DD HH24:MI:SS'), 'Android', '15881146309', 'giftcode2', NULL, 'appointment', '20190701');
INSERT INTO "CYACTIVITY"."DS_ACTIVE" VALUES ('595686745266192384', 'tl3d', '15881146309', TO_DATE('2019-07-02 18:46:27', 'SYYYY-MM-DD HH24:MI:SS'), 'IOS', '158811463093', 'giftcode3', 'giftcode2', 'appointment', '20190701');

-- ----------------------------
-- Table structure for DS_ACTIVE_OFFSET
-- ----------------------------
DROP TABLE "CYACTIVITY"."DS_ACTIVE_OFFSET";
CREATE TABLE "CYACTIVITY"."DS_ACTIVE_OFFSET" (
  "PID" NUMBER NOT NULL ,
  "NUM" NUMBER ,
  "TIME" NUMBER ,
  "APP_CODE" NVARCHAR2(64) ,
  "ACTIVITY_CODE" NVARCHAR2(64) ,
  "VERSION_CODE" NVARCHAR2(64) 
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "CYACTIVITY"."DS_ACTIVE_OFFSET"."PID" IS '主键';
COMMENT ON COLUMN "CYACTIVITY"."DS_ACTIVE_OFFSET"."NUM" IS '偏移量';
COMMENT ON COLUMN "CYACTIVITY"."DS_ACTIVE_OFFSET"."TIME" IS '更新时间 0-24，0实时';
COMMENT ON COLUMN "CYACTIVITY"."DS_ACTIVE_OFFSET"."APP_CODE" IS '应用代码';
COMMENT ON COLUMN "CYACTIVITY"."DS_ACTIVE_OFFSET"."ACTIVITY_CODE" IS '活动代码 ';
COMMENT ON COLUMN "CYACTIVITY"."DS_ACTIVE_OFFSET"."VERSION_CODE" IS '活动版本';
COMMENT ON TABLE "CYACTIVITY"."DS_ACTIVE_OFFSET" IS '预约偏移量';

-- ----------------------------
-- Records of DS_ACTIVE_OFFSET
-- ----------------------------
INSERT INTO "CYACTIVITY"."DS_ACTIVE_OFFSET" VALUES ('1', '10000', '0', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for DS_GIFT_CODE
-- ----------------------------
DROP TABLE "CYACTIVITY"."DS_GIFT_CODE";
CREATE TABLE "CYACTIVITY"."DS_GIFT_CODE" (
  "CODE" NVARCHAR2(30) NOT NULL ,
  "STATUS" NUMBER ,
  "APP_CODE" NVARCHAR2(64) ,
  "ACTIVITY_CODE" NVARCHAR2(64) ,
  "VERSION_CODE" NVARCHAR2(64) 
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "CYACTIVITY"."DS_GIFT_CODE"."CODE" IS '邀请码';
COMMENT ON COLUMN "CYACTIVITY"."DS_GIFT_CODE"."STATUS" IS '状态  0：未使用，1：已使用';
COMMENT ON COLUMN "CYACTIVITY"."DS_GIFT_CODE"."APP_CODE" IS '应用代码';
COMMENT ON COLUMN "CYACTIVITY"."DS_GIFT_CODE"."ACTIVITY_CODE" IS '活动代码 ';
COMMENT ON COLUMN "CYACTIVITY"."DS_GIFT_CODE"."VERSION_CODE" IS '活动版本';

-- ----------------------------
-- Records of DS_GIFT_CODE
-- ----------------------------
INSERT INTO "CYACTIVITY"."DS_GIFT_CODE" VALUES ('giftcode1', '1', '1', '1', '1');
INSERT INTO "CYACTIVITY"."DS_GIFT_CODE" VALUES ('giftcode2', '1', NULL, NULL, NULL);
INSERT INTO "CYACTIVITY"."DS_GIFT_CODE" VALUES ('giftcode3', '1', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for DS_GIFT_ITEM
-- ----------------------------
DROP TABLE "CYACTIVITY"."DS_GIFT_ITEM";
CREATE TABLE "CYACTIVITY"."DS_GIFT_ITEM" (
  "PID" NUMBER NOT NULL ,
  "TYPE" NUMBER ,
  "NAME" NVARCHAR2(30) ,
  "NUM" NUMBER ,
  "APP_CODE" NVARCHAR2(64) ,
  "ACTIVITY_CODE" NVARCHAR2(64) ,
  "VERSION_CODE" NVARCHAR2(64) ,
  "ICON" NVARCHAR2(255) 
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "CYACTIVITY"."DS_GIFT_ITEM"."PID" IS '主键';
COMMENT ON COLUMN "CYACTIVITY"."DS_GIFT_ITEM"."TYPE" IS '奖品的档位';
COMMENT ON COLUMN "CYACTIVITY"."DS_GIFT_ITEM"."NAME" IS '奖品名称';
COMMENT ON COLUMN "CYACTIVITY"."DS_GIFT_ITEM"."NUM" IS '奖品数量';
COMMENT ON COLUMN "CYACTIVITY"."DS_GIFT_ITEM"."APP_CODE" IS '应用代码';
COMMENT ON COLUMN "CYACTIVITY"."DS_GIFT_ITEM"."ACTIVITY_CODE" IS '活动代码 ';
COMMENT ON COLUMN "CYACTIVITY"."DS_GIFT_ITEM"."VERSION_CODE" IS '活动版本';
COMMENT ON COLUMN "CYACTIVITY"."DS_GIFT_ITEM"."ICON" IS '奖励ICON';
COMMENT ON TABLE "CYACTIVITY"."DS_GIFT_ITEM" IS '奖品表';

-- ----------------------------
-- Records of DS_GIFT_ITEM
-- ----------------------------
INSERT INTO "CYACTIVITY"."DS_GIFT_ITEM" VALUES ('1', '1', '3级穿透宝石', '1', '1', '1', '1', 'inc/images/prize.png');
INSERT INTO "CYACTIVITY"."DS_GIFT_ITEM" VALUES ('2', '2', '3级穿透宝石', '2', '1', '1', '1', 'inc/images/prize.png');
INSERT INTO "CYACTIVITY"."DS_GIFT_ITEM" VALUES ('3', '3', '3级穿透宝石', '3', '1', '1', '1', 'inc/images/prize.png');
INSERT INTO "CYACTIVITY"."DS_GIFT_ITEM" VALUES ('4', '3', '3级穿透宝石', '1', NULL, NULL, NULL, 'inc/images/prize.png');
INSERT INTO "CYACTIVITY"."DS_GIFT_ITEM" VALUES ('5', '4', '3级穿透宝石', '4', NULL, NULL, NULL, 'inc/images/prize.png');
INSERT INTO "CYACTIVITY"."DS_GIFT_ITEM" VALUES ('6', '5', '3级穿透宝石', '5', NULL, NULL, NULL, 'inc/images/prize.png');
INSERT INTO "CYACTIVITY"."DS_GIFT_ITEM" VALUES ('7', '6', '3级穿透宝石', '1', NULL, NULL, NULL, 'inc/images/prize.png');
INSERT INTO "CYACTIVITY"."DS_GIFT_ITEM" VALUES ('8', '7', '3级穿透宝石', '1', NULL, NULL, NULL, 'inc/images/prize.png');
INSERT INTO "CYACTIVITY"."DS_GIFT_ITEM" VALUES ('9', '8', '3级穿透宝石', '1', NULL, NULL, NULL, 'inc/images/prize.png');
INSERT INTO "CYACTIVITY"."DS_GIFT_ITEM" VALUES ('10', '9', '3级穿透宝石', '1', NULL, NULL, NULL, 'inc/images/prize.png');
INSERT INTO "CYACTIVITY"."DS_GIFT_ITEM" VALUES ('11', '10', '3级穿透宝石', '1', NULL, NULL, NULL, 'inc/images/prize.png');

-- ----------------------------
-- Table structure for DS_GIFT_TYPE
-- ----------------------------
DROP TABLE "CYACTIVITY"."DS_GIFT_TYPE";
CREATE TABLE "CYACTIVITY"."DS_GIFT_TYPE" (
  "PID" NUMBER NOT NULL ,
  "NAME" NVARCHAR2(20) ,
  "NUM" NUMBER ,
  "APP_CODE" NVARCHAR2(64) ,
  "ACTIVITY_CODE" NVARCHAR2(64) ,
  "VERSION_CODE" NVARCHAR2(64) ,
  "SERVER" NUMBER 
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "CYACTIVITY"."DS_GIFT_TYPE"."PID" IS '主键';
COMMENT ON COLUMN "CYACTIVITY"."DS_GIFT_TYPE"."NAME" IS '奖励档位的名称';
COMMENT ON COLUMN "CYACTIVITY"."DS_GIFT_TYPE"."NUM" IS '奖励达成人数';
COMMENT ON COLUMN "CYACTIVITY"."DS_GIFT_TYPE"."APP_CODE" IS '应用代码';
COMMENT ON COLUMN "CYACTIVITY"."DS_GIFT_TYPE"."ACTIVITY_CODE" IS '活动代码 ';
COMMENT ON COLUMN "CYACTIVITY"."DS_GIFT_TYPE"."VERSION_CODE" IS '活动版本';
COMMENT ON COLUMN "CYACTIVITY"."DS_GIFT_TYPE"."SERVER" IS '服务器 1：老服，2：新服';
COMMENT ON TABLE "CYACTIVITY"."DS_GIFT_TYPE" IS '奖品档位表';

-- ----------------------------
-- Records of DS_GIFT_TYPE
-- ----------------------------
INSERT INTO "CYACTIVITY"."DS_GIFT_TYPE" VALUES ('1', '1万预约', '10000', '1', '1', '1', '1');
INSERT INTO "CYACTIVITY"."DS_GIFT_TYPE" VALUES ('2', '2万预约', '20000', '1', '1', '1', '1');
INSERT INTO "CYACTIVITY"."DS_GIFT_TYPE" VALUES ('3', '3万预约', '30000', '1', '1', '1', '1');
INSERT INTO "CYACTIVITY"."DS_GIFT_TYPE" VALUES ('4', '4万预约', '40000', '1', '1', '1', '1');
INSERT INTO "CYACTIVITY"."DS_GIFT_TYPE" VALUES ('5', '5万预约', '50000', '1', '1', '1', '1');
INSERT INTO "CYACTIVITY"."DS_GIFT_TYPE" VALUES ('6', '1万预约', '10000', NULL, NULL, NULL, '2');
INSERT INTO "CYACTIVITY"."DS_GIFT_TYPE" VALUES ('7', '2万预约', '20000', NULL, NULL, NULL, '2');
INSERT INTO "CYACTIVITY"."DS_GIFT_TYPE" VALUES ('8', '3万预约', '30000', NULL, NULL, NULL, '2');
INSERT INTO "CYACTIVITY"."DS_GIFT_TYPE" VALUES ('9', '4万预约', '40000', NULL, NULL, NULL, '2');
INSERT INTO "CYACTIVITY"."DS_GIFT_TYPE" VALUES ('10', '5万预约', '50000', NULL, NULL, NULL, '2');

-- ----------------------------
-- Table structure for DS_INVITE_GIFT
-- ----------------------------
DROP TABLE "CYACTIVITY"."DS_INVITE_GIFT";
CREATE TABLE "CYACTIVITY"."DS_INVITE_GIFT" (
  "PID" NUMBER NOT NULL ,
  "NAME" NVARCHAR2(255) ,
  "NUM" NUMBER ,
  "CODE" NVARCHAR2(30) ,
  "ICON" NVARCHAR2(255) ,
  "APP_CODE" NVARCHAR2(64) ,
  "ACTIVITY_CODE" NVARCHAR2(64) ,
  "VERSION_CODE" NVARCHAR2(64) 
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "CYACTIVITY"."DS_INVITE_GIFT"."PID" IS '主键';
COMMENT ON COLUMN "CYACTIVITY"."DS_INVITE_GIFT"."NAME" IS '奖励名称';
COMMENT ON COLUMN "CYACTIVITY"."DS_INVITE_GIFT"."NUM" IS '奖励达成人数';
COMMENT ON COLUMN "CYACTIVITY"."DS_INVITE_GIFT"."CODE" IS '邀请礼包码';
COMMENT ON COLUMN "CYACTIVITY"."DS_INVITE_GIFT"."ICON" IS '奖励ICON';
COMMENT ON COLUMN "CYACTIVITY"."DS_INVITE_GIFT"."APP_CODE" IS '应用代码';
COMMENT ON COLUMN "CYACTIVITY"."DS_INVITE_GIFT"."ACTIVITY_CODE" IS '活动代码 ';
COMMENT ON COLUMN "CYACTIVITY"."DS_INVITE_GIFT"."VERSION_CODE" IS '活动版本';
COMMENT ON TABLE "CYACTIVITY"."DS_INVITE_GIFT" IS '邀请奖励列表';

-- ----------------------------
-- Records of DS_INVITE_GIFT
-- ----------------------------
INSERT INTO "CYACTIVITY"."DS_INVITE_GIFT" VALUES ('1', '3级穿透宝石', '3', '123', 'inc/images/prize.png', '1', '1', '1');
INSERT INTO "CYACTIVITY"."DS_INVITE_GIFT" VALUES ('3', '3级穿透宝石', '1', '111', 'inc/images/prize.png', NULL, NULL, NULL);
INSERT INTO "CYACTIVITY"."DS_INVITE_GIFT" VALUES ('2', '3级穿透宝石', '2', '321', 'inc/images/prize.png', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for TB_CORE_ACTIVITY
-- ----------------------------
DROP TABLE "CYACTIVITY"."TB_CORE_ACTIVITY";
CREATE TABLE "CYACTIVITY"."TB_CORE_ACTIVITY" (
  "ACTIVITY_CODE" NVARCHAR2(30) NOT NULL ,
  "APP_CODE" NVARCHAR2(30) NOT NULL ,
  "ACTIVITY_NAME" NVARCHAR2(30) NOT NULL ,
  "ACTIVITY_VERSION" NVARCHAR2(20) NOT NULL ,
  "START_TIME" DATE ,
  "END_TIME" DATE ,
  "OPEN_WX" NUMBER(1) NOT NULL ,
  "WX_ID" NVARCHAR2(100) ,
  "SUPPORT_PLAT" NUMBER(10) NOT NULL ,
  "STATUS" NUMBER(1) ,
  "MOBILE_URL" NVARCHAR2(255) ,
  "LANDING_URL" NVARCHAR2(255) ,
  "WECHAT_URL" NVARCHAR2(255) ,
  "DESCRIPTION" NVARCHAR2(255) ,
  "UPDATE_TIME" DATE ,
  "CREATE_TIME" DATE 
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "CYACTIVITY"."TB_CORE_ACTIVITY"."ACTIVITY_CODE" IS '活动代码 ';
COMMENT ON COLUMN "CYACTIVITY"."TB_CORE_ACTIVITY"."APP_CODE" IS '应用代码 旧活动的game';
COMMENT ON COLUMN "CYACTIVITY"."TB_CORE_ACTIVITY"."ACTIVITY_NAME" IS '活动名称 ';
COMMENT ON COLUMN "CYACTIVITY"."TB_CORE_ACTIVITY"."ACTIVITY_VERSION" IS '活动版本 ';
COMMENT ON COLUMN "CYACTIVITY"."TB_CORE_ACTIVITY"."START_TIME" IS '开始时间 ';
COMMENT ON COLUMN "CYACTIVITY"."TB_CORE_ACTIVITY"."END_TIME" IS '结束时间 ';
COMMENT ON COLUMN "CYACTIVITY"."TB_CORE_ACTIVITY"."OPEN_WX" IS '微信授权模式 是否开启微信 0 不开启 1 开启基础登陆 2 开启信息授权';
COMMENT ON COLUMN "CYACTIVITY"."TB_CORE_ACTIVITY"."WX_ID" IS '使用微信APP_ID ';
COMMENT ON COLUMN "CYACTIVITY"."TB_CORE_ACTIVITY"."SUPPORT_PLAT" IS '支持的账号类型 所有支持的类型数值总和。WECHAT(1，CHANGYOU(2，CYOU(4，CHANGYOUJIA(8，DJ(16';
COMMENT ON COLUMN "CYACTIVITY"."TB_CORE_ACTIVITY"."STATUS" IS '状态 0停用，1启用';
COMMENT ON COLUMN "CYACTIVITY"."TB_CORE_ACTIVITY"."MOBILE_URL" IS '手机入口地址 ';
COMMENT ON COLUMN "CYACTIVITY"."TB_CORE_ACTIVITY"."LANDING_URL" IS 'PC入口地址 ';
COMMENT ON COLUMN "CYACTIVITY"."TB_CORE_ACTIVITY"."WECHAT_URL" IS '微信入口地址 ';
COMMENT ON COLUMN "CYACTIVITY"."TB_CORE_ACTIVITY"."DESCRIPTION" IS '活动描述 ';
COMMENT ON COLUMN "CYACTIVITY"."TB_CORE_ACTIVITY"."UPDATE_TIME" IS '更新时间 ';
COMMENT ON COLUMN "CYACTIVITY"."TB_CORE_ACTIVITY"."CREATE_TIME" IS '创建时间 ';
COMMENT ON TABLE "CYACTIVITY"."TB_CORE_ACTIVITY" IS '活动信息 主要记录活动标识、key、是否有效、开始结束时间等';

-- ----------------------------
-- Records of TB_CORE_ACTIVITY
-- ----------------------------
INSERT INTO "CYACTIVITY"."TB_CORE_ACTIVITY" VALUES ('appointment', 'tl3d', 'test', '20190701', TO_DATE('2019-06-19 10:34:40', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-07-06 10:34:46', 'SYYYY-MM-DD HH24:MI:SS'), '0', NULL, '64', '1', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for TB_CORE_APP
-- ----------------------------
DROP TABLE "CYACTIVITY"."TB_CORE_APP";
CREATE TABLE "CYACTIVITY"."TB_CORE_APP" (
  "APP_CODE" NVARCHAR2(30) NOT NULL ,
  "APP_NAME" NVARCHAR2(30) NOT NULL ,
  "APP_KEY" NVARCHAR2(30) ,
  "STATUS" NUMBER DEFAULT 1  ,
  "CREATE_TIME" DATE ,
  "UPDATE_TIME" DATE 
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "CYACTIVITY"."TB_CORE_APP"."APP_CODE" IS '代码主键 ';
COMMENT ON COLUMN "CYACTIVITY"."TB_CORE_APP"."APP_NAME" IS '名称 ';
COMMENT ON COLUMN "CYACTIVITY"."TB_CORE_APP"."APP_KEY" IS '应用KEY ';
COMMENT ON COLUMN "CYACTIVITY"."TB_CORE_APP"."STATUS" IS '状态 ';
COMMENT ON COLUMN "CYACTIVITY"."TB_CORE_APP"."CREATE_TIME" IS 'CREATE_TIME ';
COMMENT ON COLUMN "CYACTIVITY"."TB_CORE_APP"."UPDATE_TIME" IS 'UPDATE_TIME ';
COMMENT ON TABLE "CYACTIVITY"."TB_CORE_APP" IS '应用（游戏）表 一个游戏作为一个应用';

-- ----------------------------
-- Table structure for TB_CORE_USER
-- ----------------------------
DROP TABLE "CYACTIVITY"."TB_CORE_USER";
CREATE TABLE "CYACTIVITY"."TB_CORE_USER" (
  "GUID" NVARCHAR2(60) NOT NULL ,
  "STATUS" NUMBER(1) DEFAULT 1 ,
  "UPDATE_TIME" DATE ,
  "CREATE_TIME" DATE 
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of TB_CORE_USER
-- ----------------------------
INSERT INTO "CYACTIVITY"."TB_CORE_USER" VALUES ('5d1af32a4da48c1df89c26e8', '1', TO_DATE('2019-07-02 15:04:51', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-07-02 15:04:51', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "CYACTIVITY"."TB_CORE_USER" VALUES ('5d1b02df4da48c1cc4ee2048', '1', TO_DATE('2019-07-02 15:10:22', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-07-02 15:10:22', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "CYACTIVITY"."TB_CORE_USER" VALUES ('5d1db4c34da48c1a10df1611', '1', TO_DATE('2019-07-04 16:23:59', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-07-04 16:23:59', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "CYACTIVITY"."TB_CORE_USER" VALUES ('5d1dba404da48c1a10df1612', '1', TO_DATE('2019-07-04 16:35:30', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-07-04 16:35:30', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "CYACTIVITY"."TB_CORE_USER" VALUES ('5d1dbb314da48c1a10df1613', '1', TO_DATE('2019-07-04 16:46:05', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-07-04 16:46:05', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "CYACTIVITY"."TB_CORE_USER" VALUES ('5d1dbd524da48c1a10df1614', '1', TO_DATE('2019-07-04 16:50:15', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-07-04 16:50:15', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "CYACTIVITY"."TB_CORE_USER" VALUES ('5d1dbde14da48c1a10df1615', '1', TO_DATE('2019-07-04 16:51:54', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-07-04 16:51:54', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "CYACTIVITY"."TB_CORE_USER" VALUES ('5d1dbec74da48c1a10df1616', '1', TO_DATE('2019-07-04 17:19:17', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-07-04 17:19:17', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "CYACTIVITY"."TB_CORE_USER" VALUES ('5d1dc5144da48c1a10df1617', '1', TO_DATE('2019-07-04 17:21:33', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-07-04 17:21:33', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "CYACTIVITY"."TB_CORE_USER" VALUES ('5d1dc53a4da48c1a10df1618', '1', TO_DATE('2019-07-04 17:22:12', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-07-04 17:22:12', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "CYACTIVITY"."TB_CORE_USER" VALUES ('5d1dc5f44da48c1a10df1619', '1', TO_DATE('2019-07-04 17:25:21', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-07-04 17:25:21', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "CYACTIVITY"."TB_CORE_USER" VALUES ('5d1b1d0d4da48c19a0bcc103', '1', TO_DATE('2019-07-02 17:10:52', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-07-02 17:10:52', 'SYYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Table structure for TB_CORE_USER_OPEN
-- ----------------------------
DROP TABLE "CYACTIVITY"."TB_CORE_USER_OPEN";
CREATE TABLE "CYACTIVITY"."TB_CORE_USER_OPEN" (
  "GUID" NVARCHAR2(60) NOT NULL ,
  "OPENID" NVARCHAR2(100) NOT NULL ,
  "OPEN_TYPE" NUMBER(5) 
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "CYACTIVITY"."TB_CORE_USER_OPEN"."GUID" IS 'GUID ';
COMMENT ON COLUMN "CYACTIVITY"."TB_CORE_USER_OPEN"."OPENID" IS 'OPENID ';
COMMENT ON TABLE "CYACTIVITY"."TB_CORE_USER_OPEN" IS 'TOKEN用户与其他用户表关系 ';

-- ----------------------------
-- Records of TB_CORE_USER_OPEN
-- ----------------------------
INSERT INTO "CYACTIVITY"."TB_CORE_USER_OPEN" VALUES ('5d1af32a4da48c1df89c26e8', '15881146309', '64');
INSERT INTO "CYACTIVITY"."TB_CORE_USER_OPEN" VALUES ('5d1b02df4da48c1cc4ee2048', '15881146309', '64');
INSERT INTO "CYACTIVITY"."TB_CORE_USER_OPEN" VALUES ('5d1db4c34da48c1a10df1611', '15881146309', '64');
INSERT INTO "CYACTIVITY"."TB_CORE_USER_OPEN" VALUES ('5d1dba404da48c1a10df1612', '15881146309', '64');
INSERT INTO "CYACTIVITY"."TB_CORE_USER_OPEN" VALUES ('5d1dbb314da48c1a10df1613', '15881146309', '64');
INSERT INTO "CYACTIVITY"."TB_CORE_USER_OPEN" VALUES ('5d1dbd524da48c1a10df1614', '15881146309', '64');
INSERT INTO "CYACTIVITY"."TB_CORE_USER_OPEN" VALUES ('5d1dbde14da48c1a10df1615', '15881146309', '64');
INSERT INTO "CYACTIVITY"."TB_CORE_USER_OPEN" VALUES ('5d1dbec74da48c1a10df1616', '15881146509', '64');
INSERT INTO "CYACTIVITY"."TB_CORE_USER_OPEN" VALUES ('5d1dc5144da48c1a10df1617', '15881146309', '64');
INSERT INTO "CYACTIVITY"."TB_CORE_USER_OPEN" VALUES ('5d1dc53a4da48c1a10df1618', '15881146309', '64');
INSERT INTO "CYACTIVITY"."TB_CORE_USER_OPEN" VALUES ('5d1dc5f44da48c1a10df1619', '15881146309', '64');
INSERT INTO "CYACTIVITY"."TB_CORE_USER_OPEN" VALUES ('5d1b1d0d4da48c19a0bcc103', '15881146309', '64');

-- ----------------------------
-- Table structure for TB_WX_APP
-- ----------------------------
DROP TABLE "CYACTIVITY"."TB_WX_APP";
CREATE TABLE "CYACTIVITY"."TB_WX_APP" (
  "APP_ID" NVARCHAR2(100) NOT NULL ,
  "APP_NAME" NVARCHAR2(30) NOT NULL ,
  "SECRET" NVARCHAR2(200) NOT NULL ,
  "TOKEN" NVARCHAR2(255) ,
  "STATUS" NUMBER(1) DEFAULT 1  ,
  "CREATE_TIME" DATE ,
  "UPDATE_TIME" DATE 
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "CYACTIVITY"."TB_WX_APP"."APP_ID" IS '标识 ';
COMMENT ON COLUMN "CYACTIVITY"."TB_WX_APP"."APP_NAME" IS '名称 ';
COMMENT ON COLUMN "CYACTIVITY"."TB_WX_APP"."SECRET" IS '安全密钥 ';
COMMENT ON COLUMN "CYACTIVITY"."TB_WX_APP"."TOKEN" IS 'TOKEN 统一刷新token';
COMMENT ON COLUMN "CYACTIVITY"."TB_WX_APP"."STATUS" IS 'STATUS ';
COMMENT ON COLUMN "CYACTIVITY"."TB_WX_APP"."CREATE_TIME" IS 'CREATE_TIME ';
COMMENT ON COLUMN "CYACTIVITY"."TB_WX_APP"."UPDATE_TIME" IS 'UPDATE_TIME ';
COMMENT ON TABLE "CYACTIVITY"."TB_WX_APP" IS '微信设置表 ';

-- ----------------------------
-- Table structure for TB_WX_USER
-- ----------------------------
DROP TABLE "CYACTIVITY"."TB_WX_USER";
CREATE TABLE "CYACTIVITY"."TB_WX_USER" (
  "OPENID" NVARCHAR2(50) NOT NULL ,
  "WX_ID" NVARCHAR2(100) NOT NULL ,
  "UNIONID" NVARCHAR2(50) ,
  "NICKNAME" NVARCHAR2(200) ,
  "SEX" NUMBER(1) DEFAULT 0  ,
  "CITY" NVARCHAR2(100) ,
  "PROVINCE" NVARCHAR2(100) ,
  "COUNTRY" NVARCHAR2(100) ,
  "LANGUAGE" NVARCHAR2(20) ,
  "HEADIMGURL" NVARCHAR2(255) ,
  "PRIVILEGE" NCLOB ,
  "STATUS" NUMBER(1) DEFAULT 0  ,
  "LAST_SUBSCRIBE_TIME" DATE ,
  "FIRST_SUBSCRIBE_TIME" DATE ,
  "PRE_OPENID" NVARCHAR2(50) ,
  "CREATE_TIME" DATE ,
  "UPDATE_TIME" DATE 
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "CYACTIVITY"."TB_WX_USER"."OPENID" IS 'OPENID ';
COMMENT ON COLUMN "CYACTIVITY"."TB_WX_USER"."WX_ID" IS '微信APP_ID ';
COMMENT ON COLUMN "CYACTIVITY"."TB_WX_USER"."UNIONID" IS 'UNIONID ';
COMMENT ON COLUMN "CYACTIVITY"."TB_WX_USER"."NICKNAME" IS '昵称 ';
COMMENT ON COLUMN "CYACTIVITY"."TB_WX_USER"."SEX" IS '性别 0:未知，1:男，2:女';
COMMENT ON COLUMN "CYACTIVITY"."TB_WX_USER"."CITY" IS '所在城市 ';
COMMENT ON COLUMN "CYACTIVITY"."TB_WX_USER"."PROVINCE" IS '所在省份 ';
COMMENT ON COLUMN "CYACTIVITY"."TB_WX_USER"."COUNTRY" IS '所在国家 ';
COMMENT ON COLUMN "CYACTIVITY"."TB_WX_USER"."LANGUAGE" IS '语言 简体中文是zh_CN';
COMMENT ON COLUMN "CYACTIVITY"."TB_WX_USER"."HEADIMGURL" IS '头像 最后一个数值代表正方形头像大小（有0、46、64、96、132数值可选，0代表640*640正方形头像），用户没有头像时该项为空。若用户更换头像，原有头像URL将失效。';
COMMENT ON COLUMN "CYACTIVITY"."TB_WX_USER"."PRIVILEGE" IS '用户特权 用户特权信息，json 数组，如微信沃卡用户为（chinaunicom）';
COMMENT ON COLUMN "CYACTIVITY"."TB_WX_USER"."STATUS" IS '关注状态 0未关注，1已关注，2取消关注';
COMMENT ON COLUMN "CYACTIVITY"."TB_WX_USER"."LAST_SUBSCRIBE_TIME" IS '最后一次关注时间 ';
COMMENT ON COLUMN "CYACTIVITY"."TB_WX_USER"."FIRST_SUBSCRIBE_TIME" IS '第一次关注时间 ';
COMMENT ON COLUMN "CYACTIVITY"."TB_WX_USER"."PRE_OPENID" IS '邀请用户 ';
COMMENT ON COLUMN "CYACTIVITY"."TB_WX_USER"."CREATE_TIME" IS 'CREATE_TIME ';
COMMENT ON COLUMN "CYACTIVITY"."TB_WX_USER"."UPDATE_TIME" IS 'UPDATE_TIME ';
COMMENT ON TABLE "CYACTIVITY"."TB_WX_USER" IS '微信用户表 ';

-- ----------------------------
-- Primary Key structure for table DS_ACTIVE
-- ----------------------------
ALTER TABLE "CYACTIVITY"."DS_ACTIVE" ADD CONSTRAINT "SYS_C0011935" PRIMARY KEY ("PID");

-- ----------------------------
-- Checks structure for table DS_ACTIVE
-- ----------------------------
ALTER TABLE "CYACTIVITY"."DS_ACTIVE" ADD CONSTRAINT "SYS_C0011527" CHECK ("PID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."DS_ACTIVE" ADD CONSTRAINT "SYS_C0011934" CHECK ("PID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Indexes structure for table DS_ACTIVE
-- ----------------------------
CREATE INDEX "CYACTIVITY"."IDX_PHONE"
  ON "CYACTIVITY"."DS_ACTIVE" ("PHONE" ASC)
  LOGGING
  TABLESPACE "USERS"
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
);
CREATE INDEX "CYACTIVITY"."IDX_USED_CODE"
  ON "CYACTIVITY"."DS_ACTIVE" ("USED_CODE" ASC)
  LOGGING
  TABLESPACE "USERS"
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
);

-- ----------------------------
-- Primary Key structure for table DS_ACTIVE_OFFSET
-- ----------------------------
ALTER TABLE "CYACTIVITY"."DS_ACTIVE_OFFSET" ADD CONSTRAINT "SYS_C0011939" PRIMARY KEY ("PID");

-- ----------------------------
-- Checks structure for table DS_ACTIVE_OFFSET
-- ----------------------------
ALTER TABLE "CYACTIVITY"."DS_ACTIVE_OFFSET" ADD CONSTRAINT "SYS_C0011528" CHECK ("PID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."DS_ACTIVE_OFFSET" ADD CONSTRAINT "SYS_C0011938" CHECK ("PID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table DS_GIFT_CODE
-- ----------------------------
ALTER TABLE "CYACTIVITY"."DS_GIFT_CODE" ADD CONSTRAINT "SYS_C0011953" PRIMARY KEY ("CODE");

-- ----------------------------
-- Checks structure for table DS_GIFT_CODE
-- ----------------------------
ALTER TABLE "CYACTIVITY"."DS_GIFT_CODE" ADD CONSTRAINT "SYS_C0011529" CHECK ("CODE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."DS_GIFT_CODE" ADD CONSTRAINT "SYS_C0011952" CHECK ("CODE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table DS_GIFT_ITEM
-- ----------------------------
ALTER TABLE "CYACTIVITY"."DS_GIFT_ITEM" ADD CONSTRAINT "SYS_C0011933" PRIMARY KEY ("PID");

-- ----------------------------
-- Checks structure for table DS_GIFT_ITEM
-- ----------------------------
ALTER TABLE "CYACTIVITY"."DS_GIFT_ITEM" ADD CONSTRAINT "SYS_C0011530" CHECK ("PID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."DS_GIFT_ITEM" ADD CONSTRAINT "SYS_C0011932" CHECK ("PID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table DS_GIFT_TYPE
-- ----------------------------
ALTER TABLE "CYACTIVITY"."DS_GIFT_TYPE" ADD CONSTRAINT "SYS_C0011911" PRIMARY KEY ("PID");

-- ----------------------------
-- Checks structure for table DS_GIFT_TYPE
-- ----------------------------
ALTER TABLE "CYACTIVITY"."DS_GIFT_TYPE" ADD CONSTRAINT "SYS_C0011531" CHECK ("PID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."DS_GIFT_TYPE" ADD CONSTRAINT "SYS_C0011910" CHECK ("PID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table DS_INVITE_GIFT
-- ----------------------------
ALTER TABLE "CYACTIVITY"."DS_INVITE_GIFT" ADD CONSTRAINT "SYS_C0011937" PRIMARY KEY ("PID");

-- ----------------------------
-- Checks structure for table DS_INVITE_GIFT
-- ----------------------------
ALTER TABLE "CYACTIVITY"."DS_INVITE_GIFT" ADD CONSTRAINT "SYS_C0011532" CHECK ("PID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."DS_INVITE_GIFT" ADD CONSTRAINT "SYS_C0011936" CHECK ("PID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table TB_CORE_ACTIVITY
-- ----------------------------
ALTER TABLE "CYACTIVITY"."TB_CORE_ACTIVITY" ADD CONSTRAINT "PK_TB_CORE_ACTIVITY" PRIMARY KEY ("ACTIVITY_CODE", "APP_CODE", "ACTIVITY_VERSION");

-- ----------------------------
-- Checks structure for table TB_CORE_ACTIVITY
-- ----------------------------
ALTER TABLE "CYACTIVITY"."TB_CORE_ACTIVITY" ADD CONSTRAINT "SYS_C0011533" CHECK ("ACTIVITY_CODE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."TB_CORE_ACTIVITY" ADD CONSTRAINT "SYS_C0011534" CHECK ("APP_CODE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."TB_CORE_ACTIVITY" ADD CONSTRAINT "SYS_C0011535" CHECK ("ACTIVITY_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."TB_CORE_ACTIVITY" ADD CONSTRAINT "SYS_C0011536" CHECK ("ACTIVITY_VERSION" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."TB_CORE_ACTIVITY" ADD CONSTRAINT "SYS_C0011537" CHECK ("OPEN_WX" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."TB_CORE_ACTIVITY" ADD CONSTRAINT "SYS_C0011538" CHECK ("SUPPORT_PLAT" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."TB_CORE_ACTIVITY" ADD CONSTRAINT "SYS_C0011785" CHECK ("ACTIVITY_CODE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."TB_CORE_ACTIVITY" ADD CONSTRAINT "SYS_C0011786" CHECK ("APP_CODE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."TB_CORE_ACTIVITY" ADD CONSTRAINT "SYS_C0011787" CHECK ("ACTIVITY_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."TB_CORE_ACTIVITY" ADD CONSTRAINT "SYS_C0011788" CHECK ("ACTIVITY_VERSION" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."TB_CORE_ACTIVITY" ADD CONSTRAINT "SYS_C0011789" CHECK ("OPEN_WX" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."TB_CORE_ACTIVITY" ADD CONSTRAINT "SYS_C0011790" CHECK ("SUPPORT_PLAT" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table TB_CORE_APP
-- ----------------------------
ALTER TABLE "CYACTIVITY"."TB_CORE_APP" ADD CONSTRAINT "PK_TB_CORE_APP" PRIMARY KEY ("APP_CODE");

-- ----------------------------
-- Checks structure for table TB_CORE_APP
-- ----------------------------
ALTER TABLE "CYACTIVITY"."TB_CORE_APP" ADD CONSTRAINT "SYS_C0011539" CHECK ("APP_CODE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."TB_CORE_APP" ADD CONSTRAINT "SYS_C0011540" CHECK ("APP_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."TB_CORE_APP" ADD CONSTRAINT "SYS_C0011792" CHECK ("APP_CODE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."TB_CORE_APP" ADD CONSTRAINT "SYS_C0011793" CHECK ("APP_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table TB_CORE_USER
-- ----------------------------
ALTER TABLE "CYACTIVITY"."TB_CORE_USER" ADD CONSTRAINT "SYS_C0011827" CHECK ("GUID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table TB_CORE_USER_OPEN
-- ----------------------------
ALTER TABLE "CYACTIVITY"."TB_CORE_USER_OPEN" ADD CONSTRAINT "PK_TB_CORE_USER_OPEN" PRIMARY KEY ("GUID", "OPENID");

-- ----------------------------
-- Checks structure for table TB_CORE_USER_OPEN
-- ----------------------------
ALTER TABLE "CYACTIVITY"."TB_CORE_USER_OPEN" ADD CONSTRAINT "SYS_C0011541" CHECK ("GUID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."TB_CORE_USER_OPEN" ADD CONSTRAINT "SYS_C0011542" CHECK ("OPENID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."TB_CORE_USER_OPEN" ADD CONSTRAINT "SYS_C0011795" CHECK ("GUID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."TB_CORE_USER_OPEN" ADD CONSTRAINT "SYS_C0011796" CHECK ("OPENID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table TB_WX_APP
-- ----------------------------
ALTER TABLE "CYACTIVITY"."TB_WX_APP" ADD CONSTRAINT "PK_TB_WX_APP" PRIMARY KEY ("APP_ID");

-- ----------------------------
-- Checks structure for table TB_WX_APP
-- ----------------------------
ALTER TABLE "CYACTIVITY"."TB_WX_APP" ADD CONSTRAINT "SYS_C0011543" CHECK ("APP_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."TB_WX_APP" ADD CONSTRAINT "SYS_C0011544" CHECK ("APP_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."TB_WX_APP" ADD CONSTRAINT "SYS_C0011545" CHECK ("SECRET" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."TB_WX_APP" ADD CONSTRAINT "SYS_C0011798" CHECK ("APP_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."TB_WX_APP" ADD CONSTRAINT "SYS_C0011799" CHECK ("APP_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."TB_WX_APP" ADD CONSTRAINT "SYS_C0011800" CHECK ("SECRET" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table TB_WX_USER
-- ----------------------------
ALTER TABLE "CYACTIVITY"."TB_WX_USER" ADD CONSTRAINT "PK_TB_WX_USER" PRIMARY KEY ("OPENID");

-- ----------------------------
-- Checks structure for table TB_WX_USER
-- ----------------------------
ALTER TABLE "CYACTIVITY"."TB_WX_USER" ADD CONSTRAINT "SYS_C0011546" CHECK ("OPENID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."TB_WX_USER" ADD CONSTRAINT "SYS_C0011547" CHECK ("WX_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."TB_WX_USER" ADD CONSTRAINT "SYS_C0011802" CHECK ("OPENID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CYACTIVITY"."TB_WX_USER" ADD CONSTRAINT "SYS_C0011803" CHECK ("WX_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;