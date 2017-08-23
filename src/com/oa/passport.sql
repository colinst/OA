
CREATE DATABASE `passport`;

USE `passport`;

/*Table structure for table `service` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` varchar(32) NOT NULL DEFAULT '' COMMENT '编号',
  `user_name` varchar(32)NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '登录密码',
  PRIMARY KEY (`user_id`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `service` */

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `user_id` varchar(32) NOT NULL DEFAULT '' COMMENT '编号',
  `role_id` int(11)NOT NULL DEFAULT '' COMMENT '权限',
  `role_name` varchar(32) NOT NULL DEFAULT '' COMMENT '权限名称',
  PRIMARY KEY (`user_id`),
  PRIMARY KEY (`role_id`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_role` */












/*Table structure for table `identity` */

DROP TABLE IF EXISTS `identity`;

CREATE TABLE `identity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '身份名称',
  `icon` varchar(256) DEFAULT '' COMMENT '图标',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  `createTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `modifyTime` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `identity` */

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资讯',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '资讯标题',
  `obstract` varchar(128) NOT NULL DEFAULT '' COMMENT '内容摘要',
  `cover` varchar(256) NOT NULL DEFAULT '' COMMENT '资讯封面图',
  `linkUrl` varchar(256) NOT NULL DEFAULT '' COMMENT '链接地址(H5页面)',
  `commentNum` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `clickCount` int(11) NOT NULL DEFAULT '0' COMMENT '点击次数',
  `status` tinyint(4) DEFAULT '1' COMMENT '文章状态',
  `createTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `modifyTime` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `news` */

/*Table structure for table `news_click_log` */

DROP TABLE IF EXISTS `news_click_log`;

CREATE TABLE `news_click_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newsId` int(11) NOT NULL COMMENT '点击的资讯ID',
  `userId` int(11) NOT NULL COMMENT '用户ID',
  `clickCount` int(11) NOT NULL DEFAULT '0' COMMENT '点击次数',
  `createTime` int(11) NOT NULL DEFAULT '0' COMMENT '第一次点击时间',
  `modifyTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后点击的时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `news_click_log` */

/*Table structure for table `news_comment` */

DROP TABLE IF EXISTS `news_comment`;

CREATE TABLE `news_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newsId` int(11) NOT NULL COMMENT '资讯ID',
  `userId` int(11) NOT NULL COMMENT '评论的用户ID',
  `content` varchar(1024) NOT NULL DEFAULT '' COMMENT '评论内容',
  `likingCount` int(11) DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `ip` varchar(32) DEFAULT '',
  `creatTime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `news_comment` */

/*Table structure for table `news_comment_liking` */

DROP TABLE IF EXISTS `news_comment_liking`;

CREATE TABLE `news_comment_liking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newsId` int(11) NOT NULL,
  `newsCommentId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createTime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `news_comment_liking` */

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL COMMENT '家长ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '姓名',
  `sex` tinyint(4) NOT NULL DEFAULT '1' COMMENT '性别',
  `age` int(11) NOT NULL DEFAULT '0' COMMENT '年龄',
  `headImg` varchar(256) NOT NULL DEFAULT '' COMMENT '头像',
  `grade` varchar(32) NOT NULL DEFAULT '' COMMENT '年级',
  `status` int(11) NOT NULL DEFAULT '0',
  `createTime` int(11) NOT NULL DEFAULT '0',
  `modifyTime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `student` */

/*Table structure for table `student_subject` */

DROP TABLE IF EXISTS `student_subject`;

CREATE TABLE `student_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` int(11) NOT NULL,
  `subjectId` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `student_subject` */

/*Table structure for table `subject` */

DROP TABLE IF EXISTS `subject`;

CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '科目名称',
  `icon` varchar(256) DEFAULT '',
  `grades` varchar(256) NOT NULL DEFAULT '' COMMENT '年级',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` int(11) NOT NULL DEFAULT '0',
  `modifyTime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `subject` */

/*Table structure for table `teacher_comment` */

DROP TABLE IF EXISTS `teacher_comment`;

CREATE TABLE `teacher_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacherId` int(11) NOT NULL COMMENT '老师ID',
  `userId` int(11) NOT NULL COMMENT '评论的用户ID',
  `content` varchar(256) NOT NULL DEFAULT '' COMMENT '评论的内容',
  `subjectId` int(11) NOT NULL DEFAULT '0' COMMENT '科目的ID',
  `subjectName` varchar(32) NOT NULL DEFAULT '' COMMENT '科目的名称',
  `likingCount` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数量',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `ip` varchar(32) DEFAULT '',
  `createTime` int(11) NOT NULL DEFAULT '0',
  `modifyTime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `teacher_comment` */

/*Table structure for table `teacher_comment_liking` */

DROP TABLE IF EXISTS `teacher_comment_liking`;

CREATE TABLE `teacher_comment_liking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacherId` int(11) NOT NULL COMMENT '老师ID',
  `teacherCommentId` int(11) NOT NULL COMMENT '老师的评论ID',
  `userId` int(11) NOT NULL COMMENT '点赞用户ID',
  `createTime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `teacher_comment_liking` */

/*Table structure for table `teacher_subject` */

DROP TABLE IF EXISTS `teacher_subject`;

CREATE TABLE `teacher_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacherId` int(11) NOT NULL COMMENT '老师ID',
  `subjectId` int(11) NOT NULL DEFAULT '0' COMMENT '科目ID',
  `price` double(11,2) DEFAULT '0.00' COMMENT '费用',
  `unit` varchar(32) DEFAULT '' COMMENT '计费单位',
  `classForm` int(11) DEFAULT '-1' COMMENT '课堂形式(1/1、1/n)',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态1.启用-1禁用',
  `createTime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `teacher_subject` */

/*Table structure for table `service` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '注册手机号',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '登录密码',
  `headImg` varchar(256) NOT NULL DEFAULT '' COMMENT '用户头像地址',
  `nickName` varchar(32) DEFAULT '' COMMENT '昵称',
  `sex` tinyint(4) DEFAULT '1' COMMENT '性别1.男2.女0.保密',
  `identity` int(11) DEFAULT '0' COMMENT '用户身份0默认',
  `authStatus` tinyint(4) DEFAULT '0' COMMENT '认证状态1.已认证0.未认证2认证中',
  `address` varchar(128) DEFAULT '' COMMENT '地址',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态1.正常-1禁用',
  `appVerison` varchar(32) DEFAULT '' COMMENT '用户客户端版本',
  `loginTime` int(11) DEFAULT '0' COMMENT '最后一次登录时间',
  `registTime` int(11) DEFAULT '0' COMMENT '注册时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `service` */

/*Table structure for table `user_auth` */

DROP TABLE IF EXISTS `user_auth`;

CREATE TABLE `user_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `realName` varchar(32) NOT NULL,
  `cardNo` varchar(32) DEFAULT '',
  `imgFront` varchar(256) DEFAULT '' COMMENT '身份证正面图',
  `imgBack` varchar(256) DEFAULT '' COMMENT '身份证反面图',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1.通过认证0.等待认证-1认证失败',
  `remark` varchar(128) DEFAULT '' COMMENT '处理备注信息',
  `createTime` int(11) NOT NULL DEFAULT '0',
  `modifyTime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_auth` */

/*Table structure for table `user_follow` */

DROP TABLE IF EXISTS `user_follow`;

CREATE TABLE `user_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '关注人用户ID',
  `observedId` int(11) NOT NULL DEFAULT '0' COMMENT '被关注的用户ID',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '关注状态1.正常0.取消',
  `createTime` int(11) NOT NULL COMMENT '创建时间',
  `modifyTime` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_follow` */

/*Table structure for table `user_login_log` */

DROP TABLE IF EXISTS `user_login_log`;

CREATE TABLE `user_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT '0' COMMENT '登录的用户ID',
  `deviceName` varchar(32) DEFAULT '' COMMENT '登录的设备名称',
  `loginIp` varchar(32) DEFAULT '' COMMENT '登录的IP',
  `loginTime` int(11) NOT NULL DEFAULT '0' COMMENT '登录的时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_login_log` */

/*Table structure for table `user_score` */

DROP TABLE IF EXISTS `user_score`;

CREATE TABLE `user_score` (
  `userId` int(11) NOT NULL,
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '当前积分',
  `useScore` int(11) NOT NULL DEFAULT '0' COMMENT '已使用的积分',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '用户积分状态1.可使用0.不可使用',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_score` */

/*Table structure for table `user_score_log` */

DROP TABLE IF EXISTS `user_score_log`;

CREATE TABLE `user_score_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `score` int(11) NOT NULL COMMENT '积分',
  `leftScore` int(11) NOT NULL COMMENT '剩余积分',
  `type` tinyint(4) NOT NULL COMMENT '积分使用类型',
  `remark` varchar(64) NOT NULL DEFAULT '' COMMENT '使用备注',
  `ext` varchar(256) DEFAULT '' COMMENT '备注括展信息',
  `createTime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_score_log` */

/*Table structure for table `user_setting` */

DROP TABLE IF EXISTS `user_setting`;

CREATE TABLE `user_setting` (
  `userId` int(11) NOT NULL COMMENT '字段根据用户具体设置信息而定',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_setting` */

/*Table structure for table `user_teacher` */

DROP TABLE IF EXISTS `user_teacher`;

CREATE TABLE `user_teacher` (
  `userId` int(11) NOT NULL,
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '身份',
  `area` varchar(32) NOT NULL DEFAULT '' COMMENT '区域',
  `level` varchar(32) DEFAULT '' COMMENT '教师等级(初级-中级-高级)',
  `educationReceived` varchar(32) DEFAULT '' COMMENT '学历',
  `method` tinyint(4) NOT NULL DEFAULT '0' COMMENT '受教方式(在线教育、上门教育)',
  `resume` varchar(4096) DEFAULT '' COMMENT '教师简历',
  `commentNum` int(11) DEFAULT '0' COMMENT '评价次数',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_teacher` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
