
CREATE DATABASE `passport`;

USE `passport`;

/*Table structure for table `service` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` varchar(32) NOT NULL DEFAULT '' COMMENT '���',
  `user_name` varchar(32)NOT NULL DEFAULT '' COMMENT '�ǳ�',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '��¼����',
  PRIMARY KEY (`user_id`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `service` */

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `user_id` varchar(32) NOT NULL DEFAULT '' COMMENT '���',
  `role_id` int(11)NOT NULL DEFAULT '' COMMENT 'Ȩ��',
  `role_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'Ȩ������',
  PRIMARY KEY (`user_id`),
  PRIMARY KEY (`role_id`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_role` */












/*Table structure for table `identity` */

DROP TABLE IF EXISTS `identity`;

CREATE TABLE `identity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '�������',
  `icon` varchar(256) DEFAULT '' COMMENT 'ͼ��',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '״̬',
  `createTime` int(11) NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `modifyTime` int(11) NOT NULL DEFAULT '0' COMMENT '�޸�ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `identity` */

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '��Ѷ',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '��Ѷ����',
  `obstract` varchar(128) NOT NULL DEFAULT '' COMMENT '����ժҪ',
  `cover` varchar(256) NOT NULL DEFAULT '' COMMENT '��Ѷ����ͼ',
  `linkUrl` varchar(256) NOT NULL DEFAULT '' COMMENT '���ӵ�ַ(H5ҳ��)',
  `commentNum` int(11) NOT NULL DEFAULT '0' COMMENT '������',
  `clickCount` int(11) NOT NULL DEFAULT '0' COMMENT '�������',
  `status` tinyint(4) DEFAULT '1' COMMENT '����״̬',
  `createTime` int(11) NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `modifyTime` int(11) DEFAULT '0' COMMENT '�޸�ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `news` */

/*Table structure for table `news_click_log` */

DROP TABLE IF EXISTS `news_click_log`;

CREATE TABLE `news_click_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newsId` int(11) NOT NULL COMMENT '�������ѶID',
  `userId` int(11) NOT NULL COMMENT '�û�ID',
  `clickCount` int(11) NOT NULL DEFAULT '0' COMMENT '�������',
  `createTime` int(11) NOT NULL DEFAULT '0' COMMENT '��һ�ε��ʱ��',
  `modifyTime` int(11) NOT NULL DEFAULT '0' COMMENT '�������ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `news_click_log` */

/*Table structure for table `news_comment` */

DROP TABLE IF EXISTS `news_comment`;

CREATE TABLE `news_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newsId` int(11) NOT NULL COMMENT '��ѶID',
  `userId` int(11) NOT NULL COMMENT '���۵��û�ID',
  `content` varchar(1024) NOT NULL DEFAULT '' COMMENT '��������',
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
  `parentId` int(11) NOT NULL COMMENT '�ҳ�ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '����',
  `sex` tinyint(4) NOT NULL DEFAULT '1' COMMENT '�Ա�',
  `age` int(11) NOT NULL DEFAULT '0' COMMENT '����',
  `headImg` varchar(256) NOT NULL DEFAULT '' COMMENT 'ͷ��',
  `grade` varchar(32) NOT NULL DEFAULT '' COMMENT '�꼶',
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
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '��Ŀ����',
  `icon` varchar(256) DEFAULT '',
  `grades` varchar(256) NOT NULL DEFAULT '' COMMENT '�꼶',
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
  `teacherId` int(11) NOT NULL COMMENT '��ʦID',
  `userId` int(11) NOT NULL COMMENT '���۵��û�ID',
  `content` varchar(256) NOT NULL DEFAULT '' COMMENT '���۵�����',
  `subjectId` int(11) NOT NULL DEFAULT '0' COMMENT '��Ŀ��ID',
  `subjectName` varchar(32) NOT NULL DEFAULT '' COMMENT '��Ŀ������',
  `likingCount` int(11) NOT NULL DEFAULT '0' COMMENT '��������',
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
  `teacherId` int(11) NOT NULL COMMENT '��ʦID',
  `teacherCommentId` int(11) NOT NULL COMMENT '��ʦ������ID',
  `userId` int(11) NOT NULL COMMENT '�����û�ID',
  `createTime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `teacher_comment_liking` */

/*Table structure for table `teacher_subject` */

DROP TABLE IF EXISTS `teacher_subject`;

CREATE TABLE `teacher_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacherId` int(11) NOT NULL COMMENT '��ʦID',
  `subjectId` int(11) NOT NULL DEFAULT '0' COMMENT '��ĿID',
  `price` double(11,2) DEFAULT '0.00' COMMENT '����',
  `unit` varchar(32) DEFAULT '' COMMENT '�Ʒѵ�λ',
  `classForm` int(11) DEFAULT '-1' COMMENT '������ʽ(1/1��1/n)',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '״̬1.����-1����',
  `createTime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `teacher_subject` */

/*Table structure for table `service` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT 'ע���ֻ���',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '��¼����',
  `headImg` varchar(256) NOT NULL DEFAULT '' COMMENT '�û�ͷ���ַ',
  `nickName` varchar(32) DEFAULT '' COMMENT '�ǳ�',
  `sex` tinyint(4) DEFAULT '1' COMMENT '�Ա�1.��2.Ů0.����',
  `identity` int(11) DEFAULT '0' COMMENT '�û����0Ĭ��',
  `authStatus` tinyint(4) DEFAULT '0' COMMENT '��֤״̬1.����֤0.δ��֤2��֤��',
  `address` varchar(128) DEFAULT '' COMMENT '��ַ',
  `status` tinyint(4) DEFAULT '1' COMMENT '״̬1.����-1����',
  `appVerison` varchar(32) DEFAULT '' COMMENT '�û��ͻ��˰汾',
  `loginTime` int(11) DEFAULT '0' COMMENT '���һ�ε�¼ʱ��',
  `registTime` int(11) DEFAULT '0' COMMENT 'ע��ʱ��',
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
  `imgFront` varchar(256) DEFAULT '' COMMENT '���֤����ͼ',
  `imgBack` varchar(256) DEFAULT '' COMMENT '���֤����ͼ',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1.ͨ����֤0.�ȴ���֤-1��֤ʧ��',
  `remark` varchar(128) DEFAULT '' COMMENT '����ע��Ϣ',
  `createTime` int(11) NOT NULL DEFAULT '0',
  `modifyTime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_auth` */

/*Table structure for table `user_follow` */

DROP TABLE IF EXISTS `user_follow`;

CREATE TABLE `user_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '��ע���û�ID',
  `observedId` int(11) NOT NULL DEFAULT '0' COMMENT '����ע���û�ID',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '��ע״̬1.����0.ȡ��',
  `createTime` int(11) NOT NULL COMMENT '����ʱ��',
  `modifyTime` int(11) NOT NULL DEFAULT '0' COMMENT '�޸�ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_follow` */

/*Table structure for table `user_login_log` */

DROP TABLE IF EXISTS `user_login_log`;

CREATE TABLE `user_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT '0' COMMENT '��¼���û�ID',
  `deviceName` varchar(32) DEFAULT '' COMMENT '��¼���豸����',
  `loginIp` varchar(32) DEFAULT '' COMMENT '��¼��IP',
  `loginTime` int(11) NOT NULL DEFAULT '0' COMMENT '��¼��ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_login_log` */

/*Table structure for table `user_score` */

DROP TABLE IF EXISTS `user_score`;

CREATE TABLE `user_score` (
  `userId` int(11) NOT NULL,
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '��ǰ����',
  `useScore` int(11) NOT NULL DEFAULT '0' COMMENT '��ʹ�õĻ���',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '�û�����״̬1.��ʹ��0.����ʹ��',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_score` */

/*Table structure for table `user_score_log` */

DROP TABLE IF EXISTS `user_score_log`;

CREATE TABLE `user_score_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `score` int(11) NOT NULL COMMENT '����',
  `leftScore` int(11) NOT NULL COMMENT 'ʣ�����',
  `type` tinyint(4) NOT NULL COMMENT '����ʹ������',
  `remark` varchar(64) NOT NULL DEFAULT '' COMMENT 'ʹ�ñ�ע',
  `ext` varchar(256) DEFAULT '' COMMENT '��ע��չ��Ϣ',
  `createTime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_score_log` */

/*Table structure for table `user_setting` */

DROP TABLE IF EXISTS `user_setting`;

CREATE TABLE `user_setting` (
  `userId` int(11) NOT NULL COMMENT '�ֶθ����û�����������Ϣ����',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_setting` */

/*Table structure for table `user_teacher` */

DROP TABLE IF EXISTS `user_teacher`;

CREATE TABLE `user_teacher` (
  `userId` int(11) NOT NULL,
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '���',
  `area` varchar(32) NOT NULL DEFAULT '' COMMENT '����',
  `level` varchar(32) DEFAULT '' COMMENT '��ʦ�ȼ�(����-�м�-�߼�)',
  `educationReceived` varchar(32) DEFAULT '' COMMENT 'ѧ��',
  `method` tinyint(4) NOT NULL DEFAULT '0' COMMENT '�̷ܽ�ʽ(���߽��������Ž���)',
  `resume` varchar(4096) DEFAULT '' COMMENT '��ʦ����',
  `commentNum` int(11) DEFAULT '0' COMMENT '���۴���',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_teacher` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
