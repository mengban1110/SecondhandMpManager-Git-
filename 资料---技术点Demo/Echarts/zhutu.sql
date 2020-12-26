/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50022
 Source Host           : localhost:3306
 Source Schema         : zhutu

 Target Server Type    : MySQL
 Target Server Version : 50022
 File Encoding         : 65001

 Date: 22/12/2020 12:30:26
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for shouru
-- ----------------------------
DROP TABLE IF EXISTS `shouru`;
CREATE TABLE `shouru`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `shouRuJinEr` int(11) NULL DEFAULT NULL,
  `riQi` date NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of shouru
-- ----------------------------
INSERT INTO `shouru` VALUES ('1', 50000, '2013-01-01');
INSERT INTO `shouru` VALUES ('10', 140000, '2013-10-01');
INSERT INTO `shouru` VALUES ('11', 150000, '2013-11-01');
INSERT INTO `shouru` VALUES ('12', 160000, '2013-12-01');
INSERT INTO `shouru` VALUES ('2', 60000, '2013-02-01');
INSERT INTO `shouru` VALUES ('3', 70000, '2013-03-01');
INSERT INTO `shouru` VALUES ('4', 80000, '2013-04-01');
INSERT INTO `shouru` VALUES ('5', 90000, '2013-05-01');
INSERT INTO `shouru` VALUES ('6', 100000, '2013-06-01');
INSERT INTO `shouru` VALUES ('7', 110000, '2013-07-01');
INSERT INTO `shouru` VALUES ('8', 120000, '2013-08-01');
INSERT INTO `shouru` VALUES ('9', 130000, '2013-09-01');

-- ----------------------------
-- Table structure for xuesheng
-- ----------------------------
DROP TABLE IF EXISTS `xuesheng`;
CREATE TABLE `xuesheng`  (
  `stu_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stu_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stu_sex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stu_native` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stu_hobby` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`stu_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of xuesheng
-- ----------------------------
INSERT INTO `xuesheng` VALUES (1, '176307659', '于佳林', '男', '河北#保定市#安国市', '编程 文学');
INSERT INTO `xuesheng` VALUES (2, '176307335', '翁煜', '男', '河北#张家口市#康保县', '看直播');
INSERT INTO `xuesheng` VALUES (3, '176307552', '刘华健', '男', '山东#济南市#天桥区', '音乐');
INSERT INTO `xuesheng` VALUES (4, '176307198', '刘光健', '男', '河北#廊坊市#安次区', '看书');
INSERT INTO `xuesheng` VALUES (5, '176307383', '袁志龙', '男', '河北#张家口市#崇礼县', '女');
INSERT INTO `xuesheng` VALUES (6, '170307312', '王鹏旭', '男', '河北#保定市#清苑县', 'lol ');
INSERT INTO `xuesheng` VALUES (7, '176307542', '李昕', '男', '河北#廊坊市#固安县', '学习');
INSERT INTO `xuesheng` VALUES (8, '176307506', '郭伟', '男', '河北#廊坊市#固安县', '绘画');
INSERT INTO `xuesheng` VALUES (9, '171307403', '翟宏昊', '男', '河北#保定市#涞水县', '篮球');
INSERT INTO `xuesheng` VALUES (10, '176307511', '侯慧宁', '女', '河南#安阳市#林州市', '打游戏');
INSERT INTO `xuesheng` VALUES (11, '176307295', '田鑫刚', '男', '河北#秦皇岛市#卢龙县', '学习');
INSERT INTO `xuesheng` VALUES (12, '176307055', '冯奕恺', '男', '河北#承德市#围场满族蒙古族自治县', '敲代码');
INSERT INTO `xuesheng` VALUES (13, '176307624', '王铄', '男', '河北#保定市#南市区', '看电影，旅游');
INSERT INTO `xuesheng` VALUES (14, '176307511', '侯慧宁', '女', '河南#安阳市#林州市', '打游戏');
INSERT INTO `xuesheng` VALUES (15, '176307582', '宁少聪', '男', '河北#邢台市#内丘县', '篮球');
INSERT INTO `xuesheng` VALUES (16, '176307491', '杜佳磊', '男', '河北#保定市#易　县', '打篮球');
INSERT INTO `xuesheng` VALUES (17, '176307066', '高泽林', '男', '河北#保定市#定州市', '女');
INSERT INTO `xuesheng` VALUES (18, '176307240', '孟繁森', '男', '河北#秦皇岛市#抚宁县', '打篮球');
INSERT INTO `xuesheng` VALUES (19, '176307119', '季境岭', '男', '河北#沧州市#沧　县', '学习');
INSERT INTO `xuesheng` VALUES (20, '176307748', '翟月钧', '男', '山西#大同市#浑源县', '听歌');
INSERT INTO `xuesheng` VALUES (21, '176307745', '杨盟岳', '男', '山西#大同市#新荣区', '羽毛球');
INSERT INTO `xuesheng` VALUES (22, '176307679', '张旭光', '男', '河北#邢台市#柏乡县', '学习');
INSERT INTO `xuesheng` VALUES (23, '176307626', '王维结', '男', '贵州#遵义市#湄潭县', '篮球');
INSERT INTO `xuesheng` VALUES (24, '176307686', '张悦', '女', '河北#保定市#徐水县', '学习');
INSERT INTO `xuesheng` VALUES (25, '176307732', '田家乐', '男', '山西#阳泉市#平定县', '学习');
INSERT INTO `xuesheng` VALUES (26, '176307450', '赵振伟', '男', '河北#邯郸市#峰峰矿区', '学习');
INSERT INTO `xuesheng` VALUES (27, '176307484', '陈珍', '男', '河北#张家口市#沽源县', '打篮球');
INSERT INTO `xuesheng` VALUES (28, '172307041', '刘丽斌', '男', '河北#邢台市#邢台县', '旅游');
INSERT INTO `xuesheng` VALUES (29, '176307127', '靳镫然', '男', '河北#邯郸市#丛台区', '听歌');
INSERT INTO `xuesheng` VALUES (30, '172307033', '冯炳杰', '男', '河北#邯郸市#永年县', '学习，运动，游戏');
INSERT INTO `xuesheng` VALUES (31, '176307625', '王铜', '男', '河北#张家口市#怀安县', '看书');
INSERT INTO `xuesheng` VALUES (32, '176307027', '陈源', '男', '河北#石家庄市#辛集市', '学习，游戏');
INSERT INTO `xuesheng` VALUES (33, '176307707', '朱昱安', '男', '河北#张家口市#万全县', '学习 ');
INSERT INTO `xuesheng` VALUES (34, '176307204', '刘立朴', '男', '河北#邢台市#临西县', '乒乓球');
INSERT INTO `xuesheng` VALUES (35, '176307604', '宋高健', '男', '河北#邢台市#隆尧县', '乒乓球');
INSERT INTO `xuesheng` VALUES (36, '176307153', '李威', '男', '河北#保定市#涞水县', '敲代码');
INSERT INTO `xuesheng` VALUES (37, '176307012', '蔡蓬勃', '男', '河北#保定市#高碑店市', '乒乓球');
INSERT INTO `xuesheng` VALUES (38, '176307742', '闫焰', '男', '山西#晋中市#平遥县', '尤物');
INSERT INTO `xuesheng` VALUES (39, '172307045', '王天策', '男', '河北#衡水市#桃城区', '大王老师');
INSERT INTO `xuesheng` VALUES (40, '176307225', '刘子豪', '男', '河北#邢台市#柏乡县', '运动');
INSERT INTO `xuesheng` VALUES (41, '176307351', '徐泊暄', '男', '河北#保定市#北市区', '女');
INSERT INTO `xuesheng` VALUES (42, '176307597', '申冬民', '男', '河北#衡水市#冀州市', '乒乓球');
INSERT INTO `xuesheng` VALUES (43, '176307085', '韩路', '男', '河北#廊坊市#市辖区', '篮球');
INSERT INTO `xuesheng` VALUES (44, '176307156', '李文超', '男', '河北#承德市#隆化县', '学习');
INSERT INTO `xuesheng` VALUES (45, '176307753', '周鑫辉', '男', '山西#临汾市#洪洞县', '打篮球');
INSERT INTO `xuesheng` VALUES (46, '172307043', '尚庆彬', '男', '河北#邯郸市#临漳县', '学习，打篮球，唱歌，跳舞，太多了就不一一列举了。。');
INSERT INTO `xuesheng` VALUES (47, '176307318', '王文杰', '男', '河北#张家口市#阳原县', '唱歌');
INSERT INTO `xuesheng` VALUES (48, '176307649', '闫中荣', '女', '河北#张家口市#尚义县', '学习，旅游，音乐');
INSERT INTO `xuesheng` VALUES (49, '176307259', '秦壮', '男', '河北#石家庄市#新乐市', '学习、打篮球');
INSERT INTO `xuesheng` VALUES (50, '176307627', '王新平', '男', '黑龙江#廊坊市#广阳区', '学习');
INSERT INTO `xuesheng` VALUES (51, '176307730', '石厚', '男', '山西#大同市#南郊区', '电子竞技');
INSERT INTO `xuesheng` VALUES (52, '176307690', '赵晨', '男', '河北#保定市#涿州市', '多了去了');
INSERT INTO `xuesheng` VALUES (53, '176307407', '张鹏飞', '男', '河北#承德市#平泉县', '篮球，游戏');
INSERT INTO `xuesheng` VALUES (54, '176307366', '杨坤', '男', '河北#邢台市#桥西区', '明日之后');
INSERT INTO `xuesheng` VALUES (55, '176307587', '祁艳红', '女', '河北#唐山市#迁安市', '钱');
INSERT INTO `xuesheng` VALUES (56, '176307083', '郭振添', '男', '河北#邯郸市#大名县', '学习');
INSERT INTO `xuesheng` VALUES (57, '176307723', '李天福', '男', '山西#太原市#小店区', '运动');
INSERT INTO `xuesheng` VALUES (58, '176307721', '李晶刚', '男', '山西#临汾市#洪洞县', '运动');
INSERT INTO `xuesheng` VALUES (59, '176307231', '罗云飞', '男', '河北#沧州市#河间市', '篮球，打代码');
INSERT INTO `xuesheng` VALUES (60, '176307556', '刘小龙', '男', '河北#邢台市#南和县', '篮球');
INSERT INTO `xuesheng` VALUES (61, '176307044', '杜林峰', '男', '河北#石家庄市#井陉县', '篮球');
INSERT INTO `xuesheng` VALUES (62, '176307035', '崔晓朋', '男', '河北#沧州市#吴桥县', '睡觉');
INSERT INTO `xuesheng` VALUES (63, '176307515', '胡文瑞', '男', '陕西#商洛市#商南县', 'bug');
INSERT INTO `xuesheng` VALUES (64, '176307477', '陈佳仪', '男', '河北#石家庄市#深泽县', '打篮球，听歌，');
INSERT INTO `xuesheng` VALUES (65, '176307595', '任金亮', '男', '河北#邯郸市#临漳县', '学习');
INSERT INTO `xuesheng` VALUES (67, '176307254', '皮刘硕', '男', '河北#保定市#北市区', '学习');
INSERT INTO `xuesheng` VALUES (68, '176307369', '杨硕', '男', '河北#沧州市#献　县', '听音乐');
INSERT INTO `xuesheng` VALUES (69, '176307221', '刘泽林', '男', '河北#石家庄市#井陉县', '女');
INSERT INTO `xuesheng` VALUES (70, '176307291', '唐汉陆', '男', '河北#秦皇岛市#抚宁县', '跆拳道');
INSERT INTO `xuesheng` VALUES (71, '176307485', '邓建强', '男', '陕西#渭南市#富平县', '蕾姆');
INSERT INTO `xuesheng` VALUES (72, '176307120', '冀朝阳', '男', '安徽#阜阳市#市辖区', '打代码');
INSERT INTO `xuesheng` VALUES (73, '176307655', '叶宇翔', '男', '陕西#西安市#碑林区', '篮球');
INSERT INTO `xuesheng` VALUES (74, '176307692', '赵磊', '男', '河南#周口市#项城市', 'Play the League of Legends ');

-- ----------------------------
-- Table structure for yuangongxinxi
-- ----------------------------
DROP TABLE IF EXISTS `yuangongxinxi`;
CREATE TABLE `yuangongxinxi`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `xueli` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of yuangongxinxi
-- ----------------------------
INSERT INTO `yuangongxinxi` VALUES ('1', '高中');
INSERT INTO `yuangongxinxi` VALUES ('10', '高中');
INSERT INTO `yuangongxinxi` VALUES ('2', '专科');
INSERT INTO `yuangongxinxi` VALUES ('3', '专科');
INSERT INTO `yuangongxinxi` VALUES ('4', '本科');
INSERT INTO `yuangongxinxi` VALUES ('5', '高中');
INSERT INTO `yuangongxinxi` VALUES ('6', '本科');
INSERT INTO `yuangongxinxi` VALUES ('7', '本科');
INSERT INTO `yuangongxinxi` VALUES ('8', '本科');
INSERT INTO `yuangongxinxi` VALUES ('9', '博士');

-- ----------------------------
-- Table structure for yusuan
-- ----------------------------
DROP TABLE IF EXISTS `yusuan`;
CREATE TABLE `yusuan`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `yuSuanJinEr` int(11) NULL DEFAULT NULL,
  `riQi` date NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of yusuan
-- ----------------------------
INSERT INTO `yusuan` VALUES ('1', 20000, '2013-01-01');
INSERT INTO `yusuan` VALUES ('10', 110000, '2013-10-01');
INSERT INTO `yusuan` VALUES ('11', 120000, '2013-11-01');
INSERT INTO `yusuan` VALUES ('12', 130000, '2013-12-01');
INSERT INTO `yusuan` VALUES ('2', 30000, '2013-02-01');
INSERT INTO `yusuan` VALUES ('3', 40000, '2013-03-01');
INSERT INTO `yusuan` VALUES ('4', 50000, '2013-04-01');
INSERT INTO `yusuan` VALUES ('5', 60000, '2013-05-01');
INSERT INTO `yusuan` VALUES ('6', 70000, '2013-06-01');
INSERT INTO `yusuan` VALUES ('7', 80000, '2013-07-01');
INSERT INTO `yusuan` VALUES ('8', 90000, '2013-08-01');
INSERT INTO `yusuan` VALUES ('9', 100000, '2013-09-01');

-- ----------------------------
-- Table structure for zhichu
-- ----------------------------
DROP TABLE IF EXISTS `zhichu`;
CREATE TABLE `zhichu`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `zhiChuJinEr` int(11) NULL DEFAULT NULL,
  `riQi` date NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zhichu
-- ----------------------------
INSERT INTO `zhichu` VALUES ('1', 40000, '2013-01-01');
INSERT INTO `zhichu` VALUES ('10', 50000, '2013-02-01');
INSERT INTO `zhichu` VALUES ('11', 60000, '2013-03-01');
INSERT INTO `zhichu` VALUES ('12', 70000, '2013-04-01');
INSERT INTO `zhichu` VALUES ('2', 80000, '2013-05-01');
INSERT INTO `zhichu` VALUES ('3', 90000, '2013-06-01');
INSERT INTO `zhichu` VALUES ('4', 10000, '2013-07-01');
INSERT INTO `zhichu` VALUES ('5', 11000, '2013-08-01');
INSERT INTO `zhichu` VALUES ('6', 12000, '2013-09-01');
INSERT INTO `zhichu` VALUES ('7', 130000, '2013-10-01');
INSERT INTO `zhichu` VALUES ('8', 140000, '2013-11-01');
INSERT INTO `zhichu` VALUES ('9', 150000, '2013-12-01');

-- ----------------------------
-- Table structure for zuoye
-- ----------------------------
DROP TABLE IF EXISTS `zuoye`;
CREATE TABLE `zuoye`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `wanchen` int(11) NULL DEFAULT NULL,
  `meiyou` int(11) NULL DEFAULT NULL,
  `riqi` date NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zuoye
-- ----------------------------
INSERT INTO `zuoye` VALUES ('001', 70, 12, '2018-12-24');
INSERT INTO `zuoye` VALUES ('002', 65, 9, '2018-12-25');
INSERT INTO `zuoye` VALUES ('003', 50, 24, '2018-12-26');
INSERT INTO `zuoye` VALUES ('004', 43, 31, '2018-12-27');
INSERT INTO `zuoye` VALUES ('005', 72, 2, '2018-12-28');
INSERT INTO `zuoye` VALUES ('006', 28, 46, '2018-12-29');
INSERT INTO `zuoye` VALUES ('007', 73, 1, '2018-12-30');

SET FOREIGN_KEY_CHECKS = 1;
