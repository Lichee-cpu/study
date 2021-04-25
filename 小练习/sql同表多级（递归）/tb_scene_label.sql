/*
 Navicat Premium Data Transfer

 Source Server         : srat
 Source Server Type    : MySQL
 Source Server Version : 50649
 Source Host           : 39.108.108.178:3306
 Source Schema         : tb_starclub

 Target Server Type    : MySQL
 Target Server Version : 50649
 File Encoding         : 65001

 Date: 25/04/2021 23:33:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_scene_label
-- ----------------------------
DROP TABLE IF EXISTS `tb_scene_label`;
CREATE TABLE `tb_scene_label`  (
  `label_id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(255) NULL DEFAULT NULL,
  `label_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`label_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_scene_label
-- ----------------------------
INSERT INTO `tb_scene_label` VALUES (1, 0, '换宿时长');
INSERT INTO `tb_scene_label` VALUES (2, 0, '城市');
INSERT INTO `tb_scene_label` VALUES (3, 0, '地理特征');
INSERT INTO `tb_scene_label` VALUES (4, 0, '换宿场景');
INSERT INTO `tb_scene_label` VALUES (5, 0, '工作时间');
INSERT INTO `tb_scene_label` VALUES (6, 0, '工作日常');
INSERT INTO `tb_scene_label` VALUES (7, 0, '薪资回报');
INSERT INTO `tb_scene_label` VALUES (8, 0, '专业技能');
INSERT INTO `tb_scene_label` VALUES (9, 1, '17天');
INSERT INTO `tb_scene_label` VALUES (10, 1, '14天');
INSERT INTO `tb_scene_label` VALUES (11, 1, '30天');
INSERT INTO `tb_scene_label` VALUES (12, 1, '30天+');
INSERT INTO `tb_scene_label` VALUES (13, 2, '一级城市');
INSERT INTO `tb_scene_label` VALUES (14, 2, '二级城市');
INSERT INTO `tb_scene_label` VALUES (15, 2, '三级城市');
INSERT INTO `tb_scene_label` VALUES (16, 3, '城市中心');
INSERT INTO `tb_scene_label` VALUES (17, 3, '城市周边');
INSERT INTO `tb_scene_label` VALUES (19, 3, '偏远乡村');
INSERT INTO `tb_scene_label` VALUES (20, 4, '名宿青旅');
INSERT INTO `tb_scene_label` VALUES (21, 4, '咖啡书店');
INSERT INTO `tb_scene_label` VALUES (22, 4, '餐吧酒吧');
INSERT INTO `tb_scene_label` VALUES (23, 4, '农家乐');
INSERT INTO `tb_scene_label` VALUES (24, 4, '其他');
INSERT INTO `tb_scene_label` VALUES (25, 5, '7天/周');
INSERT INTO `tb_scene_label` VALUES (26, 5, '6天/周');
INSERT INTO `tb_scene_label` VALUES (27, 5, '5天/周');
INSERT INTO `tb_scene_label` VALUES (28, 5, '4天/周');
INSERT INTO `tb_scene_label` VALUES (29, 6, '不用做饭');
INSERT INTO `tb_scene_label` VALUES (30, 6, '不用打扫客房');
INSERT INTO `tb_scene_label` VALUES (31, 7, '免费食宿');
INSERT INTO `tb_scene_label` VALUES (32, 7, '加班补贴');
INSERT INTO `tb_scene_label` VALUES (33, 7, '纯薪资');
INSERT INTO `tb_scene_label` VALUES (34, 7, '赠旅游险');
INSERT INTO `tb_scene_label` VALUES (35, 7, '车票报销');
INSERT INTO `tb_scene_label` VALUES (36, 8, '摄影');
INSERT INTO `tb_scene_label` VALUES (37, 8, '烘焙');
INSERT INTO `tb_scene_label` VALUES (38, 8, '室内设计');
INSERT INTO `tb_scene_label` VALUES (39, 8, '园艺设计');
INSERT INTO `tb_scene_label` VALUES (40, 8, '外语交流');
INSERT INTO `tb_scene_label` VALUES (41, 8, '教育陪读');
INSERT INTO `tb_scene_label` VALUES (42, 8, '活动策划');
INSERT INTO `tb_scene_label` VALUES (43, 8, '新媒体运营');

SET FOREIGN_KEY_CHECKS = 1;
