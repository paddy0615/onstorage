/*
SQLyog 企业版 - MySQL GUI v8.14
MySQL - 5.5.45 : Database - onestorage
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`onestorage` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `onestorage`;

/*Table structure for table `e_area_name` */

DROP TABLE IF EXISTS `e_area_name`;

CREATE TABLE `e_area_name` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `a_group_hk` varchar(200) DEFAULT NULL COMMENT '标题分类-繁体',
  `a_group_cn` varchar(200) DEFAULT NULL COMMENT '标题分类-简体',
  `a_group_en` varchar(200) DEFAULT NULL COMMENT '标题分类-英文',
  `a_key` varchar(100) DEFAULT NULL COMMENT '表示',
  `a_title_hk` varchar(200) DEFAULT NULL COMMENT '繁体-名',
  `a_title_cn` varchar(200) DEFAULT NULL COMMENT '简体-名',
  `a_title_en` varchar(200) DEFAULT NULL COMMENT '英文-名',
  `a_updatedate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `e_area_name` */

/*Table structure for table `e_certificate` */

DROP TABLE IF EXISTS `e_certificate`;

CREATE TABLE `e_certificate` (
  `ec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ec_title_hk` varchar(200) DEFAULT NULL COMMENT '繁体-名',
  `ec_title_cn` varchar(200) DEFAULT NULL COMMENT '简体-名',
  `ec_title_jp` varchar(200) DEFAULT NULL COMMENT '日文-名',
  `ec_title_kr` varchar(200) DEFAULT NULL COMMENT '韩文-名',
  `ec_title_en` varchar(200) DEFAULT NULL COMMENT '英文-名',
  PRIMARY KEY (`ec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `e_certificate` */

/*Table structure for table `e_currency` */

DROP TABLE IF EXISTS `e_currency`;

CREATE TABLE `e_currency` (
  `ec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ec_title` varchar(200) DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`ec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `e_currency` */

/*Table structure for table `e_form` */

DROP TABLE IF EXISTS `e_form`;

CREATE TABLE `e_form` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `e_lang_id` int(11) DEFAULT NULL COMMENT '语言Id',
  `e_type` int(11) NOT NULL COMMENT '类型(1:Resend Itinerary重新發送行程單 , 2:Duplicate Mulitiple Booking重復訂單,\n				3:Request for Certificate證明申請 , 4:Name Correction姓名修正 ,\n				5:Payment Failure支付失敗 , 6:Reconfirm Flight 確認航班 )',
  `e_pnr` varchar(100) DEFAULT NULL COMMENT 'PNR',
  `e_first_name` text,
  `e_last_name` text,
  `e_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `e_trip_type` int(11) DEFAULT '0' COMMENT '旅行类型[1返往(默认)，2单程, 3多城市]',
  `e_trip_departing` varchar(200) DEFAULT NULL COMMENT '出发地',
  `e_trip_going` varchar(200) DEFAULT NULL COMMENT '目的地',
  `e_trip_departingdate` datetime DEFAULT NULL COMMENT '出发日期',
  `e_trip_goingdate` datetime DEFAULT NULL COMMENT '回程日期',
  `e_trip_departing_new` varchar(200) DEFAULT NULL COMMENT '出发地1',
  `e_trip_going_new` varchar(200) DEFAULT NULL COMMENT '目的地1',
  `e_relation` int(11) DEFAULT '0' COMMENT '是否有关系(0无,1第一,2第二)',
  `e_relation_eid` int(11) DEFAULT '0' COMMENT '关系的id',
  `e_certificate_type` int(11) DEFAULT '0' COMMENT '证书类型(1:证明类别 , 2:搭乘航班证明 , 3:无搭乘航班證明 , 4:航班延误证明[默认])',
  `e_first_name_new` varchar(50) DEFAULT NULL COMMENT '新-名',
  `e_last_name_new` varchar(50) DEFAULT NULL COMMENT '新-性',
  `e_flie` text,
  `e_payment_type` int(11) DEFAULT '0' COMMENT '支付类型(1:支付宝,2:信用卡,3:微信)',
  `e_payment_transaction` varchar(200) DEFAULT NULL COMMENT '交易号',
  `e_payment_amount` varchar(200) DEFAULT NULL COMMENT '支付金额',
  `e_currency_id` int(11) DEFAULT '0' COMMENT 'e_currency货币外表',
  `e_payment_accounts` varchar(200) DEFAULT NULL COMMENT '账号',
  `e_random` int(11) DEFAULT '0' COMMENT 'e_currency货币外表',
  `e_updatedate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `e_dl_id` int(11) DEFAULT '0',
  `e_pnr_new` varchar(100) DEFAULT NULL COMMENT 'PNR-new',
  `e_flight_no` varchar(50) DEFAULT NULL COMMENT '航班编号',
  `e_flight_departuredate` datetime DEFAULT NULL COMMENT '航班出发日期',
  `e_status` int(11) DEFAULT '0' COMMENT 'eform状态（1为成功）',
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `e_form` */

/*Table structure for table `e_form_monitor` */

DROP TABLE IF EXISTS `e_form_monitor`;

CREATE TABLE `e_form_monitor` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `m_clientip` varchar(200) DEFAULT NULL COMMENT 'ip',
  `m_lang_id` int(11) DEFAULT NULL COMMENT 'faq语言ID',
  `m_et_id` int(11) DEFAULT NULL COMMENT 'e-form-type',
  `m_createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `m_crm_uid` varchar(50) DEFAULT NULL COMMENT 'crm-name',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `e_form_monitor` */

/*Table structure for table `e_form_result` */

DROP TABLE IF EXISTS `e_form_result`;

CREATE TABLE `e_form_result` (
  `er_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `er_e_id` int(11) DEFAULT NULL COMMENT 'e-form表单ID',
  `er_result` text,
  `er_result_xml` text,
  `er_crm_uid` varchar(50) DEFAULT NULL COMMENT 'crm-name',
  PRIMARY KEY (`er_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `e_form_result` */

/*Table structure for table `e_form_type` */

DROP TABLE IF EXISTS `e_form_type`;

CREATE TABLE `e_form_type` (
  `et_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `et_title_hk` varchar(200) DEFAULT NULL COMMENT '繁体-名',
  `et_title_cn` varchar(200) DEFAULT NULL COMMENT '简体-名',
  `et_title_en` varchar(200) DEFAULT NULL COMMENT '英文-名',
  PRIMARY KEY (`et_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `e_form_type` */

/*Table structure for table `e_form_type_display` */

DROP TABLE IF EXISTS `e_form_type_display`;

CREATE TABLE `e_form_type_display` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `d_user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `d_et_id` int(11) DEFAULT NULL COMMENT 'E-FORM type',
  `d_order` int(11) DEFAULT NULL COMMENT '排序',
  `d_createdate` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `e_form_type_display` */

/*Table structure for table `e_pdf_area` */

DROP TABLE IF EXISTS `e_pdf_area`;

CREATE TABLE `e_pdf_area` (
  `epa_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `epa_key` varchar(100) DEFAULT NULL COMMENT 'key',
  `epa_title_hk` varchar(200) DEFAULT NULL COMMENT '繁体-名',
  `epa_title_en` varchar(200) DEFAULT NULL COMMENT '英文-名',
  PRIMARY KEY (`epa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `e_pdf_area` */

/*Table structure for table `faqs_category` */

DROP TABLE IF EXISTS `faqs_category`;

CREATE TABLE `faqs_category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cat_lang_id` int(11) NOT NULL COMMENT 'faq语言ID',
  `cat_title` varchar(500) NOT NULL COMMENT '类别名称',
  `cat_createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `cat_updatedate` datetime DEFAULT NULL COMMENT '修改时间',
  `cat_createuser` int(11) DEFAULT NULL COMMENT '创建人',
  `cat_updateuser` int(11) DEFAULT NULL COMMENT '修改人',
  `cat_status` int(11) DEFAULT '0' COMMENT '状态（1发布，0未发布）',
  `cat_ordertopdate` datetime DEFAULT NULL COMMENT '置顶排序（按时间）',
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `faqs_category` */

/*Table structure for table `faqs_detailed` */

DROP TABLE IF EXISTS `faqs_detailed`;

CREATE TABLE `faqs_detailed` (
  `dl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `dl_lang_id` int(11) NOT NULL COMMENT 'faq语言ID',
  `dl_cat_id` int(11) DEFAULT NULL COMMENT '类别可以为空,字段已不用',
  `dl_title` varchar(500) NOT NULL COMMENT '详情标题',
  `dl_content` text COMMENT '详情内容,带html',
  `dl_contenttxt` text COMMENT '详情内容,纯文本',
  `dl_createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `dl_updatedate` datetime DEFAULT NULL COMMENT '修改时间',
  `dl_createuser` int(11) DEFAULT NULL COMMENT '创建人',
  `dl_updateuser` int(11) DEFAULT NULL COMMENT '修改人',
  `dl_status` int(11) DEFAULT '0' COMMENT '状态（1发布，0未发布）',
  `dl_ordertopdate` datetime DEFAULT NULL COMMENT '置顶排序（按时间）',
  `dl_fl_id` int(11) DEFAULT '0',
  `dl_weights` int(11) DEFAULT '0',
  PRIMARY KEY (`dl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `faqs_detailed` */

/*Table structure for table `faqs_detailed_feedback` */

DROP TABLE IF EXISTS `faqs_detailed_feedback`;

CREATE TABLE `faqs_detailed_feedback` (
  `df_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `df_type` int(11) DEFAULT NULL COMMENT '类别(1支持,2反对)',
  `df_dl_id` int(11) DEFAULT NULL COMMENT 'faq详细ID',
  `df_ip` varchar(100) DEFAULT NULL COMMENT 'ip',
  `df_nay_content` varchar(100) DEFAULT NULL COMMENT '反对内容',
  `df_createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `df_nay_email` varchar(100) DEFAULT NULL,
  `df_nay_number` varchar(100) DEFAULT NULL,
  `df_nay_status` int(11) DEFAULT '0',
  PRIMARY KEY (`df_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `faqs_detailed_feedback` */

/*Table structure for table `faqs_detailed_tags` */

DROP TABLE IF EXISTS `faqs_detailed_tags`;

CREATE TABLE `faqs_detailed_tags` (
  `dt_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `dt_title` varchar(200) DEFAULT NULL COMMENT 'tags名',
  `dt_createdate` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`dt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `faqs_detailed_tags` */

/*Table structure for table `faqs_dl_hotspot` */

DROP TABLE IF EXISTS `faqs_dl_hotspot`;

CREATE TABLE `faqs_dl_hotspot` (
  `dlh_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `dlh_dl_id` int(11) NOT NULL COMMENT 'faq详情ID',
  `dlh_search_count` int(11) NOT NULL DEFAULT '0' COMMENT '搜索数量',
  PRIMARY KEY (`dlh_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `faqs_dl_hotspot` */

/*Table structure for table `faqs_dtags_relation` */

DROP TABLE IF EXISTS `faqs_dtags_relation`;

CREATE TABLE `faqs_dtags_relation` (
  `dr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `dr_dt_id` int(11) DEFAULT NULL COMMENT '详细标签ID',
  `dr_dl_id` int(11) DEFAULT NULL COMMENT 'faq详细ID',
  `dr_order` int(11) DEFAULT NULL COMMENT '排序序号',
  `dr_createdate` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`dr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `faqs_dtags_relation` */

/*Table structure for table `faqs_eform_relation` */

DROP TABLE IF EXISTS `faqs_eform_relation`;

CREATE TABLE `faqs_eform_relation` (
  `er_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `er_et_id` int(11) DEFAULT NULL COMMENT 'e-form类型',
  `er_dl_id` int(11) DEFAULT NULL COMMENT 'faq详细ID',
  PRIMARY KEY (`er_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `faqs_eform_relation` */

/*Table structure for table `faqs_language` */

DROP TABLE IF EXISTS `faqs_language`;

CREATE TABLE `faqs_language` (
  `lang_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `lang_title` varchar(100) NOT NULL COMMENT '语言名称',
  `lang_problem` varchar(100) DEFAULT NULL COMMENT '语言问题',
  `lang_createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `lang_updatedate` datetime DEFAULT NULL COMMENT '修改时间',
  `lang_createuser` int(11) DEFAULT NULL COMMENT '创建人',
  `lang_updateuser` int(11) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`lang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `faqs_language` */

/*Table structure for table `faqs_librabry` */

DROP TABLE IF EXISTS `faqs_librabry`;

CREATE TABLE `faqs_librabry` (
  `fl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `fl_title` varchar(100) DEFAULT NULL COMMENT '标题',
  `fl_remarks` varchar(200) DEFAULT NULL COMMENT '备注',
  `fl_createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `fl_updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`fl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `faqs_librabry` */

/*Table structure for table `faqs_logs` */

DROP TABLE IF EXISTS `faqs_logs`;

CREATE TABLE `faqs_logs` (
  `l_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `l_user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `l_ip` varchar(200) DEFAULT NULL COMMENT 'IP',
  `l_title` varchar(250) DEFAULT NULL COMMENT '内容简介',
  `l_content` text COMMENT '内容的json',
  `l_content_other` text COMMENT '内容的json-other',
  `l_createdate` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `faqs_logs` */

/*Table structure for table `faqs_monitor` */

DROP TABLE IF EXISTS `faqs_monitor`;

CREATE TABLE `faqs_monitor` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `m_clientip` varchar(200) DEFAULT NULL COMMENT 'ip',
  `m_lang_id` int(11) DEFAULT NULL COMMENT 'faq语言ID',
  `m_cat_id` int(11) DEFAULT NULL COMMENT 'faq类别ID',
  `m_dl_id` int(11) DEFAULT NULL COMMENT 'faq答案ID',
  `m_createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `m_dl_id_father` int(11) DEFAULT '0',
  `m_crm_uid` varchar(50) DEFAULT NULL COMMENT 'crm-name',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `faqs_monitor` */

/*Table structure for table `faqs_no_tags` */

DROP TABLE IF EXISTS `faqs_no_tags`;

CREATE TABLE `faqs_no_tags` (
  `nt_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `nt_lang_id` int(11) DEFAULT NULL COMMENT '语言Id',
  `nt_ip` varchar(100) DEFAULT NULL COMMENT 'IP',
  `nt_title` varchar(100) DEFAULT NULL COMMENT '标题',
  `nt_count` int(11) DEFAULT NULL COMMENT '数量',
  `nt_createdate` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`nt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `faqs_no_tags` */

/*Table structure for table `faqs_select_monitor` */

DROP TABLE IF EXISTS `faqs_select_monitor`;

CREATE TABLE `faqs_select_monitor` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `m_clientip` varchar(200) DEFAULT NULL COMMENT 'ip',
  `m_lang_id` int(11) DEFAULT NULL COMMENT 'faq语言ID',
  `m_selete` varchar(500) DEFAULT NULL COMMENT '搜索值',
  `m_createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `m_crm_uid` varchar(50) DEFAULT NULL COMMENT 'crm-name',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `faqs_select_monitor` */

/*Table structure for table `faqs_user` */

DROP TABLE IF EXISTS `faqs_user`;

CREATE TABLE `faqs_user` (
  `usr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `usr_login_id` varchar(100) NOT NULL COMMENT '账号',
  `usr_password` varchar(100) NOT NULL COMMENT '密码',
  `usr_role` varchar(100) NOT NULL COMMENT '角色（admin管理员用户，ordinary普通用户）',
  PRIMARY KEY (`usr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `faqs_user` */

insert  into `faqs_user`(`usr_id`,`usr_login_id`,`usr_password`,`usr_role`) values (1,'admin','admin_123','admin');

/*Table structure for table `folder` */

DROP TABLE IF EXISTS `folder`;

CREATE TABLE `folder` (
  `f_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `f_title` varchar(200) DEFAULT NULL COMMENT 'title',
  `f_lang_id` int(11) NOT NULL COMMENT '语言ID',
  `f_createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `f_key_random` int(11) DEFAULT '0' COMMENT 'key-同个Q',
  PRIMARY KEY (`f_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `folder` */

/*Table structure for table `folder_display_relation` */

DROP TABLE IF EXISTS `folder_display_relation`;

CREATE TABLE `folder_display_relation` (
  `fdr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `fdr_f_id` int(11) DEFAULT NULL COMMENT '文件夹ID-f_key_random',
  `fdr_parenid` int(11) DEFAULT '1' COMMENT '文件夹父级ID，默认1',
  `fdr_level` int(11) DEFAULT NULL COMMENT '层次',
  `fdr_createdate` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`fdr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `folder_display_relation` */

/*Table structure for table `folder_tags` */

DROP TABLE IF EXISTS `folder_tags`;

CREATE TABLE `folder_tags` (
  `ft_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ft_tags` varchar(200) DEFAULT NULL COMMENT 'tags名',
  PRIMARY KEY (`ft_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `folder_tags` */

/*Table structure for table `folder_tags_relation` */

DROP TABLE IF EXISTS `folder_tags_relation`;

CREATE TABLE `folder_tags_relation` (
  `ftr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ftr_f_id` int(11) DEFAULT NULL COMMENT '文件夹ID',
  `ftr_ft_id` int(11) DEFAULT NULL COMMENT '文件夹标签ID',
  `ftr_order` int(11) DEFAULT NULL COMMENT '排序序号',
  `ftr_createdate` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ftr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `folder_tags_relation` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


-- 文件夹与faq父级关系
DROP TABLE IF EXISTS `folder_library_relation`;
CREATE TABLE `folder_library_relation` (
 `flr_id` INT NOT NULL AUTO_INCREMENT COMMENT 'id',
 `flr_fl_id` INT NULL COMMENT 'library-ID',
 `flr_parenid` INT DEFAULT 1 COMMENT '文件夹ID-f_key_random',
 `flr_createdate` DATETIME COMMENT '创建时间',
  PRIMARY KEY (`flr_id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;



-- 2020-1-2
-- 搜索反馈
DROP TABLE IF EXISTS `faqs_select_feedback`;
CREATE TABLE `faqs_select_feedback` (
  `df_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `df_lang_id` INT(11) NOT NULL COMMENT '语言ID',
  `df_ip` VARCHAR(100) DEFAULT NULL COMMENT 'ip',
  `df_createdate` DATETIME DEFAULT NULL COMMENT '创建时间',
  `df_suggest_content` VARCHAR(100) DEFAULT NULL COMMENT '建议内容',
  `df_follow_content` VARCHAR(100) DEFAULT NULL COMMENT '跟进内容',
  `df_follow` INT(11) DEFAULT '1' COMMENT '默认跟进为1',
  `df_name` VARCHAR(100) DEFAULT NULL,
  `df_email` VARCHAR(100) DEFAULT NULL,
  `df_number` VARCHAR(100) DEFAULT NULL,
  `df_status` INT(11) DEFAULT '0',
  PRIMARY KEY (`df_id`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;