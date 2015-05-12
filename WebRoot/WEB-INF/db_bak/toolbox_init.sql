/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : toolbox

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2015-05-12 18:28:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `jc_acquisition`
-- ----------------------------
DROP TABLE IF EXISTS `jc_acquisition`;
CREATE TABLE `jc_acquisition` (
  `acquisition_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `acq_name` varchar(50) NOT NULL COMMENT '采集名称',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '停止时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '当前状态(0:静止;1:采集;2:暂停)',
  `curr_num` int(11) NOT NULL DEFAULT '0' COMMENT '当前号码',
  `curr_item` int(11) NOT NULL DEFAULT '0' COMMENT '当前条数',
  `total_item` int(11) NOT NULL DEFAULT '0' COMMENT '每页总条数',
  `pause_time` int(11) NOT NULL DEFAULT '0' COMMENT '暂停时间(毫秒)',
  `page_encoding` varchar(20) NOT NULL DEFAULT 'GBK' COMMENT '页面编码',
  `plan_list` longtext COMMENT '采集列表',
  `dynamic_addr` varchar(255) DEFAULT NULL COMMENT '动态地址',
  `dynamic_start` int(11) DEFAULT NULL COMMENT '页码开始',
  `dynamic_end` int(11) DEFAULT NULL COMMENT '页码结束',
  `linkset_start` varchar(255) DEFAULT NULL COMMENT '内容链接区开始',
  `linkset_end` varchar(255) DEFAULT NULL COMMENT '内容链接区结束',
  `link_start` varchar(255) DEFAULT NULL COMMENT '内容链接开始',
  `link_end` varchar(255) DEFAULT NULL COMMENT '内容链接结束',
  `title_start` varchar(255) DEFAULT NULL COMMENT '标题开始',
  `title_end` varchar(255) DEFAULT NULL COMMENT '标题结束',
  `keywords_start` varchar(255) DEFAULT NULL COMMENT '关键字开始',
  `keywords_end` varchar(255) DEFAULT NULL COMMENT '关键字结束',
  `description_start` varchar(255) DEFAULT NULL COMMENT '描述开始',
  `description_end` varchar(255) DEFAULT NULL COMMENT '描述结束',
  `content_start` varchar(255) DEFAULT NULL COMMENT '内容开始',
  `content_end` varchar(255) DEFAULT NULL COMMENT '内容结束',
  `pagination_start` varchar(255) DEFAULT NULL COMMENT '内容分页开始',
  `pagination_end` varchar(255) DEFAULT NULL COMMENT '内容分页结束',
  `queue` int(11) NOT NULL DEFAULT '0' COMMENT '队列',
  `repeat_check_type` varchar(20) NOT NULL DEFAULT 'NONE' COMMENT '重复类型',
  `img_acqu` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否采集图片',
  `content_prefix` varchar(255) DEFAULT NULL COMMENT '内容地址补全url',
  `img_prefix` varchar(255) DEFAULT NULL COMMENT '图片地址补全url',
  `view_start` varchar(255) DEFAULT NULL COMMENT '浏览量开始',
  `view_end` varchar(255) DEFAULT NULL COMMENT '浏览量结束',
  `view_id_start` varchar(255) DEFAULT NULL COMMENT 'id前缀',
  `view_id_end` varchar(255) DEFAULT NULL COMMENT 'id后缀',
  `view_link` varchar(255) DEFAULT NULL COMMENT '浏览量动态访问地址',
  `releaseTime_start` varchar(255) DEFAULT NULL COMMENT '发布时间开始',
  `releaseTime_end` varchar(255) DEFAULT NULL COMMENT '发布时间结束',
  `author_start` varchar(255) DEFAULT NULL COMMENT '作者开始',
  `author_end` varchar(255) DEFAULT NULL COMMENT '作者结束',
  `origin_start` varchar(255) DEFAULT NULL COMMENT '来源开始',
  `origin_end` varchar(255) DEFAULT NULL COMMENT '来源结束',
  `releaseTime_format` varchar(255) DEFAULT NULL COMMENT '发布时间格式',
  PRIMARY KEY (`acquisition_id`),
  KEY `fk_jc_acquisition_channel` (`channel_id`),
  KEY `fk_jc_acquisition_contenttype` (`type_id`),
  KEY `fk_jc_acquisition_site` (`site_id`),
  KEY `fk_jc_acquisition_user` (`user_id`),
  CONSTRAINT `fk_jc_acquisition_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`),
  CONSTRAINT `fk_jc_acquisition_contenttype` FOREIGN KEY (`type_id`) REFERENCES `jc_content_type` (`type_id`),
  CONSTRAINT `fk_jc_acquisition_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_acquisition_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS采集表';

-- ----------------------------
-- Records of jc_acquisition
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_acquisition_history`
-- ----------------------------
DROP TABLE IF EXISTS `jc_acquisition_history`;
CREATE TABLE `jc_acquisition_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_url` varchar(255) NOT NULL DEFAULT '' COMMENT '栏目地址',
  `content_url` varchar(255) NOT NULL DEFAULT '' COMMENT '内容地址',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `description` varchar(20) NOT NULL DEFAULT '' COMMENT '描述',
  `acquisition_id` int(11) DEFAULT NULL COMMENT '采集源',
  `content_id` int(11) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`history_id`),
  KEY `fk_acquisition_history_acquisition` (`acquisition_id`),
  CONSTRAINT `fk_jc_history_acquisition` FOREIGN KEY (`acquisition_id`) REFERENCES `jc_acquisition` (`acquisition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采集历史记录表';

-- ----------------------------
-- Records of jc_acquisition_history
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_acquisition_temp`
-- ----------------------------
DROP TABLE IF EXISTS `jc_acquisition_temp`;
CREATE TABLE `jc_acquisition_temp` (
  `temp_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `channel_url` varchar(255) NOT NULL DEFAULT '' COMMENT '栏目地址',
  `content_url` varchar(255) NOT NULL DEFAULT '' COMMENT '内容地址',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `finish_percent` int(3) NOT NULL DEFAULT '0' COMMENT '百分比',
  `description` varchar(20) NOT NULL DEFAULT '' COMMENT '描述',
  `seq` int(3) NOT NULL DEFAULT '0' COMMENT '顺序',
  PRIMARY KEY (`temp_id`),
  KEY `fk_jc_temp_site` (`site_id`),
  CONSTRAINT `fk_jc_temp_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采集进度临时表';

-- ----------------------------
-- Records of jc_acquisition_temp
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_advertising`
-- ----------------------------
DROP TABLE IF EXISTS `jc_advertising`;
CREATE TABLE `jc_advertising` (
  `advertising_id` int(11) NOT NULL AUTO_INCREMENT,
  `adspace_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `ad_name` varchar(100) NOT NULL COMMENT '广告名称',
  `category` varchar(50) NOT NULL COMMENT '广告类型',
  `ad_code` longtext COMMENT '广告代码',
  `ad_weight` int(11) NOT NULL DEFAULT '1' COMMENT '广告权重',
  `display_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '展现次数',
  `click_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '点击次数',
  `start_time` date DEFAULT NULL COMMENT '开始时间',
  `end_time` date DEFAULT NULL COMMENT '结束时间',
  `is_enabled` char(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  PRIMARY KEY (`advertising_id`),
  KEY `fk_jc_advertising_site` (`site_id`),
  KEY `fk_jc_space_advertising` (`adspace_id`),
  CONSTRAINT `fk_jc_advertising_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_space_advertising` FOREIGN KEY (`adspace_id`) REFERENCES `jc_advertising_space` (`adspace_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='CMS广告表';

-- ----------------------------
-- Records of jc_advertising
-- ----------------------------
INSERT INTO `jc_advertising` VALUES ('1', '1', '1', 'banner', 'image', null, '1', '130', '0', null, null, '1');
INSERT INTO `jc_advertising` VALUES ('2', '2', '1', '通栏广告1', 'image', null, '1', '123', '2', null, null, '1');
INSERT INTO `jc_advertising` VALUES ('3', '3', '1', '视频广告上', 'image', null, '1', '0', '0', null, null, '1');
INSERT INTO `jc_advertising` VALUES ('4', '4', '1', '视频广告下', 'image', null, '1', '0', '0', null, null, '1');
INSERT INTO `jc_advertising` VALUES ('5', '5', '1', '留言板本周热点广告', 'image', null, '1', '0', '0', '2014-07-19', '2014-07-01', '1');

-- ----------------------------
-- Table structure for `jc_advertising_attr`
-- ----------------------------
DROP TABLE IF EXISTS `jc_advertising_attr`;
CREATE TABLE `jc_advertising_attr` (
  `advertising_id` int(11) NOT NULL,
  `attr_name` varchar(50) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_params_advertising` (`advertising_id`),
  CONSTRAINT `fk_jc_params_advertising` FOREIGN KEY (`advertising_id`) REFERENCES `jc_advertising` (`advertising_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS广告属性表';

-- ----------------------------
-- Records of jc_advertising_attr
-- ----------------------------
INSERT INTO `jc_advertising_attr` VALUES ('1', 'image_title', '查看toolbox官方网站');
INSERT INTO `jc_advertising_attr` VALUES ('1', 'image_url', '/v6/u/cms/www/201404/30140543hzlx.gif');
INSERT INTO `jc_advertising_attr` VALUES ('1', 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES ('1', 'image_link', 'http://www.toolbox.com');
INSERT INTO `jc_advertising_attr` VALUES ('1', 'image_width', '735');
INSERT INTO `jc_advertising_attr` VALUES ('1', 'image_height', '70');
INSERT INTO `jc_advertising_attr` VALUES ('2', 'image_title', 'toolbox官方网站');
INSERT INTO `jc_advertising_attr` VALUES ('2', 'image_url', '/r/cms/www/red/img/banner1.jpg');
INSERT INTO `jc_advertising_attr` VALUES ('2', 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES ('2', 'image_link', 'http://www.toolbox.com');
INSERT INTO `jc_advertising_attr` VALUES ('2', 'image_width', '960');
INSERT INTO `jc_advertising_attr` VALUES ('2', 'image_height', '60');
INSERT INTO `jc_advertising_attr` VALUES ('3', 'image_height', '89');
INSERT INTO `jc_advertising_attr` VALUES ('3', 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES ('3', 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES ('3', 'image_url', '/u/cms/www/201112/17144805im1p.jpg');
INSERT INTO `jc_advertising_attr` VALUES ('3', 'image_width', '980');
INSERT INTO `jc_advertising_attr` VALUES ('4', 'image_height', '90');
INSERT INTO `jc_advertising_attr` VALUES ('4', 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES ('4', 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES ('4', 'image_url', '/u/cms/www/201112/17145028j3bj.jpg');
INSERT INTO `jc_advertising_attr` VALUES ('4', 'image_width', '980');
INSERT INTO `jc_advertising_attr` VALUES ('5', 'image_height', '109');
INSERT INTO `jc_advertising_attr` VALUES ('5', 'image_link', 'http://3x.toolbox.com');
INSERT INTO `jc_advertising_attr` VALUES ('5', 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES ('5', 'image_url', '/u/cms/www/201112/18155751wi1k.gif');
INSERT INTO `jc_advertising_attr` VALUES ('5', 'image_width', '215');

-- ----------------------------
-- Table structure for `jc_advertising_space`
-- ----------------------------
DROP TABLE IF EXISTS `jc_advertising_space`;
CREATE TABLE `jc_advertising_space` (
  `adspace_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `ad_name` varchar(100) NOT NULL COMMENT '名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `is_enabled` char(1) NOT NULL COMMENT '是否启用',
  PRIMARY KEY (`adspace_id`),
  KEY `fk_jc_adspace_site` (`site_id`),
  CONSTRAINT `fk_jc_adspace_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='CMS广告版位表';

-- ----------------------------
-- Records of jc_advertising_space
-- ----------------------------
INSERT INTO `jc_advertising_space` VALUES ('1', '1', '页头banner', '全站页头banner', '1');
INSERT INTO `jc_advertising_space` VALUES ('2', '1', '通栏广告', '页面中间通栏广告', '1');
INSERT INTO `jc_advertising_space` VALUES ('3', '1', '视频广告上', '', '1');
INSERT INTO `jc_advertising_space` VALUES ('4', '1', '视频广告下', '', '1');
INSERT INTO `jc_advertising_space` VALUES ('5', '1', '留言板本周热点广告', '留言板本周热点广告', '1');
INSERT INTO `jc_advertising_space` VALUES ('6', '1', '顶上撒的', '顶上撒的', '0');

-- ----------------------------
-- Table structure for `jc_channel`
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel`;
CREATE TABLE `jc_channel` (
  `channel_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) NOT NULL COMMENT '模型ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `parent_id` int(11) DEFAULT NULL COMMENT '父栏目ID',
  `channel_path` varchar(30) DEFAULT NULL COMMENT '访问路径',
  `lft` int(11) NOT NULL DEFAULT '1' COMMENT '树左边',
  `rgt` int(11) NOT NULL DEFAULT '2' COMMENT '树右边',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `has_content` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有内容',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  PRIMARY KEY (`channel_id`),
  KEY `fk_jc_channel_model` (`model_id`),
  KEY `fk_jc_channel_parent` (`parent_id`),
  KEY `fk_jc_channel_site` (`site_id`),
  CONSTRAINT `fk_jc_channel_model` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`),
  CONSTRAINT `fk_jc_channel_parent` FOREIGN KEY (`parent_id`) REFERENCES `jc_channel` (`channel_id`),
  CONSTRAINT `fk_jc_channel_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='CMS栏目表';

-- ----------------------------
-- Records of jc_channel
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_channel_attr`
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_attr`;
CREATE TABLE `jc_channel_attr` (
  `channel_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_attr_channel` (`channel_id`),
  CONSTRAINT `fk_jc_attr_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目扩展属性表';

-- ----------------------------
-- Records of jc_channel_attr
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_channel_count`
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_count`;
CREATE TABLE `jc_channel_count` (
  `channel_id` int(11) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '总访问数',
  `views_month` int(11) NOT NULL DEFAULT '0' COMMENT '月访问数',
  `views_week` int(11) NOT NULL DEFAULT '0' COMMENT '周访问数',
  `views_day` int(11) NOT NULL DEFAULT '0' COMMENT '日访问数',
  PRIMARY KEY (`channel_id`),
  CONSTRAINT `fk_jc_count_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目访问量计数表';

-- ----------------------------
-- Records of jc_channel_count
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_channel_ext`
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_ext`;
CREATE TABLE `jc_channel_ext` (
  `channel_id` int(11) NOT NULL,
  `channel_name` varchar(100) NOT NULL COMMENT '名称',
  `final_step` tinyint(4) DEFAULT '2' COMMENT '终审级别',
  `after_check` tinyint(4) DEFAULT NULL COMMENT '审核后(1:不能修改删除;2:修改后退回;3:修改后不变)',
  `is_static_channel` char(1) NOT NULL DEFAULT '0' COMMENT '是否栏目静态化',
  `is_static_content` char(1) NOT NULL DEFAULT '0' COMMENT '是否内容静态化',
  `is_access_by_dir` char(1) NOT NULL DEFAULT '1' COMMENT '是否使用目录访问',
  `is_list_child` char(1) NOT NULL DEFAULT '0' COMMENT '是否使用子栏目列表',
  `page_size` int(11) NOT NULL DEFAULT '20' COMMENT '每页多少条记录',
  `channel_rule` varchar(150) DEFAULT NULL COMMENT '栏目页生成规则',
  `content_rule` varchar(150) DEFAULT NULL COMMENT '内容页生成规则',
  `link` varchar(255) DEFAULT NULL COMMENT '外部链接',
  `tpl_channel` varchar(100) DEFAULT NULL COMMENT '栏目页模板',
  `tpl_content` varchar(100) DEFAULT NULL COMMENT '内容页模板',
  `title_img` varchar(100) DEFAULT NULL COMMENT '缩略图',
  `content_img` varchar(100) DEFAULT NULL COMMENT '内容图',
  `has_title_img` tinyint(1) NOT NULL DEFAULT '0' COMMENT '内容是否有缩略图',
  `has_content_img` tinyint(1) NOT NULL DEFAULT '0' COMMENT '内容是否有内容图',
  `title_img_width` int(11) NOT NULL DEFAULT '139' COMMENT '内容标题图宽度',
  `title_img_height` int(11) NOT NULL DEFAULT '139' COMMENT '内容标题图高度',
  `content_img_width` int(11) NOT NULL DEFAULT '310' COMMENT '内容内容图宽度',
  `content_img_height` int(11) NOT NULL DEFAULT '310' COMMENT '内容内容图高度',
  `comment_control` int(11) NOT NULL DEFAULT '0' COMMENT '评论(0:匿名;1:会员;2:关闭)',
  `allow_updown` tinyint(1) NOT NULL DEFAULT '1' COMMENT '顶踩(true:开放;false:关闭)',
  `is_blank` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否新窗口打开',
  `title` varchar(255) DEFAULT NULL COMMENT 'TITLE',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'KEYWORDS',
  `description` varchar(255) DEFAULT NULL COMMENT 'DESCRIPTION',
  `allow_share` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分享(true:开放;false:关闭)',
  `allow_score` tinyint(1) NOT NULL DEFAULT '0' COMMENT '评分(true:开放;false:关闭)',
  PRIMARY KEY (`channel_id`),
  CONSTRAINT `fk_jc_ext_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目内容表';

-- ----------------------------
-- Records of jc_channel_ext
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_channel_model`
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_model`;
CREATE TABLE `jc_channel_model` (
  `channel_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL COMMENT '模型id',
  `tpl_content` varchar(100) DEFAULT NULL COMMENT '内容模板',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排序',
  PRIMARY KEY (`channel_id`,`priority`),
  KEY `fk_jc_model_channel_m` (`model_id`),
  CONSTRAINT `fk_jc_channel_model_c` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`),
  CONSTRAINT `fk_jc_model_channel_m` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='栏目可选内容模型表';

-- ----------------------------
-- Records of jc_channel_model
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_channel_txt`
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_txt`;
CREATE TABLE `jc_channel_txt` (
  `channel_id` int(11) NOT NULL,
  `txt` longtext COMMENT '栏目内容',
  `txt1` longtext COMMENT '扩展内容1',
  `txt2` longtext COMMENT '扩展内容2',
  `txt3` longtext COMMENT '扩展内容3',
  PRIMARY KEY (`channel_id`),
  CONSTRAINT `fk_jc_txt_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目文本表';

-- ----------------------------
-- Records of jc_channel_txt
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_channel_user`
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_user`;
CREATE TABLE `jc_channel_user` (
  `channel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`user_id`),
  KEY `fk_jc_channel_user` (`user_id`),
  CONSTRAINT `fk_jc_channel_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_user_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目用户关联表';

-- ----------------------------
-- Records of jc_channel_user
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_chnl_group_contri`
-- ----------------------------
DROP TABLE IF EXISTS `jc_chnl_group_contri`;
CREATE TABLE `jc_chnl_group_contri` (
  `channel_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`group_id`),
  KEY `fk_jc_channel_group_c` (`group_id`),
  CONSTRAINT `fk_jc_channel_group_c` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`),
  CONSTRAINT `fk_jc_group_channel_c` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目投稿会员组关联表';

-- ----------------------------
-- Records of jc_chnl_group_contri
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_chnl_group_view`
-- ----------------------------
DROP TABLE IF EXISTS `jc_chnl_group_view`;
CREATE TABLE `jc_chnl_group_view` (
  `channel_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`group_id`),
  KEY `fk_jc_channel_group_v` (`group_id`),
  CONSTRAINT `fk_jc_channel_group_v` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`),
  CONSTRAINT `fk_jc_group_channel_v` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目浏览会员组关联表';

-- ----------------------------
-- Records of jc_chnl_group_view
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_comment`
-- ----------------------------
DROP TABLE IF EXISTS `jc_comment`;
CREATE TABLE `jc_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_user_id` int(11) DEFAULT NULL COMMENT '评论用户ID',
  `reply_user_id` int(11) DEFAULT NULL COMMENT '回复用户ID',
  `content_id` int(11) NOT NULL COMMENT '内容ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  `reply_time` datetime DEFAULT NULL COMMENT '回复时间',
  `ups` smallint(6) NOT NULL DEFAULT '0' COMMENT '支持数',
  `downs` smallint(6) NOT NULL DEFAULT '0' COMMENT '反对数',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `is_checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否审核',
  `score` int(11) DEFAULT NULL COMMENT '评分',
  PRIMARY KEY (`comment_id`),
  KEY `fk_jc_comment_content` (`content_id`),
  KEY `fk_jc_comment_reply` (`reply_user_id`),
  KEY `fk_jc_comment_site` (`site_id`),
  KEY `fk_jc_comment_user` (`comment_user_id`),
  CONSTRAINT `fk_jc_comment_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
  CONSTRAINT `fk_jc_comment_reply` FOREIGN KEY (`reply_user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_comment_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_comment_user` FOREIGN KEY (`comment_user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='CMS评论表';

-- ----------------------------
-- Records of jc_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_comment_ext`
-- ----------------------------
DROP TABLE IF EXISTS `jc_comment_ext`;
CREATE TABLE `jc_comment_ext` (
  `comment_id` int(11) NOT NULL,
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `text` longtext COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  KEY `fk_jc_ext_comment` (`comment_id`),
  CONSTRAINT `fk_jc_ext_comment` FOREIGN KEY (`comment_id`) REFERENCES `jc_comment` (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS评论扩展表';

-- ----------------------------
-- Records of jc_comment_ext
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_config`
-- ----------------------------
DROP TABLE IF EXISTS `jc_config`;
CREATE TABLE `jc_config` (
  `config_id` int(11) NOT NULL,
  `context_path` varchar(20) DEFAULT '/toolbox' COMMENT '部署路径',
  `servlet_point` varchar(20) DEFAULT NULL COMMENT 'Servlet挂载点',
  `port` int(11) DEFAULT NULL COMMENT '端口',
  `db_file_uri` varchar(50) NOT NULL DEFAULT '/dbfile.svl?n=' COMMENT '数据库附件访问地址',
  `is_upload_to_db` tinyint(1) NOT NULL DEFAULT '0' COMMENT '上传附件至数据库',
  `def_img` varchar(255) NOT NULL DEFAULT '/toolbox/r/cms/www/default/no_picture.gif' COMMENT '图片不存在时默认图片',
  `login_url` varchar(255) NOT NULL DEFAULT '/login.jspx' COMMENT '登录地址',
  `process_url` varchar(255) DEFAULT NULL COMMENT '登录后处理地址',
  `mark_on` tinyint(1) NOT NULL DEFAULT '1' COMMENT '开启图片水印',
  `mark_width` int(11) NOT NULL DEFAULT '120' COMMENT '图片最小宽度',
  `mark_height` int(11) NOT NULL DEFAULT '120' COMMENT '图片最小高度',
  `mark_image` varchar(100) DEFAULT '/r/cms/www/watermark.png' COMMENT '图片水印',
  `mark_content` varchar(100) NOT NULL DEFAULT 'www.toolbox.com' COMMENT '文字水印内容',
  `mark_size` int(11) NOT NULL DEFAULT '20' COMMENT '文字水印大小',
  `mark_color` varchar(10) NOT NULL DEFAULT '#FF0000' COMMENT '文字水印颜色',
  `mark_alpha` int(11) NOT NULL DEFAULT '50' COMMENT '水印透明度（0-100）',
  `mark_position` int(11) NOT NULL DEFAULT '1' COMMENT '水印位置(0-5)',
  `mark_offset_x` int(11) NOT NULL DEFAULT '0' COMMENT 'x坐标偏移量',
  `mark_offset_y` int(11) NOT NULL DEFAULT '0' COMMENT 'y坐标偏移量',
  `count_clear_time` date NOT NULL COMMENT '计数器清除时间',
  `count_copy_time` datetime NOT NULL COMMENT '计数器拷贝时间',
  `download_code` varchar(32) NOT NULL DEFAULT 'toolbox' COMMENT '下载防盗链md5混淆码',
  `download_time` int(11) NOT NULL DEFAULT '12' COMMENT '下载有效时间（小时）',
  `email_host` varchar(50) DEFAULT NULL COMMENT '邮件发送服务器',
  `email_encoding` varchar(20) DEFAULT NULL COMMENT '邮件发送编码',
  `email_username` varchar(100) DEFAULT NULL COMMENT '邮箱用户名',
  `email_password` varchar(100) DEFAULT NULL COMMENT '邮箱密码',
  `email_personal` varchar(100) DEFAULT NULL COMMENT '邮箱发件人',
  `email_validate` tinyint(1) DEFAULT '0' COMMENT '开启邮箱验证',
  `view_only_checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '只有终审才能浏览内容页',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS配置表';

-- ----------------------------
-- Records of jc_config
-- ----------------------------
INSERT INTO `jc_config` VALUES ('1', '/toolbox', null, '8080', '/dbfile.svl?n=', '0', '/r/cms/www/no_picture.gif', '/login.jspx', null, '1', '120', '120', '/r/cms/www/watermark.png', 'www.toolbox.com', '40', '#FF0000', '100', '1', '0', '0', '2014-09-02', '2014-09-02 17:17:16', 'toolbox', '12', null, null, null, null, null, '1', '0');

-- ----------------------------
-- Table structure for `jc_config_attr`
-- ----------------------------
DROP TABLE IF EXISTS `jc_config_attr`;
CREATE TABLE `jc_config_attr` (
  `config_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_attr_config` (`config_id`),
  CONSTRAINT `fk_jc_attr_config` FOREIGN KEY (`config_id`) REFERENCES `jc_config` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS配置属性表';

-- ----------------------------
-- Records of jc_config_attr
-- ----------------------------
INSERT INTO `jc_config_attr` VALUES ('1', 'password_min_len', '3');
INSERT INTO `jc_config_attr` VALUES ('1', 'username_reserved', '');
INSERT INTO `jc_config_attr` VALUES ('1', 'register_on', 'true');
INSERT INTO `jc_config_attr` VALUES ('1', 'member_on', 'true');
INSERT INTO `jc_config_attr` VALUES ('1', 'username_min_len', '3');
INSERT INTO `jc_config_attr` VALUES ('1', 'version', 'toolbox-v6');
INSERT INTO `jc_config_attr` VALUES ('1', 'user_img_height', '98');
INSERT INTO `jc_config_attr` VALUES ('1', 'user_img_width', '143');
INSERT INTO `jc_config_attr` VALUES ('1', 'check_on', 'false');
INSERT INTO `jc_config_attr` VALUES ('1', 'new_picture', '/r/cms/www/new.gif');
INSERT INTO `jc_config_attr` VALUES ('1', 'day', '3');
INSERT INTO `jc_config_attr` VALUES ('1', 'preview', 'false');
INSERT INTO `jc_config_attr` VALUES ('1', 'qqEnable', 'true');
INSERT INTO `jc_config_attr` VALUES ('1', 'sinaKey', '2c64512a12f2e7f6a5cfb5f5b5d8b128');
INSERT INTO `jc_config_attr` VALUES ('1', 'sinaEnable', 'true');
INSERT INTO `jc_config_attr` VALUES ('1', 'qqID', '101139646');
INSERT INTO `jc_config_attr` VALUES ('1', 'qqKey', '13f23bebda25f9f26c5c082d017f74ee');
INSERT INTO `jc_config_attr` VALUES ('1', 'sinaID', '2510334929');
INSERT INTO `jc_config_attr` VALUES ('1', 'qqWeboEnable', 'true');
INSERT INTO `jc_config_attr` VALUES ('1', 'qqWeboKey', 'c6b0a6d1ce972f6be1a9113c3afbea2f');
INSERT INTO `jc_config_attr` VALUES ('1', 'qqWeboID', '801526383');
INSERT INTO `jc_config_attr` VALUES ('1', 'weixinEnable', 'false');
INSERT INTO `jc_config_attr` VALUES ('1', 'weixinKey', 'b442bcedc2ab8508caaa63841e33686e');
INSERT INTO `jc_config_attr` VALUES ('1', 'weixinID', 'wxfc9f068ff05339f1');

-- ----------------------------
-- Table structure for `jc_config_item`
-- ----------------------------
DROP TABLE IF EXISTS `jc_config_item`;
CREATE TABLE `jc_config_item` (
  `modelitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_id` int(11) NOT NULL,
  `field` varchar(50) NOT NULL COMMENT '字段',
  `item_label` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '70' COMMENT '排列顺序',
  `def_value` varchar(255) DEFAULT NULL COMMENT '默认值',
  `opt_value` varchar(255) DEFAULT NULL COMMENT '可选项',
  `text_size` varchar(20) DEFAULT NULL COMMENT '长度',
  `area_rows` varchar(3) DEFAULT NULL COMMENT '文本行数',
  `area_cols` varchar(3) DEFAULT NULL COMMENT '文本列数',
  `help` varchar(255) DEFAULT NULL COMMENT '帮助信息',
  `help_position` varchar(1) DEFAULT NULL COMMENT '帮助位置',
  `data_type` int(11) NOT NULL DEFAULT '1' COMMENT '数据类型 "1":"字符串文本","2":"整型文本","3":"浮点型文本","4":"文本区","5":"日期","6":"下拉列表","7":"复选框","8":"单选框"',
  `is_required` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否必填',
  `category` int(11) NOT NULL DEFAULT '1' COMMENT '模型项目所属分类（1注册模型）',
  PRIMARY KEY (`modelitem_id`),
  KEY `fk_jc_item_config` (`config_id`),
  CONSTRAINT `fk_jc_item_config` FOREIGN KEY (`config_id`) REFERENCES `jc_config` (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='CMS配置模型项表';

-- ----------------------------
-- Records of jc_config_item
-- ----------------------------
INSERT INTO `jc_config_item` VALUES ('1', '1', 'realname', '真实姓名', '1', '', '', '', '3', '30', '', '', '1', '0', '1');
INSERT INTO `jc_config_item` VALUES ('2', '1', 'phone', '手机号码', '2', null, null, null, '3', '30', null, null, '1', '0', '1');
INSERT INTO `jc_config_item` VALUES ('3', '1', 'xingqu', '兴趣标签', '3', '', '新闻,娱乐,房产,生活,文化,体育,财经,时尚,汽车,IT', '', '3', '30', '', '', '7', '0', '1');

-- ----------------------------
-- Table structure for `jc_content`
-- ----------------------------
DROP TABLE IF EXISTS `jc_content`;
CREATE TABLE `jc_content` (
  `content_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL COMMENT '栏目ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `type_id` int(11) NOT NULL COMMENT '属性ID',
  `model_id` int(11) NOT NULL COMMENT '模型ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `sort_date` datetime NOT NULL COMMENT '排序日期',
  `top_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '固顶级别',
  `has_title_img` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有标题图',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `status` tinyint(4) NOT NULL DEFAULT '2' COMMENT '状态(0:草稿;1:审核中;2:审核通过;3:回收站；4:投稿)',
  `views_day` int(11) NOT NULL DEFAULT '0' COMMENT '日访问数',
  `comments_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日评论数',
  `downloads_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日下载数',
  `ups_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日顶数',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '得分',
  PRIMARY KEY (`content_id`),
  KEY `fk_jc_content_site` (`site_id`),
  KEY `fk_jc_content_type` (`type_id`),
  KEY `fk_jc_content_user` (`user_id`),
  KEY `fk_jc_contentchannel` (`channel_id`),
  KEY `fk_jc_content_model` (`model_id`),
  CONSTRAINT `fk_jc_content_model` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`),
  CONSTRAINT `fk_jc_content_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_content_type` FOREIGN KEY (`type_id`) REFERENCES `jc_content_type` (`type_id`),
  CONSTRAINT `fk_jc_content_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_contentchannel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=565 DEFAULT CHARSET=utf8 COMMENT='CMS内容表';

-- ----------------------------
-- Records of jc_content
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_contenttag`
-- ----------------------------
DROP TABLE IF EXISTS `jc_contenttag`;
CREATE TABLE `jc_contenttag` (
  `content_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  KEY `fk_jc_content_tag` (`tag_id`),
  KEY `fk_jc_tag_content` (`content_id`),
  CONSTRAINT `fk_jc_content_tag` FOREIGN KEY (`tag_id`) REFERENCES `jc_content_tag` (`tag_id`),
  CONSTRAINT `fk_jc_tag_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容标签关联表';

-- ----------------------------
-- Records of jc_contenttag
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_content_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_attachment`;
CREATE TABLE `jc_content_attachment` (
  `content_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL COMMENT '排列顺序',
  `attachment_path` varchar(255) NOT NULL COMMENT '附件路径',
  `attachment_name` varchar(100) NOT NULL COMMENT '附件名称',
  `filename` varchar(100) DEFAULT NULL COMMENT '文件名',
  `download_count` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  KEY `fk_jc_attachment_content` (`content_id`),
  CONSTRAINT `fk_jc_attachment_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容附件表';

-- ----------------------------
-- Records of jc_content_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_content_attr`
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_attr`;
CREATE TABLE `jc_content_attr` (
  `content_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_attr_content` (`content_id`),
  CONSTRAINT `fk_jc_attr_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容扩展属性表';

-- ----------------------------
-- Records of jc_content_attr
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_content_channel`
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_channel`;
CREATE TABLE `jc_content_channel` (
  `channel_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`content_id`),
  KEY `fk_jc_channel_content` (`content_id`),
  CONSTRAINT `fk_jc_channel_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
  CONSTRAINT `fk_jc_content_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容栏目关联表';

-- ----------------------------
-- Records of jc_content_channel
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_content_check`
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_check`;
CREATE TABLE `jc_content_check` (
  `content_id` int(11) NOT NULL,
  `check_step` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核步数',
  `check_opinion` varchar(255) DEFAULT NULL COMMENT '审核意见',
  `is_rejected` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否退回',
  `reviewer` int(11) DEFAULT NULL COMMENT '终审者',
  `check_date` datetime DEFAULT NULL COMMENT '终审时间',
  PRIMARY KEY (`content_id`),
  KEY `fk_jc_content_check_user` (`reviewer`),
  CONSTRAINT `fk_jc_check_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
  CONSTRAINT `fk_jc_content_check_user` FOREIGN KEY (`reviewer`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容审核信息表';

-- ----------------------------
-- Records of jc_content_check
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_content_count`
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_count`;
CREATE TABLE `jc_content_count` (
  `content_id` int(11) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '总访问数',
  `views_month` int(11) NOT NULL DEFAULT '0' COMMENT '月访问数',
  `views_week` int(11) NOT NULL DEFAULT '0' COMMENT '周访问数',
  `views_day` int(11) NOT NULL DEFAULT '0' COMMENT '日访问数',
  `comments` int(11) NOT NULL DEFAULT '0' COMMENT '总评论数',
  `comments_month` int(11) NOT NULL DEFAULT '0' COMMENT '月评论数',
  `comments_week` smallint(6) NOT NULL DEFAULT '0' COMMENT '周评论数',
  `comments_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日评论数',
  `downloads` int(11) NOT NULL DEFAULT '0' COMMENT '总下载数',
  `downloads_month` int(11) NOT NULL DEFAULT '0' COMMENT '月下载数',
  `downloads_week` smallint(6) NOT NULL DEFAULT '0' COMMENT '周下载数',
  `downloads_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日下载数',
  `ups` int(11) NOT NULL DEFAULT '0' COMMENT '总顶数',
  `ups_month` int(11) NOT NULL DEFAULT '0' COMMENT '月顶数',
  `ups_week` smallint(6) NOT NULL DEFAULT '0' COMMENT '周顶数',
  `ups_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日顶数',
  `downs` int(11) NOT NULL DEFAULT '0' COMMENT '总踩数',
  PRIMARY KEY (`content_id`),
  CONSTRAINT `fk_jc_count_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容计数表';

-- ----------------------------
-- Records of jc_content_count
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_content_ext`
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_ext`;
CREATE TABLE `jc_content_ext` (
  `content_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL COMMENT '标题',
  `short_title` varchar(150) DEFAULT NULL COMMENT '简短标题',
  `author` varchar(100) DEFAULT NULL COMMENT '作者',
  `origin` varchar(100) DEFAULT NULL COMMENT '来源',
  `origin_url` varchar(255) DEFAULT NULL COMMENT '来源链接',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `release_date` datetime NOT NULL COMMENT '发布日期',
  `media_path` varchar(255) DEFAULT NULL COMMENT '媒体路径',
  `media_type` varchar(20) DEFAULT NULL COMMENT '媒体类型',
  `title_color` varchar(10) DEFAULT NULL COMMENT '标题颜色',
  `is_bold` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否加粗',
  `title_img` varchar(100) DEFAULT NULL COMMENT '标题图片',
  `content_img` varchar(100) DEFAULT NULL COMMENT '内容图片',
  `type_img` varchar(100) DEFAULT NULL COMMENT '类型图片',
  `link` varchar(255) DEFAULT NULL COMMENT '外部链接',
  `tpl_content` varchar(100) DEFAULT NULL COMMENT '指定模板',
  `need_regenerate` tinyint(1) NOT NULL DEFAULT '1' COMMENT '需要重新生成静态页',
  PRIMARY KEY (`content_id`),
  CONSTRAINT `fk_jc_ext_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容扩展表';

-- ----------------------------
-- Records of jc_content_ext
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_content_group_view`
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_group_view`;
CREATE TABLE `jc_content_group_view` (
  `content_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`content_id`,`group_id`),
  KEY `fk_jc_content_group_v` (`group_id`),
  CONSTRAINT `fk_jc_content_group_v` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`),
  CONSTRAINT `fk_jc_group_content_v` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容浏览会员组关联表';

-- ----------------------------
-- Records of jc_content_group_view
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_content_picture`
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_picture`;
CREATE TABLE `jc_content_picture` (
  `content_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL COMMENT '排列顺序',
  `img_path` varchar(100) NOT NULL COMMENT '图片地址',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`content_id`,`priority`),
  CONSTRAINT `fk_jc_picture_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容图片表';

-- ----------------------------
-- Records of jc_content_picture
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_content_tag`
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_tag`;
CREATE TABLE `jc_content_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(50) NOT NULL COMMENT 'tag名称',
  `ref_counter` int(11) NOT NULL DEFAULT '1' COMMENT '被引用的次数',
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `ak_tag_name` (`tag_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容TAG表';

-- ----------------------------
-- Records of jc_content_tag
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_content_topic`
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_topic`;
CREATE TABLE `jc_content_topic` (
  `content_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  PRIMARY KEY (`content_id`,`topic_id`),
  KEY `fk_jc_content_topic` (`topic_id`),
  CONSTRAINT `fk_jc_content_topic` FOREIGN KEY (`topic_id`) REFERENCES `jc_topic` (`topic_id`),
  CONSTRAINT `fk_jc_topic_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS专题内容关联表';

-- ----------------------------
-- Records of jc_content_topic
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_content_txt`
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_txt`;
CREATE TABLE `jc_content_txt` (
  `content_id` int(11) NOT NULL,
  `txt` longtext COMMENT '文章内容',
  `txt1` longtext COMMENT '扩展内容1',
  `txt2` longtext COMMENT '扩展内容2',
  `txt3` longtext COMMENT '扩展内容3',
  PRIMARY KEY (`content_id`),
  CONSTRAINT `fk_jc_txt_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容文本表';

-- ----------------------------
-- Records of jc_content_txt
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_type`;
CREATE TABLE `jc_content_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(20) NOT NULL COMMENT '名称',
  `img_width` int(11) DEFAULT NULL COMMENT '图片宽',
  `img_height` int(11) DEFAULT NULL COMMENT '图片高',
  `has_image` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有图片',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容类型表';

-- ----------------------------
-- Records of jc_content_type
-- ----------------------------
INSERT INTO `jc_content_type` VALUES ('1', '普通', '100', '100', '0', '0');
INSERT INTO `jc_content_type` VALUES ('2', '图文', '143', '98', '1', '0');
INSERT INTO `jc_content_type` VALUES ('3', '焦点', '280', '200', '1', '0');
INSERT INTO `jc_content_type` VALUES ('4', '头条', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `jc_dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `jc_dictionary`;
CREATE TABLE `jc_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'name',
  `value` varchar(255) NOT NULL COMMENT 'value',
  `type` varchar(255) NOT NULL COMMENT 'type',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of jc_dictionary
-- ----------------------------
INSERT INTO `jc_dictionary` VALUES ('1', '10-20人', '10-20人', 'scale');
INSERT INTO `jc_dictionary` VALUES ('2', '20-50人', '20-50人', 'scale');
INSERT INTO `jc_dictionary` VALUES ('3', '50-10人', '50-10人', 'scale');
INSERT INTO `jc_dictionary` VALUES ('4', '100人以上', '100人以上', 'scale');
INSERT INTO `jc_dictionary` VALUES ('5', '私企', '私企', 'nature');
INSERT INTO `jc_dictionary` VALUES ('6', '股份制', '股份制', 'nature');
INSERT INTO `jc_dictionary` VALUES ('7', '国企', '国企', 'nature');
INSERT INTO `jc_dictionary` VALUES ('8', '互联网', '互联网', 'industry');
INSERT INTO `jc_dictionary` VALUES ('9', '房地产', '房地产', 'industry');
INSERT INTO `jc_dictionary` VALUES ('10', '加工制造', '加工制造', 'industry');
INSERT INTO `jc_dictionary` VALUES ('11', '服务行业', '服务行业', 'industry');

-- ----------------------------
-- Table structure for `jc_directive_tpl`
-- ----------------------------
DROP TABLE IF EXISTS `jc_directive_tpl`;
CREATE TABLE `jc_directive_tpl` (
  `tpl_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '标签名称',
  `description` varchar(1000) DEFAULT NULL COMMENT '标签描述',
  `code` text COMMENT '标签代码',
  `user_id` int(11) NOT NULL COMMENT '标签创建者',
  PRIMARY KEY (`tpl_id`),
  KEY `fk_jc_directive_tpl_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='FComment';

-- ----------------------------
-- Records of jc_directive_tpl
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_file`
-- ----------------------------
DROP TABLE IF EXISTS `jc_file`;
CREATE TABLE `jc_file` (
  `file_path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `file_name` varchar(255) DEFAULT '' COMMENT '文件名字',
  `file_isvalid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有效',
  `content_id` int(11) DEFAULT NULL COMMENT '内容id',
  PRIMARY KEY (`file_path`),
  KEY `fk_jc_file_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jc_file
-- ----------------------------
INSERT INTO `jc_file` VALUES ('/u/cms/www/09093304hc6x.jpg', '09093304hc6x.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09093632txyy.jpg', '09093632txyy.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/090938248x1c.jpg', '090938248x1c.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/090940173zaj.jpg', '090940173zaj.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09094140f562.jpg', '09094140f562.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09094302sldg.jpg', '09094302sldg.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09094430w0xt.jpg', '09094430w0xt.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09151507n6i1.jpg', '09151507n6i1.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09152518pzoq.jpg', '09152518pzoq.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09152931cgps.jpg', '09152931cgps.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/091552426die.jpg', '091552426die.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/0915541140xt.jpg', '0915541140xt.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09160120meel.jpg', '09160120meel.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/091602465aop.jpg', '091602465aop.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09165026tk5e.jpg', '09165026tk5e.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/091655240woj.jpg', '091655240woj.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09165821s06r.jpg', '09165821s06r.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09170006n0hs.jpg', '09170006n0hs.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09174523xkvt.jpg', '09174523xkvt.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09174527lkok.jpg', '09174527lkok.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10092229195q.jpg', '10092229195q.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/100950366ij3.jpg', '100950366ij3.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/100953460bvo.jpg', '100953460bvo.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10103806oifr.jpg', '10103806oifr.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10104531ukj5.jpg', '10104531ukj5.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10144918u244.jpg', '10144918u244.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11165619lkm8.jpg', '11165619lkm8.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11165624319n.jpg', '11165624319n.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111656292jx9.jpg', '111656292jx9.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11165633po01.jpg', '11165633po01.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111656366w4b.jpg', '111656366w4b.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11165640djk4.jpg', '11165640djk4.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11165849ahx1.jpg', '11165849ahx1.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11170224nw94.jpg', '11170224nw94.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11170651qc2f.jpg', '11170651qc2f.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11170656zz9b.jpg', '11170656zz9b.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111707001w2k.jpg', '111707001w2k.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11170703j2h2.jpg', '11170703j2h2.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111707071tn0.jpg', '111707071tn0.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11170712hp37.jpg', '11170712hp37.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111707541g63.jpg', '111707541g63.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171054ja61.jpg', '11171054ja61.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171058td8f.jpg', '11171058td8f.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171102ae78.jpg', '11171102ae78.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171106qaui.jpg', '11171106qaui.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171109m2sr.jpg', '11171109m2sr.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171211kmih.jpg', '11171211kmih.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171546aux9.jpg', '11171546aux9.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111715499z6t.jpg', '111715499z6t.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171553t5kf.jpg', '11171553t5kf.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171558kiit.jpg', '11171558kiit.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171603em6o.jpg', '11171603em6o.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171606wnmy.jpg', '11171606wnmy.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1117164754x7.jpg', '1117164754x7.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11172127ltqx.jpg', '11172127ltqx.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111721308eyj.jpg', '111721308eyj.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11172134wikw.jpg', '11172134wikw.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11172137nwy5.jpg', '11172137nwy5.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11172219hw2t.jpg', '11172219hw2t.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173208w8ji.jpg', '11173208w8ji.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173213qlec.jpg', '11173213qlec.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111732181p5u.jpg', '111732181p5u.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173222qknp.jpg', '11173222qknp.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1117323496nx.jpg', '1117323496nx.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173244ggfv.jpg', '11173244ggfv.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173334yvdd.jpg', '11173334yvdd.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111737053v9i.jpg', '111737053v9i.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173708ffx2.jpg', '11173708ffx2.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173711toqx.jpg', '11173711toqx.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173718do4k.jpg', '11173718do4k.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173719ykxk.jpg', '11173719ykxk.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173724ul7o.jpg', '11173724ul7o.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173804j6hj.jpg', '11173804j6hj.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11174436pnoi.jpg', '11174436pnoi.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11174439eb3l.jpg', '11174439eb3l.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1117444317kg.jpg', '1117444317kg.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111744466aux.jpg', '111744466aux.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111745157ps9.jpg', '111745157ps9.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12105715powr.jpg', '12105715powr.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12105715u0i2.jpg', '12105715u0i2.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12105716avso.jpg', '12105716avso.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12105716f0ks.jpg', '12105716f0ks.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12105716u081.jpg', '12105716u081.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12105717rgdv.jpg', '12105717rgdv.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12105908yuqz.jpg', '12105908yuqz.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121101457hlo.jpg', '121101457hlo.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121101459s0t.jpg', '121101459s0t.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110145r34m.jpg', '12110145r34m.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110146fexh.jpg', '12110146fexh.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110146v1cq.jpg', '12110146v1cq.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110146ynj3.jpg', '12110146ynj3.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110240hrzh.jpg', '12110240hrzh.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121104013vts.jpg', '121104013vts.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110726kcxc.jpg', '12110726kcxc.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110726rqp4.jpg', '12110726rqp4.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121107270owq.jpg', '121107270owq.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1211072762wj.jpg', '1211072762wj.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110728cz8z.jpg', '12110728cz8z.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110728hvna.jpg', '12110728hvna.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110817ejy1.jpg', '12110817ejy1.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111106jy1l.jpg', '12111106jy1l.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111106lobh.jpg', '12111106lobh.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111106zad3.jpg', '12111106zad3.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111106zedy.jpg', '12111106zedy.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111107ctqg.jpg', '12111107ctqg.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111107l4wg.jpg', '12111107l4wg.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1211124392sy.jpg', '1211124392sy.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111518igwr.jpg', '12111518igwr.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111518kvd2.jpg', '12111518kvd2.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111518l3p5.jpg', '12111518l3p5.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111518vk7v.jpg', '12111518vk7v.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121115195muw.jpg', '121115195muw.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111519tyc2.jpg', '12111519tyc2.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1211190051if.jpg', '1211190051if.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12112124imh5.jpg', '12112124imh5.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121121253f1z.jpg', '121121253f1z.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121121265tk1.jpg', '121121265tk1.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121121267h0z.jpg', '121121267h0z.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12112127795n.jpg', '12112127795n.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12112128ltfy.jpg', '12112128ltfy.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12112247lfhe.jpg', '12112247lfhe.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12120435rmvm.jpg', '12120435rmvm.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12120436on4w.jpg', '12120436on4w.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121204384v5d.jpg', '121204384v5d.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121204408a3o.jpg', '121204408a3o.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1212044200gm.jpg', '1212044200gm.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121207389dlf.jpg', '121207389dlf.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134158q84h.jpg', '12134158q84h.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134158qzrx.jpg', '12134158qzrx.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121341597c2x.jpg', '121341597c2x.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134159kbxa.jpg', '12134159kbxa.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134159robe.jpg', '12134159robe.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134200cwyl.jpg', '12134200cwyl.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134300ap1h.jpg', '12134300ap1h.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134450lo6n.jpg', '12134450lo6n.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134450mwvm.jpg', '12134450mwvm.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134451j9p9.jpg', '12134451j9p9.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134451k1zj.jpg', '12134451k1zj.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134452b2g1.jpg', '12134452b2g1.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134452bb5z.jpg', '12134452bb5z.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134552bk69.jpg', '12134552bk69.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121348103ux5.jpg', '121348103ux5.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121348109k92.jpg', '121348109k92.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121348110tfi.jpg', '121348110tfi.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134811y9du.jpg', '12134811y9du.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134812unit.jpg', '12134812unit.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134933sxsx.jpg', '12134933sxsx.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135148im9s.jpg', '12135148im9s.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135149ar88.jpg', '12135149ar88.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135149bhlg.jpg', '12135149bhlg.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135149s2wm.jpg', '12135149s2wm.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135243x57l.jpg', '12135243x57l.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135606e58j.jpg', '12135606e58j.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135607ftvv.jpg', '12135607ftvv.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135607vqhp.jpg', '12135607vqhp.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135608ad8p.jpg', '12135608ad8p.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135608l3ai.jpg', '12135608l3ai.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135609wexl.jpg', '12135609wexl.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135827xy0y.jpg', '12135827xy0y.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135944xk9f.jpg', '12135944xk9f.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12140033b5mx.jpg', '12140033b5mx.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12140434ixtu.jpg', '12140434ixtu.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12140434n4th.jpg', '12140434n4th.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12140435relm.jpg', '12140435relm.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12140436rua8.jpg', '12140436rua8.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12140436wwsc.jpg', '12140436wwsc.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12140851yp14.jpg', '12140851yp14.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12141311nuua.jpg', '12141311nuua.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12141311xxbj.jpg', '12141311xxbj.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12141312d3p6.jpg', '12141312d3p6.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12141312r6eb.jpg', '12141312r6eb.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1214131399h0.jpg', '1214131399h0.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12141313ndlq.jpg', '12141313ndlq.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121414505xah.jpg', '121414505xah.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142118fe7p.jpg', '12142118fe7p.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121421197sla.jpg', '121421197sla.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142119m8y5.jpg', '12142119m8y5.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142120loqu.jpg', '12142120loqu.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142120u2tx.jpg', '12142120u2tx.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1214212172bk.jpg', '1214212172bk.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142322wa0z.jpg', '12142322wa0z.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142734jwmh.jpg', '12142734jwmh.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142735jqmu.jpg', '12142735jqmu.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142735rhib.jpg', '12142735rhib.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1214273617d5.jpg', '1214273617d5.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142736ue6c.jpg', '12142736ue6c.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142737cr9y.jpg', '12142737cr9y.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142830poeb.jpg', '12142830poeb.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1214325480ue.jpg', '1214325480ue.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12143254y1wh.jpg', '12143254y1wh.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121432556ttu.jpg', '121432556ttu.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12143255ryzh.jpg', '12143255ryzh.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12143255ukxu.jpg', '12143255ukxu.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12143256g1bo.jpg', '12143256g1bo.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12143342sfmg.jpg', '12143342sfmg.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121454345gdz.jpg', '121454345gdz.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12145434959z.jpg', '12145434959z.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12145434qkiz.jpg', '12145434qkiz.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12145435lmi6.jpg', '12145435lmi6.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12145435u9c1.jpg', '12145435u9c1.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121456599tnd.jpg', '121456599tnd.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12150556da16.jpg', '12150556da16.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12150556inf7.jpg', '12150556inf7.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12150557dzrz.jpg', '12150557dzrz.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12150557etcp.jpg', '12150557etcp.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12150701tmkd.jpg', '12150701tmkd.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12150936264i.jpg', '12150936264i.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121509368460.jpg', '121509368460.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12150936cnpa.jpg', '12150936cnpa.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121509371kyv.jpg', '121509371kyv.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12150937xe3g.jpg', '12150937xe3g.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12151139jrv6.jpg', '12151139jrv6.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1215211539ic.jpg', '1215211539ic.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12152115dymp.jpg', '12152115dymp.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12152115n7ee.jpg', '12152115n7ee.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12152115oqbj.jpg', '12152115oqbj.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12152116am9n.jpg', '12152116am9n.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12152257va9g.jpg', '12152257va9g.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12153550461x.jpg', '12153550461x.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12153550ryso.jpg', '12153550ryso.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12153551fflz.jpg', '12153551fflz.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12153551igy5.jpg', '12153551igy5.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12153551r5kz.jpg', '12153551r5kz.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121535526foq.jpg', '121535526foq.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121536505s2h.jpg', '121536505s2h.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121542148jkc.jpg', '121542148jkc.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121542158t1n.jpg', '121542158t1n.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121542159xil.jpg', '121542159xil.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12154215ryyk.jpg', '12154215ryyk.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12154215y02n.jpg', '12154215y02n.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12154216egtt.jpg', '12154216egtt.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121543059cct.jpg', '121543059cct.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12154708kkn6.jpg', '12154708kkn6.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12154708nsye.jpg', '12154708nsye.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12154708we6w.jpg', '12154708we6w.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12154709iod3.jpg', '12154709iod3.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12154709ypkl.jpg', '12154709ypkl.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121547582f5t.jpg', '121547582f5t.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1311420498g8.jpg', '1311420498g8.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/131203117zrn.jpg', '131203117zrn.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/131257327chh.jpg', '131257327chh.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13141220dfer.jpg', '13141220dfer.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/131423399l1z.jpg', '131423399l1z.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13142927kzr3.jpg', '13142927kzr3.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1316285322ks.jpg', '1316285322ks.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13162904gqxm.jpg', '13162904gqxm.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13162913da42.jpg', '13162913da42.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/131629222u39.jpg', '131629222u39.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13162931ofsn.jpg', '13162931ofsn.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13162941ipg2.jpg', '13162941ipg2.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13163101ccd3.jpg', '13163101ccd3.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13163113pd3s.jpg', '13163113pd3s.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13163306pqvc.jpg', '13163306pqvc.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13165112t47d.jpg', '13165112t47d.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13165118lr7r.jpg', '13165118lr7r.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13165348xokj.jpg', '13165348xokj.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/131656557m43.jpg', '131656557m43.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13165702cchp.jpg', '13165702cchp.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13170123ywvv.jpg', '13170123ywvv.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13170129mx9q.jpg', '13170129mx9q.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13170427k084.jpg', '13170427k084.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/131706089h4w.jpg', '131706089h4w.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13170759d8ow.jpg', '13170759d8ow.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13170940lu1h.jpg', '13170940lu1h.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19110822fin2.jpg', '19110822fin2.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19112623820c.jpg', '19112623820c.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19112700bypf.jpg', '19112700bypf.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19114043tp85.jpg', '19114043tp85.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19114201tdir.jpg', '19114201tdir.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191201449moh.jpg', '191201449moh.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191203538tdp.jpg', '191203538tdp.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19131809acqm.jpg', '19131809acqm.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19131949r2ge.jpg', '19131949r2ge.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191342393mlg.jpg', '191342393mlg.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19134448qvza.jpg', '19134448qvza.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191351590e53.jpg', '191351590e53.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19135642zjak.jpg', '19135642zjak.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19135645ge7r.jpg', '19135645ge7r.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19135821ij0m.jpg', '19135821ij0m.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19140340fri2.jpg', '19140340fri2.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19140601kgid.jpg', '19140601kgid.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19140803w9fg.jpg', '19140803w9fg.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191408471iyj.jpg', '191408471iyj.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19141200ip5c.jpg', '19141200ip5c.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19141318apz1.jpg', '19141318apz1.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19141700opui.jpg', '19141700opui.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19141756u9sa.jpg', '19141756u9sa.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19142041eu8x.jpg', '19142041eu8x.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19142206y73m.jpg', '19142206y73m.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19142430589t.jpg', '19142430589t.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19142451945q.jpg', '19142451945q.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19142818yvty.jpg', '19142818yvty.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19142840ycm6.jpg', '19142840ycm6.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201139137vu6.jpg', '201139137vu6.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/20114003od1n.jpg', '20114003od1n.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201140399nrc.jpg', '201140399nrc.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201143116bd3.jpg', '201143116bd3.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/20114348t1z8.jpg', '20114348t1z8.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/20114520rqti.jpg', '20114520rqti.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/20114607jim6.jpg', '20114607jim6.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/20114824s9bf.jpg', '20114824s9bf.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/20115532h8tv.jpg', '20115532h8tv.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201159459afm.jpg', '201159459afm.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/20120531bbei.jpg', '20120531bbei.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/20120732ybv8.jpg', '20120732ybv8.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201308', '201308', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201309', '201309', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201312/301119254w80.flv', '/u/cms/www/201312/301119254w80.flv', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22093458gynd.jpg', '22093458gynd.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22093502mmft.jpg', '22093502mmft.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22093506l8pv.jpg', '22093506l8pv.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22093509qm3l.jpg', '22093509qm3l.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22093513srmf.jpg', '22093513srmf.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22094752xoxd.jpg', '22094752xoxd.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22094906lrj8.jpg', '22094906lrj8.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22094911xe9x.jpg', '22094911xe9x.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22094915t8h1.jpg', '22094915t8h1.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22094918gnze.jpg', '22094918gnze.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22100555lytj.jpg', '22100555lytj.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22100558gfsb.jpg', '22100558gfsb.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22100601l1us.jpg', '22100601l1us.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22100606t8mw.jpg', '22100606t8mw.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22100611o2gl.jpg', '22100611o2gl.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172935t4sb.jpg', '23172935t4sb.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172936acob.jpg', '23172936acob.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172937bli1.jpg', '23172937bli1.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172937r23n.jpg', '23172937r23n.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172939ln5a.jpg', '23172939ln5a.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/231729407e1v.jpg', '231729407e1v.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/231729434x7h.jpg', '231729434x7h.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172944o38x.jpg', '23172944o38x.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172944vvdh.jpg', '23172944vvdh.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172946mzqx.jpg', '23172946mzqx.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172947nrrl.jpg', '23172947nrrl.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/24102446b7al.jpg', '24102446b7al.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/24102503z9wj.jpg', '24102503z9wj.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/2416455972ro.jpg', '2416455972ro.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/241646340nq6.jpg', '241646340nq6.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/24164707ksjq.jpg', '24164707ksjq.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/26115537aper.jpg', '26115537aper.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/26115537rs0f.jpg', '26115537rs0f.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/26150136kryi.txt', '26150136kryi.txt', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/Thumbs.db', 'Thumbs.db', '1', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/13135536pnt2.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/131359296e9c.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/1314055350gc.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/13140606bjte.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/13140635xydz.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/13140702pfne.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/13140909s64p.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/13141723ywh0.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/13142644qpdm.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/131429269ikl.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/131431450xia.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/131431578u9o.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/1316123792p0.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13163251c8d5.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/131634322gqg.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/131636277cxi.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13163934xmp0.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13164248ng73.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13165347xxty.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13170503bwpw.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13170603q1bw.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/131706463pqt.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13172446osvy.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13172626x71c.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13173752etj3.zip', 'ChromeSetup.zip', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13173805fii8.zip', 'ChromeSetup.zip', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14091703u57k.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14091741h0w0.zip', 'ChromeSetup.zip', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14092030cnyx.mp4', '18183451i5bi.mp4', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14092835ljai.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14095531y5tg.zip', 'ChromeSetup.zip', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14095543za61.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14095551kk1a.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14095759mdqw.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14102936l7gw.txt', 'freemarker.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14104521p9ey.zip', 'bbs-update-2012-11-2.zip', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14105137jxtn.mp4', '/v6/u/cms/www/201403/14105137jxtn.mp4', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14112725dsar.zip', '/v6/u/cms/www/201403/14112725dsar.zip', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14130702z3xz.png', '/v6/u/cms/www/201403/14130702z3xz.png', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14165746s64i.pdf', '1.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/1914315903bj.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/20151821gj8y.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/2015202141s0.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/211128348kuw.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/2111305770l1.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/21113452hsxh.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/211137096eif.jpg', 'mv.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/211149148tx0.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/21115759y8sm.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/211511276v74.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/21151948k1fh.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/21154820xtfs.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/2115485050rw.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/21155236mk9b.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22084701xqxy.doc', '/v6/u/cms/www/201404/22084701xqxy.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22084833ys27.doc', '/v6/u/cms/www/201404/22084833ys27.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22111217hftv.doc', 'Linux开启mysql远程连接.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22111332dwt3.doc', 'Linux开启mysql远程连接.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22114143pw1a.doc', 'Linux开启mysql远程连接.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22132355vqdf.txt', 'IBM LDAP.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22133304pnoh.txt', '/v6/u/cms/www/201404/22133304pnoh.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22133312pz3j.exe', 'wpp.exe', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22135235m1m1.txt', 'cmstop.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22135348pbqp.swf', '2.swf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/221353537d0o.doc', 'discuz_2.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22140446zkgv.txt', 'toolbox新bug.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22140629jx27.txt', '360检测.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22140634er4n.doc', 'Discuz_X2.0数据字典(数据库表作用解释).doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22140716e5bk.flv', '/v6/u/cms/www/201404/22140716e5bk.flv', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22141101f9tv.txt', '360检测.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22141404irh6.docx', 'Apache_Shiro_使用手册.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22142207xrqx.doc', 'Discuz_X2.0数据字典(数据库表作用解释).doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22145137jigp.docx', 'Apache_Shiro_使用手册.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22145142drkb.docx', 'Apache_Shiro_使用手册.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/221501301rkt.docx', 'Apache_Shiro_使用手册.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22151702mcwi.docx', 'Apache_Shiro_使用手册.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22152145c9do.doc', 'Linux开启mysql远程连接.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22152231wfrv.mp4', '/v6/u/cms/www/201404/22152231wfrv.mp4', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22155743mgws.txt', 'bug平台推荐.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22155756p9of.txt', 'flot柱状图.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22155756scdn.txt', 'flot使用笔记.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/28134316erf3.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/281402505i20.jpg', 'mv.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/28140346452f.jpg', 'mv.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/30140543hzlx.gif', 'webLogo.gif', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/08091845sh2l.jpg', '1.JPG', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/08092143cyap.jpg', '1.JPG', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/08092249ype2.jpg', '1.JPG', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/08092924h3fr.jpg', '1.JPG', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/08093111b3jm.jpg', '1.JPG', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/09083819wiab.jpg', 'mv.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/090840146ik7.jpg', 'mv.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/090918028k13.jpg', 'mv.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201406/09144419786f.txt', 'bbs好的功能.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201406/09145849ap2u.docx', '1.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201406/09151219pj5s.doc', '2.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201406/0915215434ij.txt', 'cmstop.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/121650299xv9.doc', 'DiscuzX2文件说明,目录说明.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/12165642273e.doc', 'Discuz_X2.0数据字典(数据库表作用解释).doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/12170522j2ct.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/30093714q9ic.mp4', '/v6/u/cms/www/201407/30093714q9ic.mp4', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/30130947bmm3.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/30170627hj1m.jpg', 'mv.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/31114444inln.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/31114945lp9t.jpg', 'mv.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/31115246futn.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/31115423u7e6.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/31132254zdh7.jpg', 'mv.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201312/241031214kys.txt', '/v6/wenku/www/201312/241031214kys.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201401/16164720tu2n.doc', '/v6/wenku/www/201401/16164720tu2n.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201401/17083718btie.doc', '/v6/wenku/www/201401/17083718btie.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201401/17084032522j.doc', '/v6/wenku/www/201401/17084032522j.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201401/170842070sy2.doc', '/v6/wenku/www/201401/170842070sy2.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201401/17084442fd08.doc', '/v6/wenku/www/201401/17084442fd08.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201401/17085101zvcg.doc', '/v6/wenku/www/201401/17085101zvcg.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201401/25095002cniq.doc', '/v6/wenku/www/201401/25095002cniq.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201403/10115402nl6c.docx', '/v6/wenku/www/201403/10115402nl6c.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201403/1011550974pv.docx', '/v6/wenku/www/201403/1011550974pv.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201403/101155409soa.txt', '/v6/wenku/www/201403/101155409soa.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201403/10115750uxwh.txt', '/v6/wenku/www/201403/10115750uxwh.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/04132656esvy.pdf', '/v6/wenku/www/201406/04132656esvy.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/04133131ky4f.pdf', '/v6/wenku/www/201406/04133131ky4f.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/04133159jryy.pdf', '/v6/wenku/www/201406/04133159jryy.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/04133312rszg.pdf', '/v6/wenku/www/201406/04133312rszg.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/04133437555h.pdf', '/v6/wenku/www/201406/04133437555h.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/04133611h3sa.pdf', '/v6/wenku/www/201406/04133611h3sa.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/041340029cmx.pdf', '/v6/wenku/www/201406/041340029cmx.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/0413413473t5.pdf', '/v6/wenku/www/201406/0413413473t5.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/041353368k3b.doc', '/v6/wenku/www/201406/041353368k3b.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/04135541s2ay.doc', '/v6/wenku/www/201406/04135541s2ay.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201408/08112543cj83.pdf', '/v6/wenku/www/201408/08112543cj83.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201408/08131514njo0.pdf', '/v6/wenku/www/201408/08131514njo0.pdf', '0', null);

-- ----------------------------
-- Table structure for `jc_friendlink`
-- ----------------------------
DROP TABLE IF EXISTS `jc_friendlink`;
CREATE TABLE `jc_friendlink` (
  `friendlink_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `friendlinkctg_id` int(11) NOT NULL,
  `site_name` varchar(150) NOT NULL COMMENT '网站名称',
  `domain` varchar(255) NOT NULL COMMENT '网站地址',
  `logo` varchar(150) DEFAULT NULL COMMENT '图标',
  `email` varchar(100) DEFAULT NULL COMMENT '站长邮箱',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '点击次数',
  `is_enabled` char(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  PRIMARY KEY (`friendlink_id`),
  KEY `fk_jc_ctg_friendlink` (`friendlinkctg_id`),
  KEY `fk_jc_friendlink_site` (`site_id`),
  CONSTRAINT `fk_jc_ctg_friendlink` FOREIGN KEY (`friendlinkctg_id`) REFERENCES `jc_friendlink_ctg` (`friendlinkctg_id`),
  CONSTRAINT `fk_jc_friendlink_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='CMS友情链接';

-- ----------------------------
-- Records of jc_friendlink
-- ----------------------------
INSERT INTO `jc_friendlink` VALUES ('1', '1', '1', 'toolbox官网', 'http://www.toolbox.com', null, 'toolbox@163.com', 'toolbox是JavaEE版网站管理系统（Java Enterprise Edition Content Manage System）的简称。Java凭借其强大、稳定、安全、高效等多方面的优势，一直是企业级应用的首选。', '34', '1', '1');
INSERT INTO `jc_friendlink` VALUES ('2', '1', '1', 'toolbox论坛', 'http://bbs.toolbox.com', null, 'toolbox@163.com', 'toolbox论坛', '3', '1', '10');
INSERT INTO `jc_friendlink` VALUES ('3', '1', '2', '京东商城', 'http://www.360buy.com/', '/u/cms/www/201112/1910271036lr.gif', '', '', '3', '1', '10');
INSERT INTO `jc_friendlink` VALUES ('4', '1', '2', '当当网', 'http://www.dangdang.com/', '/u/cms/www/201112/191408344rwj.gif', '', '', '1', '1', '10');
INSERT INTO `jc_friendlink` VALUES ('5', '1', '2', '亚马逊', 'http://www.amazon.cn/', '/u/cms/www/201112/19141012lh2q.gif', '', '', '1', '1', '10');
INSERT INTO `jc_friendlink` VALUES ('6', '1', '2', 'ihush', 'http://www.ihush.com/', '/u/cms/www/201112/19141255yrfb.gif', '', '', '1', '1', '10');

-- ----------------------------
-- Table structure for `jc_friendlink_ctg`
-- ----------------------------
DROP TABLE IF EXISTS `jc_friendlink_ctg`;
CREATE TABLE `jc_friendlink_ctg` (
  `friendlinkctg_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `friendlinkctg_name` varchar(50) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  PRIMARY KEY (`friendlinkctg_id`),
  KEY `fk_jc_friendlinkctg_site` (`site_id`),
  CONSTRAINT `fk_jc_friendlinkctg_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS友情链接类别';

-- ----------------------------
-- Records of jc_friendlink_ctg
-- ----------------------------
INSERT INTO `jc_friendlink_ctg` VALUES ('1', '1', '文字链接', '1');
INSERT INTO `jc_friendlink_ctg` VALUES ('2', '1', '品牌专区（图片链接）', '2');

-- ----------------------------
-- Table structure for `jc_group`
-- ----------------------------
DROP TABLE IF EXISTS `jc_group`;
CREATE TABLE `jc_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `need_captcha` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否需要验证码',
  `need_check` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否需要审核',
  `allow_per_day` int(11) NOT NULL DEFAULT '4096' COMMENT '每日允许上传KB',
  `allow_max_file` int(11) NOT NULL DEFAULT '1024' COMMENT '每个文件最大KB',
  `allow_suffix` varchar(255) DEFAULT 'jpg,jpeg,gif,png,bmp' COMMENT '允许上传的后缀',
  `is_reg_def` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认会员组',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS会员组表';

-- ----------------------------
-- Records of jc_group
-- ----------------------------
INSERT INTO `jc_group` VALUES ('1', '普通会员', '10', '1', '1', '0', '0', '', '1');
INSERT INTO `jc_group` VALUES ('2', '高级组', '10', '1', '1', '0', '0', '', '0');

-- ----------------------------
-- Table structure for `jc_guestbook`
-- ----------------------------
DROP TABLE IF EXISTS `jc_guestbook`;
CREATE TABLE `jc_guestbook` (
  `guestbook_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `guestbookctg_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT '留言会员',
  `admin_id` int(11) DEFAULT NULL COMMENT '回复管理员',
  `ip` varchar(50) NOT NULL COMMENT '留言IP',
  `create_time` datetime NOT NULL COMMENT '留言时间',
  `replay_time` datetime DEFAULT NULL COMMENT '回复时间',
  `is_checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否审核',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  PRIMARY KEY (`guestbook_id`),
  KEY `fk_jc_ctg_guestbook` (`guestbookctg_id`),
  KEY `fk_jc_guestbook_admin` (`admin_id`),
  KEY `fk_jc_guestbook_member` (`member_id`),
  KEY `fk_jc_guestbook_site` (`site_id`),
  CONSTRAINT `fk_jc_ctg_guestbook` FOREIGN KEY (`guestbookctg_id`) REFERENCES `jc_guestbook_ctg` (`guestbookctg_id`),
  CONSTRAINT `fk_jc_guestbook_admin` FOREIGN KEY (`admin_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_guestbook_member` FOREIGN KEY (`member_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_guestbook_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='CMS留言';

-- ----------------------------
-- Records of jc_guestbook
-- ----------------------------
INSERT INTO `jc_guestbook` VALUES ('1', '1', '1', null, '1', '127.0.0.1', '2014-01-01 15:02:19', null, '1', '0');
INSERT INTO `jc_guestbook` VALUES ('2', '1', '1', '1', null, '127.0.0.1', '2014-04-19 16:04:19', null, '0', '0');
INSERT INTO `jc_guestbook` VALUES ('3', '1', '1', '1', null, '127.0.0.1', '2014-04-19 16:04:34', null, '0', '0');
INSERT INTO `jc_guestbook` VALUES ('4', '1', '1', null, null, '127.0.0.1', '2014-04-19 17:11:55', null, '0', '0');
INSERT INTO `jc_guestbook` VALUES ('5', '1', '2', '1', null, '127.0.0.1', '2014-04-21 09:28:01', null, '0', '0');
INSERT INTO `jc_guestbook` VALUES ('6', '1', '1', '1', null, '127.0.0.1', '2014-04-21 10:52:45', null, '0', '0');
INSERT INTO `jc_guestbook` VALUES ('7', '1', '1', '1', null, '127.0.0.1', '2014-04-21 11:20:16', null, '0', '0');
INSERT INTO `jc_guestbook` VALUES ('8', '1', '1', '1', '1', '127.0.0.1', '2014-04-21 11:23:25', '2014-05-07 17:33:05', '0', '1');
INSERT INTO `jc_guestbook` VALUES ('9', '1', '1', '1', null, '127.0.0.1', '2014-05-04 16:06:02', null, '0', '1');

-- ----------------------------
-- Table structure for `jc_guestbook_ctg`
-- ----------------------------
DROP TABLE IF EXISTS `jc_guestbook_ctg`;
CREATE TABLE `jc_guestbook_ctg` (
  `guestbookctg_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `ctg_name` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`guestbookctg_id`),
  KEY `fk_jc_guestbookctg_site` (`site_id`),
  CONSTRAINT `fk_jc_guestbookctg_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS留言类别';

-- ----------------------------
-- Records of jc_guestbook_ctg
-- ----------------------------
INSERT INTO `jc_guestbook_ctg` VALUES ('1', '1', '普通', '1', '普通留言');
INSERT INTO `jc_guestbook_ctg` VALUES ('2', '1', '投诉', '10', '投诉');

-- ----------------------------
-- Table structure for `jc_guestbook_ext`
-- ----------------------------
DROP TABLE IF EXISTS `jc_guestbook_ext`;
CREATE TABLE `jc_guestbook_ext` (
  `guestbook_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `content` longtext COMMENT '留言内容',
  `reply` longtext COMMENT '回复内容',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(100) DEFAULT NULL COMMENT '电话',
  `qq` varchar(50) DEFAULT NULL COMMENT 'QQ',
  KEY `fk_jc_ext_guestbook` (`guestbook_id`),
  CONSTRAINT `fk_jc_ext_guestbook` FOREIGN KEY (`guestbook_id`) REFERENCES `jc_guestbook` (`guestbook_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS留言内容';

-- ----------------------------
-- Records of jc_guestbook_ext
-- ----------------------------
INSERT INTO `jc_guestbook_ext` VALUES ('1', '111111111111111', '11', '11111111111111111', null, null, null);
INSERT INTO `jc_guestbook_ext` VALUES ('2', 'aa', 'a', null, null, 'aa', null);
INSERT INTO `jc_guestbook_ext` VALUES ('3', 'aa', 'a', null, null, 'aa', null);
INSERT INTO `jc_guestbook_ext` VALUES ('4', 'asdfsadf', 'asdfasdfasdf', null, null, null, null);
INSERT INTO `jc_guestbook_ext` VALUES ('5', 'aaaa', 'aaaaa', null, null, 'a', null);
INSERT INTO `jc_guestbook_ext` VALUES ('6', null, 'asdfasd', null, null, null, null);
INSERT INTO `jc_guestbook_ext` VALUES ('7', null, 'aaa', null, null, 'a', null);
INSERT INTO `jc_guestbook_ext` VALUES ('8', 'asdf', 'asdf', 'asdf', null, null, null);
INSERT INTO `jc_guestbook_ext` VALUES ('9', '<script>alert(\"dd\")</script> ', '<script>alert(\"dd\")</script> ', null, null, null, null);

-- ----------------------------
-- Table structure for `jc_job_apply`
-- ----------------------------
DROP TABLE IF EXISTS `jc_job_apply`;
CREATE TABLE `jc_job_apply` (
  `job_apply_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `content_id` int(11) NOT NULL COMMENT '职位id',
  `apply_time` datetime NOT NULL COMMENT '申请时间',
  PRIMARY KEY (`job_apply_id`),
  KEY `fk_jc_job_apply_user` (`user_id`),
  KEY `fk_jc_job_apply_content` (`content_id`),
  CONSTRAINT `fk_jc_job_apply_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
  CONSTRAINT `fk_jc_job_apply_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='职位申请表';

-- ----------------------------
-- Records of jc_job_apply
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_keyword`
-- ----------------------------
DROP TABLE IF EXISTS `jc_keyword`;
CREATE TABLE `jc_keyword` (
  `keyword_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL COMMENT '站点ID',
  `keyword_name` varchar(100) NOT NULL COMMENT '名称',
  `url` varchar(255) NOT NULL COMMENT '链接',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  PRIMARY KEY (`keyword_id`),
  KEY `fk_jc_keyword_site` (`site_id`),
  CONSTRAINT `fk_jc_keyword_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS内容关键词表';

-- ----------------------------
-- Records of jc_keyword
-- ----------------------------
INSERT INTO `jc_keyword` VALUES ('1', null, '内容管理系统', '<a href=\"http://www.toolbox.com/\" target=\"_blank\">内容管理系统</a>', '0');

-- ----------------------------
-- Table structure for `jc_log`
-- ----------------------------
DROP TABLE IF EXISTS `jc_log`;
CREATE TABLE `jc_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `category` int(11) NOT NULL COMMENT '日志类型',
  `log_time` datetime NOT NULL COMMENT '日志时间',
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `url` varchar(255) DEFAULT NULL COMMENT 'URL地址',
  `title` varchar(255) DEFAULT NULL COMMENT '日志标题',
  `content` varchar(255) DEFAULT NULL COMMENT '日志内容',
  PRIMARY KEY (`log_id`),
  KEY `fk_jc_log_site` (`site_id`),
  KEY `fk_jc_log_user` (`user_id`),
  CONSTRAINT `fk_jc_log_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_log_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='CMS日志表';

-- ----------------------------
-- Records of jc_log
-- ----------------------------
INSERT INTO `jc_log` VALUES ('2', '1', '1', '3', '2015-05-12 09:57:39', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/config/o_system_update.do', '修改系统设置', null);
INSERT INTO `jc_log` VALUES ('6', '1', '1', '3', '2015-05-12 18:18:52', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/channel/o_delete.do', '删除栏目', 'id=10;title=关于我们');
INSERT INTO `jc_log` VALUES ('7', '1', '1', '3', '2015-05-12 18:18:56', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/channel/o_delete.do', '删除栏目', 'id=60;title=网络调查');
INSERT INTO `jc_log` VALUES ('8', '1', '1', '3', '2015-05-12 18:19:03', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/channel/o_delete.do', '删除栏目', 'id=61;title=招聘');
INSERT INTO `jc_log` VALUES ('9', '1', '1', '3', '2015-05-12 18:19:12', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/channel/o_delete.do', '删除栏目', 'id=11;title=国内新闻');
INSERT INTO `jc_log` VALUES ('10', '1', '1', '3', '2015-05-12 18:19:12', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/channel/o_delete.do', '删除栏目', 'id=12;title=国际新闻');
INSERT INTO `jc_log` VALUES ('11', '1', '1', '3', '2015-05-12 18:19:12', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/channel/o_delete.do', '删除栏目', 'id=13;title=社会热点');
INSERT INTO `jc_log` VALUES ('12', '1', '1', '3', '2015-05-12 18:19:12', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/channel/o_delete.do', '删除栏目', 'id=14;title=时事评论');
INSERT INTO `jc_log` VALUES ('13', '1', '1', '3', '2015-05-12 18:19:12', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/channel/o_delete.do', '删除栏目', 'id=15;title=图片新闻');
INSERT INTO `jc_log` VALUES ('14', '1', '1', '3', '2015-05-12 18:19:13', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/channel/o_delete.do', '删除栏目', 'id=40;title=null');
INSERT INTO `jc_log` VALUES ('15', '1', '1', '3', '2015-05-12 18:19:13', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/channel/o_delete.do', '删除栏目', 'id=41;title=null');
INSERT INTO `jc_log` VALUES ('16', '1', '1', '3', '2015-05-12 18:19:13', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/channel/o_delete.do', '删除栏目', 'id=69;title=反腐倡廉');
INSERT INTO `jc_log` VALUES ('17', '1', '1', '3', '2015-05-12 18:19:28', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/channel/o_delete.do', '删除栏目', 'id=49;title=null');
INSERT INTO `jc_log` VALUES ('18', '1', '1', '3', '2015-05-12 18:19:28', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/channel/o_delete.do', '删除栏目', 'id=50;title=null');
INSERT INTO `jc_log` VALUES ('19', '1', '1', '3', '2015-05-12 18:19:28', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/channel/o_delete.do', '删除栏目', 'id=51;title=null');
INSERT INTO `jc_log` VALUES ('20', '1', '1', '3', '2015-05-12 18:19:36', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/channel/o_delete.do', '删除栏目', 'id=37;title=系统软件');
INSERT INTO `jc_log` VALUES ('21', '1', '1', '3', '2015-05-12 18:19:36', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/channel/o_delete.do', '删除栏目', 'id=38;title=网络游戏');
INSERT INTO `jc_log` VALUES ('22', '1', '1', '3', '2015-05-12 18:19:36', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/channel/o_delete.do', '删除栏目', 'id=39;title=媒体工具');
INSERT INTO `jc_log` VALUES ('23', '1', '1', '3', '2015-05-12 18:19:36', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/channel/o_delete.do', '删除栏目', 'id=57;title=null');
INSERT INTO `jc_log` VALUES ('24', '1', '1', '3', '2015-05-12 18:19:46', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/channel/o_delete.do', '删除栏目', 'id=1;title=新闻资讯');
INSERT INTO `jc_log` VALUES ('25', '1', '1', '3', '2015-05-12 18:19:46', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/channel/o_delete.do', '删除栏目', 'id=46;title=null');
INSERT INTO `jc_log` VALUES ('26', '1', '1', '3', '2015-05-12 18:19:46', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/channel/o_delete.do', '删除栏目', 'id=9;title=下载中心');
INSERT INTO `jc_log` VALUES ('27', '1', '1', '3', '2015-05-12 18:20:11', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/channel/o_delete.do', '删除栏目', 'id=45;title=null');
INSERT INTO `jc_log` VALUES ('28', '1', '1', '3', '2015-05-12 18:20:30', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/topic/o_delete.do', '删除专题', 'id=6;name=美军准备空袭叙利亚');
INSERT INTO `jc_log` VALUES ('29', '1', '1', '3', '2015-05-12 18:20:30', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/topic/o_delete.do', '删除专题', 'id=7;name=“气功大师”王林遭质疑');
INSERT INTO `jc_log` VALUES ('30', '1', '1', '3', '2015-05-12 18:20:30', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/topic/o_delete.do', '删除专题', 'id=5;name=广西桂林学校附近发生爆炸');
INSERT INTO `jc_log` VALUES ('31', '1', '1', '3', '2015-05-12 18:20:30', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/topic/o_delete.do', '删除专题', 'id=4;name=习近平中亚之行');
INSERT INTO `jc_log` VALUES ('32', '1', '1', '3', '2015-05-12 18:20:30', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/topic/o_delete.do', '删除专题', 'id=3;name=低碳经济');
INSERT INTO `jc_log` VALUES ('33', '1', '1', '3', '2015-05-12 18:20:30', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/topic/o_delete.do', '删除专题', 'id=2;name=上海世博会专题');
INSERT INTO `jc_log` VALUES ('34', '1', '1', '3', '2015-05-12 18:20:30', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/topic/o_delete.do', '删除专题', 'id=1;name=2010年南非世界杯');
INSERT INTO `jc_log` VALUES ('35', '1', '1', '3', '2015-05-12 18:20:39', '0:0:0:0:0:0:0:1', '/toolbox/tooladmin/toolbox/channel/o_delete.do', '删除栏目', 'id=42;title=null');

-- ----------------------------
-- Table structure for `jc_message`
-- ----------------------------
DROP TABLE IF EXISTS `jc_message`;
CREATE TABLE `jc_message` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `msg_title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `msg_content` longtext COMMENT '站内信息内容',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '发送时间',
  `msg_send_user` int(11) NOT NULL DEFAULT '1' COMMENT '发信息人',
  `msg_receiver_user` int(11) NOT NULL DEFAULT '0' COMMENT '接收人',
  `site_id` int(11) NOT NULL DEFAULT '1' COMMENT '站点',
  `msg_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消息状态0未读，1已读',
  `msg_box` int(2) NOT NULL DEFAULT '1' COMMENT '消息信箱 0收件箱 1发件箱 2草稿箱 3垃圾箱',
  PRIMARY KEY (`msg_id`),
  KEY `fk_jc_message_user_send` (`msg_send_user`),
  KEY `fk_jc_message_user_receiver` (`msg_receiver_user`),
  KEY `fk_jc_message_site` (`site_id`),
  CONSTRAINT `fk_jc_message_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_message_user_receiver` FOREIGN KEY (`msg_receiver_user`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_message_user_send` FOREIGN KEY (`msg_send_user`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站内信';

-- ----------------------------
-- Records of jc_message
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_model`
-- ----------------------------
DROP TABLE IF EXISTS `jc_model`;
CREATE TABLE `jc_model` (
  `model_id` int(11) NOT NULL,
  `model_name` varchar(100) NOT NULL COMMENT '名称',
  `model_path` varchar(100) NOT NULL COMMENT '路径',
  `tpl_channel_prefix` varchar(20) DEFAULT NULL COMMENT '栏目模板前缀',
  `tpl_content_prefix` varchar(20) DEFAULT NULL COMMENT '内容模板前缀',
  `title_img_width` int(11) NOT NULL DEFAULT '139' COMMENT '栏目标题图宽度',
  `title_img_height` int(11) NOT NULL DEFAULT '139' COMMENT '栏目标题图高度',
  `content_img_width` int(11) NOT NULL DEFAULT '310' COMMENT '栏目内容图宽度',
  `content_img_height` int(11) NOT NULL DEFAULT '310' COMMENT '栏目内容图高度',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `has_content` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有内容',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `is_def` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认模型',
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS模型表';

-- ----------------------------
-- Records of jc_model
-- ----------------------------
INSERT INTO `jc_model` VALUES ('1', '新闻', '1', 'news', 'news', '139', '139', '310', '310', '1', '1', '0', '1');
INSERT INTO `jc_model` VALUES ('2', '单页', '2', 'alone', 'alone', '139', '139', '310', '310', '2', '0', '0', '0');
INSERT INTO `jc_model` VALUES ('4', '下载', '4', 'download', 'download', '139', '139', '310', '310', '4', '1', '0', '0');
INSERT INTO `jc_model` VALUES ('5', '图库', '5', 'pic', 'pic', '139', '139', '310', '310', '5', '1', '0', '0');
INSERT INTO `jc_model` VALUES ('6', '视频', '6', 'vedio', 'vedio', '139', '139', '310', '310', '10', '1', '0', '0');
INSERT INTO `jc_model` VALUES ('8', '招聘', 'job', 'job', 'job', '139', '139', '310', '310', '10', '1', '0', '0');

-- ----------------------------
-- Table structure for `jc_model_item`
-- ----------------------------
DROP TABLE IF EXISTS `jc_model_item`;
CREATE TABLE `jc_model_item` (
  `modelitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) NOT NULL,
  `field` varchar(50) NOT NULL COMMENT '字段',
  `item_label` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '70' COMMENT '排列顺序',
  `def_value` varchar(255) DEFAULT NULL COMMENT '默认值',
  `opt_value` varchar(255) DEFAULT NULL COMMENT '可选项',
  `text_size` varchar(20) DEFAULT NULL COMMENT '长度',
  `area_rows` varchar(3) DEFAULT NULL COMMENT '文本行数',
  `area_cols` varchar(3) DEFAULT NULL COMMENT '文本列数',
  `help` varchar(255) DEFAULT NULL COMMENT '帮助信息',
  `help_position` varchar(1) DEFAULT NULL COMMENT '帮助位置',
  `data_type` int(11) NOT NULL DEFAULT '1' COMMENT '数据类型',
  `is_single` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否独占一行',
  `is_channel` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否栏目模型项',
  `is_custom` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否自定义',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  PRIMARY KEY (`modelitem_id`),
  KEY `fk_jc_item_model` (`model_id`),
  CONSTRAINT `fk_jc_item_model` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=426 DEFAULT CHARSET=utf8 COMMENT='CMS模型项表';

-- ----------------------------
-- Records of jc_model_item
-- ----------------------------
INSERT INTO `jc_model_item` VALUES ('1', '1', 'name', '栏目名称', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('2', '1', 'path', '访问路径', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('3', '1', 'title', 'meta标题', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('4', '1', 'keywords', 'meta关键字', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('5', '1', 'description', 'meta描述', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('6', '1', 'tplChannel', '栏目模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('7', '1', 'tplContent', '选择模型模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('8', '1', 'channelStatic', '栏目静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('9', '1', 'contentStatic', '内容静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('10', '1', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('11', '1', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('12', '1', 'docImg', '文档图片', '10', null, null, null, null, null, null, null, '8', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('14', '1', 'afterCheck', '审核后', '11', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('15', '1', 'commentControl', '评论', '11', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('16', '1', 'allowUpdown', '顶踩', '11', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('17', '1', 'viewGroupIds', '浏览权限', '12', null, null, null, null, null, null, null, '7', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('18', '1', 'contriGroupIds', '投稿权限', '12', null, null, null, null, null, null, null, '7', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('20', '1', 'link', '外部链接', '12', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('21', '1', 'titleImg', '标题图', '12', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('23', '1', 'title', '标题', '9', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('24', '1', 'shortTitle', '简短标题', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('25', '1', 'titleColor', '标题颜色', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('26', '1', 'tagStr', 'Tag标签', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('27', '1', 'description', '摘要', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('28', '1', 'author', '作者', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('29', '1', 'origin', '来源', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('30', '1', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('31', '1', 'topLevel', '固顶级别', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('32', '1', 'releaseDate', '发布时间', '10', null, null, null, null, null, null, null, '5', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('33', '1', 'typeId', '内容类型', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('34', '1', 'tplContent', '指定模板', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('35', '1', 'typeImg', '类型图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('36', '1', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('37', '1', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('38', '1', 'attachments', '附件', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('39', '1', 'media', '多媒体', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('40', '1', 'txt', '内容', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('42', '2', 'name', '栏目名称', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('43', '2', 'path', '访问路径', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('44', '2', 'title', 'meta标题', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('45', '2', 'keywords', 'meta关键字', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('46', '2', 'description', 'meta描述', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('47', '2', 'tplChannel', '栏目模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('48', '2', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('49', '2', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('50', '2', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('51', '2', 'link', '外部链接', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('52', '2', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('53', '2', 'txt', '内容', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('93', '4', 'name', '栏目名称', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('94', '4', 'path', '访问路径', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('95', '4', 'title', 'meta标题', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('96', '4', 'keywords', 'meta关键字', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('97', '4', 'description', 'meta描述', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('98', '4', 'tplChannel', '栏目模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('99', '4', 'tplContent', '选择模型模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('100', '4', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('101', '4', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('102', '4', 'docImg', '文档图片', '10', null, null, null, null, null, null, null, '8', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('103', '4', 'commentControl', '评论', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('104', '4', 'allowUpdown', '顶踩', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('105', '4', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('107', '4', 'channelId', '栏目', '1', null, null, null, null, null, null, null, '6', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('108', '4', 'title', '软件名称', '2', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('109', '4', 'shortTitle', '软件简称', '3', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('110', '4', 'titleColor', '标题颜色', '4', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('111', '4', 'description', '摘要', '5', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('112', '4', 'author', '发布人', '6', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('113', '4', 'viewGroupIds', '浏览权限', '7', null, null, null, null, null, null, null, '7', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('114', '4', 'topLevel', '固顶级别', '8', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('115', '4', 'releaseDate', '发布时间', '9', null, null, null, null, null, null, null, '5', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('116', '4', 'typeId', '内容类型', '21', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('117', '4', 'tplContent', '指定模板', '22', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('118', '4', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('119', '4', 'attachments', '资源上传', '11', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('120', '4', 'txt', '软件介绍', '20', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('121', '4', 'softType', '软件类型', '12', '国产软件', '国产软件,国外软件', '100', '3', '30', null, null, '6', '0', '0', '1', '1');
INSERT INTO `jc_model_item` VALUES ('122', '4', 'warrant', '软件授权', '13', '免费版', '免费版,共享版', '', '3', '30', '', '', '6', '0', '0', '1', '1');
INSERT INTO `jc_model_item` VALUES ('123', '4', 'relatedLink', '相关链接', '14', 'http://', '', '50', '3', '30', '', '', '1', '0', '0', '1', '1');
INSERT INTO `jc_model_item` VALUES ('124', '4', 'demoUrl', '演示地址', '15', 'http://', null, '60', '3', '30', null, null, '1', '0', '0', '1', '1');
INSERT INTO `jc_model_item` VALUES ('125', '5', 'name', '栏目名称', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('126', '5', 'path', '访问路径', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('127', '5', 'title', 'meta标题', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('128', '5', 'keywords', 'meta关键字', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('129', '5', 'description', 'meta描述', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('130', '5', 'tplChannel', '栏目模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('131', '5', 'tplContent', '选择模型模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('132', '5', 'channelStatic', '栏目静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('133', '5', 'contentStatic', '内容静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('134', '5', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('135', '5', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('136', '5', 'docImg', '文档图片', '10', null, null, null, null, null, null, null, '8', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('138', '5', 'afterCheck', '审核后', '11', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('139', '5', 'commentControl', '评论', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('140', '5', 'allowUpdown', '顶踩', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('141', '5', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('142', '5', 'contriGroupIds', '投稿权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('144', '5', 'link', '外部链接', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('145', '5', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('146', '5', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('147', '5', 'channelId', '栏目', '10', null, null, null, null, null, null, null, '6', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('148', '5', 'title', '标题', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('149', '5', 'shortTitle', '简短标题', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('150', '5', 'titleColor', '标题颜色', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('151', '5', 'tagStr', 'Tag标签', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('152', '5', 'description', '摘要', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('153', '5', 'author', '作者', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('154', '5', 'origin', '来源', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('155', '5', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('156', '5', 'topLevel', '固顶级别', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('157', '5', 'releaseDate', '发布时间', '10', null, null, null, null, null, null, null, '5', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('158', '5', 'typeId', '内容类型', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('159', '5', 'tplContent', '指定模板', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('160', '5', 'typeImg', '类型图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('161', '5', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('162', '5', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('163', '5', 'pictures', '图片集', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('164', '6', 'name', '栏目名称', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('165', '6', 'path', '访问路径', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('166', '6', 'title', 'meta标题', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('167', '6', 'keywords', 'meta关键字', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('168', '6', 'description', 'meta描述', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('169', '6', 'tplChannel', '栏目模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('170', '6', 'tplContent', '选择模型模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('171', '6', 'channelStatic', '栏目静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('172', '6', 'contentStatic', '内容静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('173', '6', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('174', '6', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('175', '6', 'docImg', '文档图片', '10', null, null, null, null, null, null, null, '8', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('177', '6', 'afterCheck', '审核后', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('178', '6', 'commentControl', '评论', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('179', '6', 'allowUpdown', '顶踩', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('180', '6', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('181', '6', 'contriGroupIds', '投稿权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('183', '6', 'link', '外部链接', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('184', '6', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('185', '6', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('186', '6', 'channelId', '栏目', '10', null, null, null, null, null, null, null, '6', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('187', '6', 'title', '标题', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('188', '6', 'shortTitle', '简短标题', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('189', '6', 'titleColor', '标题颜色', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('190', '6', 'tagStr', 'Tag标签', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('191', '6', 'description', '内容简介', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('192', '6', 'author', '作者', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('193', '6', 'origin', '来源', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('194', '6', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('195', '6', 'topLevel', '固顶级别', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('196', '6', 'releaseDate', '发布时间', '10', null, null, null, null, null, null, null, '5', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('197', '6', 'typeId', '内容类型', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('198', '6', 'tplContent', '指定模板', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('199', '6', 'typeImg', '类型图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('200', '6', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('201', '6', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('202', '6', 'attachments', '附件', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('203', '6', 'media', '多媒体', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('246', '4', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('249', '8', 'name', '栏目名称', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('250', '8', 'path', '访问路径', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('251', '8', 'title', 'meta标题', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('252', '8', 'keywords', 'meta关键字', '10', null, null, null, null, null, null, null, '1', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('253', '8', 'description', 'meta描述', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('254', '8', 'tplChannel', '栏目模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('255', '8', 'tplContent', '选择模型模板', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('256', '8', 'channelStatic', '栏目静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('257', '8', 'contentStatic', '内容静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('258', '8', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('259', '8', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('260', '8', 'docImg', '文档图片', '10', null, null, null, null, null, null, null, '8', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('262', '8', 'afterCheck', '审核后', '10', null, null, null, null, null, null, null, '6', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('263', '8', 'commentControl', '评论', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('264', '8', 'allowUpdown', '顶踩', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('265', '8', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('266', '8', 'contriGroupIds', '投稿权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('268', '8', 'link', '外部链接', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('269', '8', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('270', '8', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('271', '8', 'channelId', '栏目', '1', null, null, null, null, null, null, null, '6', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('272', '8', 'title', '岗位名称', '1', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('275', '8', 'tagStr', 'Tag标签', '7', null, null, null, null, null, null, null, '1', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('279', '8', 'viewGroupIds', '浏览权限', '8', null, null, null, null, null, null, null, '7', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('280', '8', 'topLevel', '固顶级别', '7', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('281', '8', 'releaseDate', '发布时间', '2', null, null, null, null, null, null, null, '5', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('282', '8', 'typeId', '内容类型', '7', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('283', '8', 'tplContent', '指定模板', '8', null, null, null, null, null, null, null, '6', '0', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('289', '8', 'txt', '职位描述', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('290', '8', 'deadline', '截止日期', '2', null, null, null, '3', '30', '留空永久有效', null, '5', '0', '0', '1', '1');
INSERT INTO `jc_model_item` VALUES ('291', '8', 'experience', '工作经验', '3', null, '1-3年,3-5年,5年以上,不限', null, '3', '30', null, null, '6', '0', '0', '1', '1');
INSERT INTO `jc_model_item` VALUES ('292', '8', 'education', '最低学历', '3', '', '专科,本科,硕士,不限', '', '3', '30', '', '', '6', '0', '0', '1', '1');
INSERT INTO `jc_model_item` VALUES ('293', '8', 'salary', '职位月薪', '4', null, '1500-2000,2000-3000,3000-5000,5000-8000,8000+,面议', null, '3', '30', null, null, '6', '0', '0', '1', '1');
INSERT INTO `jc_model_item` VALUES ('294', '8', 'workplace', '工作地点', '4', '', '北京,上海,深圳,广州,重庆,南京,杭州,西安,南昌', '', '3', '30', '', '', '7', '0', '0', '1', '1');
INSERT INTO `jc_model_item` VALUES ('295', '8', 'nature', '工作性质', '5', '', '全职,兼职', '', '3', '30', '', '', '8', '0', '0', '1', '1');
INSERT INTO `jc_model_item` VALUES ('296', '8', 'hasmanage', '管理经验', '5', '', '要求,不要求', '', '3', '30', '', '', '8', '0', '0', '1', '1');
INSERT INTO `jc_model_item` VALUES ('297', '8', 'nums', '招聘人数', '6', '', '1-3人,3-5人,5-10人,若干', '', '3', '30', '', '', '6', '0', '0', '1', '1');
INSERT INTO `jc_model_item` VALUES ('298', '8', 'category', '职位类别', '6', null, '项目主管,java高级工程师,java工程师,网页设计师,测试人员,技术支持', null, '3', '30', null, null, '6', '0', '0', '1', '1');
INSERT INTO `jc_model_item` VALUES ('344', '1', 'channelId', '栏目', '8', null, null, null, null, null, null, null, '6', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('403', '6', 'Director', '导演', '10', '', '', '', '1', '2', '', '', '1', '0', '0', '1', '1');
INSERT INTO `jc_model_item` VALUES ('404', '6', 'Starring', '主演', '10', '', '', '', '1', '30', '', '', '1', '0', '0', '1', '1');
INSERT INTO `jc_model_item` VALUES ('405', '6', 'VideoType', '视频类型', '10', null, '历史,古装,都市,喜剧,悬疑,动作,谍战,伦理,战争,惊悚', null, '3', '30', null, null, '7', '0', '0', '1', '1');
INSERT INTO `jc_model_item` VALUES ('406', '6', 'Video', '影片信息', '10', '', '正片,预告片', '', '3', '30', '', '', '6', '0', '0', '1', '1');
INSERT INTO `jc_model_item` VALUES ('408', '1', 'contentImg', '内容图', '12', null, null, null, null, null, null, null, '1', '1', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('409', '5', 'txt', '内容', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('410', '6', 'txt', '内容', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('412', '1', 'allowShare', '分享', '11', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('413', '1', 'allowScore', '评分', '11', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('414', '1', 'pictures', '图片集', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1');
INSERT INTO `jc_model_item` VALUES ('415', '1', 'finalStep', '终审级别', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('420', '6', 'finalStep', '终审级别', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('421', '6', 'allowShare', '分享', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('422', '6', 'allowScore', '评分', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('423', '8', 'finalStep', '终审级别', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('424', '8', 'allowShare', '分享', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');
INSERT INTO `jc_model_item` VALUES ('425', '8', 'allowScore', '评分', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1');

-- ----------------------------
-- Table structure for `jc_origin`
-- ----------------------------
DROP TABLE IF EXISTS `jc_origin`;
CREATE TABLE `jc_origin` (
  `origin_id` int(11) NOT NULL AUTO_INCREMENT,
  `origin_name` varchar(255) NOT NULL COMMENT '来源名称',
  `ref_count` int(11) NOT NULL DEFAULT '0' COMMENT '来源文章总数',
  PRIMARY KEY (`origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='来源';

-- ----------------------------
-- Records of jc_origin
-- ----------------------------
INSERT INTO `jc_origin` VALUES ('1', '新浪微博', '0');
INSERT INTO `jc_origin` VALUES ('2', '百度', '0');
INSERT INTO `jc_origin` VALUES ('3', '百度论坛', '0');
INSERT INTO `jc_origin` VALUES ('4', '百度贴吧', '0');
INSERT INTO `jc_origin` VALUES ('5', '新浪新闻', '0');
INSERT INTO `jc_origin` VALUES ('6', '腾讯新闻', '0');

-- ----------------------------
-- Table structure for `jc_plug`
-- ----------------------------
DROP TABLE IF EXISTS `jc_plug`;
CREATE TABLE `jc_plug` (
  `plug_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '插件名称',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `description` varchar(2000) DEFAULT NULL COMMENT '描述',
  `author` varchar(255) DEFAULT NULL COMMENT '作者',
  `upload_time` datetime NOT NULL COMMENT '上传时间',
  `install_time` datetime DEFAULT NULL COMMENT '安装时间',
  `uninstall_time` datetime DEFAULT NULL COMMENT '卸载时间',
  `file_conflict` tinyint(1) NOT NULL DEFAULT '0' COMMENT '包含文件是否冲突',
  `is_used` tinyint(1) NOT NULL DEFAULT '0' COMMENT '使用状态(0未使用,1使用中)',
  `plug_perms` varchar(255) DEFAULT '' COMMENT '插件权限（,分隔各个权限配置）',
  PRIMARY KEY (`plug_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='插件';

-- ----------------------------
-- Records of jc_plug
-- ----------------------------
INSERT INTO `jc_plug` VALUES ('4', '测试1', '/WEB-INF/plug/test.zip', '测试测试', 'TOM', '2014-01-04 16:49:47', '2014-02-19 09:49:31', '2014-02-19 09:49:15', '0', '0', 'test:*');

-- ----------------------------
-- Table structure for `jc_receiver_message`
-- ----------------------------
DROP TABLE IF EXISTS `jc_receiver_message`;
CREATE TABLE `jc_receiver_message` (
  `msg_re_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `msg_title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `msg_content` longtext COMMENT '站内信息内容',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '发送时间',
  `msg_send_user` int(11) NOT NULL DEFAULT '1' COMMENT '发信息人',
  `msg_receiver_user` int(11) NOT NULL DEFAULT '0' COMMENT '接收人',
  `site_id` int(11) NOT NULL DEFAULT '1' COMMENT '站点',
  `msg_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消息状态0未读，1已读',
  `msg_box` int(2) NOT NULL DEFAULT '1' COMMENT '消息信箱 0收件箱 1发件箱 2草稿箱 3垃圾箱',
  `msg_id` int(11) DEFAULT NULL COMMENT '发信的信件id',
  PRIMARY KEY (`msg_re_id`),
  KEY `jc_receiver_message_user_send` (`msg_send_user`),
  KEY `jc_receiver_message_user_receiver` (`msg_receiver_user`),
  KEY `jc_receiver_message_site` (`site_id`),
  KEY `jc_receiver_message_message` (`msg_re_id`),
  KEY `fk_jc_receiver_message_message` (`msg_id`),
  CONSTRAINT `fk_jc_receiver_message_message` FOREIGN KEY (`msg_id`) REFERENCES `jc_message` (`msg_id`),
  CONSTRAINT `fk_jc_receiver_message_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_receiver_message_user_receiver` FOREIGN KEY (`msg_receiver_user`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_receiver_message_user_send` FOREIGN KEY (`msg_send_user`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='站内信收信表';

-- ----------------------------
-- Records of jc_receiver_message
-- ----------------------------
INSERT INTO `jc_receiver_message` VALUES ('1', 'aa', 'aaa', '2014-01-22 09:44:32', '1', '1', '1', '1', '0', null);
INSERT INTO `jc_receiver_message` VALUES ('2', 'aa', 'aaa', '2014-01-22 09:44:32', '1', '1', '1', '0', '3', null);

-- ----------------------------
-- Table structure for `jc_role`
-- ----------------------------
DROP TABLE IF EXISTS `jc_role`;
CREATE TABLE `jc_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `role_name` varchar(100) NOT NULL COMMENT '角色名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `is_super` char(1) NOT NULL DEFAULT '0' COMMENT '拥有所有权限',
  PRIMARY KEY (`role_id`),
  KEY `fk_jc_role_site` (`site_id`),
  CONSTRAINT `fk_jc_role_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS角色表';

-- ----------------------------
-- Records of jc_role
-- ----------------------------
INSERT INTO `jc_role` VALUES ('1', null, '管理员', '10', '1');

-- ----------------------------
-- Table structure for `jc_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `jc_role_permission`;
CREATE TABLE `jc_role_permission` (
  `role_id` int(11) NOT NULL,
  `uri` varchar(100) NOT NULL,
  KEY `fk_jc_permission_role` (`role_id`),
  CONSTRAINT `fk_jc_permission_role` FOREIGN KEY (`role_id`) REFERENCES `jc_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS角色授权表';

-- ----------------------------
-- Records of jc_role_permission
-- ----------------------------
INSERT INTO `jc_role_permission` VALUES ('1', '/top.do');
INSERT INTO `jc_role_permission` VALUES ('1', '/right.do');
INSERT INTO `jc_role_permission` VALUES ('1', '/main.do');
INSERT INTO `jc_role_permission` VALUES ('1', '/left.do');
INSERT INTO `jc_role_permission` VALUES ('1', '/index.do');
INSERT INTO `jc_role_permission` VALUES ('1', '/message/v_countUnreadMsg.do');
INSERT INTO `jc_role_permission` VALUES ('1', '/content/o_generateTags.do');
INSERT INTO `jc_role_permission` VALUES ('1', '/map.do');
INSERT INTO `jc_role_permission` VALUES ('1', '/statistic_member/v_list.do');
INSERT INTO `jc_role_permission` VALUES ('1', 'admin_global:v_list:*');
INSERT INTO `jc_role_permission` VALUES ('1', 'admin_local:v_list:*');
INSERT INTO `jc_role_permission` VALUES ('1', '/admin_local/v_edit/2');
INSERT INTO `jc_role_permission` VALUES ('1', 'admin_local:v_list');

-- ----------------------------
-- Table structure for `jc_score_group`
-- ----------------------------
DROP TABLE IF EXISTS `jc_score_group`;
CREATE TABLE `jc_score_group` (
  `score_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '分组名',
  `description` varchar(1000) DEFAULT NULL COMMENT '描述',
  `enable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `def` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否默认',
  `site_id` int(11) NOT NULL COMMENT '站点',
  PRIMARY KEY (`score_group_id`),
  KEY `fk_jc_score_group_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='FComment';

-- ----------------------------
-- Records of jc_score_group
-- ----------------------------
INSERT INTO `jc_score_group` VALUES ('1', '心情组', '心情组', '1', '1', '1');
INSERT INTO `jc_score_group` VALUES ('2', '星级评分', '星级评分', '1', '0', '1');

-- ----------------------------
-- Table structure for `jc_score_item`
-- ----------------------------
DROP TABLE IF EXISTS `jc_score_item`;
CREATE TABLE `jc_score_item` (
  `score_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `score_group_id` int(11) NOT NULL COMMENT '评分组',
  `name` varchar(255) NOT NULL COMMENT '评分名',
  `score` int(11) NOT NULL COMMENT '分值',
  `image_path` varchar(255) DEFAULT NULL COMMENT '评分图标路径',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排序',
  PRIMARY KEY (`score_item_id`),
  KEY `fk_jc_score_item_group` (`score_group_id`),
  CONSTRAINT `fk_jc_score_item_group` FOREIGN KEY (`score_group_id`) REFERENCES `jc_score_group` (`score_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='评分项';

-- ----------------------------
-- Records of jc_score_item
-- ----------------------------
INSERT INTO `jc_score_item` VALUES ('1', '1', '开心', '1', '/r/cms/smilies/m1.gif', '1');
INSERT INTO `jc_score_item` VALUES ('2', '1', '板砖', '1', '/r/cms/smilies/m2.gif', '2');
INSERT INTO `jc_score_item` VALUES ('3', '1', '感动', '1', '/r/cms/smilies/m3.gif', '3');
INSERT INTO `jc_score_item` VALUES ('4', '1', '有用', '1', '/r/cms/smilies/m4.gif', '4');
INSERT INTO `jc_score_item` VALUES ('5', '1', '疑问', '1', '/r/cms/smilies/m5.gif', '5');
INSERT INTO `jc_score_item` VALUES ('6', '1', '难过', '1', '/r/cms/smilies/m6.gif', '6');
INSERT INTO `jc_score_item` VALUES ('7', '1', '无聊', '1', '/r/cms/smilies/m7.gif', '7');
INSERT INTO `jc_score_item` VALUES ('8', '1', '震惊', '1', '/r/cms/smilies/m8.gif', '8');
INSERT INTO `jc_score_item` VALUES ('9', '2', '非常差', '1', '', '1');
INSERT INTO `jc_score_item` VALUES ('10', '2', '差', '2', '', '2');
INSERT INTO `jc_score_item` VALUES ('11', '2', '一般', '3', '', '3');
INSERT INTO `jc_score_item` VALUES ('12', '2', '好', '4', '', '4');
INSERT INTO `jc_score_item` VALUES ('13', '2', '非常好', '5', '', '5');

-- ----------------------------
-- Table structure for `jc_score_record`
-- ----------------------------
DROP TABLE IF EXISTS `jc_score_record`;
CREATE TABLE `jc_score_record` (
  `score_record_id` int(11) NOT NULL AUTO_INCREMENT,
  `score_item_id` int(11) NOT NULL COMMENT '评分项',
  `content_id` int(11) NOT NULL COMMENT '内容',
  `score_count` int(11) NOT NULL COMMENT '评分次数',
  PRIMARY KEY (`score_record_id`),
  KEY `fk_jc_record_score_item` (`score_item_id`),
  KEY `index_score_record_content` (`content_id`),
  CONSTRAINT `fk_jc_record_score_item` FOREIGN KEY (`score_item_id`) REFERENCES `jc_score_item` (`score_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评分纪录';

-- ----------------------------
-- Records of jc_score_record
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_search_words`
-- ----------------------------
DROP TABLE IF EXISTS `jc_search_words`;
CREATE TABLE `jc_search_words` (
  `word_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '搜索词汇',
  `hit_count` int(11) NOT NULL DEFAULT '0' COMMENT '搜索次数',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '优先级',
  `name_initial` varchar(500) NOT NULL DEFAULT '' COMMENT '拼音首字母',
  PRIMARY KEY (`word_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='搜索热词';

-- ----------------------------
-- Records of jc_search_words
-- ----------------------------
INSERT INTO `jc_search_words` VALUES ('1', '国内新闻', '0', '2', 'gnxw');
INSERT INTO `jc_search_words` VALUES ('4', '中大云锦', '0', '1', 'zdyj');
INSERT INTO `jc_search_words` VALUES ('5', '中国建设', '60', '2', 'zgjs');
INSERT INTO `jc_search_words` VALUES ('6', '中国农业银行', '0', '2', 'zgnyyx');
INSERT INTO `jc_search_words` VALUES ('7', '中国建设银行', '12', '10', 'zgjsyx');
INSERT INTO `jc_search_words` VALUES ('8', '江西', '1', '10', 'jx');
INSERT INTO `jc_search_words` VALUES ('9', '南昌', '22', '10', 'nc');
INSERT INTO `jc_search_words` VALUES ('10', '新闻', '9', '10', 'xw');
INSERT INTO `jc_search_words` VALUES ('11', '家', '3', '10', 'j');
INSERT INTO `jc_search_words` VALUES ('13', '毛泽东', '8', '10', 'mzd');
INSERT INTO `jc_search_words` VALUES ('14', '刘晓庆', '10', '10', 'lxq');
INSERT INTO `jc_search_words` VALUES ('15', '广西 ', '1', '10', 'gx');
INSERT INTO `jc_search_words` VALUES ('17', '国内', '16', '10', 'gn');
INSERT INTO `jc_search_words` VALUES ('18', '巴基斯坦', '1', '10', 'bjst');

-- ----------------------------
-- Table structure for `jc_sensitivity`
-- ----------------------------
DROP TABLE IF EXISTS `jc_sensitivity`;
CREATE TABLE `jc_sensitivity` (
  `sensitivity_id` int(11) NOT NULL AUTO_INCREMENT,
  `search` varchar(255) NOT NULL COMMENT '敏感词',
  `replacement` varchar(255) NOT NULL COMMENT '替换词',
  PRIMARY KEY (`sensitivity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS敏感词表';

-- ----------------------------
-- Records of jc_sensitivity
-- ----------------------------
INSERT INTO `jc_sensitivity` VALUES ('1', '法论功', '***');

-- ----------------------------
-- Table structure for `jc_site`
-- ----------------------------
DROP TABLE IF EXISTS `jc_site`;
CREATE TABLE `jc_site` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_id` int(11) NOT NULL COMMENT '配置ID',
  `ftp_upload_id` int(11) DEFAULT NULL COMMENT '上传ftp',
  `domain` varchar(50) NOT NULL COMMENT '域名',
  `site_path` varchar(20) NOT NULL COMMENT '路径',
  `site_name` varchar(100) NOT NULL COMMENT '网站名称',
  `short_name` varchar(100) NOT NULL COMMENT '简短名称',
  `protocol` varchar(20) NOT NULL DEFAULT 'http://' COMMENT '协议',
  `dynamic_suffix` varchar(10) NOT NULL DEFAULT '.jhtml' COMMENT '动态页后缀',
  `static_suffix` varchar(10) NOT NULL DEFAULT '.html' COMMENT '静态页后缀',
  `static_dir` varchar(50) DEFAULT NULL COMMENT '静态页存放目录',
  `is_index_to_root` char(1) NOT NULL DEFAULT '0' COMMENT '是否使用将首页放在根目录下',
  `is_static_index` char(1) NOT NULL DEFAULT '0' COMMENT '是否静态化首页',
  `locale_admin` varchar(10) NOT NULL DEFAULT 'zh_CN' COMMENT '后台本地化',
  `locale_front` varchar(10) NOT NULL DEFAULT 'zh_CN' COMMENT '前台本地化',
  `tpl_solution` varchar(50) NOT NULL DEFAULT 'default' COMMENT '模板方案',
  `final_step` tinyint(4) NOT NULL DEFAULT '2' COMMENT '终审级别',
  `after_check` tinyint(4) NOT NULL DEFAULT '2' COMMENT '审核后(1:不能修改删除;2:修改后退回;3:修改后不变)',
  `is_relative_path` char(1) NOT NULL DEFAULT '1' COMMENT '是否使用相对路径',
  `is_recycle_on` char(1) NOT NULL DEFAULT '1' COMMENT '是否开启回收站',
  `domain_alias` varchar(255) DEFAULT NULL COMMENT '域名别名',
  `domain_redirect` varchar(255) DEFAULT NULL COMMENT '域名重定向',
  `tpl_index` varchar(255) DEFAULT NULL COMMENT '首页模板',
  `keywords` varchar(255) DEFAULT NULL COMMENT '站点关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '站点描述',
  PRIMARY KEY (`site_id`),
  UNIQUE KEY `ak_domain_path` (`domain`),
  KEY `fk_jc_site_config` (`config_id`),
  KEY `fk_jc_site_upload_ftp` (`ftp_upload_id`),
  CONSTRAINT `fk_jc_site_config` FOREIGN KEY (`config_id`) REFERENCES `jc_config` (`config_id`),
  CONSTRAINT `fk_jc_site_upload_ftp` FOREIGN KEY (`ftp_upload_id`) REFERENCES `jo_ftp` (`ftp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS站点表';

-- ----------------------------
-- Records of jc_site
-- ----------------------------
INSERT INTO `jc_site` VALUES ('1', '1', null, 'localhost', 'www', 'toolbox开发站', 'toolbox开发站', 'http://', '.jhtml', '.html', '/jx', '0', '0', 'zh_CN', 'zh_CN', 'default', '3', '3', '0', '1', '', '', '/WEB-INF/t/cms/www/default/index/index.html', '', '');

-- ----------------------------
-- Table structure for `jc_site_access`
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_access`;
CREATE TABLE `jc_site_access` (
  `access_id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(32) NOT NULL DEFAULT '',
  `site_id` int(11) NOT NULL COMMENT '站点id',
  `access_time` time NOT NULL COMMENT '访问时间',
  `access_date` date NOT NULL COMMENT '访问日期',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `area` varchar(50) DEFAULT NULL COMMENT '访问地区',
  `access_source` varchar(255) DEFAULT NULL COMMENT '访问来源',
  `external_link` varchar(255) DEFAULT NULL COMMENT '外部链接网址',
  `engine` varchar(50) DEFAULT NULL COMMENT '搜索引擎',
  `entry_page` varchar(255) DEFAULT NULL COMMENT '入口页面',
  `last_stop_page` varchar(255) DEFAULT NULL COMMENT '最后停留页面',
  `visit_second` int(11) DEFAULT NULL COMMENT '访问时长(秒)',
  `visit_page_count` int(11) DEFAULT NULL COMMENT '访问页面数',
  `operating_system` varchar(50) DEFAULT NULL COMMENT '操作系统',
  `browser` varchar(50) DEFAULT NULL COMMENT '浏览器',
  `keyword` varchar(255) DEFAULT NULL COMMENT '来访关键字',
  PRIMARY KEY (`access_id`),
  KEY `fk_jc_access_site` (`site_id`),
  CONSTRAINT `fk_jc_access_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='站点访问表';

-- ----------------------------
-- Records of jc_site_access
-- ----------------------------
INSERT INTO `jc_site_access` VALUES ('1', '54342ECBB17EB8967CF14F552305BD8D', '1', '09:57:44', '2015-05-12', '0:0:0:0:0:0:0:1', '', '', null, null, 'http://localhost:8080/toolbox/', 'http://localhost:8080/toolbox/', '331', '4', 'Win 7', 'firefox 37', '');

-- ----------------------------
-- Table structure for `jc_site_access_count`
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_access_count`;
CREATE TABLE `jc_site_access_count` (
  `access_count` int(11) NOT NULL AUTO_INCREMENT,
  `page_count` int(11) NOT NULL DEFAULT '1' COMMENT '访问页数',
  `visitors` int(11) NOT NULL DEFAULT '0' COMMENT '用户数',
  `statistic_date` date NOT NULL COMMENT '统计日期',
  `site_id` int(11) NOT NULL COMMENT '统计站点',
  PRIMARY KEY (`access_count`),
  KEY `fk_jc_access_count_site` (`site_id`),
  CONSTRAINT `fk_jc_access_count_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每日统计页数访问情况';

-- ----------------------------
-- Records of jc_site_access_count
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_site_access_pages`
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_access_pages`;
CREATE TABLE `jc_site_access_pages` (
  `access_pages_id` int(11) NOT NULL AUTO_INCREMENT,
  `access_page` varchar(255) NOT NULL COMMENT '访问页面',
  `session_id` varchar(32) NOT NULL,
  `access_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '访问日期',
  `access_time` time NOT NULL COMMENT '访问时间',
  `visit_second` int(11) NOT NULL DEFAULT '0' COMMENT '停留时长（秒）',
  `page_index` int(11) NOT NULL DEFAULT '0' COMMENT '用户访问页面的索引',
  `site_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`access_pages_id`),
  KEY `fk_jc_access_pages_access` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='访问详细页面表';

-- ----------------------------
-- Records of jc_site_access_pages
-- ----------------------------
INSERT INTO `jc_site_access_pages` VALUES ('1', 'http://localhost:8080/toolbox/', '54342ECBB17EB8967CF14F552305BD8D', '2015-05-12', '09:58:27', '224', '1', '1');
INSERT INTO `jc_site_access_pages` VALUES ('2', 'http://localhost:8080/toolbox/', '54342ECBB17EB8967CF14F552305BD8D', '2015-05-12', '10:02:11', '55', '2', '1');
INSERT INTO `jc_site_access_pages` VALUES ('3', 'http://localhost:8080/toolbox/', '54342ECBB17EB8967CF14F552305BD8D', '2015-05-12', '10:03:06', '9', '3', '1');
INSERT INTO `jc_site_access_pages` VALUES ('4', 'http://localhost:8080/toolbox/', '54342ECBB17EB8967CF14F552305BD8D', '2015-05-12', '10:03:15', '0', '4', '1');

-- ----------------------------
-- Table structure for `jc_site_access_statistic`
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_access_statistic`;
CREATE TABLE `jc_site_access_statistic` (
  `access_statistic_id` int(11) NOT NULL AUTO_INCREMENT,
  `statistic_date` date NOT NULL COMMENT '统计日期',
  `pv` int(11) NOT NULL DEFAULT '0' COMMENT 'pv量',
  `ip` int(11) NOT NULL DEFAULT '0' COMMENT 'ip量',
  `visitors` int(11) NOT NULL DEFAULT '0' COMMENT '访客数量',
  `pages_aver` int(11) NOT NULL DEFAULT '0' COMMENT '人均浏览次数',
  `visit_second_aver` int(11) NOT NULL DEFAULT '0' COMMENT '人均访问时长（秒）',
  `site_id` int(11) NOT NULL COMMENT '站点id',
  `statisitc_type` varchar(255) NOT NULL DEFAULT 'all' COMMENT '统计分类（all代表当天所有访问量的统计）',
  `statistic_column_value` varchar(255) DEFAULT '' COMMENT '统计列值',
  PRIMARY KEY (`access_statistic_id`),
  KEY `fk_jc_access_statistic_site` (`site_id`),
  CONSTRAINT `fk_jc_access_statistic_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='访问统计表';

-- ----------------------------
-- Records of jc_site_access_statistic
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_site_attr`
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_attr`;
CREATE TABLE `jc_site_attr` (
  `site_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_attr_site` (`site_id`),
  CONSTRAINT `fk_jc_attr_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS站点属性表';

-- ----------------------------
-- Records of jc_site_attr
-- ----------------------------
INSERT INTO `jc_site_attr` VALUES ('1', 'pvTotal', '140');
INSERT INTO `jc_site_attr` VALUES ('1', 'visitors', '34');

-- ----------------------------
-- Table structure for `jc_site_cfg`
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_cfg`;
CREATE TABLE `jc_site_cfg` (
  `site_id` int(11) NOT NULL,
  `cfg_name` varchar(30) NOT NULL COMMENT '名称',
  `cfg_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_cfg_site` (`site_id`),
  CONSTRAINT `fk_jc_cfg_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS站点配置表';

-- ----------------------------
-- Records of jc_site_cfg
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_site_company`
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_company`;
CREATE TABLE `jc_site_company` (
  `site_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '公司名称',
  `scale` varchar(255) DEFAULT NULL COMMENT '公司规模',
  `nature` varchar(255) DEFAULT NULL COMMENT '公司性质',
  `industry` varchar(1000) DEFAULT NULL COMMENT '公司行业',
  `contact` varchar(500) DEFAULT NULL COMMENT '联系方式',
  `description` text COMMENT '公司简介',
  `address` varchar(500) DEFAULT NULL COMMENT '公司地址',
  `longitude` float(5,2) DEFAULT NULL COMMENT '经度',
  `latitude` float(4,2) DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`site_id`),
  CONSTRAINT `fk_jc_company_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司信息';

-- ----------------------------
-- Records of jc_site_company
-- ----------------------------
INSERT INTO `jc_site_company` VALUES ('1', 'toolbox开发站', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `jc_site_model`
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_model`;
CREATE TABLE `jc_site_model` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(50) NOT NULL COMMENT '字段',
  `model_label` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `upload_path` varchar(100) DEFAULT NULL COMMENT '上传路径',
  `text_size` varchar(20) DEFAULT NULL COMMENT '长度',
  `area_rows` varchar(3) DEFAULT NULL COMMENT '文本行数',
  `area_cols` varchar(3) DEFAULT NULL COMMENT '文本列数',
  `help` varchar(255) DEFAULT NULL COMMENT '帮助信息',
  `help_position` varchar(1) DEFAULT NULL COMMENT '帮助位置',
  `data_type` int(11) DEFAULT '1' COMMENT '0:编辑器;1:文本框;2:文本区;3:图片;4:附件',
  `is_single` tinyint(1) DEFAULT '1' COMMENT '是否独占一行',
  PRIMARY KEY (`model_id`),
  UNIQUE KEY `ak_field` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS站点信息模型表';

-- ----------------------------
-- Records of jc_site_model
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_site_txt`
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_txt`;
CREATE TABLE `jc_site_txt` (
  `site_id` int(11) NOT NULL,
  `txt_name` varchar(30) NOT NULL COMMENT '名称',
  `txt_value` longtext COMMENT '值',
  KEY `fk_jc_txt_site` (`site_id`),
  CONSTRAINT `fk_jc_txt_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS站点文本表';

-- ----------------------------
-- Records of jc_site_txt
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_task`
-- ----------------------------
DROP TABLE IF EXISTS `jc_task`;
CREATE TABLE `jc_task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_code` varchar(255) DEFAULT NULL COMMENT '任务执行代码',
  `task_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '任务类型(1首页静态化、2栏目页静态化、3内容页静态化、4采集、5分发)',
  `task_name` varchar(255) NOT NULL COMMENT '任务名称',
  `job_class` varchar(255) NOT NULL COMMENT '任务类',
  `execycle` tinyint(1) NOT NULL DEFAULT '1' COMMENT '执行周期分类(1非表达式 2 cron表达式)',
  `day_of_month` int(11) DEFAULT NULL COMMENT '每月的哪天',
  `day_of_week` tinyint(1) DEFAULT NULL COMMENT '周几',
  `hour` int(11) DEFAULT NULL COMMENT '小时',
  `minute` int(11) DEFAULT NULL COMMENT '分钟',
  `interval_hour` int(11) DEFAULT NULL COMMENT '间隔小时',
  `interval_minute` int(11) DEFAULT NULL COMMENT '间隔分钟',
  `task_interval_unit` tinyint(1) DEFAULT NULL COMMENT '1分钟、2小时、3日、4周、5月',
  `cron_expression` varchar(255) DEFAULT NULL COMMENT '规则表达式',
  `is_enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `task_remark` varchar(255) DEFAULT NULL COMMENT '任务说明',
  `site_id` int(11) NOT NULL COMMENT '站点',
  `user_id` int(11) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`task_id`),
  KEY `fk_jc_task_site` (`site_id`),
  CONSTRAINT `fk_jc_task_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务表';

-- ----------------------------
-- Records of jc_task
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_task_attr`
-- ----------------------------
DROP TABLE IF EXISTS `jc_task_attr`;
CREATE TABLE `jc_task_attr` (
  `task_id` int(11) NOT NULL,
  `param_name` varchar(30) NOT NULL COMMENT '参数名称',
  `param_value` varchar(255) DEFAULT NULL COMMENT '参数值',
  KEY `fk_jc_attr_task` (`task_id`),
  CONSTRAINT `fk_jc_attr_task` FOREIGN KEY (`task_id`) REFERENCES `jc_task` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务参数表';

-- ----------------------------
-- Records of jc_task_attr
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_test`
-- ----------------------------
DROP TABLE IF EXISTS `jc_test`;
CREATE TABLE `jc_test` (
  `test_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_title` varchar(255) DEFAULT NULL,
  `test_description` varchar(255) DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`test_id`),
  KEY `fk_jc_test_user` (`user_id`),
  KEY `fk_jc_test_site` (`site_id`),
  CONSTRAINT `fk_jc_test_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_test_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试表';

-- ----------------------------
-- Records of jc_test
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_third_account`
-- ----------------------------
DROP TABLE IF EXISTS `jc_third_account`;
CREATE TABLE `jc_third_account` (
  `account_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_key` varchar(255) NOT NULL DEFAULT '' COMMENT '第三方账号key',
  `username` varchar(100) NOT NULL DEFAULT '0' COMMENT '关联用户名',
  `source` varchar(10) NOT NULL DEFAULT '' COMMENT '第三方账号平台(QQ、新浪微博等)',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='第三方登录平台账号';

-- ----------------------------
-- Records of jc_third_account
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_topic`
-- ----------------------------
DROP TABLE IF EXISTS `jc_topic`;
CREATE TABLE `jc_topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) DEFAULT NULL,
  `topic_name` varchar(150) NOT NULL COMMENT '名称',
  `short_name` varchar(150) DEFAULT NULL COMMENT '简称',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `title_img` varchar(100) DEFAULT NULL COMMENT '标题图',
  `content_img` varchar(100) DEFAULT NULL COMMENT '内容图',
  `tpl_content` varchar(100) DEFAULT NULL COMMENT '专题模板',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推??',
  PRIMARY KEY (`topic_id`),
  KEY `fk_jc_topic_channel` (`channel_id`),
  CONSTRAINT `fk_jc_topic_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='CMS专题表';

-- ----------------------------
-- Records of jc_topic
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_user`
-- ----------------------------
DROP TABLE IF EXISTS `jc_user`;
CREATE TABLE `jc_user` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `register_time` datetime NOT NULL COMMENT '注册时间',
  `register_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '注册IP',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '最后登录IP',
  `login_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `rank` int(11) NOT NULL DEFAULT '0' COMMENT '管理员级别',
  `upload_total` bigint(20) NOT NULL DEFAULT '0' COMMENT '上传总大小',
  `upload_size` int(11) NOT NULL DEFAULT '0' COMMENT '上传大小',
  `upload_date` date DEFAULT NULL COMMENT '上传日期',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否管理员',
  `is_self_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否只管理自己的数据',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ak_username` (`username`),
  KEY `fk_jc_user_group` (`group_id`),
  CONSTRAINT `fk_jc_user_group` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS用户表';

-- ----------------------------
-- Records of jc_user
-- ----------------------------
INSERT INTO `jc_user` VALUES ('1', '1', 'admin', '', '2011-01-03 00:00:00', '127.0.0.1', '2015-05-12 18:18:25', '0:0:0:0:0:0:0:1', '1044', '9', '197857', '45', '2014-08-29', '1', '0', '0');

-- ----------------------------
-- Table structure for `jc_user_attr`
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_attr`;
CREATE TABLE `jc_user_attr` (
  `user_id` int(11) NOT NULL,
  `attr_name` varchar(255) NOT NULL,
  `attr_value` varchar(255) DEFAULT NULL,
  KEY `fk_jc_attr_user` (`user_id`),
  CONSTRAINT `fk_jc_attr_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户属性表';

-- ----------------------------
-- Records of jc_user_attr
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_user_collection`
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_collection`;
CREATE TABLE `jc_user_collection` (
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `content_id` int(11) NOT NULL DEFAULT '0' COMMENT '内容id',
  PRIMARY KEY (`user_id`,`content_id`),
  KEY `fk_jc_user_collection_con` (`content_id`),
  CONSTRAINT `fk_jc_user_collection_con` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
  CONSTRAINT `fk_jc_user_collection_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户收藏关联表';

-- ----------------------------
-- Records of jc_user_collection
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_user_ext`
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_ext`;
CREATE TABLE `jc_user_ext` (
  `user_id` int(11) NOT NULL,
  `realname` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `gender` tinyint(1) DEFAULT NULL COMMENT '性别',
  `birthday` datetime DEFAULT NULL COMMENT '出生日期',
  `intro` varchar(255) DEFAULT NULL COMMENT '个人介绍',
  `comefrom` varchar(150) DEFAULT NULL COMMENT '来自',
  `qq` varchar(100) DEFAULT NULL COMMENT 'QQ',
  `msn` varchar(100) DEFAULT NULL COMMENT 'MSN',
  `phone` varchar(50) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机',
  `user_img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `user_signature` varchar(255) DEFAULT NULL COMMENT '用户个性签名',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_jc_ext_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS用户扩展信息表';

-- ----------------------------
-- Records of jc_user_ext
-- ----------------------------
INSERT INTO `jc_user_ext` VALUES ('1', '大师', null, null, null, '南昌', null, null, '1110', '110', '', '');

-- ----------------------------
-- Table structure for `jc_user_menu`
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_menu`;
CREATE TABLE `jc_user_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) NOT NULL COMMENT '菜单名称',
  `menu_url` varchar(255) NOT NULL COMMENT '菜单地址',
  `priority` int(11) NOT NULL DEFAULT '10',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`menu_id`),
  KEY `fk_jc_menu_user` (`user_id`),
  CONSTRAINT `fk_jc_menu_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户常用菜单';

-- ----------------------------
-- Records of jc_user_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_user_resume`
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_resume`;
CREATE TABLE `jc_user_resume` (
  `user_id` int(11) NOT NULL,
  `resume_name` varchar(255) NOT NULL COMMENT '简历名称',
  `target_worknature` varchar(255) DEFAULT NULL COMMENT '期望工作性质',
  `target_workplace` varchar(255) DEFAULT NULL COMMENT '期望工作地点',
  `target_category` varchar(255) DEFAULT NULL COMMENT '期望职位类别',
  `target_salary` varchar(255) DEFAULT NULL COMMENT '期望月薪',
  `edu_school` varchar(255) DEFAULT NULL COMMENT '毕业学校',
  `edu_graduation` datetime DEFAULT NULL COMMENT '毕业时间',
  `edu_back` varchar(255) DEFAULT NULL COMMENT '学历',
  `edu_discipline` varchar(255) DEFAULT NULL COMMENT '专业',
  `recent_company` varchar(500) DEFAULT NULL COMMENT '最近工作公司名称',
  `company_industry` varchar(255) DEFAULT NULL COMMENT '最近公司所属行业',
  `company_scale` varchar(255) DEFAULT NULL COMMENT '公司规模',
  `job_name` varchar(255) DEFAULT NULL COMMENT '职位名称',
  `job_category` varchar(255) DEFAULT NULL COMMENT '职位类别',
  `job_start` datetime DEFAULT NULL COMMENT '工作起始时间',
  `subordinates` varchar(255) DEFAULT NULL COMMENT '下属人数',
  `job_description` text COMMENT '工作描述',
  `self_evaluation` varchar(2000) DEFAULT NULL COMMENT '自我评价',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_jc_resume_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户简历';

-- ----------------------------
-- Records of jc_user_resume
-- ----------------------------
INSERT INTO `jc_user_resume` VALUES ('1', '程序员', '全职', '上海', 'java工程师', '', '家里蹲大学', null, '本科', '吃饭', '<img src=/tooladmin/toolbox/admin_global/o_update.do?password=111&groupId=1&rank=9&roleIds=1&siteIds=1&steps=2&allChannels=true&id=1＞', null, null, '11', null, null, null, '111', '111');

-- ----------------------------
-- Table structure for `jc_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_role`;
CREATE TABLE `jc_user_role` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `fk_jc_role_user` (`user_id`),
  CONSTRAINT `fk_jc_role_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_user_role` FOREIGN KEY (`role_id`) REFERENCES `jc_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS用户角色关联表';

-- ----------------------------
-- Records of jc_user_role
-- ----------------------------
INSERT INTO `jc_user_role` VALUES ('1', '1');

-- ----------------------------
-- Table structure for `jc_user_site`
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_site`;
CREATE TABLE `jc_user_site` (
  `usersite_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `check_step` tinyint(4) NOT NULL DEFAULT '1' COMMENT '审核级别',
  `is_all_channel` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否拥有所有栏目的权限',
  PRIMARY KEY (`usersite_id`),
  KEY `fk_jc_site_user` (`user_id`),
  KEY `fk_jc_user_site` (`site_id`),
  CONSTRAINT `fk_jc_site_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_user_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS管理员站点表';

-- ----------------------------
-- Records of jc_user_site
-- ----------------------------
INSERT INTO `jc_user_site` VALUES ('2', '1', '1', '3', '1');

-- ----------------------------
-- Table structure for `jc_vote_item`
-- ----------------------------
DROP TABLE IF EXISTS `jc_vote_item`;
CREATE TABLE `jc_vote_item` (
  `voteitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `votetopic_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '投票数量',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `subtopic_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`voteitem_id`),
  KEY `fk_jc_vote_item_topic` (`votetopic_id`),
  KEY `FK_jc_vote_item_subtopic` (`subtopic_id`),
  CONSTRAINT `FK_jc_vote_item_subtopic` FOREIGN KEY (`subtopic_id`) REFERENCES `jc_vote_subtopic` (`subtopic_id`),
  CONSTRAINT `fk_jc_vote_item_topic` FOREIGN KEY (`votetopic_id`) REFERENCES `jc_vote_topic` (`votetopic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='CMS投票项';

-- ----------------------------
-- Records of jc_vote_item
-- ----------------------------
INSERT INTO `jc_vote_item` VALUES ('1', '2', '不喜欢', '0', '3', '12');
INSERT INTO `jc_vote_item` VALUES ('2', '2', '喜欢', '0', '2', '12');
INSERT INTO `jc_vote_item` VALUES ('3', '2', '很喜欢', '1', '1', '12');
INSERT INTO `jc_vote_item` VALUES ('4', '2', '没有改进', '0', '7', '11');
INSERT INTO `jc_vote_item` VALUES ('5', '2', '有改进', '0', '5', '11');
INSERT INTO `jc_vote_item` VALUES ('6', '2', '改进很大', '1', '4', '11');
INSERT INTO `jc_vote_item` VALUES ('7', '2', '差不多', '0', '6', '11');
INSERT INTO `jc_vote_item` VALUES ('8', '2', '下载', '1', '11', '9');
INSERT INTO `jc_vote_item` VALUES ('9', '2', '新闻', '1', '8', '9');
INSERT INTO `jc_vote_item` VALUES ('10', '2', '图库', '1', '9', '9');
INSERT INTO `jc_vote_item` VALUES ('11', '2', '视频', '1', '10', '9');

-- ----------------------------
-- Table structure for `jc_vote_record`
-- ----------------------------
DROP TABLE IF EXISTS `jc_vote_record`;
CREATE TABLE `jc_vote_record` (
  `voterecored_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `votetopic_id` int(11) NOT NULL,
  `vote_time` datetime NOT NULL COMMENT '投票时间',
  `vote_ip` varchar(50) NOT NULL COMMENT '投票IP',
  `vote_cookie` varchar(32) NOT NULL COMMENT '投票COOKIE',
  PRIMARY KEY (`voterecored_id`),
  KEY `fk_jc_vote_record_topic` (`votetopic_id`),
  KEY `fk_jc_voterecord_user` (`user_id`),
  CONSTRAINT `fk_jc_vote_record_topic` FOREIGN KEY (`votetopic_id`) REFERENCES `jc_vote_topic` (`votetopic_id`),
  CONSTRAINT `fk_jc_voterecord_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS投票记录';

-- ----------------------------
-- Records of jc_vote_record
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_vote_reply`
-- ----------------------------
DROP TABLE IF EXISTS `jc_vote_reply`;
CREATE TABLE `jc_vote_reply` (
  `votereply_id` int(11) NOT NULL AUTO_INCREMENT,
  `reply` text COMMENT '回复内容',
  `subtopic_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`votereply_id`),
  KEY `FK_jc_vote_reply_sub` (`subtopic_id`),
  CONSTRAINT `FK_jc_vote_reply_sub` FOREIGN KEY (`subtopic_id`) REFERENCES `jc_vote_subtopic` (`subtopic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投票文本题目回复表';

-- ----------------------------
-- Records of jc_vote_reply
-- ----------------------------

-- ----------------------------
-- Table structure for `jc_vote_subtopic`
-- ----------------------------
DROP TABLE IF EXISTS `jc_vote_subtopic`;
CREATE TABLE `jc_vote_subtopic` (
  `subtopic_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `votetopic_id` int(11) NOT NULL DEFAULT '0' COMMENT '投票（调查）',
  `subtopic_type` int(2) NOT NULL DEFAULT '1' COMMENT '类型（1单选，2多选，3文本）',
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`subtopic_id`),
  KEY `FK_jc_vote_subtopic_vote` (`votetopic_id`),
  CONSTRAINT `FK_jc_vote_subtopic_vote` FOREIGN KEY (`votetopic_id`) REFERENCES `jc_vote_topic` (`votetopic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='投票子题目';

-- ----------------------------
-- Records of jc_vote_subtopic
-- ----------------------------
INSERT INTO `jc_vote_subtopic` VALUES ('9', '您觉得V5演示站哪些模块做的比较好', '2', '2', '4');
INSERT INTO `jc_vote_subtopic` VALUES ('10', '我觉得这里完善一下：', '2', '3', '3');
INSERT INTO `jc_vote_subtopic` VALUES ('11', 'V5版本比V2012sp1版的设计风格有改进吗？', '2', '1', '2');
INSERT INTO `jc_vote_subtopic` VALUES ('12', 'V5版本演示站网页的设计风格您喜欢吗？', '2', '1', '1');

-- ----------------------------
-- Table structure for `jc_vote_topic`
-- ----------------------------
DROP TABLE IF EXISTS `jc_vote_topic`;
CREATE TABLE `jc_vote_topic` (
  `votetopic_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `repeate_hour` int(11) DEFAULT NULL COMMENT '重复投票限制时间，单位小时，为空不允许重复投票',
  `total_count` int(11) NOT NULL DEFAULT '0' COMMENT '总投票数',
  `multi_select` int(11) NOT NULL DEFAULT '1' COMMENT '最多可以选择几项',
  `is_restrict_member` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限制会员',
  `is_restrict_ip` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限制IP',
  `is_restrict_cookie` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限制COOKIE',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `is_def` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认主题',
  PRIMARY KEY (`votetopic_id`),
  KEY `fk_jc_votetopic_site` (`site_id`),
  CONSTRAINT `fk_jc_votetopic_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS投票主题';

-- ----------------------------
-- Records of jc_vote_topic
-- ----------------------------
INSERT INTO `jc_vote_topic` VALUES ('2', '1', 'toolbox演示站改版用户问卷调查', 'toolboxv5版正式发布了，伴随着系统的完善，toolbox演示站的模板也一直在不断的改版，针对此次改版，toolbox美工团队特邀您参与“toolbox演示站改版用户问卷调查”，希望大家能提出宝贵的意见，我们一定认真改进，谢谢大家的支持！', null, null, null, '1', '1', '0', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for `jo_authentication`
-- ----------------------------
DROP TABLE IF EXISTS `jo_authentication`;
CREATE TABLE `jo_authentication` (
  `authentication_id` char(32) NOT NULL COMMENT '认证ID',
  `userid` int(11) NOT NULL COMMENT '用户ID',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `login_time` datetime NOT NULL COMMENT '登录时间',
  `login_ip` varchar(50) NOT NULL COMMENT '登录ip',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='认证信息表';

-- ----------------------------
-- Records of jo_authentication
-- ----------------------------

-- ----------------------------
-- Table structure for `jo_config`
-- ----------------------------
DROP TABLE IF EXISTS `jo_config`;
CREATE TABLE `jo_config` (
  `cfg_key` varchar(50) NOT NULL COMMENT '配置KEY',
  `cfg_value` varchar(255) DEFAULT NULL COMMENT '配置VALUE',
  PRIMARY KEY (`cfg_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置表';

-- ----------------------------
-- Records of jo_config
-- ----------------------------
INSERT INTO `jo_config` VALUES ('email_encoding', '');
INSERT INTO `jo_config` VALUES ('email_host', 'smtp.126.com');
INSERT INTO `jo_config` VALUES ('email_password', 'mingming_chen');
INSERT INTO `jo_config` VALUES ('email_personal', '');
INSERT INTO `jo_config` VALUES ('email_port', null);
INSERT INTO `jo_config` VALUES ('email_username', 'toolboxv5@126.com');
INSERT INTO `jo_config` VALUES ('login_error_interval', '30');
INSERT INTO `jo_config` VALUES ('login_error_times', '3');
INSERT INTO `jo_config` VALUES ('message_forgotpassword_subject', '找回toolbox密码');
INSERT INTO `jo_config` VALUES ('message_forgotpassword_text', '感谢您使用toolbox系统会员密码找回功能，请记住以下找回信息：\r\n用户ID：${uid}\r\n用户名：${username}\r\n您的新密码为：${resetPwd}\r\n请访问如下链接新密码才能生效：\r\nhttp://demo.toolbox.com/member/password_reset.jspx?uid=${uid}&key=${resetKey}');
INSERT INTO `jo_config` VALUES ('message_register_subject', '欢迎您注册toolbox用户');
INSERT INTO `jo_config` VALUES ('message_register_text', '${username}您好：\r\n欢迎您注册toolbox系统会员\r\n请点击以下链接进行激活\r\nhttp://demo.toolbox.com/active.jspx?username=${username}&key=${activationCode}');
INSERT INTO `jo_config` VALUES ('message_subject', 'toolbox会员密码找回信息');
INSERT INTO `jo_config` VALUES ('message_text', '感谢您使用toolbox系统会员密码找回功能，请记住以下找回信息：\r\n用户ID：${uid}\r\n用户名：${username}\r\n您的新密码为：${resetPwd}\r\n请访问如下链接新密码才能生效：\r\nhttp://localhost/member/password_reset.jspx?uid=${uid}&key=${resetKey}\r\n');

-- ----------------------------
-- Table structure for `jo_ftp`
-- ----------------------------
DROP TABLE IF EXISTS `jo_ftp`;
CREATE TABLE `jo_ftp` (
  `ftp_id` int(11) NOT NULL AUTO_INCREMENT,
  `ftp_name` varchar(100) NOT NULL COMMENT '名称',
  `ip` varchar(50) NOT NULL COMMENT 'IP',
  `port` int(11) NOT NULL DEFAULT '21' COMMENT '端口号',
  `username` varchar(100) DEFAULT NULL COMMENT '登录名',
  `password` varchar(100) DEFAULT NULL COMMENT '登陆密码',
  `encoding` varchar(20) NOT NULL DEFAULT 'UTF-8' COMMENT '编码',
  `timeout` int(11) DEFAULT NULL COMMENT '超时时间',
  `ftp_path` varchar(255) DEFAULT NULL COMMENT '路径',
  `url` varchar(255) NOT NULL COMMENT '访问URL',
  PRIMARY KEY (`ftp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='FTP表';

-- ----------------------------
-- Records of jo_ftp
-- ----------------------------

-- ----------------------------
-- Table structure for `jo_template`
-- ----------------------------
DROP TABLE IF EXISTS `jo_template`;
CREATE TABLE `jo_template` (
  `tpl_name` varchar(150) NOT NULL COMMENT '模板名称',
  `tpl_source` longtext COMMENT '模板内容',
  `last_modified` bigint(20) NOT NULL COMMENT '最后修改时间',
  `is_directory` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否目录',
  PRIMARY KEY (`tpl_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模板表';

-- ----------------------------
-- Records of jo_template
-- ----------------------------

-- ----------------------------
-- Table structure for `jo_upload`
-- ----------------------------
DROP TABLE IF EXISTS `jo_upload`;
CREATE TABLE `jo_upload` (
  `filename` varchar(150) NOT NULL COMMENT '文件名',
  `length` int(11) NOT NULL COMMENT '文件大小(字节)',
  `last_modified` bigint(20) NOT NULL COMMENT '最后修改时间',
  `content` longblob NOT NULL COMMENT '内容',
  PRIMARY KEY (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上传附件表';

-- ----------------------------
-- Records of jo_upload
-- ----------------------------

-- ----------------------------
-- Table structure for `jo_user`
-- ----------------------------
DROP TABLE IF EXISTS `jo_user`;
CREATE TABLE `jo_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  `password` char(32) NOT NULL COMMENT '密码',
  `register_time` datetime NOT NULL COMMENT '注册时间',
  `register_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '注册IP',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '最后登录IP',
  `login_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reset_key` char(32) DEFAULT NULL COMMENT '重置密码KEY',
  `reset_pwd` varchar(10) DEFAULT NULL COMMENT '重置密码VALUE',
  `error_time` datetime DEFAULT NULL COMMENT '登录错误时间',
  `error_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录错误次数',
  `error_ip` varchar(50) DEFAULT NULL COMMENT '登录错误IP',
  `activation` tinyint(1) NOT NULL DEFAULT '1' COMMENT '激活状态',
  `activation_code` char(32) DEFAULT NULL COMMENT '激活码',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ak_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of jo_user
-- ----------------------------
INSERT INTO `jo_user` VALUES ('1', 'admin', null, '5f4dcc3b5aa765d61d8327deb882cf99', '2011-01-03 00:00:00', '127.0.0.1', '2013-11-06 15:09:12', '127.0.0.1', '131', null, null, '2013-12-24 17:01:46', '1', '127.0.0.1', '1', null);
