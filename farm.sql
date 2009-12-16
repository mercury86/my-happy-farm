/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2009-12-16 14:13:37                          */
/*==============================================================*/

use farm;

drop table if exists admin;

drop table if exists eventresult;

drop table if exists events;

drop table if exists farmuser;

drop table if exists globalrecord;

drop table if exists interactiverecord;

drop table if exists packs;

drop table if exists products;

drop table if exists steptimerelation;

drop table if exists storage;

drop table if exists useraccessories;

drop table if exists useranimals;

drop table if exists userfarmlands;

/*==============================================================*/
/* Table: admin                                                 */
/*==============================================================*/
create table admin
(
   id                   int(8) not null auto_increment,
   uid                  int(11) not null,
   primary key (id)
)
comment = "系统管理员表"
type = MyISAM
charset = UTF8;

/*==============================================================*/
/* Table: eventresult                                           */
/*==============================================================*/
create table eventresult
(
   id                   int(8) not null auto_increment,
   event_id             int(8) comment '事件ID',
   event_type           int(4) not null comment '1.加经验值,2奖励物品',
   product_id           int(8) not null comment 'event_id具体类型，决定该字段是否有实际用途',
   product_name         varchar(40) not null comment '冗余字段',
   product_num          int(8) not null comment '数量',
   add_experience       int(8) comment '加经验',
   primary key (id)
)
comment = "事件引发结果关系表,可通过管理后台配置."
type = MyISAM
charset = UTF8;

/*==============================================================*/
/* Table: events                                                */
/*==============================================================*/
create table events
(
   id                   int(8) not null,
   description          varchar(200) comment '事件概述',
   event_type           int(4) not null default 0 comment '事件类型0普通1.加经验值,2奖励物品,3待述',
   primary key (id)
)
comment = "事件经验值设置表
           事件分为系统级（登陆广播）和事件级（用户的操作事件，比如升级）
           所有动作全部定义成事件1登陆奖励,2普通消息,3事件触发奖励"
type = MyISAM
charset = UTF8;

/*==============================================================*/
/* Table: farmuser                                              */
/*==============================================================*/
create table farmuser
(
   id                   int(8) not null auto_increment,
   uid                  int(11) not null,
   level                int(4) not null default 1 comment '等级',
   experience           int(8) not null comment '经验值',
   cash                 int(11) comment '金币',
   kool                 int(11) comment '酷币',
   credit               int(11) comment '声望',
   weather              int(2) not null default 0 comment '随机天气状况0晴天1下雨',
   background           int(11) not null comment '背景ID',
   create_time          datetime,
   level_updatetime     datetime,
   experience_updatetime datetime,
   cash_updatetime      datetime,
   background_updatetime datetime,
   primary key (id)
)
comment = "游戏用户表"
type = MyISAM
charset = UTF8;

/*==============================================================*/
/* Table: globalrecord                                          */
/*==============================================================*/
create table globalrecord
(
   id                   int(10) not null auto_increment,
   uid                  int(11) not null comment '事件承受着',
   event_id             int(8) not null default 0 comment '事件类型（见event表）',
   description          varchar(600) not null comment '描述',
   create_time          datetime comment '发生时间',
   primary key (id)
)
comment = "全局日志记录"
type = MyISAM
charset = UTF8;

/*==============================================================*/
/* Table: interactiverecord                                     */
/*==============================================================*/
create table interactiverecord
(
   id                   int(10) not null auto_increment,
   from_uid             int(11) not null comment '时间发起者',
   to_uid               int(11) not null comment '事件承受着',
   event_id             int(8) not null default 0 comment '事件类型（见event表）',
   description          varchar(600) comment '内容描述',
   create_time          datetime comment '发生时间',
   primary key (id)
)
comment = "好友互动记录表.个人操作自己的地盘，记入日志文件中"
type = MyISAM
charset = UTF8;

/*==============================================================*/
/* Table: packs                                                 */
/*==============================================================*/
create table packs
(
   id                   int(8) not null auto_increment,
   uid                  int(11) not null comment '拥有者',
   product_id           int(8) not null default 0 comment '物品ID',
   category             int(4) comment '类别(具体分类待定)',
   count                int(8) not null default 0 comment '数量',
   add_time             datetime not null comment '创建时间',
   update_time          datetime not null comment '更新时间(最后购买时间)',
   primary key (id)
)
comment = "包裹表"
type = MyISAM
charset = UTF8;

/*==============================================================*/
/* Table: products                                              */
/*==============================================================*/
create table products
(
   id                   int(8) not null auto_increment,
   name                 varchar(40) not null comment '名称',
   img                  varchar(255) not null default '' comment '物品图片',
   category             int(4) not null default 0 comment '0;植物;1动物;3装饰品',
   reuse_num            int(2) not null default 1 comment '几季(重复使用次数)',
   buy_price            int(8) not null default 1 comment '购买单价',
   sell_price           int(4) not null default 1 comment '售出单价',
   required_level       int(4) not null default 1 comment '需要等级',
   min_output           int(4) not null default 25 comment '最小产出',
   max_output           int(4) not null default 50 comment '最大产出',
   ripe_time            int(11) not null default 0 comment '成熟时间(seconds)',
   reripe_time          int(11) not null default 0 comment '再熟时间',
   experience           int(8) not null default 1 comment '获得经验',
   primary key (id)
)
comment = "农场物品表"
type = MyISAM
charset = UTF8;

/*==============================================================*/
/* Table: steptimerelation                                      */
/*==============================================================*/
create table steptimerelation
(
   id                   int(8) not null auto_increment,
   product_id           int(8) not null,
   growth_step          int(4) not null comment '生长阶段',
   duration_time        int(11) not null comment '该阶段需要持续的时间(所需时间,以秒计算)',
   primary key (id)
)
comment = "作物生长阶段和时间对应关系表"
type = MyISAM
charset = UTF8;

/*==============================================================*/
/* Table: storage                                               */
/*==============================================================*/
create table storage
(
   id                   int(8) not null auto_increment,
   uid                  int(11) not null,
   product_id           int(8) not null,
   count                int(8) not null default 0 comment '储量',
   add_time             datetime not null,
   update_time          timestamp,
   primary key (id)
)
comment = "仓库(历史成果，记录全部成果)"
type = MyISAM
charset = UTF8;

/*==============================================================*/
/* Table: useraccessories                                       */
/*==============================================================*/
create table useraccessories
(
   id                   int(8) not null auto_increment,
   uid                  int(8) not null,
   product_id           int(4) not null comment '装饰品id',
   use_status           int(11) not null comment '使用状态(1使用中,2未使用)',
   create_time          datetime,
   primary key (id)
)
comment = "用户装饰表，便于以后扩展。"
type = MyISAM
charset = UTF8;

/*==============================================================*/
/* Table: useranimals                                           */
/*==============================================================*/
create table useranimals
(
   id                   int(8) not null auto_increment,
   uid                  int(11) not null comment '农场主',
   product_id           int(8) not null comment '物品id',
   growth_status        int(4) not null comment '状态(1正常,2生病)',
   growth_step          int(4) not null default -1 comment '成长阶段(-1未养,1仔)',
   output               int(4) not null comment '预期产量',
   increment            float comment '增产量',
   plant_time           datetime comment '饲养时间',
   step_updatetime      timestamp comment '成长阶段更新时间',
   create_time          datetime comment '记录创建时间',
   primary key (id)
)
comment = "用户养殖动物关系表
           考虑到用户作物表量级较大，固将养殖动物关系表单独分开"
type = MyISAM
charset = UTF8;

/*==============================================================*/
/* Table: userfarmlands                                         */
/*==============================================================*/
create table userfarmlands
(
   id                   int(8) not null auto_increment,
   uid                  int(11) not null comment '农场主',
   x                    int(4) not null comment '横坐标',
   y                    int(4) not null comment '纵坐标',
   product_id           int(8) not null comment '作物id',
   worm                 int(2) not null default 0 comment '虫子数(0无虫;)',
   grass                int(2) not null default 0 comment '杂草数(0无草)',
   reuse_num            int(4) not null default 1 comment '物品生长状态(对应几季)',
   soil_status          int(4) not null default -2 comment '土壤状态(1正常;2干旱;3肥沃;)',
   growth_step          int(4) not null default -1 comment '生长阶段(-3荒地,-2显示开垦牌;-1未种,1种子,2发芽,3小叶子,4大叶子,5开花,6成熟,7枯萎)',
   output               int(4) default 0 comment '实际产量(只在成熟后才有，最低产量*增产量>实际产量,则被偷过)',
   increment            float not null default 0 comment '增产量',
   seed_time            datetime comment '播种时间',
   step_updatetime      datetime comment '生长阶段更新时间(用于计算到下一阶段所需时间)',
   create_time          datetime comment '开垦时间(记录创建时间)',
   primary key (id)
)
comment = "农田作物信息表，用于展示。有好友除虫时，到FriendEventRecord中检查，是否能除草"
type = MyISAM
charset = UTF8;

