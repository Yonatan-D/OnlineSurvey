/*
Navicat MySQL Data Transfer

Source Server         : MySQL80
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : surveydb

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2020-04-10 22:01:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_answer`
-- ----------------------------
DROP TABLE IF EXISTS `t_answer`;
CREATE TABLE `t_answer` (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `recycle_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `question_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_answer
-- ----------------------------

-- ----------------------------
-- Table structure for `t_an_checkbox`
-- ----------------------------
DROP TABLE IF EXISTS `t_an_checkbox`;
CREATE TABLE `t_an_checkbox` (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `qs_item_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `visibility` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_an_checkbox
-- ----------------------------
INSERT INTO `t_an_checkbox` VALUES ('01ff86f86ba74dbe84d2dd7310d6dfce', '没有遇到过问题', '18c6f4bb42254d11bbd84e82cb7619c6', '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('05739b6dbc6f463a854707b913ea9882', '2G（GPRS）', '39522a4b4e204fe59cf0983227d4c4d9', '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('064898a4bc814803822698e1bba16bfa', '公司、单位', null, '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('0677654f22ce4ed5bd27bb02bc6d5e91', '网上购物', '77ba2ee736d0412caa9d57cc6315cd64', '2', '1');
INSERT INTO `t_an_checkbox` VALUES ('079983d2800a483e829a1d770abddda3', '家里', null, '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('08dd5507838c4f258bab5794ccd99416', '靠闺蜜基友', '625314f363cd4141b7e11fab14b8518b', '2', '1');
INSERT INTO `t_an_checkbox` VALUES ('08dea3ccea4943a4a145d4688c188720', '查成绩', '0a2acd84a62c4beebb20bf0cbdb6960d', '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('13614eb3ef65435ba9ae42abe177b613', '其他 ____', '233b5853e7564856a66abbd8b01d79fd', '5', '1');
INSERT INTO `t_an_checkbox` VALUES ('14d8a23bef2d4839ab532b386c620834', '4G', '74dc6803a2994476a6b06e3cbd90bf8f', '2', '1');
INSERT INTO `t_an_checkbox` VALUES ('160c96b75dc245cba51870118ac539ad', '我不知道', '74dc6803a2994476a6b06e3cbd90bf8f', '4', '1');
INSERT INTO `t_an_checkbox` VALUES ('171d2002899449b88f13e6381b75ac11', '台式电脑', '8e5d276dcecc48b89784300678b178c3', '2', '1');
INSERT INTO `t_an_checkbox` VALUES ('184b343c56784411a4528d2d005977d8', '选项A', null, '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('241ca93e7d8f45c4a3f7748b16f5d9b2', 'Wi-Fi/WLAN', '74f6311805714adaba804be83cfb6e61', '2', '1');
INSERT INTO `t_an_checkbox` VALUES ('244429405a5b46d7924f5a9333c0d5d3', '其他', '77ba2ee736d0412caa9d57cc6315cd64', '6', '1');
INSERT INTO `t_an_checkbox` VALUES ('2d865f0caa5b4aba83b2542b3d634ecf', '学校', '233b5853e7564856a66abbd8b01d79fd', '3', '1');
INSERT INTO `t_an_checkbox` VALUES ('2ded93c55c054b98a54b4e7e08ac5034', '包装不良（有食物或汁水洒出来）', '142fbeabee4c415395ac2bf47ff336c9', '6', '1');
INSERT INTO `t_an_checkbox` VALUES ('2f289d74eb9c40d592bb91236342ea2a', '公司/单位', '233b5853e7564856a66abbd8b01d79fd', '2', '1');
INSERT INTO `t_an_checkbox` VALUES ('3066f2f8fa684d2d8e79b867ce1a1946', '中餐厅', '5ee1bda4a075432ba7dcbee46bb95987', '3', '1');
INSERT INTO `t_an_checkbox` VALUES ('30ba8ea1de1f488ba4b9f557e8fa919b', '地铁、公交、火车等交通工具上', 'd6bf6a8d42444f748ca1ccacdc4345a2', '5', '1');
INSERT INTO `t_an_checkbox` VALUES ('31763f6dfda642eb896217db71058bed', '3G', '39522a4b4e204fe59cf0983227d4c4d9', '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('3401702ebae64a32b9ecaaf3ed307df5', '电脑（包括台式电脑和笔记本电脑）', 'a32f9b5e19b04bb2aec2f4a2db93cfb8', '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('34e4bd76cde7418bb58c48068da8541c', '饭食', '77ba2ee736d0412caa9d57cc6315cd64', '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('4279328eedfe41f395bad9a7679544ec', '手机', '80b8f25f0878480a9ab5a3ad49073e84', '5', '1');
INSERT INTO `t_an_checkbox` VALUES ('43ccefc2fcd747378ae9a347bc68c79f', '网吧', null, '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('486fc254900f486b83eae3bfe9556f25', '家里', '048d3562e92542cc8cc679f0f5427018', '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('4b0008936f624650a8fb1258ea806968', '饮料，零食等', '77ba2ee736d0412caa9d57cc6315cd64', '4', '1');
INSERT INTO `t_an_checkbox` VALUES ('4c7a1e6b7775447b86e6440ccafb8e28', '逛街', '77ba2ee736d0412caa9d57cc6315cd64', '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('4cf207f8b6ea458da0a322c1b15f1c1a', '其他 ____', '142fbeabee4c415395ac2bf47ff336c9', '7', '1');
INSERT INTO `t_an_checkbox` VALUES ('4f10fd8a7f2746c28c1dab52bd5b8c80', '异国风味类（泰国菜、印度菜等）', '5ee1bda4a075432ba7dcbee46bb95987', '6', '1');
INSERT INTO `t_an_checkbox` VALUES ('4f1c27d47c344cf4b3eb3213209cdbda', '宿舍', 'd6bf6a8d42444f748ca1ccacdc4345a2', '3', '1');
INSERT INTO `t_an_checkbox` VALUES ('4f99ca026f734f36adf90c8aedb2e1fc', '宿舍', '0db08599e240456fb4c6c969a9f5d9c7', '3', '1');
INSERT INTO `t_an_checkbox` VALUES ('4fb4740d1205494599445613c8ffb576', '其他 ____', '0db08599e240456fb4c6c969a9f5d9c7', '8', '1');
INSERT INTO `t_an_checkbox` VALUES ('501d2b5f35604629b93c282795910fed', '校花校草', null, '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('50af88fd57ca4cbda1ec937133bc219e', '味道不好', '142fbeabee4c415395ac2bf47ff336c9', '3', '1');
INSERT INTO `t_an_checkbox` VALUES ('5107b9a7e5b9460cbcd9c492bb1f042e', '校花校草', null, '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('5943981e43f64349ac837feaa7d5ea0a', '宵夜聚餐', '77ba2ee736d0412caa9d57cc6315cd64', '5', '1');
INSERT INTO `t_an_checkbox` VALUES ('5952f2042bde4bcd9b6e50c5686ebc6f', '网吧', '048d3562e92542cc8cc679f0f5427018', '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('5a3bbd52052b43648f8dd54d1ae3b630', '4G', '39522a4b4e204fe59cf0983227d4c4d9', '2', '1');
INSERT INTO `t_an_checkbox` VALUES ('5a5dea31832745c0a27ce11bfe0993e4', '娱乐', '77ba2ee736d0412caa9d57cc6315cd64', '3', '1');
INSERT INTO `t_an_checkbox` VALUES ('5a823a8ab4454b11b772f835c4f92e1c', '其他', '625314f363cd4141b7e11fab14b8518b', '4', '1');
INSERT INTO `t_an_checkbox` VALUES ('5cf7de967a58471bbbf8ef7890483b07', '123', null, '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('5d65ca1043754088be639429f4030b90', '其他 ____', '902ca2d18fe84a02891226f5c4f80a3d', '7', '1');
INSERT INTO `t_an_checkbox` VALUES ('5ef4ebdd69274f4f8fc898b6dc910be3', '等位、排队等', '0db08599e240456fb4c6c969a9f5d9c7', '7', '1');
INSERT INTO `t_an_checkbox` VALUES ('63fde995f0c04fc595f380e7d0f4aeb0', '宽带', '74f6311805714adaba804be83cfb6e61', '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('6c505c064ec74a49bd0be824b6162418', '其他 ____', '5ee1bda4a075432ba7dcbee46bb95987', '7', '1');
INSERT INTO `t_an_checkbox` VALUES ('6c8570cf93c8421b887d33161bc55d91', '平板电脑', 'a32f9b5e19b04bb2aec2f4a2db93cfb8', '2', '1');
INSERT INTO `t_an_checkbox` VALUES ('6cb5b56995db446a9fd7cef6247534ba', '以上均无', '80b8f25f0878480a9ab5a3ad49073e84', '6', '1');
INSERT INTO `t_an_checkbox` VALUES ('6fc5fe67e4b7482aa777f63141e6aedf', '日韩料理', '5ee1bda4a075432ba7dcbee46bb95987', '5', '1');
INSERT INTO `t_an_checkbox` VALUES ('6fdefab6fdd140eb920384b3d29d7d19', '表白墙', '0a2acd84a62c4beebb20bf0cbdb6960d', '4', '1');
INSERT INTO `t_an_checkbox` VALUES ('714b79bbaa294a8d966034f1414e8768', '我不知道', '39522a4b4e204fe59cf0983227d4c4d9', '4', '1');
INSERT INTO `t_an_checkbox` VALUES ('73f001e99a314de39de2f96429877ef2', '宽带', null, '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('7560ebbd4c58431e87d4927ef36f9a0c', '快餐类', '5ee1bda4a075432ba7dcbee46bb95987', '2', '1');
INSERT INTO `t_an_checkbox` VALUES ('777ce41c759b419c97b0b2bb18aa4b76', '台式电脑', '80b8f25f0878480a9ab5a3ad49073e84', '2', '1');
INSERT INTO `t_an_checkbox` VALUES ('7950696caedc482b90d7a0df709be2ae', '社团活动', '1c1758cd78a7418493f758bca5cb57c2', '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('7b6e75f2fc424b1894900d751f18875c', '投影仪', '80b8f25f0878480a9ab5a3ad49073e84', '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('7d212e463d524ce687fc00306c7f2b17', '手机', null, '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('7d62ed6fad364db28ea7ffa8e4ee06a9', '3G', '74dc6803a2994476a6b06e3cbd90bf8f', '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('7dc043f4a62440ec86d0ae81ecce159a', 'Wi-Fi/WLAN', '404f8d3d96634b9a81d706abb137b6cb', '2', '1');
INSERT INTO `t_an_checkbox` VALUES ('8053e750850941adb7a1aa6c5a6ed11c', '异国风味类（泰国菜、印度菜等）', '902ca2d18fe84a02891226f5c4f80a3d', '6', '1');
INSERT INTO `t_an_checkbox` VALUES ('80b05f99d59a4f2f858da09b16bcd0d1', '其他 ____', '18c6f4bb42254d11bbd84e82cb7619c6', '7', '1');
INSERT INTO `t_an_checkbox` VALUES ('80ec1fdd95c740dead36772ea92b2f5c', '没有遇到过问题', null, '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('82dd9e0ec16e4433a1da558ac7998db7', '公司、单位', '0db08599e240456fb4c6c969a9f5d9c7', '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('82fef6a739a948dfa122343f90001877', '包装不良（有食物或汁水洒出来）', '18c6f4bb42254d11bbd84e82cb7619c6', '6', '1');
INSERT INTO `t_an_checkbox` VALUES ('8388a26d310844cbbb1303e525444ce3', '电脑（包括台式电脑和笔记本电脑）', null, '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('8570e09b538a4e858b2d58c7e9441b45', '平板电脑', '33849be19e6d435897a241e7fb5e800c', '2', '1');
INSERT INTO `t_an_checkbox` VALUES ('85f353d667784fd0892b5c683e410a49', '局域网（学校或办公）', '404f8d3d96634b9a81d706abb137b6cb', '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('869bb6cfce3e42399675621f50cc782d', '电脑（包括台式电脑和笔记本电脑）', '33849be19e6d435897a241e7fb5e800c', '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('86fbad0da663483e814dd393521cc2e3', '其他 ____', '74f6311805714adaba804be83cfb6e61', '4', '1');
INSERT INTO `t_an_checkbox` VALUES ('88f44c328d8240149e5af6d33a47ae09', '3G', null, '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('894198450a004625b62a3f8f3ddac076', '份量太少', '142fbeabee4c415395ac2bf47ff336c9', '4', '1');
INSERT INTO `t_an_checkbox` VALUES ('89981be03446458ca8784b591c66557a', '学校', 'd6bf6a8d42444f748ca1ccacdc4345a2', '2', '1');
INSERT INTO `t_an_checkbox` VALUES ('89b16881d4e84817b76724c9648dd839', '学校', '048d3562e92542cc8cc679f0f5427018', '3', '1');
INSERT INTO `t_an_checkbox` VALUES ('8ef82932d6ee45a293d28fe7873e7c58', '其他 ____', '74dc6803a2994476a6b06e3cbd90bf8f', '5', '1');
INSERT INTO `t_an_checkbox` VALUES ('9134173725424eae920ebca493976331', '笔记本电脑', '8e5d276dcecc48b89784300678b178c3', '3', '1');
INSERT INTO `t_an_checkbox` VALUES ('928a58b183c84b4ca5b818901ddf0a26', '其他 ____', 'd6bf6a8d42444f748ca1ccacdc4345a2', '8', '1');
INSERT INTO `t_an_checkbox` VALUES ('92e8359a02da40b6a22359b997f7f917', '西餐厅', '5ee1bda4a075432ba7dcbee46bb95987', '4', '1');
INSERT INTO `t_an_checkbox` VALUES ('944ad975d4d74efdbe99f115507275f5', '网吧', '233b5853e7564856a66abbd8b01d79fd', '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('954c7949301541fea309c372915dd423', '家里', null, '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('965f754e16be402cb181687159d90bad', '等位、排队等', 'd6bf6a8d42444f748ca1ccacdc4345a2', '7', '1');
INSERT INTO `t_an_checkbox` VALUES ('97c895fa482c42fd8bb6b330159745c8', '地铁、公交、火车等交通工具上', '0db08599e240456fb4c6c969a9f5d9c7', '5', '1');
INSERT INTO `t_an_checkbox` VALUES ('98f4215b69de4f59a751d3b0ddca7885', '其他 ____', '33849be19e6d435897a241e7fb5e800c', '4', '1');
INSERT INTO `t_an_checkbox` VALUES ('99410d9b98cd4f8a924ad6a4c703651c', 'Pad', '8e5d276dcecc48b89784300678b178c3', '4', '1');
INSERT INTO `t_an_checkbox` VALUES ('99938bdea7e249b79ecc5ee73c92d079', '小吃类', null, '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('9b13a197cc824df5bae3fdcb094bc25c', '其他 ____', '39522a4b4e204fe59cf0983227d4c4d9', '5', '1');
INSERT INTO `t_an_checkbox` VALUES ('9e92a8db01954687bd269b9297f2e000', '校园街景', '0a2acd84a62c4beebb20bf0cbdb6960d', '6', '1');
INSERT INTO `t_an_checkbox` VALUES ('9feacad74ec74c219db166e81ca97b70', '送餐速度慢', '18c6f4bb42254d11bbd84e82cb7619c6', '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('a12e4b393fe24a268aa0979e50f0984f', '其他 ____', '404f8d3d96634b9a81d706abb137b6cb', '4', '1');
INSERT INTO `t_an_checkbox` VALUES ('a2edf436911849abb296ebc40f7d398e', '无线（Wifi/Wlan）', '74dc6803a2994476a6b06e3cbd90bf8f', '3', '1');
INSERT INTO `t_an_checkbox` VALUES ('a44dbc72cbca436bad0d695d999fa68a', '烧烤类', null, '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('a4800709fc524415aedc0d629b907176', '菜品与图片不符', '142fbeabee4c415395ac2bf47ff336c9', '2', '1');
INSERT INTO `t_an_checkbox` VALUES ('a5b08c2eb5ff47e6ad70f579e1275eb5', '我不知道', '74f6311805714adaba804be83cfb6e61', '3', '1');
INSERT INTO `t_an_checkbox` VALUES ('a6292441d4ea4485b75ab9116431d85a', '家里', '0db08599e240456fb4c6c969a9f5d9c7', '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('aa1167ff05224e9f9f688e78b991b0a7', 'IPTV', null, '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('aac08b20b44f4237be7fa73a76c9bfd5', '社团活动', null, '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('ac3e415ead634dee9cc0e7cfc5ce7a02', '奖学金', '625314f363cd4141b7e11fab14b8518b', '3', '1');
INSERT INTO `t_an_checkbox` VALUES ('ac7788181939449997c523df885a68fe', '电视', 'a32f9b5e19b04bb2aec2f4a2db93cfb8', '3', '1');
INSERT INTO `t_an_checkbox` VALUES ('b20bcfc0b8f94fc99b98df48f7826952', '娱乐场所（如KTV等）', 'd6bf6a8d42444f748ca1ccacdc4345a2', '4', '1');
INSERT INTO `t_an_checkbox` VALUES ('b24b219e4b5845ed83498ac38adff62d', '外出、旅行', 'd6bf6a8d42444f748ca1ccacdc4345a2', '6', '1');
INSERT INTO `t_an_checkbox` VALUES ('b45a85ab22724b209fbd78b1882598bb', '父母', '625314f363cd4141b7e11fab14b8518b', '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('b65904d35d534090babdd0a2c18ae4ce', '其他 ____', '0a2acd84a62c4beebb20bf0cbdb6960d', '8', '1');
INSERT INTO `t_an_checkbox` VALUES ('b69bdc2e7fb84788adac114ba717a5c8', '公司/单位', '048d3562e92542cc8cc679f0f5427018', '2', '1');
INSERT INTO `t_an_checkbox` VALUES ('b83205c777044f9c933d47d26a36dcd1', '其他 ____', '1c1758cd78a7418493f758bca5cb57c2', '3', '1');
INSERT INTO `t_an_checkbox` VALUES ('b9a7e6a880ad4c6fbe66bddf376e506c', '电视', '33849be19e6d435897a241e7fb5e800c', '3', '1');
INSERT INTO `t_an_checkbox` VALUES ('b9f84f44389440ea97940b29b36fb703', '2G（GPRS）', null, '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('ba2d8ced9f4c4a2599abaf8b88ca2869', '卫生不佳', '142fbeabee4c415395ac2bf47ff336c9', '5', '1');
INSERT INTO `t_an_checkbox` VALUES ('bf1af71371ea4161b7eec6701e4fc930', '其他 ____', 'a32f9b5e19b04bb2aec2f4a2db93cfb8', '4', '1');
INSERT INTO `t_an_checkbox` VALUES ('c0ce751a84a34026b31fe95ca3bf6c6c', '学校通知', null, '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('c11eb267d30e46ab935df8430fcfdd7b', '查成绩', null, '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('c1e4a2dfacd44514b15752dbe691a964', '无线（Wifi/Wlan）', '39522a4b4e204fe59cf0983227d4c4d9', '3', '1');
INSERT INTO `t_an_checkbox` VALUES ('c2becfbef11941a3a772c1fb75d7169b', '其他 ____', '048d3562e92542cc8cc679f0f5427018', '5', '1');
INSERT INTO `t_an_checkbox` VALUES ('c9770f5155cc449a8cb8c85e97ce365d', '手机', 'a32f9b5e19b04bb2aec2f4a2db93cfb8', '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('cb99a894af6b41c59e59cb1121856a74', '查成绩', null, '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('ce29f8386121445895b9e544a9ff6592', '123', null, '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('ce5e426a8a56466b80cdaa5448bbdadc', '份量太少', '18c6f4bb42254d11bbd84e82cb7619c6', '4', '1');
INSERT INTO `t_an_checkbox` VALUES ('d1a5719c3f3e43aeabfb09cadb762e92', '外出、旅行', '0db08599e240456fb4c6c969a9f5d9c7', '6', '1');
INSERT INTO `t_an_checkbox` VALUES ('d20f2b8ab1e04ee699d3f6840d1641c6', '投影仪', null, '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('d220b22dab044e18b61439fc8e4437c3', '学校', '0db08599e240456fb4c6c969a9f5d9c7', '2', '1');
INSERT INTO `t_an_checkbox` VALUES ('d27124f64557421c95f0669221b16092', '兼职', '625314f363cd4141b7e11fab14b8518b', '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('d2800aed5ebd445f981d8c8529fcbe30', '局域网（学校或办公）', '74f6311805714adaba804be83cfb6e61', '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('d2e15292212c4c7980a5cc1aaa8462b7', '快餐类', '902ca2d18fe84a02891226f5c4f80a3d', '2', '1');
INSERT INTO `t_an_checkbox` VALUES ('d2f1142233824f1c8f064c58651fcbe5', 'IPTV', '8e5d276dcecc48b89784300678b178c3', '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('d30658002da842c78d4653feb9f1a8c1', '菜品与图片不符', '18c6f4bb42254d11bbd84e82cb7619c6', '2', '1');
INSERT INTO `t_an_checkbox` VALUES ('d58e7bdce9e743a4b2e40e610b9c9a8f', '手机', '8e5d276dcecc48b89784300678b178c3', '5', '1');
INSERT INTO `t_an_checkbox` VALUES ('d627df680f7541ec80116f8977a1a5a5', '笔记本电脑', '80b8f25f0878480a9ab5a3ad49073e84', '3', '1');
INSERT INTO `t_an_checkbox` VALUES ('d7ce1b99a585421b98d98c679dc6842e', '校花校草', '0a2acd84a62c4beebb20bf0cbdb6960d', '2', '1');
INSERT INTO `t_an_checkbox` VALUES ('d981e4e2a2ba4e0ea9d297b0055905b2', '中餐厅', '902ca2d18fe84a02891226f5c4f80a3d', '3', '1');
INSERT INTO `t_an_checkbox` VALUES ('d9829b1e296a43cea7aa65f58d36dc9d', '我不知道', '404f8d3d96634b9a81d706abb137b6cb', '3', '1');
INSERT INTO `t_an_checkbox` VALUES ('db9200a7dd5144ce9cb670cc043fbf1d', '原创文章', '1c1758cd78a7418493f758bca5cb57c2', '2', '1');
INSERT INTO `t_an_checkbox` VALUES ('dc0ff30483014270895fd61207209e35', '家里', '233b5853e7564856a66abbd8b01d79fd', '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('dd9e2cb52c784a7b90d00c36762c8241', 'IPTV', '80b8f25f0878480a9ab5a3ad49073e84', '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('de1020880d5740f49c400b5969954486', '47890', null, '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('e11cb3b4dd1d49448058c74ae36bf395', '味道不好', '18c6f4bb42254d11bbd84e82cb7619c6', '3', '1');
INSERT INTO `t_an_checkbox` VALUES ('e1a5fb0fdd0c41a4a78e98c66afc20dc', '投影仪', '8e5d276dcecc48b89784300678b178c3', '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('e5df23e6cade47f08c5aa40c795663fb', 'Pad', '80b8f25f0878480a9ab5a3ad49073e84', '4', '1');
INSERT INTO `t_an_checkbox` VALUES ('ea46f337395b4789b024c97f3f32cc9c', '2G（GPRS）', '74dc6803a2994476a6b06e3cbd90bf8f', '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('eaf482dc9e9e42cf951b0b7e48f12559', '宿舍', '048d3562e92542cc8cc679f0f5427018', '4', '1');
INSERT INTO `t_an_checkbox` VALUES ('eeb0e7a8bddb4ae28cf8609e9e3ced12', '娱乐场所（如KTV等）', '0db08599e240456fb4c6c969a9f5d9c7', '4', '1');
INSERT INTO `t_an_checkbox` VALUES ('eeb2853d2e784c0693316d3ad0df1837', '选项B', null, '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('f095e009a8a845f6a5006cebdaead1b0', '手机', '33849be19e6d435897a241e7fb5e800c', '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('f404498f794446eb9078728ba2ca3b3f', '宿舍', '233b5853e7564856a66abbd8b01d79fd', '4', '1');
INSERT INTO `t_an_checkbox` VALUES ('f41a39c31a6e46c78d554fba5ec5eeea', '局域网（学校或办公）', null, '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('f4c26eb81da44cf79342fc1ae0c5063f', '家里', 'd6bf6a8d42444f748ca1ccacdc4345a2', '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('f5ed5eaa330f46b89347f8de4fb8aca7', '西餐厅', '902ca2d18fe84a02891226f5c4f80a3d', '4', '1');
INSERT INTO `t_an_checkbox` VALUES ('f72c49c9b3e14bbbb433b5a3471c0723', '宽带', '404f8d3d96634b9a81d706abb137b6cb', '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('f9e3d771649241a9a103200826930c68', '送餐速度慢', null, '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('f9f693e3d2ac476990649554a90d0204', '没有遇到过问题', '142fbeabee4c415395ac2bf47ff336c9', '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('fa8c96f36fec4a7e9e0ce84e2215d76d', '卫生不佳', '18c6f4bb42254d11bbd84e82cb7619c6', '5', '1');
INSERT INTO `t_an_checkbox` VALUES ('fb7e894d8db54840896c6023d6697017', '学校通知', '1c1758cd78a7418493f758bca5cb57c2', '0', '1');
INSERT INTO `t_an_checkbox` VALUES ('fd81593492394382aa60a705f169dbf8', '日韩料理', '902ca2d18fe84a02891226f5c4f80a3d', '5', '1');
INSERT INTO `t_an_checkbox` VALUES ('fe277afcf2c74bbf8ae52efed4b0bb40', '送餐速度慢', '142fbeabee4c415395ac2bf47ff336c9', '1', '1');
INSERT INTO `t_an_checkbox` VALUES ('ffa7b6f153064922878af770fa0ee19c', '以上均无', '8e5d276dcecc48b89784300678b178c3', '6', '1');
INSERT INTO `t_an_checkbox` VALUES ('ffc929735c184059991f8000a293ac5e', '公司、单位', 'd6bf6a8d42444f748ca1ccacdc4345a2', '1', '1');

-- ----------------------------
-- Table structure for `t_an_radio`
-- ----------------------------
DROP TABLE IF EXISTS `t_an_radio`;
CREATE TABLE `t_an_radio` (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `qs_item_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `visibility` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_an_radio
-- ----------------------------
INSERT INTO `t_an_radio` VALUES ('005604f1c93d43b99245e365ce83e662', '7-10年（含10年）', '3df04df92934436691633433921837b9', '3', '1');
INSERT INTO `t_an_radio` VALUES ('00906f8d54734de7953abeffad040986', '朋友推荐', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('0126808f9593492b8b3d49f8fdf37b50', '18岁以下', '2413dcb52d254bac96058bde0ccbd6a5', '0', '1');
INSERT INTO `t_an_radio` VALUES ('0161ff6686804873b98ece511273e298', '退休', '46caaea0489e4bbf9b476fc7737b0192', '10', '1');
INSERT INTO `t_an_radio` VALUES ('01b9fc07ce0d47ec9a3674b13a29de3a', '其他', '34a4b7a6ab484132a3cc5518b0fdfe43', '4', '1');
INSERT INTO `t_an_radio` VALUES ('0219c9eaaa4043bdb35eb7fe61a18700', '10小时以上', '5412bc52e4204df0b3c58de3d594d6fa', '5', '1');
INSERT INTO `t_an_radio` VALUES ('035c35b7d9c5498a9b0c10278ea3d905', '8-10小时（含10小时）', '8c2e3b75e2ee409ba561c2b0ad3bcbe8', '4', '1');
INSERT INTO `t_an_radio` VALUES ('0600535fbbbf4ff29bef972d3036f3a2', '5-8小时（含8小时）', '5d210b03ba4c4885832ce73b459de854', '3', '1');
INSERT INTO `t_an_radio` VALUES ('0656d756013e4ca9bd748716525ab9f1', '3-5小时（含5小时）', '5d210b03ba4c4885832ce73b459de854', '2', '1');
INSERT INTO `t_an_radio` VALUES ('06ccb717e6fa474aae56e00dd7b44a9d', '123', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('06d2b1601cf846a0b34cf7138ae8da00', '暂无职业', '46caaea0489e4bbf9b476fc7737b0192', '12', '1');
INSERT INTO `t_an_radio` VALUES ('072848c69fa84397aafdba8780a30126', '51~60岁', '1b6362a2ebba40459abf114f35609079', '5', '1');
INSERT INTO `t_an_radio` VALUES ('07377a34f0c142c6aa69452eca695884', '1年以下', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('07bcf4e671634cb7ade4a2e1f6281608', '一荤两素', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('07c8c139d43c4ef6a6c200cc4f34b7d1', '30分钟以内', 'c923f8c360744b978f1e28f92c7c019a', '0', '1');
INSERT INTO `t_an_radio` VALUES ('07e8bc64c3024ebab0236a2b8fc0b8e1', '农林牧渔劳动者', '84aea8d11a9048abbf04ab23af1d77d3', '9', '1');
INSERT INTO `t_an_radio` VALUES ('083377d639c94a019a6865f4ca46bb7c', '10—20个', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('09922eabce7f4d1795bee9267a8ff64a', '手机/电话', '0ddb6d59a6484b7c8bae05a3af44fa31', '0', '1');
INSERT INTO `t_an_radio` VALUES ('09aa2e6097a14f60a1ce82c4e4441711', '8-10小时（含10小时）', '5412bc52e4204df0b3c58de3d594d6fa', '4', '1');
INSERT INTO `t_an_radio` VALUES ('0a2b315a147e4352b1d8fa26df29300c', '是', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('0a2ce40f0a814a0d9dbd7c03bb1d48a9', '选项A', 'f569d5142f304bfb81e108bb6d2301dc', '0', '1');
INSERT INTO `t_an_radio` VALUES ('0aebc679cd9e471e8bc1fa271494b78e', '自由职业者', '724fa4e30afd4e6284d208ee2b4d36b1', '8', '1');
INSERT INTO `t_an_radio` VALUES ('0b7b95fb5b8e44e899d1634ee7efef13', '初中', '51ed0211a1c9410593f0c2a958ba0bd1', '1', '1');
INSERT INTO `t_an_radio` VALUES ('0cfb143a5b6b491e819db86f407e818c', '无所谓', '6701b73e88874724b9295bc05c303cf5', '2', '1');
INSERT INTO `t_an_radio` VALUES ('0d0f146c5f4444f987f413dd60aae3b0', '向食品监管部门投诉', '3a60b96cb23d4608b742724769bb4473', '2', '1');
INSERT INTO `t_an_radio` VALUES ('0d4c71f41f294747a71a656acc2f9379', '15元以内', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('0d89567c3f0e4d45892a922e7897a67a', '其他 ____', '5058645c8ab04f31b8948dd1615ce32f', '5', '1');
INSERT INTO `t_an_radio` VALUES ('0da92dd5432045989929a5cc11938919', '上网查询', 'd1df94cd4bdf49488418b96a05cc8298', '2', '1');
INSERT INTO `t_an_radio` VALUES ('0f391c69570f46b0bb57e4c70010bcfa', '18岁以下', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('10139f32630f456fb71309a2a5787e02', '普通职员（办公室/写字楼工作人员）', '46caaea0489e4bbf9b476fc7737b0192', '3', '1');
INSERT INTO `t_an_radio` VALUES ('11018e00f5c14c3084769095d37f42f8', '123', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('12198bcf75f7409e9e1881ab2c160ce9', '公司餐厅', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('147ef2325ae5446faa4e5f67b9dcd394', '两天一次', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('14e5d256145346b0a649bab81509de4e', '专业人员（如医生/律师/文体/记者/老师等）', '84aea8d11a9048abbf04ab23af1d77d3', '4', '1');
INSERT INTO `t_an_radio` VALUES ('15a8d3782dac41ccaed163bf92bb8bb9', '123', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('1640de36b4564793a91979f6f92ff88d', '在线完成一部分，线下教材/辅导资料完成一部分', 'cd36be3192394591b7dc6819321233ad', '1', '1');
INSERT INTO `t_an_radio` VALUES ('16b572c9f28d4257ae29ec186a4956d1', '女', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('171952bc57b24d02b6e31c9ff18b8c96', '上餐馆', 'fe392eb4ba764e60b9121b85e9dd3f91', '1', '1');
INSERT INTO `t_an_radio` VALUES ('17b40a2223184ce3b319ab2b53bebbb5', '否', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('17efe779853d4d87accfd09206867eec', '小学及以下', '167240aaa1e24f5183684b1d33be77d4', '0', '1');
INSERT INTO `t_an_radio` VALUES ('184a5f6c13f94c10a9c5b309fd990495', '在线完成一部分，线下教材/辅导资料完成一部分', '8a4ae59245b04c5f8313f469a99ad18f', '1', '1');
INSERT INTO `t_an_radio` VALUES ('1880f8bbbc1d481abd2fafe6fe150117', '10-15年（含15年）', '3df04df92934436691633433921837b9', '4', '1');
INSERT INTO `t_an_radio` VALUES ('188a3fe5fc0841a6a69ba9f9350631fe', '1-3年（含3年）', '3df04df92934436691633433921837b9', '1', '1');
INSERT INTO `t_an_radio` VALUES ('18ade01906b5485688c6c97f13044b76', '600-2400', 'c70dc58d99504050bc4fdfd4a8002f16', '2', '1');
INSERT INTO `t_an_radio` VALUES ('1a20ad6e35fe4e66a59b7a755ff74322', '8-10小时（含10小时）', '66e8b5f9d6364c3ea7e85332c95f774a', '4', '1');
INSERT INTO `t_an_radio` VALUES ('1a5d1824803b4cc7b9bd5c737e8aeb36', '1次/周', 'b763792ffc9748d5b0f3c8f52889c7e1', '1', '1');
INSERT INTO `t_an_radio` VALUES ('1aecaafaa02e47b191413dc55ed88659', '晚上睡觉前', 'ba7a8451c7474efe9e61a786439e1b82', '3', '1');
INSERT INTO `t_an_radio` VALUES ('1cbd6bf0c8054ef3b7cdf1b7fff837d7', '到店/电话与老板沟通', '3a60b96cb23d4608b742724769bb4473', '1', '1');
INSERT INTO `t_an_radio` VALUES ('1d351f3135e347c3b4875d0ceeb07d23', '大一', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('1d81ec611b32412f9c43643be10a7ef9', '大四', '34a4b7a6ab484132a3cc5518b0fdfe43', '3', '1');
INSERT INTO `t_an_radio` VALUES ('1e88fe492803471ba47ad0f18608eee1', '其他 ____', '84aea8d11a9048abbf04ab23af1d77d3', '13', '1');
INSERT INTO `t_an_radio` VALUES ('1eb889aafa984aa8a9adb8ba4269389d', '1次/周', 'c86ba53fbd004d4898060d5a74c4e2bc', '1', '1');
INSERT INTO `t_an_radio` VALUES ('1fad04271fd84910a6fec76395d92011', '早上起床后', 'ba7a8451c7474efe9e61a786439e1b82', '0', '1');
INSERT INTO `t_an_radio` VALUES ('1fd60f7a008845bc820c403c89ba87c5', '男', '6becaf43f8d8451a88cea429ede483eb', '0', '1');
INSERT INTO `t_an_radio` VALUES ('203dfa1fca8642259ef6647631d6a19f', '31~40岁', '2413dcb52d254bac96058bde0ccbd6a5', '3', '1');
INSERT INTO `t_an_radio` VALUES ('20d446d5a8324aabae96a25787a1035b', '放在心里，下次再也不买了', '71d9470d38764af885f41d3b04c81419', '3', '1');
INSERT INTO `t_an_radio` VALUES ('21ec8b293c9440bbaf5476d93592ed32', '15—20元', '8fde0aa2b74a4bd8b0dc87128a832a44', '1', '1');
INSERT INTO `t_an_radio` VALUES ('21efd26b7de1403d93ae7af30581e32e', '1-3小时（含3小时）', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('22870de691b340d1b7f5f37d2f27cfc7', '普通工人（如工厂工人/体力劳动者等）', '46caaea0489e4bbf9b476fc7737b0192', '5', '1');
INSERT INTO `t_an_radio` VALUES ('23026a0c26ae4c859bf653f0eaa867d3', '10-15年（含15年）', '529a75fe627c4ec88062b44e5ef0c352', '4', '1');
INSERT INTO `t_an_radio` VALUES ('238812a584f24f699937b06c55c925da', '朋友们都叫了外卖', '5ea431d35e884ba1a6049efca1f540e4', '4', '1');
INSERT INTO `t_an_radio` VALUES ('2441aee59afb49dcb8f67ba4ff1fd43f', '初中生', '9a95c92760db4907b91ecbf0adec2f3b', '2', '1');
INSERT INTO `t_an_radio` VALUES ('24c28a2204bd44d9b7e3cdef764f0adc', '个体经营者/承包商', '84aea8d11a9048abbf04ab23af1d77d3', '7', '1');
INSERT INTO `t_an_radio` VALUES ('257cf7433ab649c9ae200e78451ba716', '朋友介绍', '11b33c6c00fa42d1866034337e2b8a0e', '1', '1');
INSERT INTO `t_an_radio` VALUES ('25ce0c5fdb46491582b7b7a93c575d10', '否', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('2613b970b61843b38ec7ea6e185fde1e', '专业人员（如医生/律师/文体/记者/老师等）', '46caaea0489e4bbf9b476fc7737b0192', '4', '1');
INSERT INTO `t_an_radio` VALUES ('2687d972ae7e4ea4ada0c41394ecb741', '1年以下', '3df04df92934436691633433921837b9', '0', '1');
INSERT INTO `t_an_radio` VALUES ('28d5bbfeb46b4e95a13deb584510a9fa', '工作/学习太忙时', 'bc9abfa058c1406fa32f263981a5e00a', '1', '1');
INSERT INTO `t_an_radio` VALUES ('2987a40d67e2445b9b1c36b10e3ecfbb', '暂无职业', '724fa4e30afd4e6284d208ee2b4d36b1', '12', '1');
INSERT INTO `t_an_radio` VALUES ('2a11e7bf642f408c99304cbf6ac18740', '1800-2600', '719c6ff9a0584daca39a09019c497d9f', '2', '1');
INSERT INTO `t_an_radio` VALUES ('2a981dfdb050475181b6374d1484d0b9', '没人一起吃饭', 'bc9abfa058c1406fa32f263981a5e00a', '3', '1');
INSERT INTO `t_an_radio` VALUES ('2af130b1a7a744b9b89a6448f2bcc2dc', '61-90分钟', '853007360e7d4131a76cccccfde14e55', '2', '1');
INSERT INTO `t_an_radio` VALUES ('2ba7d0d9dcd4498d8518247d696451c2', '社交平台（百度贴吧/新浪微博)', '3257d4316d45447eb61a08df231e9a62', '4', '1');
INSERT INTO `t_an_radio` VALUES ('2bc038d371bf4324b0ff3e1dbd573f03', '没人一起吃饭', '5ea431d35e884ba1a6049efca1f540e4', '3', '1');
INSERT INTO `t_an_radio` VALUES ('2bc0a2e3eae4452aa16c26d38bb5368a', '一荤两素', 'c1ad11c107c34c4c80d1be51f4348f97', '0', '1');
INSERT INTO `t_an_radio` VALUES ('2bf069593745488f8317195165e5f6b0', '3-5小时（含5小时）', '66e8b5f9d6364c3ea7e85332c95f774a', '2', '1');
INSERT INTO `t_an_radio` VALUES ('2de1047321e54bbaa9def2e0a2a6ea4d', '速度', '3c9603f826ee4200883476a839fc16e1', '2', '1');
INSERT INTO `t_an_radio` VALUES ('2e0a2ac22e8c454f90a4ca93a18ab0e5', '91-120分钟', 'c923f8c360744b978f1e28f92c7c019a', '3', '1');
INSERT INTO `t_an_radio` VALUES ('2eb7f4e284bb41a6ab793c8c21cc565a', '31—50元', '8fde0aa2b74a4bd8b0dc87128a832a44', '4', '1');
INSERT INTO `t_an_radio` VALUES ('2ef3ea842ae9436f8f9265cca589cb0c', '91-120分钟', '556c899b96354e9aaed7d9517fc20a45', '3', '1');
INSERT INTO `t_an_radio` VALUES ('2f30cf116b15497481c373b7b4fa93f5', '完全通过网络平台在线完成', 'cd36be3192394591b7dc6819321233ad', '0', '1');
INSERT INTO `t_an_radio` VALUES ('2f5b22ff84604368b5f7ec33d02fb1b5', '30-60分钟', 'c923f8c360744b978f1e28f92c7c019a', '1', '1');
INSERT INTO `t_an_radio` VALUES ('3042f17ea84343adad390b2f2aa7838d', '放在心里，下次再也不买了', '3a60b96cb23d4608b742724769bb4473', '3', '1');
INSERT INTO `t_an_radio` VALUES ('30ba506f772640f2bebdf1df77226c79', '中午休息时', 'ba7a8451c7474efe9e61a786439e1b82', '1', '1');
INSERT INTO `t_an_radio` VALUES ('3186d8725afb4e18875c8557e6cf3ac2', '30-60分钟', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('326504d34e4b4ba3b690a0cc3b5521d0', '初中', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('33214f98a09c48e8a54d34ac0e42b5d2', '手机/电话', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('33b71ff0e00c46f0b2e066f16d073052', '21—25元', '8fde0aa2b74a4bd8b0dc87128a832a44', '2', '1');
INSERT INTO `t_an_radio` VALUES ('33c7f163c3c544c397604528e67f3f4c', '123', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('3418b5b8407941ee8e91348e73faba62', '相关文章', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('3555209c81cc475a8f2a10b6c4192d81', '30-60分钟', '556c899b96354e9aaed7d9517fc20a45', '1', '1');
INSERT INTO `t_an_radio` VALUES ('35c1ea2da8734563b88e3bd3917cb9be', '录播课程（录制好的课程，不能互动只能观看）', '7c9cdb095d924da389bc20cd67bdf842', '1', '1');
INSERT INTO `t_an_radio` VALUES ('368e9a741d7e40b7bea63040590d424e', '是', '7a2486916fc44f8abb279ab5e1723516', '0', '1');
INSERT INTO `t_an_radio` VALUES ('36d00927a44848b4b89818449ecb9996', '30分钟以内', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('39327b08eb2b4a0faceee6ec0272d401', '0次', 'c86ba53fbd004d4898060d5a74c4e2bc', '0', '1');
INSERT INTO `t_an_radio` VALUES ('3953cd63256748aa99400770883f76c3', '校友', '5058645c8ab04f31b8948dd1615ce32f', '4', '1');
INSERT INTO `t_an_radio` VALUES ('39e9b1a58a6f4e3b9bdf6528e460bd8d', '选项B', '46caaea0489e4bbf9b476fc7737b0192', '1', '1');
INSERT INTO `t_an_radio` VALUES ('3b30da11aac04ddab401c4e14c2388c2', '30分钟以内', '5a3312dbfe0545c8af22b72ebc11c0ab', '0', '1');
INSERT INTO `t_an_radio` VALUES ('3d2d030aaf224e1b927540038de1d36a', '15年以上', '3df04df92934436691633433921837b9', '5', '1');
INSERT INTO `t_an_radio` VALUES ('3dd160c77bdd40d78f79cc08b14551d5', '一荤两素', 'de3e4a3b3169433e8a68425ccbc1c733', '0', '1');
INSERT INTO `t_an_radio` VALUES ('3f035a1925004237a33840ea4b316e03', '高中/中专/技校', '51ed0211a1c9410593f0c2a958ba0bd1', '2', '1');
INSERT INTO `t_an_radio` VALUES ('3fc61b79d26b4721854afa034c0275e2', '公司餐厅', 'fe392eb4ba764e60b9121b85e9dd3f91', '0', '1');
INSERT INTO `t_an_radio` VALUES ('400e2d864c3141e3ba1c81eb7fb8fb8d', '8-10小时（含10小时）', 'e622828dfc304e83936c7d0f151238a1', '4', '1');
INSERT INTO `t_an_radio` VALUES ('40500dd4e4484d429f390c59af953619', '有', '529843bd84464110afb58efc378ca0d3', '0', '1');
INSERT INTO `t_an_radio` VALUES ('409491dfca2749479e79dde04f215ba9', '相关文章', '3257d4316d45447eb61a08df231e9a62', '1', '1');
INSERT INTO `t_an_radio` VALUES ('4185116e9d234fb8aa0077ddc07a503f', '2400以上', '2a94675053ad419bb835c5a97fb405aa', '3', '1');
INSERT INTO `t_an_radio` VALUES ('423c424a680c4fdd9ad584eaeb6bc268', '111', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('425e9d5eedd34328ac69a0fe31851055', '口味', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('42b1b0612d9340f595019b5c6d29b9f8', '完全线下完成（教材/辅导资料等）', '8a4ae59245b04c5f8313f469a99ad18f', '2', '1');
INSERT INTO `t_an_radio` VALUES ('42cca87aa8f24a39a03aaad558bc63f5', '两荤两素', 'de3e4a3b3169433e8a68425ccbc1c733', '1', '1');
INSERT INTO `t_an_radio` VALUES ('458c250bdbeb451bbbfba1e4a2713b48', '15元以内', 'bc0976bf6d77430ca4e678c3d77d9a4c', '0', '1');
INSERT INTO `t_an_radio` VALUES ('4609067a145444bea6dee1d720657c08', '25~30岁', '2413dcb52d254bac96058bde0ccbd6a5', '2', '1');
INSERT INTO `t_an_radio` VALUES ('471c17fcb4e0447ea1ed375544189c07', '普通工人（如工厂工人/体力劳动者等）', '84aea8d11a9048abbf04ab23af1d77d3', '5', '1');
INSERT INTO `t_an_radio` VALUES ('47630d69fc6e42109492cf2a36a5eea2', '自带', 'fe392eb4ba764e60b9121b85e9dd3f91', '3', '1');
INSERT INTO `t_an_radio` VALUES ('47a694b7b4fe44ae9367b41338beac51', '高中生/职校生/中专生', '0487be1bb2b641c684db7084d81fcbb5', '3', '1');
INSERT INTO `t_an_radio` VALUES ('4934306c574f477aa253169a63e483a2', '想换个口味', 'bc9abfa058c1406fa32f263981a5e00a', '2', '1');
INSERT INTO `t_an_radio` VALUES ('49495563660e4353a4b7b3dcc37615a7', '男', '7b227bcfb14e4eca840a0e4db224ed03', '0', '1');
INSERT INTO `t_an_radio` VALUES ('4aa5ce7f40344fa888de11a7d9c7776b', '10-15元', 'f5c0124c6fc74587a0fa495127065913', '1', '1');
INSERT INTO `t_an_radio` VALUES ('4b06d5809a7248e4aeaf0fb2465b6e73', '是', '2d205fb586f34be1863bee20e92a262b', '0', '1');
INSERT INTO `t_an_radio` VALUES ('4b680aa9afa448e4bc5b219da21ebfd3', '1年以下', '529a75fe627c4ec88062b44e5ef0c352', '0', '1');
INSERT INTO `t_an_radio` VALUES ('4ddd8c9f01554c67ace4078b944e71cd', '1小时-1个半小时', '44d64c981e2747c1b2657279e61f6bc2', '2', '1');
INSERT INTO `t_an_radio` VALUES ('4ddda51a522d46a2a0e624c619169438', '10小时以上', 'e622828dfc304e83936c7d0f151238a1', '5', '1');
INSERT INTO `t_an_radio` VALUES ('4e059c1a7cfb4abebec193b4f5db6801', '选项B', 'f569d5142f304bfb81e108bb6d2301dc', '1', '1');
INSERT INTO `t_an_radio` VALUES ('4e20e7a622ed4a08969b5c9ef59bb9be', '自由职业者', '84aea8d11a9048abbf04ab23af1d77d3', '8', '1');
INSERT INTO `t_an_radio` VALUES ('4f5b09a4da954961b17b91789681d01a', '女', '6c938c2fa1744f7eba28e53b169c9135', '1', '1');
INSERT INTO `t_an_radio` VALUES ('4f6e8a2a880044be9f7fe770d1482e3c', '上课时间', 'ba7a8451c7474efe9e61a786439e1b82', '2', '1');
INSERT INTO `t_an_radio` VALUES ('50ab289b30af48b699bd7f9c2611d73c', '大一', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('50dcf41ece4b48b6b319fcd95aa7b708', '大二', '5058645c8ab04f31b8948dd1615ce32f', '1', '1');
INSERT INTO `t_an_radio` VALUES ('5130e49f640546aa99480176937ed0cd', '自由职业者', '46caaea0489e4bbf9b476fc7737b0192', '8', '1');
INSERT INTO `t_an_radio` VALUES ('53609c40fd8347caacaf58da0bfdfcfb', '硕士研究生及以上', '167240aaa1e24f5183684b1d33be77d4', '5', '1');
INSERT INTO `t_an_radio` VALUES ('537ae5548ad6463e9f213907c2a5f5df', '上网查询', '11b33c6c00fa42d1866034337e2b8a0e', '2', '1');
INSERT INTO `t_an_radio` VALUES ('53f991931dd74eb295e0beb62562b61a', '健康', '9b8100624c7f4f18a59213f8d132569d', '0', '1');
INSERT INTO `t_an_radio` VALUES ('547dd5245cd845c0b10b701e69e65900', '课程1', '7c0f30017dd440b2ba28a12de21be433', '0', '1');
INSERT INTO `t_an_radio` VALUES ('54afce33b594471f9364ef8d46632da9', '商业服务业职工（如销售人员/商店职员/服务员等）', '84aea8d11a9048abbf04ab23af1d77d3', '6', '1');
INSERT INTO `t_an_radio` VALUES ('54ee1f20ee134cf49c28e8d341cb269d', '叫外卖', '8eff71130701455097b2610b955f59b5', '2', '1');
INSERT INTO `t_an_radio` VALUES ('5518226ceed44296a66ee5fa23cef6c5', '速度', '9b8100624c7f4f18a59213f8d132569d', '2', '1');
INSERT INTO `t_an_radio` VALUES ('5573aee30573466c9e469bce5b182841', '有，都放银行卡里面了！', '8f558ea2be8240e0aeb8fcdd0bd58794', '1', '1');
INSERT INTO `t_an_radio` VALUES ('5701eb4eea7142a0a09e19f09b76951a', '30分钟以内', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('58d49461fdbf41fd90d82e2068fcb190', '5次/周', 'c86ba53fbd004d4898060d5a74c4e2bc', '3', '1');
INSERT INTO `t_an_radio` VALUES ('5962c836d1814203b49f1977fa0a3876', '222', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('59bd1a3cb6a94f4d85d145bb312fc1eb', '大四', '5058645c8ab04f31b8948dd1615ce32f', '3', '1');
INSERT INTO `t_an_radio` VALUES ('5b891e31d21644e79dbdec48c4e90139', '公司餐厅', '8eff71130701455097b2610b955f59b5', '0', '1');
INSERT INTO `t_an_radio` VALUES ('5c1b1476682d49c5abe07417fd9f3ca8', '大二', '34a4b7a6ab484132a3cc5518b0fdfe43', '1', '1');
INSERT INTO `t_an_radio` VALUES ('5c6ada2282144300844147939ee6e505', '农林牧渔劳动者', '46caaea0489e4bbf9b476fc7737b0192', '9', '1');
INSERT INTO `t_an_radio` VALUES ('5d780e175d844a0fae32062873755ad7', '51~60岁', '2413dcb52d254bac96058bde0ccbd6a5', '5', '1');
INSERT INTO `t_an_radio` VALUES ('5e2b45c5f2ae42b8834406bbd3944cce', '10个以内', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('5f5885e9fc87400d8ffb42d50554bfcb', '大二', '7aa795ec0b654626b77ce3b1478f8e5e', '1', '1');
INSERT INTO `t_an_radio` VALUES ('5ffd821826874c45a361f3cfe0c739e1', '超过120分钟', '853007360e7d4131a76cccccfde14e55', '4', '1');
INSERT INTO `t_an_radio` VALUES ('607b625db13c48d1b06c208c2c628a22', '语音消息', '527bf07584c64f5e865bf3b33fd5cc65', '3', '1');
INSERT INTO `t_an_radio` VALUES ('6096af26ec074128a89d359a948f2edd', '3-5小时（含5小时）', 'e622828dfc304e83936c7d0f151238a1', '2', '1');
INSERT INTO `t_an_radio` VALUES ('60a72f09564a4117a5f3e6a644650160', '到店/电话与老板沟通', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('6172e638a8d3482e91937ea26317df30', '微信', '38f10108bbfd498a97838688d285ddbc', '2', '1');
INSERT INTO `t_an_radio` VALUES ('62afecb65716479b8da41ef6fb38fde1', '1小时以内', '66e8b5f9d6364c3ea7e85332c95f774a', '0', '1');
INSERT INTO `t_an_radio` VALUES ('62d38defc40a45d18c23137363e13926', '41~50岁', '2413dcb52d254bac96058bde0ccbd6a5', '4', '1');
INSERT INTO `t_an_radio` VALUES ('62e36bac6fdf4006938d406d0c81af78', '否', '9231a02193d54f8e939eb08992e7dbef', '1', '1');
INSERT INTO `t_an_radio` VALUES ('6401226a12f64a55b40f4fa875634150', '大三', '7aa795ec0b654626b77ce3b1478f8e5e', '2', '1');
INSERT INTO `t_an_radio` VALUES ('640c978d2e49454daee774568e8ec680', '直播课程（可以和老师互动或者举手答题等）', '1fa52caba3c643a395169b3ef34589a5', '0', '1');
INSERT INTO `t_an_radio` VALUES ('6516600a3f274ad38233006190b56b55', '男', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('6537f6e956494026992dbacffb1cfb57', '在校学生', '724fa4e30afd4e6284d208ee2b4d36b1', '0', '1');
INSERT INTO `t_an_radio` VALUES ('6567146c32474ce8b1c62657185cd246', '一周一次', 'dcb61198e671480d8207f991a9848897', '3', '1');
INSERT INTO `t_an_radio` VALUES ('65a2f74dcb6c4fb4bbecf2edd6fd1524', '先通过网络上课学习新学期课程', '359bd884ccb74cf49e06fe634c57be9e', '0', '1');
INSERT INTO `t_an_radio` VALUES ('65eece4ba19b4599b8f6a82af1e93306', '男', 'c3ec6f33576149c48967f76a6f57178e', '0', '1');
INSERT INTO `t_an_radio` VALUES ('66529216350e4f75b96384357e114489', '30-60分钟', '00e08ebfd814410d9c7ec02c248c82c7', '1', '1');
INSERT INTO `t_an_radio` VALUES ('678cf03415fb47e399d3c6e1964968c3', '否', '7a2486916fc44f8abb279ab5e1723516', '1', '1');
INSERT INTO `t_an_radio` VALUES ('6828960747804f588df579762f80faf7', '录播课程（录制好的课程，不能互动只能观看）', '1fa52caba3c643a395169b3ef34589a5', '1', '1');
INSERT INTO `t_an_radio` VALUES ('6897503db6f64c27ab44261bf8bbf480', '小学一到三年级', '0487be1bb2b641c684db7084d81fcbb5', '0', '1');
INSERT INTO `t_an_radio` VALUES ('698ed790de944628895cb03f46aa80fb', '普通职员（办公室/写字楼工作人员）', '724fa4e30afd4e6284d208ee2b4d36b1', '3', '1');
INSERT INTO `t_an_radio` VALUES ('69f89b2c58f94e22a6d45727564d9617', '视频消息', '527bf07584c64f5e865bf3b33fd5cc65', '2', '1');
INSERT INTO `t_an_radio` VALUES ('6a99a622d05145879d6742aa9b5eed67', '其他 ____', '724fa4e30afd4e6284d208ee2b4d36b1', '13', '1');
INSERT INTO `t_an_radio` VALUES ('6aa2e87176204048b2ba8d276d8b36c1', '纯文字', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('6b218e5e7a244c5899ac9c31e64fbd5a', '朋友推荐', '3257d4316d45447eb61a08df231e9a62', '0', '1');
INSERT INTO `t_an_radio` VALUES ('6b9c930f9ca04658b97728f09b0fd958', '健康', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('6e1f979cc9e54f548498631cb6128e77', '400-800', '2a94675053ad419bb835c5a97fb405aa', '0', '1');
INSERT INTO `t_an_radio` VALUES ('6ea23d665d364232beb4cc824a078bcd', '8-10小时（含10小时）', '5d210b03ba4c4885832ce73b459de854', '4', '1');
INSERT INTO `t_an_radio` VALUES ('6f0c905d9889465aa83832943a15b96e', '小学及以下', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('6f58cb4b261f414983fc2e88bd3d3074', '有些紧张', 'ab622f88f8e54a5c8256e73d8a762c7d', '2', '1');
INSERT INTO `t_an_radio` VALUES ('7028b46baf72439280e153d736fc83a1', '其他 ____', '3257d4316d45447eb61a08df231e9a62', '5', '1');
INSERT INTO `t_an_radio` VALUES ('703e85a67fc5466bae56da6069114b73', '否', '2d205fb586f34be1863bee20e92a262b', '1', '1');
INSERT INTO `t_an_radio` VALUES ('7042aac163d440e795c2b7c246eb57f4', '初中', '167240aaa1e24f5183684b1d33be77d4', '1', '1');
INSERT INTO `t_an_radio` VALUES ('706b9e2873914d75b07110b75496e37e', '手机/电话', '38f10108bbfd498a97838688d285ddbc', '0', '1');
INSERT INTO `t_an_radio` VALUES ('707e3f3b7057464783aedb54ed6eea31', '小学一到三年级', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('70b26c1a80f749729b732736dee43ce2', '叫外卖', 'fe392eb4ba764e60b9121b85e9dd3f91', '2', '1');
INSERT INTO `t_an_radio` VALUES ('7330a963063a410b8da327bd46399cda', '大四', '7aa795ec0b654626b77ce3b1478f8e5e', '3', '1');
INSERT INTO `t_an_radio` VALUES ('735cd90ecfcb43b9a095fbf22daf8b3a', '是', '9231a02193d54f8e939eb08992e7dbef', '0', '1');
INSERT INTO `t_an_radio` VALUES ('738eafe6bab04951849d10c756143c9c', '123', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('739cbd3efdbf41c98e0b4e7c98a8dfa7', '1-3小时（含3小时）', '5412bc52e4204df0b3c58de3d594d6fa', '1', '1');
INSERT INTO `t_an_radio` VALUES ('7430996d5061487591cb5cedc3a7af08', '有，都放余额宝里面了！', '8f558ea2be8240e0aeb8fcdd0bd58794', '0', '1');
INSERT INTO `t_an_radio` VALUES ('75294f40e71c4bcc87c3eedc5520f7ca', '女', '6becaf43f8d8451a88cea429ede483eb', '1', '1');
INSERT INTO `t_an_radio` VALUES ('75f346601e9b458a9304ddd37f052d1a', '91-120分钟', '853007360e7d4131a76cccccfde14e55', '3', '1');
INSERT INTO `t_an_radio` VALUES ('76f8831eaf0c48a492f8c65f5d804cf6', '绰绰有余', 'ab622f88f8e54a5c8256e73d8a762c7d', '0', '1');
INSERT INTO `t_an_radio` VALUES ('777f2cecc0a24297bdf8a19d1863b742', '大学生', '0487be1bb2b641c684db7084d81fcbb5', '4', '1');
INSERT INTO `t_an_radio` VALUES ('77c6f8e114924637bbbf96807a57f573', '10元之内', 'f5c0124c6fc74587a0fa495127065913', '0', '1');
INSERT INTO `t_an_radio` VALUES ('77d284ed2d164697a5dfa0d63905e004', '等可以回学校了再开始学习新学期课程，可以用周末和其它假期补课', '359bd884ccb74cf49e06fe634c57be9e', '1', '1');
INSERT INTO `t_an_radio` VALUES ('7903825142794341ba548421ed385abd', '大学专科', '167240aaa1e24f5183684b1d33be77d4', '3', '1');
INSERT INTO `t_an_radio` VALUES ('79df64020b204c8fa05bfec568747e55', '没有', '529843bd84464110afb58efc378ca0d3', '1', '1');
INSERT INTO `t_an_radio` VALUES ('7a085de580d94ccc94784c49ce97fa4d', '1小时以内', '1850b05538f041e4bbc8112e2233a0e9', '0', '1');
INSERT INTO `t_an_radio` VALUES ('7a3afe1c6a10408193f12356875372ca', '网上订餐', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('7ab8ae6dce604bd7b9aae6022c46b8f9', '商业服务业职工（如销售人员/商店职员/服务员等）', '46caaea0489e4bbf9b476fc7737b0192', '6', '1');
INSERT INTO `t_an_radio` VALUES ('7b7ab80ff9044238b56a35f401e6fbe8', '30-60分钟', '853007360e7d4131a76cccccfde14e55', '1', '1');
INSERT INTO `t_an_radio` VALUES ('7d07d93cbe684074a5b2c98b312354e7', '其他', '8f558ea2be8240e0aeb8fcdd0bd58794', '4', '1');
INSERT INTO `t_an_radio` VALUES ('7e116f9491cf4a52b1e9959fa6d79412', '向送餐员说明', '71d9470d38764af885f41d3b04c81419', '0', '1');
INSERT INTO `t_an_radio` VALUES ('7e2a7ab030424ef8b2b2e7a68bc1af87', '26—30元', 'bc0976bf6d77430ca4e678c3d77d9a4c', '3', '1');
INSERT INTO `t_an_radio` VALUES ('7f73cb82f0ba492ab05498d13a3f5de2', '传单广告', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('8023682934fa4d1d9dff7cf3f735c983', '太多了，没有数过', '0ac211410e5346f383ff4b5483e8a848', '2', '1');
INSERT INTO `t_an_radio` VALUES ('8037947e716e4925a058d166ceef518e', '高中生/职校生/中专生', '9a95c92760db4907b91ecbf0adec2f3b', '3', '1');
INSERT INTO `t_an_radio` VALUES ('82f0422c51004596b6fed5957903fc8b', '工作/学习太忙时', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('83281be8aac44b4bbe3d462b8f71f3cf', '30-60分钟', '44d64c981e2747c1b2657279e61f6bc2', '1', '1');
INSERT INTO `t_an_radio` VALUES ('836b3801a58a48088dfa45f0fc4816c2', '传单广告', '11b33c6c00fa42d1866034337e2b8a0e', '0', '1');
INSERT INTO `t_an_radio` VALUES ('843819928f554d74b0a9f4e93a689986', '课程2', '7c0f30017dd440b2ba28a12de21be433', '1', '1');
INSERT INTO `t_an_radio` VALUES ('85dec0a5655249a28026a192075b9d98', '小学及以下', '51ed0211a1c9410593f0c2a958ba0bd1', '0', '1');
INSERT INTO `t_an_radio` VALUES ('85f0507d061c416e97bedc1b0b61b341', '1小时-1个半小时', '5a3312dbfe0545c8af22b72ebc11c0ab', '2', '1');
INSERT INTO `t_an_radio` VALUES ('8862bbb2e5f84133be4af89291b9aa78', '网上订餐', '38f10108bbfd498a97838688d285ddbc', '1', '1');
INSERT INTO `t_an_radio` VALUES ('88739f8ac2c846a7b87eaf90ba0accf7', '大学本科', '167240aaa1e24f5183684b1d33be77d4', '4', '1');
INSERT INTO `t_an_radio` VALUES ('887d415c9e4d41f8aca86cb56861e3fc', '10小时以上', '66e8b5f9d6364c3ea7e85332c95f774a', '5', '1');
INSERT INTO `t_an_radio` VALUES ('88f9f1260814456997fb1482bfaf61f5', '普通职员（办公室/写字楼工作人员）', '84aea8d11a9048abbf04ab23af1d77d3', '3', '1');
INSERT INTO `t_an_radio` VALUES ('89c9ac371f2543909eb1622f6dc83a46', '25~30岁', '1b6362a2ebba40459abf114f35609079', '2', '1');
INSERT INTO `t_an_radio` VALUES ('8a1b4ea8d386417c88a2f1bd244af07f', '亲自上门打包', '38f10108bbfd498a97838688d285ddbc', '4', '1');
INSERT INTO `t_an_radio` VALUES ('8a37622ad14c4609990def2675d6f3c9', '两荤两素', 'c1ad11c107c34c4c80d1be51f4348f97', '1', '1');
INSERT INTO `t_an_radio` VALUES ('8a4d5a51457346edaf4c906d8090b0fd', '8-10小时（含10小时）', '1850b05538f041e4bbc8112e2233a0e9', '4', '1');
INSERT INTO `t_an_radio` VALUES ('8a8cd5da3c9b422587f34c77c611fd81', '大二', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('8b2c4956020c4a3bbdcd2ffd5a06afa9', '口味', '9b8100624c7f4f18a59213f8d132569d', '1', '1');
INSERT INTO `t_an_radio` VALUES ('8c3a46e2178a4c26b28260423e2803c3', '在校学生', '84aea8d11a9048abbf04ab23af1d77d3', '0', '1');
INSERT INTO `t_an_radio` VALUES ('8c3e00a23eaf49fc8bb7a5c714e1a00a', '政府/机关干部/公务员', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('8d56ed69954b471889a3e29fb7d0bf52', '2600以上', '719c6ff9a0584daca39a09019c497d9f', '3', '1');
INSERT INTO `t_an_radio` VALUES ('8d5ceb3f7f5c450cbc83bff3c82cfb49', '50元以上', 'bc0976bf6d77430ca4e678c3d77d9a4c', '5', '1');
INSERT INTO `t_an_radio` VALUES ('8e3e1821f76b42978af1a78902c0d407', '走在路上，发现不错的店就会记下来', '11b33c6c00fa42d1866034337e2b8a0e', '3', '1');
INSERT INTO `t_an_radio` VALUES ('8fe08a1c6bfd4fd789aabb733f4f5001', '1-3小时（含3小时）', '5d210b03ba4c4885832ce73b459de854', '1', '1');
INSERT INTO `t_an_radio` VALUES ('904a7514dc7345d5a2a6c44c65f0958d', '个体经营者/承包商', '46caaea0489e4bbf9b476fc7737b0192', '7', '1');
INSERT INTO `t_an_radio` VALUES ('906a2caa3f9d44bb83165c8c825db5ce', '大致够了', 'ab622f88f8e54a5c8256e73d8a762c7d', '1', '1');
INSERT INTO `t_an_radio` VALUES ('90d539d1f27b4d03b250d8183252abd2', '91-120分钟', '00e08ebfd814410d9c7ec02c248c82c7', '3', '1');
INSERT INTO `t_an_radio` VALUES ('90e40e0f8dab421193a51efd84f9a116', '是', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('9131a87aca71448a8191b642b10dbdc2', '每天一次', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('91c4989103434f378494469f404870cf', '0次', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('9296bd2789e94251be2604c7324d6afe', '是', '6701b73e88874724b9295bc05c303cf5', '0', '1');
INSERT INTO `t_an_radio` VALUES ('930afb7812e4427f846db2b15f2bae69', '18~24岁', '1b6362a2ebba40459abf114f35609079', '1', '1');
INSERT INTO `t_an_radio` VALUES ('93dca09a581a4bd3bd6271fda84dfbf1', '3-5小时（含5小时）', '5412bc52e4204df0b3c58de3d594d6fa', '2', '1');
INSERT INTO `t_an_radio` VALUES ('96d71a8632834c8c9f11bfac0a2480c8', '50元以上', '8fde0aa2b74a4bd8b0dc87128a832a44', '5', '1');
INSERT INTO `t_an_radio` VALUES ('96e2bffefe1e40d0b28316a8a0e38836', '61-90分钟', '556c899b96354e9aaed7d9517fc20a45', '2', '1');
INSERT INTO `t_an_radio` VALUES ('97a18f729ac045a899774805514b4340', '1-3小时（含3小时）', 'e622828dfc304e83936c7d0f151238a1', '1', '1');
INSERT INTO `t_an_radio` VALUES ('986472229efd4e43bc481681bcaf30dd', '小学一到三年级', '9a95c92760db4907b91ecbf0adec2f3b', '0', '1');
INSERT INTO `t_an_radio` VALUES ('98d915d07ff54b889df764b11727baf0', '21—25元', 'bc0976bf6d77430ca4e678c3d77d9a4c', '2', '1');
INSERT INTO `t_an_radio` VALUES ('9a98cb58226944e08cbf264dad09cc29', '政府/机关干部/公务员', '724fa4e30afd4e6284d208ee2b4d36b1', '1', '1');
INSERT INTO `t_an_radio` VALUES ('9abfb1f52b3440a1bc351efa0bccd59b', '亲自上门打包', '0ddb6d59a6484b7c8bae05a3af44fa31', '4', '1');
INSERT INTO `t_an_radio` VALUES ('9ccb4131e7694877bbe4a4b5984977ad', '3-5小时（含5小时）', '1850b05538f041e4bbc8112e2233a0e9', '2', '1');
INSERT INTO `t_an_radio` VALUES ('9d13aa7b8cba4b0ea591558be42c6b04', '其他 ____', '46caaea0489e4bbf9b476fc7737b0192', '13', '1');
INSERT INTO `t_an_radio` VALUES ('9ed54a7ffd994f3b8f48dfca5a211833', '每天一次', 'dcb61198e671480d8207f991a9848897', '0', '1');
INSERT INTO `t_an_radio` VALUES ('a027f88872814cd0b984054679d53288', '没有', '68b3e72d85a0428d9df527afd456e01a', '1', '1');
INSERT INTO `t_an_radio` VALUES ('a19fb894831043cdbd0eb0c02f548466', '600-2400', '2a94675053ad419bb835c5a97fb405aa', '2', '1');
INSERT INTO `t_an_radio` VALUES ('a1e18a8b6f314f7d86f7a5578337a5c6', '20元以上', 'f5c0124c6fc74587a0fa495127065913', '3', '1');
INSERT INTO `t_an_radio` VALUES ('a1eae194fb3e41b7a28f7915d92e2992', '远远不够', 'ab622f88f8e54a5c8256e73d8a762c7d', '3', '1');
INSERT INTO `t_an_radio` VALUES ('a215d9de84344bb8afa8d60a53589682', '向食品监管部门投诉', '71d9470d38764af885f41d3b04c81419', '2', '1');
INSERT INTO `t_an_radio` VALUES ('a2ab6c80f44a4d939b7cf44494cff3dc', '5-8小时（含8小时）', '5412bc52e4204df0b3c58de3d594d6fa', '3', '1');
INSERT INTO `t_an_radio` VALUES ('a3a699b1721f4f5e870b3b59a0ce19d6', '3-7年（含7年）', '3df04df92934436691633433921837b9', '2', '1');
INSERT INTO `t_an_radio` VALUES ('a4dddfd3e294482e8501f39dca075b2d', '否', '6701b73e88874724b9295bc05c303cf5', '1', '1');
INSERT INTO `t_an_radio` VALUES ('a591ca767f444212a5f2e0cac0998a6a', '两天一次', 'dcb61198e671480d8207f991a9848897', '1', '1');
INSERT INTO `t_an_radio` VALUES ('a5dee76cbe814858ad99d8bb264cc912', '主动搜索', '3257d4316d45447eb61a08df231e9a62', '3', '1');
INSERT INTO `t_an_radio` VALUES ('a73988efaee749abbb444084d1aeb65b', '自带', '8eff71130701455097b2610b955f59b5', '3', '1');
INSERT INTO `t_an_radio` VALUES ('a764a5086ca041eb8199b2acc209ba40', '否', '88d1c394f9ef4c68b20bb2331de2aa06', '1', '1');
INSERT INTO `t_an_radio` VALUES ('a7cba90c0a994c60b88771f3d074597f', '图文欣赏', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('a7dee9dd08474c1892c73fbd4405b315', '否', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('a881280389a44d36845684da728a231a', '等可以回学校了再开始学习新学期课程，可以用周末和其它假期补课', '822920a68322404a9749d9b42742a16f', '1', '1');
INSERT INTO `t_an_radio` VALUES ('a8f48fb627c341f28c4ddcc5c39675ff', '5-8小时（含8小时）', 'e622828dfc304e83936c7d0f151238a1', '3', '1');
INSERT INTO `t_an_radio` VALUES ('a98105873f1e45dda1f5f52ef2b25fd3', '18~24岁', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('a9a73af3da71484ca821681800d5cf83', '1-3小时（含3小时）', '1850b05538f041e4bbc8112e2233a0e9', '1', '1');
INSERT INTO `t_an_radio` VALUES ('a9f336495db749eebf8d641dcc6f6dab', '是', '88d1c394f9ef4c68b20bb2331de2aa06', '0', '1');
INSERT INTO `t_an_radio` VALUES ('a9f4a38a65594a108283db4045128f10', '想换个口味', '5ea431d35e884ba1a6049efca1f540e4', '2', '1');
INSERT INTO `t_an_radio` VALUES ('aab9af0373624143815c33e2caaf1748', '退休', '724fa4e30afd4e6284d208ee2b4d36b1', '10', '1');
INSERT INTO `t_an_radio` VALUES ('aba9a12a0c774d1884b2dbc79323d598', '不想出门', '5ea431d35e884ba1a6049efca1f540e4', '0', '1');
INSERT INTO `t_an_radio` VALUES ('ad10cdfea97540ae9d1fad19ace751fc', '30分钟以内', '853007360e7d4131a76cccccfde14e55', '0', '1');
INSERT INTO `t_an_radio` VALUES ('ad7bab2ff2884dd38ebc849eeb61d82e', '上餐馆', '8eff71130701455097b2610b955f59b5', '1', '1');
INSERT INTO `t_an_radio` VALUES ('ae0dfb4a66f44ab0bffd8b9a97fa4ac2', '高中/中专/技校', '167240aaa1e24f5183684b1d33be77d4', '2', '1');
INSERT INTO `t_an_radio` VALUES ('ae3f6729918c426d880b1b44eda5de21', '硕士研究生及以上', '51ed0211a1c9410593f0c2a958ba0bd1', '5', '1');
INSERT INTO `t_an_radio` VALUES ('aed1b1792da04019a3172c6a4bd5b075', '初中生', '0487be1bb2b641c684db7084d81fcbb5', '2', '1');
INSERT INTO `t_an_radio` VALUES ('af5b4d62f5b94c929c9a1b9393f22958', '是', '6af3e3c9f0a441989e22f3ae23ae935f', '0', '1');
INSERT INTO `t_an_radio` VALUES ('af816e2b068a4017b7e8a4486be55c65', '26—30元', '8fde0aa2b74a4bd8b0dc87128a832a44', '3', '1');
INSERT INTO `t_an_radio` VALUES ('b0beecd9a7c44c1dbd19c82df8f74bd9', '1小时以内', '5d210b03ba4c4885832ce73b459de854', '0', '1');
INSERT INTO `t_an_radio` VALUES ('b13ebdadb6404f3690d2cbbd97693bce', '先通过网络上课学习新学期课程', '822920a68322404a9749d9b42742a16f', '0', '1');
INSERT INTO `t_an_radio` VALUES ('b148f01b96244bf0b6bbc8c06bfda67e', '3-7年（含7年）', '529a75fe627c4ec88062b44e5ef0c352', '2', '1');
INSERT INTO `t_an_radio` VALUES ('b155a1f221124ec0b46a6b4c50b691fd', '超过120分钟', '00e08ebfd814410d9c7ec02c248c82c7', '4', '1');
INSERT INTO `t_an_radio` VALUES ('b213c56b552c42ab97aee87f509d4ddd', '7-10年（含10年）', '529a75fe627c4ec88062b44e5ef0c352', '3', '1');
INSERT INTO `t_an_radio` VALUES ('b238b4d671ee440d980769b9748fc500', '直播课程（可以和老师互动或者举手答题等）', '7c9cdb095d924da389bc20cd67bdf842', '0', '1');
INSERT INTO `t_an_radio` VALUES ('b2b03af8802b4042b5fde93c293a0d1b', '暂无职业', '84aea8d11a9048abbf04ab23af1d77d3', '12', '1');
INSERT INTO `t_an_radio` VALUES ('b2f63d034f504d58bc97bf95f79199f2', '2400以上', 'c70dc58d99504050bc4fdfd4a8002f16', '3', '1');
INSERT INTO `t_an_radio` VALUES ('b3336a24c93140679c618a90ff09c145', '小学四到六年级', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('b3bd51b360664b509cfe146c7853e246', '有', '68b3e72d85a0428d9df527afd456e01a', '0', '1');
INSERT INTO `t_an_radio` VALUES ('b3f6e6aec8194290a91ae4d8f33517a9', '400-800', 'c70dc58d99504050bc4fdfd4a8002f16', '0', '1');
INSERT INTO `t_an_radio` VALUES ('b41902b5ef064b228e60121d09929500', '30分钟以内', '556c899b96354e9aaed7d9517fc20a45', '0', '1');
INSERT INTO `t_an_radio` VALUES ('b523f112ebcd49a5b4c43e7f2797e318', '10小时以上', '1850b05538f041e4bbc8112e2233a0e9', '5', '1');
INSERT INTO `t_an_radio` VALUES ('b5578b2fa25646dd8a2bc54e66ea4299', '向送餐员说明', '3a60b96cb23d4608b742724769bb4473', '0', '1');
INSERT INTO `t_an_radio` VALUES ('b55a53680e394ea19b196ed8bd48c363', '1小时以内', 'e622828dfc304e83936c7d0f151238a1', '0', '1');
INSERT INTO `t_an_radio` VALUES ('b56e24390636439e8eaba8410af28f35', '上餐馆', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('b5f313dcb7e344d08486109b8957f0a0', '5次/周', 'b763792ffc9748d5b0f3c8f52889c7e1', '3', '1');
INSERT INTO `t_an_radio` VALUES ('b64a44a68deb49a2bc03caa0bbd51159', '一周两次', 'dcb61198e671480d8207f991a9848897', '2', '1');
INSERT INTO `t_an_radio` VALUES ('b6e36768d3e6479f836e6e9e83341898', '在校学生', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('b77ad4393eb3484aa6fa69ce82df7f29', '61岁及以上', '2413dcb52d254bac96058bde0ccbd6a5', '6', '1');
INSERT INTO `t_an_radio` VALUES ('b8397135cfbc4160946020ba96b03d9a', '一个半小时以上', '44d64c981e2747c1b2657279e61f6bc2', '3', '1');
INSERT INTO `t_an_radio` VALUES ('b8880ffd6c2244dd9b642050f313ce94', '3次/周', 'b763792ffc9748d5b0f3c8f52889c7e1', '2', '1');
INSERT INTO `t_an_radio` VALUES ('b888e9444ac045f8b9e99fea6e35fa18', '网课没有布置过作业', '8a4ae59245b04c5f8313f469a99ad18f', '3', '1');
INSERT INTO `t_an_radio` VALUES ('b9cf3c0eaee74852841ab04a90a19f17', '大学专科', '51ed0211a1c9410593f0c2a958ba0bd1', '3', '1');
INSERT INTO `t_an_radio` VALUES ('bcc4e913249e48c1883119d833a7f3be', '政府/机关干部/公务员', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('bd47e8dee2f6471e877bb1971a75fe5e', '朋友们都叫了外卖', 'bc9abfa058c1406fa32f263981a5e00a', '4', '1');
INSERT INTO `t_an_radio` VALUES ('beaf351353434f4086f03d59f81750e4', '在校学生', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('bf2d0007c0964091ad939b8131795b7b', '15年以上', '529a75fe627c4ec88062b44e5ef0c352', '5', '1');
INSERT INTO `t_an_radio` VALUES ('c0f3d1adb36a440fb62bbe9a24c3d227', '1次/周', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('c1fb5372b89c43f0831d0b67a06cfa8a', '10小时以上', '8c2e3b75e2ee409ba561c2b0ad3bcbe8', '5', '1');
INSERT INTO `t_an_radio` VALUES ('c29c9e29fa644380b6e33ea3ea830c64', '1小时以内', '8c2e3b75e2ee409ba561c2b0ad3bcbe8', '0', '1');
INSERT INTO `t_an_radio` VALUES ('c2e3d0ef7a39413daf918400b9578f07', '30分钟以内', '00e08ebfd814410d9c7ec02c248c82c7', '0', '1');
INSERT INTO `t_an_radio` VALUES ('c3c61d266ecd4dd9a7d5c4642fb63efd', '18岁以下', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('c4932fbd02ca482a9b13d6767039a51e', '3次/周', 'c86ba53fbd004d4898060d5a74c4e2bc', '2', '1');
INSERT INTO `t_an_radio` VALUES ('c542d4d7600147a9bc186075928cd7d9', '大三', '34a4b7a6ab484132a3cc5518b0fdfe43', '2', '1');
INSERT INTO `t_an_radio` VALUES ('c644c6ff27014674997838bde89d1648', '否', '6af3e3c9f0a441989e22f3ae23ae935f', '1', '1');
INSERT INTO `t_an_radio` VALUES ('c66ca02376ea45829fda9ebb3d226e69', '一个半小时以上', '5a3312dbfe0545c8af22b72ebc11c0ab', '3', '1');
INSERT INTO `t_an_radio` VALUES ('c6fb526bbf2e49ab99a6606163880ddd', '61-90分钟', '00e08ebfd814410d9c7ec02c248c82c7', '2', '1');
INSERT INTO `t_an_radio` VALUES ('c745c0180e2545c0a7070e5d9aa5d48e', '18岁以下', '1b6362a2ebba40459abf114f35609079', '0', '1');
INSERT INTO `t_an_radio` VALUES ('c763f773152d4faab905cbec93e3a9eb', '0次', 'b763792ffc9748d5b0f3c8f52889c7e1', '0', '1');
INSERT INTO `t_an_radio` VALUES ('c77b6045112741eba78cc3282db097d4', '有，都放钱包里面了！', '8f558ea2be8240e0aeb8fcdd0bd58794', '2', '1');
INSERT INTO `t_an_radio` VALUES ('c78a331e3a504ea2b18dcd25f61bcce4', '61-90分钟', 'c923f8c360744b978f1e28f92c7c019a', '2', '1');
INSERT INTO `t_an_radio` VALUES ('c7d1f6228e514763819f652cf6e990f2', '有', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('c7e48112004c430da4004093b2af09f2', '完全通过网络平台在线完成', '8a4ae59245b04c5f8313f469a99ad18f', '0', '1');
INSERT INTO `t_an_radio` VALUES ('c7efb40182164c4d8c92d566760f5311', '外卖App', '0ddb6d59a6484b7c8bae05a3af44fa31', '3', '1');
INSERT INTO `t_an_radio` VALUES ('c82d33d617cc4cd4af1da97b97708d89', '早上起床后', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('c8467c175e2944aca2641dc1a0654f65', '是', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('c887af6730834bd7adcae11a912ace92', '15—20元', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('c8c19c99442d4d3db53ccd579c4697fb', '盖浇饭', 'c1ad11c107c34c4c80d1be51f4348f97', '2', '1');
INSERT INTO `t_an_radio` VALUES ('c8f41801fc594dfdbe23374a41e6625d', '网课没有布置过作业', 'cd36be3192394591b7dc6819321233ad', '3', '1');
INSERT INTO `t_an_radio` VALUES ('caf801bc67c9458785e4cf32d1aba274', '盖浇饭', 'de3e4a3b3169433e8a68425ccbc1c733', '2', '1');
INSERT INTO `t_an_radio` VALUES ('cb23516999e445f499fd128990f51632', '朋友介绍', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('cd0480a735904073a16d97e7420c8282', '5-8小时（含8小时）', '1850b05538f041e4bbc8112e2233a0e9', '3', '1');
INSERT INTO `t_an_radio` VALUES ('cd2ce4977fc74a289878b99a0f684de9', '61岁及以上', '1b6362a2ebba40459abf114f35609079', '6', '1');
INSERT INTO `t_an_radio` VALUES ('cd977929e28f4224a2a63da39398455f', '大二', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('cddd1c0528bd410693695f0589dfa670', '个体经营者/承包商', '724fa4e30afd4e6284d208ee2b4d36b1', '7', '1');
INSERT INTO `t_an_radio` VALUES ('cddee69f35b243b7a061eaa90eb1e5fe', '走在路上，发现不错的店就会记下来', 'd1df94cd4bdf49488418b96a05cc8298', '3', '1');
INSERT INTO `t_an_radio` VALUES ('cf3b50f6f5cc466dbd760fb4558cfe85', '1-3年（含3年）', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('cfb1efe9840a4972a77f131547a593ad', '1-3年（含3年）', '529a75fe627c4ec88062b44e5ef0c352', '1', '1');
INSERT INTO `t_an_radio` VALUES ('cffa4764ebe042f8acb41737bb4bab9e', '无所谓', '88d1c394f9ef4c68b20bb2331de2aa06', '2', '1');
INSERT INTO `t_an_radio` VALUES ('d00f3f1cadff41d79fb1a02cbc9593e0', '商业服务业职工（如销售人员/商店职员/服务员等）', '724fa4e30afd4e6284d208ee2b4d36b1', '6', '1');
INSERT INTO `t_an_radio` VALUES ('d03c28d005db4cc0887c464f2bd3cda4', '5-8小时（含8小时）', '8c2e3b75e2ee409ba561c2b0ad3bcbe8', '3', '1');
INSERT INTO `t_an_radio` VALUES ('d059323d0ecd478e8946d2563343a52c', '企业管理者（包括基层及中高层管理者）', '46caaea0489e4bbf9b476fc7737b0192', '2', '1');
INSERT INTO `t_an_radio` VALUES ('d09c7e644f1641df853aca91d2290070', '其他', '7aa795ec0b654626b77ce3b1478f8e5e', '4', '1');
INSERT INTO `t_an_radio` VALUES ('d0f5ac2fc3c1467cb3fcf56acb8da755', '向送餐员说明', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('d10e64a399b14b97a333ed5d429fbafd', '朋友介绍', 'd1df94cd4bdf49488418b96a05cc8298', '1', '1');
INSERT INTO `t_an_radio` VALUES ('d2105a22e7304a9cb3e64bb9739f7ad5', '小学四到六年级', '9a95c92760db4907b91ecbf0adec2f3b', '1', '1');
INSERT INTO `t_an_radio` VALUES ('d39cacb032674e1fbbdc86ffa4044e6d', '两荤两素', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('d51179d0ce5d4c46a81d83ea862402ca', '小学及以下', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('d559632b265e4c53a9daef1c1c61ee0d', '1小时以内', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('d5abbbe1acd94631b2414ed05bd8bbad', '30分钟以内', '44d64c981e2747c1b2657279e61f6bc2', '0', '1');
INSERT INTO `t_an_radio` VALUES ('d5cdb86b17464105bac941713f191069', '大学本科', '51ed0211a1c9410593f0c2a958ba0bd1', '4', '1');
INSERT INTO `t_an_radio` VALUES ('d6016abb235c4a60a3ed03983830da41', '家庭主妇/全职太太', '724fa4e30afd4e6284d208ee2b4d36b1', '11', '1');
INSERT INTO `t_an_radio` VALUES ('d6a1cfc3630a4c4cadeec0f4fea0ff59', '大学生', '9a95c92760db4907b91ecbf0adec2f3b', '4', '1');
INSERT INTO `t_an_radio` VALUES ('d6a3c17d797c4986a638335db39e1733', '666', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('d6d859caba564f9cbb14fa681178f65a', '课程3', '7c0f30017dd440b2ba28a12de21be433', '2', '1');
INSERT INTO `t_an_radio` VALUES ('d6ed949c187f4d2093be4990bffaed42', '大一', '5058645c8ab04f31b8948dd1615ce32f', '0', '1');
INSERT INTO `t_an_radio` VALUES ('d78a010e7b334cd7bd4ffdc2ade87691', '外卖App', '38f10108bbfd498a97838688d285ddbc', '3', '1');
INSERT INTO `t_an_radio` VALUES ('d79dce52e19d4b078e652214ed8c1322', '超过120分钟', 'c923f8c360744b978f1e28f92c7c019a', '4', '1');
INSERT INTO `t_an_radio` VALUES ('d8618516a155494fa13dca670255136e', '1000以下', '719c6ff9a0584daca39a09019c497d9f', '0', '1');
INSERT INTO `t_an_radio` VALUES ('d8b852c2fc9d496b9785b9d83ede634d', '工作/学习太忙时', '5ea431d35e884ba1a6049efca1f540e4', '1', '1');
INSERT INTO `t_an_radio` VALUES ('d961ad90f3c94fea938639d1a07e77ed', '家庭主妇/全职太太', '46caaea0489e4bbf9b476fc7737b0192', '11', '1');
INSERT INTO `t_an_radio` VALUES ('d9c8ff26997743f99d177d9fd2024bd5', '小学四到六年级', '0487be1bb2b641c684db7084d81fcbb5', '1', '1');
INSERT INTO `t_an_radio` VALUES ('daeceaf082e54cc9a52b1e2156e93237', '567', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('db2f42ea31d941e5805324f160e39021', '31~40岁', '1b6362a2ebba40459abf114f35609079', '3', '1');
INSERT INTO `t_an_radio` VALUES ('dbe79d9f90f949e5bff1808117d12fd0', '1小时以内', '5412bc52e4204df0b3c58de3d594d6fa', '0', '1');
INSERT INTO `t_an_radio` VALUES ('dc35862acb574fc8945f26fb8e95ae13', '企业管理者（包括基层及中高层管理者）', '84aea8d11a9048abbf04ab23af1d77d3', '2', '1');
INSERT INTO `t_an_radio` VALUES ('dcd4e870d9dd4551ab325ac432d650f8', '18~24岁', '2413dcb52d254bac96058bde0ccbd6a5', '1', '1');
INSERT INTO `t_an_radio` VALUES ('dce24db5229849698bc92cec5af2dec2', '纯文字', '527bf07584c64f5e865bf3b33fd5cc65', '0', '1');
INSERT INTO `t_an_radio` VALUES ('dd283f23b3d4418799c4bd422f8cb37f', '800-1600', '2a94675053ad419bb835c5a97fb405aa', '1', '1');
INSERT INTO `t_an_radio` VALUES ('dd5a6d32483d490c9b3aa495797bfc0c', '1000-1800', '719c6ff9a0584daca39a09019c497d9f', '1', '1');
INSERT INTO `t_an_radio` VALUES ('de8a3f4ecd4441a98b46ce697ffafe98', '传单广告', 'd1df94cd4bdf49488418b96a05cc8298', '0', '1');
INSERT INTO `t_an_radio` VALUES ('de8fd726492c4c2295d03b3598fdd0f7', '初中', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('def83a76cc1b4bd8a0742a8bb2791466', '超过120分钟', '556c899b96354e9aaed7d9517fc20a45', '4', '1');
INSERT INTO `t_an_radio` VALUES ('e0989c4b4a1e48cc9a8b5fa19a9e3a7b', '15元以内', '8fde0aa2b74a4bd8b0dc87128a832a44', '0', '1');
INSERT INTO `t_an_radio` VALUES ('e193edceea2749d188b10d946a08c71d', '大三', '5058645c8ab04f31b8948dd1615ce32f', '2', '1');
INSERT INTO `t_an_radio` VALUES ('e3fd59ef9b7c4d86a91c1e1e07563263', '30-60分钟', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('e47c8dfa65f6429b8f5b83066d4a362c', '18~24岁', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('e53d0b1201ac4115b3c20f5c163df913', '1-3小时（含3小时）', '8c2e3b75e2ee409ba561c2b0ad3bcbe8', '1', '1');
INSERT INTO `t_an_radio` VALUES ('e5b8524ec03343d1950ad76a5c3bb316', '10个以内', '0ac211410e5346f383ff4b5483e8a848', '0', '1');
INSERT INTO `t_an_radio` VALUES ('e63c2e5ed44847f9a35cc6764fb39995', '不想出门', null, '0', '1');
INSERT INTO `t_an_radio` VALUES ('e659768a96fc4bf3a9311958b9482775', '二维码扫描', '3257d4316d45447eb61a08df231e9a62', '2', '1');
INSERT INTO `t_an_radio` VALUES ('e72221f7025e45cca4d1f5d61c41137d', '农林牧渔劳动者', '724fa4e30afd4e6284d208ee2b4d36b1', '9', '1');
INSERT INTO `t_an_radio` VALUES ('e775be0e8c2f4175ae4962471ce62b82', '大一', '7aa795ec0b654626b77ce3b1478f8e5e', '0', '1');
INSERT INTO `t_an_radio` VALUES ('e823425a20f141668f1dc81a748b5aaf', '完全线下完成（教材/辅导资料等）', 'cd36be3192394591b7dc6819321233ad', '2', '1');
INSERT INTO `t_an_radio` VALUES ('e8da470743ae4f1593f93de965eea21f', '专业人员（如医生/律师/文体/记者/老师等）', '724fa4e30afd4e6284d208ee2b4d36b1', '4', '1');
INSERT INTO `t_an_radio` VALUES ('e8dd0da8dd0d458fbe98c83a19b845a9', '微信', '0ddb6d59a6484b7c8bae05a3af44fa31', '2', '1');
INSERT INTO `t_an_radio` VALUES ('ea14dee7050e43e18acb51e526620c5d', '企业管理者（包括基层及中高层管理者）', '724fa4e30afd4e6284d208ee2b4d36b1', '2', '1');
INSERT INTO `t_an_radio` VALUES ('ea3872059f1d4a1dbd0cdae81c101f32', '41~50岁', '1b6362a2ebba40459abf114f35609079', '4', '1');
INSERT INTO `t_an_radio` VALUES ('ec35754f317d49aba0c693c0f036309c', '男', '6c938c2fa1744f7eba28e53b169c9135', '0', '1');
INSERT INTO `t_an_radio` VALUES ('ec3820c211b347f59aa41a705863e1cb', '大一', '34a4b7a6ab484132a3cc5518b0fdfe43', '0', '1');
INSERT INTO `t_an_radio` VALUES ('ec3d97179149458bbcf81d5b8bbb864b', '30-60分钟', '5a3312dbfe0545c8af22b72ebc11c0ab', '1', '1');
INSERT INTO `t_an_radio` VALUES ('ed639d849c904e049215d392b1bff4df', '女', 'c3ec6f33576149c48967f76a6f57178e', '1', '1');
INSERT INTO `t_an_radio` VALUES ('ed897753c44d4ba5878f8e91edaa453c', '中午休息时', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('ed8ba536ce304e40af8980d87b7c9f6f', '没有，要用就拿！', '8f558ea2be8240e0aeb8fcdd0bd58794', '3', '1');
INSERT INTO `t_an_radio` VALUES ('ee9fec3c5f5d4b93b98c1d4e18819a87', '15—20元', 'bc0976bf6d77430ca4e678c3d77d9a4c', '1', '1');
INSERT INTO `t_an_radio` VALUES ('eea66b40f19a4a348a68b24ab032cedc', '图文欣赏', '527bf07584c64f5e865bf3b33fd5cc65', '1', '1');
INSERT INTO `t_an_radio` VALUES ('ef0a9b71b15547ea87ff52ef94499688', '10—20个', '0ac211410e5346f383ff4b5483e8a848', '1', '1');
INSERT INTO `t_an_radio` VALUES ('f107d8bba2424688a872ef15868c7d2a', '课程4', '7c0f30017dd440b2ba28a12de21be433', '3', '1');
INSERT INTO `t_an_radio` VALUES ('f13b50276c664970ba18e8153688c3fb', '网上订餐', '0ddb6d59a6484b7c8bae05a3af44fa31', '1', '1');
INSERT INTO `t_an_radio` VALUES ('f170f24823ba4afaaa677294d799c429', '政府/机关干部/公务员', '84aea8d11a9048abbf04ab23af1d77d3', '1', '1');
INSERT INTO `t_an_radio` VALUES ('f188e3a96f254ff9a870d96f155447ad', '到店/电话与老板沟通', '71d9470d38764af885f41d3b04c81419', '1', '1');
INSERT INTO `t_an_radio` VALUES ('f2b71b250bfe45b5b9fb766f1c662d2c', '退休', '84aea8d11a9048abbf04ab23af1d77d3', '10', '1');
INSERT INTO `t_an_radio` VALUES ('f2c7b0166bdd42fda5a04a7e4f9d893a', '1-3小时（含3小时）', '66e8b5f9d6364c3ea7e85332c95f774a', '1', '1');
INSERT INTO `t_an_radio` VALUES ('f3882453ff71450b8107e50b112fc8a7', '31—50元', 'bc0976bf6d77430ca4e678c3d77d9a4c', '4', '1');
INSERT INTO `t_an_radio` VALUES ('f3986233d3244999ab0a0f316e9527f3', '123', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('f56c253a22c146279b1eed56325a8ed2', '选项A', '46caaea0489e4bbf9b476fc7737b0192', '0', '1');
INSERT INTO `t_an_radio` VALUES ('f5c72f8a50694a28b5c694b01b2d2294', '健康', '3c9603f826ee4200883476a839fc16e1', '0', '1');
INSERT INTO `t_an_radio` VALUES ('f6e4e0a187cb44229c1941bf671cc9b8', '口味', '3c9603f826ee4200883476a839fc16e1', '1', '1');
INSERT INTO `t_an_radio` VALUES ('f7f503d0859e4b75bd480ae6bb694aae', '家庭主妇/全职太太', '84aea8d11a9048abbf04ab23af1d77d3', '11', '1');
INSERT INTO `t_an_radio` VALUES ('f840826d08ad40108105e6454cfe90e5', '普通工人（如工厂工人/体力劳动者等）', '724fa4e30afd4e6284d208ee2b4d36b1', '5', '1');
INSERT INTO `t_an_radio` VALUES ('f84f1f58f2cf4a1da62a15b5fafc41ce', '5-8小时（含8小时）', '66e8b5f9d6364c3ea7e85332c95f774a', '3', '1');
INSERT INTO `t_an_radio` VALUES ('f8a097478e3d4f388cd07ad56fff0d50', '3-5小时（含5小时）', '8c2e3b75e2ee409ba561c2b0ad3bcbe8', '2', '1');
INSERT INTO `t_an_radio` VALUES ('f91cda0043d94969b43be305af358ae7', '800-1600', 'c70dc58d99504050bc4fdfd4a8002f16', '1', '1');
INSERT INTO `t_an_radio` VALUES ('f980e7fd915c4f1cacfd3706ba51c725', '没有', null, '1', '1');
INSERT INTO `t_an_radio` VALUES ('faa0242d66d54b088e00c564613171fa', '10小时以上', '5d210b03ba4c4885832ce73b459de854', '5', '1');
INSERT INTO `t_an_radio` VALUES ('fc3c30ac464f42919d88f60e7bfc41b0', '女', '7b227bcfb14e4eca840a0e4db224ed03', '1', '1');
INSERT INTO `t_an_radio` VALUES ('fe516b0d5a3a43b89c35ba16d22a9f61', '15-20元', 'f5c0124c6fc74587a0fa495127065913', '2', '1');
INSERT INTO `t_an_radio` VALUES ('ff72e9bdb98241f8b57fbad9bb8fcf91', '不想出门', 'bc9abfa058c1406fa32f263981a5e00a', '0', '1');

-- ----------------------------
-- Table structure for `t_qs_checkbox`
-- ----------------------------
DROP TABLE IF EXISTS `t_qs_checkbox`;
CREATE TABLE `t_qs_checkbox` (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `visibility` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_qs_checkbox
-- ----------------------------
INSERT INTO `t_qs_checkbox` VALUES ('048d3562e92542cc8cc679f0f5427018', 'checkbox', '最近半年，您使用电脑上网的地点有哪些？', '1');
INSERT INTO `t_qs_checkbox` VALUES ('0a2acd84a62c4beebb20bf0cbdb6960d', 'checkbox', '您最喜欢XX公众号的哪个功能？', '1');
INSERT INTO `t_qs_checkbox` VALUES ('0db08599e240456fb4c6c969a9f5d9c7', 'checkbox', '最近半年，您使用手机上网的地点有哪些？', '1');
INSERT INTO `t_qs_checkbox` VALUES ('142fbeabee4c415395ac2bf47ff336c9', 'checkbox', '在您的外卖经历中，您觉得存在的哪些问题是？', '1');
INSERT INTO `t_qs_checkbox` VALUES ('18c6f4bb42254d11bbd84e82cb7619c6', 'checkbox', '在您的外卖经历中，您觉得存在的哪些问题是？', '1');
INSERT INTO `t_qs_checkbox` VALUES ('1c1758cd78a7418493f758bca5cb57c2', 'checkbox', '您最喜欢XX公众号哪些方面的消息推送？', '1');
INSERT INTO `t_qs_checkbox` VALUES ('233b5853e7564856a66abbd8b01d79fd', 'checkbox', '最近半年，您使用电脑上网的地点有哪些？', '1');
INSERT INTO `t_qs_checkbox` VALUES ('33849be19e6d435897a241e7fb5e800c', 'checkbox', '您主要使用哪种设备上网？', '1');
INSERT INTO `t_qs_checkbox` VALUES ('39522a4b4e204fe59cf0983227d4c4d9', 'checkbox', '最近半年，您手机上网主要使用什么网络？', '1');
INSERT INTO `t_qs_checkbox` VALUES ('404f8d3d96634b9a81d706abb137b6cb', 'checkbox', '最近半年，您使用电脑接入网络的方式有哪些？', '1');
INSERT INTO `t_qs_checkbox` VALUES ('5ee1bda4a075432ba7dcbee46bb95987', 'checkbox', '您喜欢哪类型的外卖餐饮？', '1');
INSERT INTO `t_qs_checkbox` VALUES ('625314f363cd4141b7e11fab14b8518b', 'checkbox', '你的经济来源于？', '1');
INSERT INTO `t_qs_checkbox` VALUES ('74dc6803a2994476a6b06e3cbd90bf8f', 'checkbox', '最近半年，您手机上网主要使用什么网络？', '1');
INSERT INTO `t_qs_checkbox` VALUES ('74f6311805714adaba804be83cfb6e61', 'checkbox', '最近半年，您使用电脑接入网络的方式有哪些？', '1');
INSERT INTO `t_qs_checkbox` VALUES ('77ba2ee736d0412caa9d57cc6315cd64', 'checkbox', '你的消费集中于？', '1');
INSERT INTO `t_qs_checkbox` VALUES ('80b8f25f0878480a9ab5a3ad49073e84', 'checkbox', '请问您家中有以下哪些电子设备？', '1');
INSERT INTO `t_qs_checkbox` VALUES ('8e5d276dcecc48b89784300678b178c3', 'checkbox', '请问您家中有以下哪些电子设备？', '1');
INSERT INTO `t_qs_checkbox` VALUES ('902ca2d18fe84a02891226f5c4f80a3d', 'checkbox', '您喜欢哪类型的外卖餐饮？', '1');
INSERT INTO `t_qs_checkbox` VALUES ('a32f9b5e19b04bb2aec2f4a2db93cfb8', 'checkbox', '您主要使用哪种设备上网？', '1');
INSERT INTO `t_qs_checkbox` VALUES ('d6bf6a8d42444f748ca1ccacdc4345a2', 'checkbox', '最近半年，您使用手机上网的地点有哪些？', '1');

-- ----------------------------
-- Table structure for `t_qs_radio`
-- ----------------------------
DROP TABLE IF EXISTS `t_qs_radio`;
CREATE TABLE `t_qs_radio` (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `visibility` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_qs_radio
-- ----------------------------
INSERT INTO `t_qs_radio` VALUES ('00e08ebfd814410d9c7ec02c248c82c7', 'radio', '您觉得比较合适的网络课程每节课应该多长时间？', '1');
INSERT INTO `t_qs_radio` VALUES ('0487be1bb2b641c684db7084d81fcbb5', 'radio', '请选择您所在的学段：', '1');
INSERT INTO `t_qs_radio` VALUES ('0ac211410e5346f383ff4b5483e8a848', 'radio', '您关注了多少个公众号？', '1');
INSERT INTO `t_qs_radio` VALUES ('0ddb6d59a6484b7c8bae05a3af44fa31', 'radio', '您一般通过什么方式订外卖？', '1');
INSERT INTO `t_qs_radio` VALUES ('11b33c6c00fa42d1866034337e2b8a0e', 'radio', '您一般通过什么途径知道外卖店？', '1');
INSERT INTO `t_qs_radio` VALUES ('167240aaa1e24f5183684b1d33be77d4', 'radio', '您的最高学历（含目前在读）是？', '1');
INSERT INTO `t_qs_radio` VALUES ('1850b05538f041e4bbc8112e2233a0e9', 'radio', '最近半年，您每天累计使用互联网大约多长时间？（包括电脑、手机、平板电脑、电视等设备上网时长）', '1');
INSERT INTO `t_qs_radio` VALUES ('1b6362a2ebba40459abf114f35609079', 'radio', '您的年龄是', '1');
INSERT INTO `t_qs_radio` VALUES ('1fa52caba3c643a395169b3ef34589a5', 'radio', '如果是网络授课，您更喜欢哪种形式的网络课程？', '1');
INSERT INTO `t_qs_radio` VALUES ('2413dcb52d254bac96058bde0ccbd6a5', 'radio', '您的年龄是', '1');
INSERT INTO `t_qs_radio` VALUES ('2a94675053ad419bb835c5a97fb405aa', 'radio', '你每月消费多少？', '1');
INSERT INTO `t_qs_radio` VALUES ('2d205fb586f34be1863bee20e92a262b', 'radio', '您是否希望通过饮食来控制体重？', '1');
INSERT INTO `t_qs_radio` VALUES ('3257d4316d45447eb61a08df231e9a62', 'radio', '您是从什么地方得知（关注）XX公众号的？', '1');
INSERT INTO `t_qs_radio` VALUES ('34a4b7a6ab484132a3cc5518b0fdfe43', 'radio', '你是大几的学生？', '1');
INSERT INTO `t_qs_radio` VALUES ('359bd884ccb74cf49e06fe634c57be9e', 'radio', '疫情期间需要延迟返校，对于新学期课程的安排，您更愿意是哪种形式？', '1');
INSERT INTO `t_qs_radio` VALUES ('38f10108bbfd498a97838688d285ddbc', 'radio', '您一般通过什么方式订外卖？', '1');
INSERT INTO `t_qs_radio` VALUES ('3a60b96cb23d4608b742724769bb4473', 'radio', '遇到外卖服务不满意的情况，您会怎样处理？', '1');
INSERT INTO `t_qs_radio` VALUES ('3c9603f826ee4200883476a839fc16e1', 'radio', '您对外卖服务最看重的是哪方面？', '1');
INSERT INTO `t_qs_radio` VALUES ('3df04df92934436691633433921837b9', 'radio', '到目前为止，您使用互联网大约多长时间了？（包括电脑、手机、平板电脑、电视等设备上网经验）', '1');
INSERT INTO `t_qs_radio` VALUES ('44d64c981e2747c1b2657279e61f6bc2', 'radio', '您午餐花费的时间一般为？', '1');
INSERT INTO `t_qs_radio` VALUES ('46caaea0489e4bbf9b476fc7737b0192', 'radio', '您目前的职业是？', '1');
INSERT INTO `t_qs_radio` VALUES ('5058645c8ab04f31b8948dd1615ce32f', 'radio', '您所在的年级是？', '1');
INSERT INTO `t_qs_radio` VALUES ('51ed0211a1c9410593f0c2a958ba0bd1', 'radio', '您的最高学历（含目前在读）是？', '1');
INSERT INTO `t_qs_radio` VALUES ('527bf07584c64f5e865bf3b33fd5cc65', 'radio', '您最喜欢什么形式的消息推送？', '1');
INSERT INTO `t_qs_radio` VALUES ('529843bd84464110afb58efc378ca0d3', 'radio', '您在疫情之前有过上网络课程的体验吗？', '1');
INSERT INTO `t_qs_radio` VALUES ('529a75fe627c4ec88062b44e5ef0c352', 'radio', '到目前为止，您使用互联网大约多长时间了？（包括电脑、手机、平板电脑、电视等设备上网经验）', '1');
INSERT INTO `t_qs_radio` VALUES ('5412bc52e4204df0b3c58de3d594d6fa', 'radio', '最近半年，您平均每天使用手机上网的时长大约是？', '1');
INSERT INTO `t_qs_radio` VALUES ('556c899b96354e9aaed7d9517fc20a45', 'radio', '您上的网络课程每节课大概多长时间？', '1');
INSERT INTO `t_qs_radio` VALUES ('5a3312dbfe0545c8af22b72ebc11c0ab', 'radio', '您午餐花费的时间一般为？', '1');
INSERT INTO `t_qs_radio` VALUES ('5d210b03ba4c4885832ce73b459de854', 'radio', '最近半年，您平均每天使用电脑上网的时长大约是？', '1');
INSERT INTO `t_qs_radio` VALUES ('5ea431d35e884ba1a6049efca1f540e4', 'radio', '您在什么情况下会选择叫外卖呢？', '1');
INSERT INTO `t_qs_radio` VALUES ('66e8b5f9d6364c3ea7e85332c95f774a', 'radio', '最近半年，您平均每天使用电脑上网的时长大约是？', '1');
INSERT INTO `t_qs_radio` VALUES ('6701b73e88874724b9295bc05c303cf5', 'radio', '一家外卖餐厅能够提供菜品所含的卡路里和营养，您是否会感兴趣？', '1');
INSERT INTO `t_qs_radio` VALUES ('68b3e72d85a0428d9df527afd456e01a', 'radio', '您在疫情之前有过上网络课程的体验吗？', '1');
INSERT INTO `t_qs_radio` VALUES ('6af3e3c9f0a441989e22f3ae23ae935f', 'radio', '您是否经常困扰中午应该吃什么？', '1');
INSERT INTO `t_qs_radio` VALUES ('6becaf43f8d8451a88cea429ede483eb', 'radio', '您的性别是？', '1');
INSERT INTO `t_qs_radio` VALUES ('6c938c2fa1744f7eba28e53b169c9135', 'radio', '您的性别是？', '1');
INSERT INTO `t_qs_radio` VALUES ('719c6ff9a0584daca39a09019c497d9f', 'radio', '每个月父母给的生活费有多少？', '1');
INSERT INTO `t_qs_radio` VALUES ('71d9470d38764af885f41d3b04c81419', 'radio', '遇到外卖服务不满意的情况，您会怎样处理？', '1');
INSERT INTO `t_qs_radio` VALUES ('724fa4e30afd4e6284d208ee2b4d36b1', 'radio', '您目前的职业是？', '1');
INSERT INTO `t_qs_radio` VALUES ('7a2486916fc44f8abb279ab5e1723516', 'radio', '您是否经常困扰中午应该吃什么？', '1');
INSERT INTO `t_qs_radio` VALUES ('7aa795ec0b654626b77ce3b1478f8e5e', 'radio', '你是大几的学生？', '1');
INSERT INTO `t_qs_radio` VALUES ('7b227bcfb14e4eca840a0e4db224ed03', 'radio', '您的性别是？', '1');
INSERT INTO `t_qs_radio` VALUES ('7c0f30017dd440b2ba28a12de21be433', 'radio', '选择你感兴趣的课程', '1');
INSERT INTO `t_qs_radio` VALUES ('7c9cdb095d924da389bc20cd67bdf842', 'radio', '如果是网络授课，您更喜欢哪种形式的网络课程？', '1');
INSERT INTO `t_qs_radio` VALUES ('822920a68322404a9749d9b42742a16f', 'radio', '疫情期间需要延迟返校，对于新学期课程的安排，您更愿意是哪种形式？', '1');
INSERT INTO `t_qs_radio` VALUES ('84aea8d11a9048abbf04ab23af1d77d3', 'radio', '您目前的职业是？', '1');
INSERT INTO `t_qs_radio` VALUES ('853007360e7d4131a76cccccfde14e55', 'radio', '您觉得比较合适的网络课程每节课应该多长时间？', '1');
INSERT INTO `t_qs_radio` VALUES ('88d1c394f9ef4c68b20bb2331de2aa06', 'radio', '一家外卖餐厅能够提供菜品所含的卡路里和营养，您是否会感兴趣？', '1');
INSERT INTO `t_qs_radio` VALUES ('8a4ae59245b04c5f8313f469a99ad18f', 'radio', '您如何完成网络课程布置的作业？', '1');
INSERT INTO `t_qs_radio` VALUES ('8c2e3b75e2ee409ba561c2b0ad3bcbe8', 'radio', '最近半年，您每天累计使用互联网大约多长时间？（包括电脑、手机、平板电脑、电视等设备上网时长）', '1');
INSERT INTO `t_qs_radio` VALUES ('8eff71130701455097b2610b955f59b5', 'radio', '在工作日时，您午餐的选择是', '1');
INSERT INTO `t_qs_radio` VALUES ('8f558ea2be8240e0aeb8fcdd0bd58794', 'radio', '你是否有理财的习惯？', '1');
INSERT INTO `t_qs_radio` VALUES ('8fde0aa2b74a4bd8b0dc87128a832a44', 'radio', '您能接受的午餐价格？', '1');
INSERT INTO `t_qs_radio` VALUES ('9231a02193d54f8e939eb08992e7dbef', 'radio', '您是否希望通过饮食来控制体重？', '1');
INSERT INTO `t_qs_radio` VALUES ('9a95c92760db4907b91ecbf0adec2f3b', 'radio', '请选择您所在的学段：', '1');
INSERT INTO `t_qs_radio` VALUES ('9b8100624c7f4f18a59213f8d132569d', 'radio', '您对外卖服务最看重的是哪方面？', '1');
INSERT INTO `t_qs_radio` VALUES ('ab622f88f8e54a5c8256e73d8a762c7d', 'radio', '你觉得每月父母给的生活费用于吃饭方面够吗？', '1');
INSERT INTO `t_qs_radio` VALUES ('b763792ffc9748d5b0f3c8f52889c7e1', 'radio', '最近三个月内，您叫外卖的频率更接近于？', '1');
INSERT INTO `t_qs_radio` VALUES ('ba7a8451c7474efe9e61a786439e1b82', 'radio', '您一般在什么时间查看我们的推送内容？', '1');
INSERT INTO `t_qs_radio` VALUES ('bc0976bf6d77430ca4e678c3d77d9a4c', 'radio', '您能接受的午餐价格？', '1');
INSERT INTO `t_qs_radio` VALUES ('bc9abfa058c1406fa32f263981a5e00a', 'radio', '您在什么情况下会选择叫外卖呢？', '1');
INSERT INTO `t_qs_radio` VALUES ('c1ad11c107c34c4c80d1be51f4348f97', 'radio', '您希望外卖公司提供的菜品组合？', '1');
INSERT INTO `t_qs_radio` VALUES ('c3ec6f33576149c48967f76a6f57178e', 'radio', '您的性别是？', '1');
INSERT INTO `t_qs_radio` VALUES ('c70dc58d99504050bc4fdfd4a8002f16', 'radio', '你每月消费多少？', '1');
INSERT INTO `t_qs_radio` VALUES ('c86ba53fbd004d4898060d5a74c4e2bc', 'radio', '最近三个月内，您叫外卖的频率更接近于？', '1');
INSERT INTO `t_qs_radio` VALUES ('c923f8c360744b978f1e28f92c7c019a', 'radio', '您上的网络课程每节课大概多长时间？', '1');
INSERT INTO `t_qs_radio` VALUES ('cd36be3192394591b7dc6819321233ad', 'radio', '您如何完成网络课程布置的作业？', '1');
INSERT INTO `t_qs_radio` VALUES ('d1df94cd4bdf49488418b96a05cc8298', 'radio', '您一般通过什么途径知道外卖店？', '1');
INSERT INTO `t_qs_radio` VALUES ('dcb61198e671480d8207f991a9848897', 'radio', '您觉得XX公众号推送频率多少可以接受？', '1');
INSERT INTO `t_qs_radio` VALUES ('de3e4a3b3169433e8a68425ccbc1c733', 'radio', '您希望外卖公司提供的菜品组合？', '1');
INSERT INTO `t_qs_radio` VALUES ('e622828dfc304e83936c7d0f151238a1', 'radio', '最近半年，您平均每天使用手机上网的时长大约是？', '1');
INSERT INTO `t_qs_radio` VALUES ('f569d5142f304bfb81e108bb6d2301dc', 'radio', '这是一道单选题', '1');
INSERT INTO `t_qs_radio` VALUES ('f5c0124c6fc74587a0fa495127065913', 'radio', '你每餐平均消费多少金额？', '1');
INSERT INTO `t_qs_radio` VALUES ('fe392eb4ba764e60b9121b85e9dd3f91', 'radio', '在工作日时，您午餐的选择是', '1');

-- ----------------------------
-- Table structure for `t_qs_rate`
-- ----------------------------
DROP TABLE IF EXISTS `t_qs_rate`;
CREATE TABLE `t_qs_rate` (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `visibility` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_qs_rate
-- ----------------------------
INSERT INTO `t_qs_rate` VALUES ('09cc96e38b02494ea047fd772369853b', 'rate', '你对每月的花费满意情况如何？', '1');
INSERT INTO `t_qs_rate` VALUES ('29cca468926b4ca2ba5cacde084ba4ff', 'rate', '您是否愿意继续使用本问卷调查网站？', '1');
INSERT INTO `t_qs_rate` VALUES ('3b4d436467a74a44b87928eee06ed0ba', 'rate', '您对代理人专业能力的满意度', '1');
INSERT INTO `t_qs_rate` VALUES ('3d45d72a4700441eb3013036ae7ba52d', 'rate', '您对市场、客服人员服务的满意度', '1');
INSERT INTO `t_qs_rate` VALUES ('49652e7c284e4b2aa9efaf2c887bd967', 'rate', '您对XXX的总体满意度', '1');
INSERT INTO `t_qs_rate` VALUES ('55853b0efcc64018a2bca53a7d5f2c4c', 'rate', '您是否愿意推荐身边的人（亲朋好友）使用本问卷调查网站？', '1');
INSERT INTO `t_qs_rate` VALUES ('618eff2f90844850a3ecd98d944c7f2e', 'rate', '您是否愿意推荐身边的人（亲朋好友）使用本问卷调查网站？', '1');
INSERT INTO `t_qs_rate` VALUES ('6205cf76ea574717963972e6b5cdf05b', 'rate', '您对本问卷调查网站的满意程度是？', '1');
INSERT INTO `t_qs_rate` VALUES ('8915eb14d0e4494ca21555af0407a848', 'rate', '您对我们的XX公众号总体满意度如何？', '1');
INSERT INTO `t_qs_rate` VALUES ('bcdeb0cecfac44f0a51c0e0b06550249', 'rate', '您是否愿意继续使用本问卷调查网站？', '1');
INSERT INTO `t_qs_rate` VALUES ('c1289bd8ba604c3a928260c385a20bca', 'rate', '您对本问卷调查网站的满意程度是？', '1');

-- ----------------------------
-- Table structure for `t_qs_textarea`
-- ----------------------------
DROP TABLE IF EXISTS `t_qs_textarea`;
CREATE TABLE `t_qs_textarea` (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `visibility` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_qs_textarea
-- ----------------------------
INSERT INTO `t_qs_textarea` VALUES ('106d9541ad724e7b909f856708b7577f', 'textarea', '您的手机号码是？', '1');
INSERT INTO `t_qs_textarea` VALUES ('1d17f8de78f0469b87ebf046d0ce9fb0', 'textarea', '您使用过哪些设备上网络课程？', '1');
INSERT INTO `t_qs_textarea` VALUES ('2bc6eefab1c94f6aaa45ca09280c1e57', 'textarea', '您使用过哪些设备上网络课程？', '1');
INSERT INTO `t_qs_textarea` VALUES ('499a4616977148608bc36efb674fa531', 'textarea', '您的 QQ 号码是？', '1');
INSERT INTO `t_qs_textarea` VALUES ('4adc7cf9f20e45e0962f42a3ebd9d906', 'textarea', '手机号码', '1');
INSERT INTO `t_qs_textarea` VALUES ('62209745ae3d417688e763c7cf674be6', 'textarea', '您希望我们公众号新增什么板块/功能？', '1');
INSERT INTO `t_qs_textarea` VALUES ('76637df8251a48609a8798929f71daf5', 'textarea', '您的 QQ 号码是？', '1');
INSERT INTO `t_qs_textarea` VALUES ('796c525d8e1247f58b5c65a21aade29e', 'textarea', '您的手机号码是？', '1');
INSERT INTO `t_qs_textarea` VALUES ('7a8200163f9f4fabb8d874bcecea3f70', 'textarea', '您对我们的公众号有什么意见或建议？', '1');
INSERT INTO `t_qs_textarea` VALUES ('9fc5cd8a3915413b88204547ac9fda76', 'textarea', '您的姓名', '1');
INSERT INTO `t_qs_textarea` VALUES ('a96526c7065641688c161f0660166110', 'textarea', '您的电子邮箱是？', '1');
INSERT INTO `t_qs_textarea` VALUES ('b1d9606e933943dfaf5929c9e4a19134', 'textarea', '姓名', '1');
INSERT INTO `t_qs_textarea` VALUES ('ba3bee5247db4a6fa56b0e0da7882f82', 'textarea', '您的姓名', '1');
INSERT INTO `t_qs_textarea` VALUES ('bce452809211493c96ba681228b9014e', 'textarea', '您的微信号是多少？', '1');
INSERT INTO `t_qs_textarea` VALUES ('ca8b56e0ac1a4d3aab2726d1262c5b4a', 'textarea', '您的电子邮箱是？', '1');
INSERT INTO `t_qs_textarea` VALUES ('ce858d4b71e34456ab95543c13999c10', 'textarea', '您的姓名', '1');
INSERT INTO `t_qs_textarea` VALUES ('eb1098c34ceb4e7d842cd5b12a1f3c44', 'textarea', '您的微信号是多少？', '1');

-- ----------------------------
-- Table structure for `t_question`
-- ----------------------------
DROP TABLE IF EXISTS `t_question`;
CREATE TABLE `t_question` (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `survey_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `qs_item_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_required` int(11) DEFAULT '0',
  `is_note` int(11) DEFAULT NULL,
  `note` text,
  `order_id` int(11) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_question
-- ----------------------------
INSERT INTO `t_question` VALUES ('01858a80d2bc44ea9e212260d7a5bfc9', 'radio', '88e85c5bf29c4e839194a4c6a5f12696', '3df04df92934436691633433921837b9', '0', null, null, '1008', '2020-03-19 19:16:18', null);
INSERT INTO `t_question` VALUES ('01f4e9656d28426f94699c6bcb36b5de', 'radio', '023f1c2f46ee483c935f81a1e539b2fe', '853007360e7d4131a76cccccfde14e55', '1', null, null, '1008', '2020-03-19 20:17:18', null);
INSERT INTO `t_question` VALUES ('03591953547a44f78abc976d4c8a39cd', 'checkbox', '88e85c5bf29c4e839194a4c6a5f12696', 'd6bf6a8d42444f748ca1ccacdc4345a2', '0', null, null, '1003', '2020-03-19 19:12:43', null);
INSERT INTO `t_question` VALUES ('0363b7e24580471b926d47e47c857a4b', 'radio', '792013f5afad486a9c32295ebf5a175f', '724fa4e30afd4e6284d208ee2b4d36b1', '0', null, null, '1003', '2020-03-19 17:33:22', null);
INSERT INTO `t_question` VALUES ('05e4ca2ae0ba49b48a48ba8e2b9e6d8a', 'checkbox', '88e85c5bf29c4e839194a4c6a5f12696', '404f8d3d96634b9a81d706abb137b6cb', '0', null, null, '1000', '2020-03-19 19:10:42', null);
INSERT INTO `t_question` VALUES ('077e01a996dc4dad977f13348446077f', 'textarea', '6b4d4efdb1784108a76412af5e2803f0', '499a4616977148608bc36efb674fa531', '0', null, null, '1001', '2020-03-19 19:02:58', null);
INSERT INTO `t_question` VALUES ('0c7481b993d74f23a3a8fc0792b91d7f', 'radio', '9e1d078156264050a52547013be02eb0', '8eff71130701455097b2610b955f59b5', '0', null, null, '1002', '2020-03-19 21:55:32', null);
INSERT INTO `t_question` VALUES ('0f55eff7fdb94183b9105954f3c7cae8', 'rate', '360c10dbc8f14ca889271704ca0225aa', '8915eb14d0e4494ca21555af0407a848', '0', null, null, '1008', '2020-03-19 19:31:00', null);
INSERT INTO `t_question` VALUES ('12ef5155e3ca400b80f2c113d2ab321c', 'radio', '5f7249a7e84845d68657435dd94455ee', 'b763792ffc9748d5b0f3c8f52889c7e1', '0', null, null, '1003', '2020-03-19 19:35:45', null);
INSERT INTO `t_question` VALUES ('13333cfbfdda434596fa9b8b64dd7fc9', 'radio', '9e1d078156264050a52547013be02eb0', '3c9603f826ee4200883476a839fc16e1', '0', null, null, '1013', '2020-03-19 21:55:32', null);
INSERT INTO `t_question` VALUES ('14630294f9ac4ac88f11bb1ad322ef2a', 'radio', '5f7249a7e84845d68657435dd94455ee', '3a60b96cb23d4608b742724769bb4473', '0', null, null, '1010', '2020-03-19 19:40:09', null);
INSERT INTO `t_question` VALUES ('14e75ef2c3434c54ad156375353864a5', 'radio', '9e1d078156264050a52547013be02eb0', '44d64c981e2747c1b2657279e61f6bc2', '0', null, null, '1005', '2020-03-19 21:55:32', null);
INSERT INTO `t_question` VALUES ('16ae0c8a9d7b4874b5e1d606060876d3', 'rate', 'd776f8480b7f45dbb11d6a264cc56bed', 'bcdeb0cecfac44f0a51c0e0b06550249', '0', null, null, '1002', '2020-03-19 19:20:24', null);
INSERT INTO `t_question` VALUES ('190e0e1612a145ddac08bbdcdbc56c81', 'radio', '9e1d078156264050a52547013be02eb0', 'c86ba53fbd004d4898060d5a74c4e2bc', '0', null, null, '1003', '2020-03-19 21:55:32', null);
INSERT INTO `t_question` VALUES ('1a92c1c0842741fe9dedb98cb0ed89bc', 'radio', '5f7249a7e84845d68657435dd94455ee', 'bc9abfa058c1406fa32f263981a5e00a', '0', null, null, '1004', '2020-03-19 19:36:17', null);
INSERT INTO `t_question` VALUES ('2877361a4dac4089837d387252cfd550', 'rate', 'd776f8480b7f45dbb11d6a264cc56bed', 'c1289bd8ba604c3a928260c385a20bca', '0', null, null, '1000', '2020-03-19 19:19:01', null);
INSERT INTO `t_question` VALUES ('291c9c08188a4f28b63289969c69986f', 'radio', 'ba729e9f54524158bb42900f4cbb8df5', '719c6ff9a0584daca39a09019c497d9f', '0', null, null, '1004', '2020-03-19 21:48:13', null);
INSERT INTO `t_question` VALUES ('2bc3472db6c643e0b25af17aeb242848', 'checkbox', '023f1c2f46ee483c935f81a1e539b2fe', '8e5d276dcecc48b89784300678b178c3', '1', null, null, '1001', '2020-03-19 19:45:15', null);
INSERT INTO `t_question` VALUES ('2e3fc565b3354dde8745d279daa2b9e3', 'radio', '5f7249a7e84845d68657435dd94455ee', '8fde0aa2b74a4bd8b0dc87128a832a44', '0', null, null, '1015', '2020-03-19 19:41:55', null);
INSERT INTO `t_question` VALUES ('30ffe429b9af410f9038d88762bdbba6', 'radio', 'c344bfc0eebe42b4bd9461ed4998c291', '0487be1bb2b641c684db7084d81fcbb5', '1', null, null, '1000', '2020-03-19 22:00:59', null);
INSERT INTO `t_question` VALUES ('312b16540dc74a2c8080769a7a9396a8', 'textarea', '44db89b84629446c9bf9ba3f25c653ff', 'b1d9606e933943dfaf5929c9e4a19134', '1', null, null, '1000', '2020-03-19 21:10:02', null);
INSERT INTO `t_question` VALUES ('362ff34cb3c144c48c37be0e6c725f68', 'radio', '360c10dbc8f14ca889271704ca0225aa', 'dcb61198e671480d8207f991a9848897', '0', null, null, '1005', '2020-03-19 19:29:19', null);
INSERT INTO `t_question` VALUES ('38576f71300d4ca0abb16e07a1a1adb8', 'checkbox', '360c10dbc8f14ca889271704ca0225aa', '1c1758cd78a7418493f758bca5cb57c2', '0', null, null, '1002', '2020-03-19 19:27:41', null);
INSERT INTO `t_question` VALUES ('4666527a44234a17a26edf4a4d7e3989', 'checkbox', '88e85c5bf29c4e839194a4c6a5f12696', 'a32f9b5e19b04bb2aec2f4a2db93cfb8', '0', null, null, '1004', '2020-03-19 19:13:45', null);
INSERT INTO `t_question` VALUES ('49c83373556f4706bd33f669af90c27d', 'radio', '5f7249a7e84845d68657435dd94455ee', 'fe392eb4ba764e60b9121b85e9dd3f91', '0', null, null, '1002', '2020-03-19 19:35:21', null);
INSERT INTO `t_question` VALUES ('4b2cbdd8993445cfbf37b3525ee39b89', 'textarea', '6b4d4efdb1784108a76412af5e2803f0', 'bce452809211493c96ba681228b9014e', '0', null, null, '1000', '2020-03-19 19:02:52', null);
INSERT INTO `t_question` VALUES ('4b69f68a9d20476ea741538d98f8123e', 'radio', '023f1c2f46ee483c935f81a1e539b2fe', '9a95c92760db4907b91ecbf0adec2f3b', '1', null, null, '1000', '2020-03-19 19:44:38', null);
INSERT INTO `t_question` VALUES ('4e12c764d242458081d2af756a191c92', 'radio', '792013f5afad486a9c32295ebf5a175f', '2413dcb52d254bac96058bde0ccbd6a5', '0', null, null, '1001', '2020-03-19 17:31:16', null);
INSERT INTO `t_question` VALUES ('4f1622522a39448a9b59efe11bd8d631', 'rate', '61e072ac351a40cf9e81235752250f25', '3b4d436467a74a44b87928eee06ed0ba', '0', null, null, '1004', '2020-03-19 21:39:00', null);
INSERT INTO `t_question` VALUES ('50670d305710419cb2b3eb6b10b6c375', 'textarea', '360c10dbc8f14ca889271704ca0225aa', '7a8200163f9f4fabb8d874bcecea3f70', '0', null, null, '1010', '2020-03-19 19:31:20', null);
INSERT INTO `t_question` VALUES ('544c791315e44484ac11a7740a6859c2', 'radio', '5f7249a7e84845d68657435dd94455ee', '88d1c394f9ef4c68b20bb2331de2aa06', '0', null, null, '1012', '2020-03-19 19:40:59', null);
INSERT INTO `t_question` VALUES ('56f57513ea0249f8acebef2ba4bdbc3a', 'radio', '9e1d078156264050a52547013be02eb0', 'bc0976bf6d77430ca4e678c3d77d9a4c', '0', null, null, '1015', '2020-03-19 21:55:32', null);
INSERT INTO `t_question` VALUES ('57c05fde62744172ba59018316719234', 'radio', 'c344bfc0eebe42b4bd9461ed4998c291', 'cd36be3192394591b7dc6819321233ad', '1', null, null, '1005', '2020-03-19 22:00:59', null);
INSERT INTO `t_question` VALUES ('5e26045015284271843b0db858c2d109', 'checkbox', 'ba729e9f54524158bb42900f4cbb8df5', '77ba2ee736d0412caa9d57cc6315cd64', '0', null, null, '1002', '2020-03-19 21:45:11', null);
INSERT INTO `t_question` VALUES ('5ff17a5e123b4c88acfea0a21f64268d', 'textarea', '023f1c2f46ee483c935f81a1e539b2fe', '1d17f8de78f0469b87ebf046d0ce9fb0', '0', null, null, '1002', '2020-03-19 19:46:44', null);
INSERT INTO `t_question` VALUES ('61f503ef32fb4aecafe8facb1b322f50', 'radio', 'c344bfc0eebe42b4bd9461ed4998c291', '7c9cdb095d924da389bc20cd67bdf842', '1', null, null, '1007', '2020-03-19 22:00:59', null);
INSERT INTO `t_question` VALUES ('625f65f4530c4773bee035e5ccfc9251', 'radio', '9e1d078156264050a52547013be02eb0', '38f10108bbfd498a97838688d285ddbc', '0', null, null, '1006', '2020-03-19 21:55:32', null);
INSERT INTO `t_question` VALUES ('6639029691b54b689a83ca9d03b999fa', 'checkbox', 'c344bfc0eebe42b4bd9461ed4998c291', '80b8f25f0878480a9ab5a3ad49073e84', '1', null, null, '1001', '2020-03-19 22:00:59', null);
INSERT INTO `t_question` VALUES ('675c36b4c9b14710aa44537b8e7b3713', 'radio', 'c344bfc0eebe42b4bd9461ed4998c291', '556c899b96354e9aaed7d9517fc20a45', '1', null, null, '1004', '2020-03-19 22:00:59', null);
INSERT INTO `t_question` VALUES ('67ce4ecf55b042469a0c0436eae90fa9', 'radio', '5f7249a7e84845d68657435dd94455ee', 'c1ad11c107c34c4c80d1be51f4348f97', '0', null, null, '1014', '2020-03-19 19:41:37', null);
INSERT INTO `t_question` VALUES ('6c8a7ee8cb494acea732c7bd9a007a15', 'radio', '9e1d078156264050a52547013be02eb0', '9231a02193d54f8e939eb08992e7dbef', '0', null, null, '1011', '2020-03-19 21:55:32', null);
INSERT INTO `t_question` VALUES ('6d3cabb13fb741cd8c38afb6c2ca002f', 'checkbox', '88e85c5bf29c4e839194a4c6a5f12696', '048d3562e92542cc8cc679f0f5427018', '0', null, null, '1001', '2020-03-19 19:11:17', null);
INSERT INTO `t_question` VALUES ('6d50b2e4e7a34560af09aa604981e9c9', 'radio', 'ba729e9f54524158bb42900f4cbb8df5', '2a94675053ad419bb835c5a97fb405aa', '0', null, null, '1001', '2020-03-19 21:44:20', null);
INSERT INTO `t_question` VALUES ('6f2593c0b0ac454bb3ccfc7ba003d72c', 'radio', '360c10dbc8f14ca889271704ca0225aa', '0ac211410e5346f383ff4b5483e8a848', '0', null, null, '1006', '2020-03-19 19:29:49', null);
INSERT INTO `t_question` VALUES ('706f9f265ed64c02a84402a628b6b704', 'radio', '360c10dbc8f14ca889271704ca0225aa', '3257d4316d45447eb61a08df231e9a62', '0', null, null, '1000', '2020-03-19 19:26:06', null);
INSERT INTO `t_question` VALUES ('70c520634125457d9f8c0320afba2d6b', 'radio', '5f7249a7e84845d68657435dd94455ee', '5a3312dbfe0545c8af22b72ebc11c0ab', '0', null, null, '1005', '2020-03-19 19:36:46', null);
INSERT INTO `t_question` VALUES ('71e7ed53d9aa4aefa046bde873998be5', 'radio', '9e1d078156264050a52547013be02eb0', '6701b73e88874724b9295bc05c303cf5', '0', null, null, '1012', '2020-03-19 21:55:32', null);
INSERT INTO `t_question` VALUES ('740edb45e82242ad9c94c8841d67dcd9', 'radio', '360c10dbc8f14ca889271704ca0225aa', '527bf07584c64f5e865bf3b33fd5cc65', '0', null, null, '1004', '2020-03-19 19:28:45', null);
INSERT INTO `t_question` VALUES ('7692e9951a9d4fcdba787a2ce7df6ecc', 'radio', '792013f5afad486a9c32295ebf5a175f', '51ed0211a1c9410593f0c2a958ba0bd1', '0', null, null, '1002', '2020-03-19 17:32:20', null);
INSERT INTO `t_question` VALUES ('78e073506c24454f984d0729b0306135', 'radio', 'c344bfc0eebe42b4bd9461ed4998c291', '68b3e72d85a0428d9df527afd456e01a', '1', null, null, '1003', '2020-03-19 22:00:59', null);
INSERT INTO `t_question` VALUES ('7990fef5541145cbb250146b71a55d8b', 'textarea', '61e072ac351a40cf9e81235752250f25', 'ce858d4b71e34456ab95543c13999c10', '0', null, null, '1000', '2020-03-19 21:37:53', null);
INSERT INTO `t_question` VALUES ('7e2b9b0588f04d03ad26e3a0d008539d', 'radio', '9e1d078156264050a52547013be02eb0', '5ea431d35e884ba1a6049efca1f540e4', '0', null, null, '1004', '2020-03-19 21:55:32', null);
INSERT INTO `t_question` VALUES ('7e60b74a21c7440fae4eac4d4fb68b30', 'radio', 'ba729e9f54524158bb42900f4cbb8df5', 'ab622f88f8e54a5c8256e73d8a762c7d', '0', null, null, '1005', '2020-03-19 21:49:02', null);
INSERT INTO `t_question` VALUES ('7fc9987fd6bd47efbc280d215d19bff6', 'radio', '9e1d078156264050a52547013be02eb0', '71d9470d38764af885f41d3b04c81419', '0', null, null, '1010', '2020-03-19 21:55:32', null);
INSERT INTO `t_question` VALUES ('8048880570454348a16ed3efe6576708', 'textarea', '360c10dbc8f14ca889271704ca0225aa', '62209745ae3d417688e763c7cf674be6', '0', null, null, '1009', '2020-03-19 19:31:09', null);
INSERT INTO `t_question` VALUES ('828d4874bd804287b4865cb4a45ea813', 'checkbox', '5f7249a7e84845d68657435dd94455ee', '5ee1bda4a075432ba7dcbee46bb95987', '0', null, null, '1008', '2020-03-19 19:38:16', null);
INSERT INTO `t_question` VALUES ('84af14cbfc3546ae8fe6d6c98f6653f5', 'radio', '5f7249a7e84845d68657435dd94455ee', '0ddb6d59a6484b7c8bae05a3af44fa31', '0', null, null, '1006', '2020-03-19 19:37:13', null);
INSERT INTO `t_question` VALUES ('875fd9278a2549318e8366c31b0eb887', 'rate', '61e072ac351a40cf9e81235752250f25', '49652e7c284e4b2aa9efaf2c887bd967', '0', null, null, '1002', '2020-03-19 21:38:38', null);
INSERT INTO `t_question` VALUES ('896c13a27c4a41dc9a88a328e5f1fbb8', 'radio', '88e85c5bf29c4e839194a4c6a5f12696', '5d210b03ba4c4885832ce73b459de854', '0', null, null, '1006', '2020-03-19 19:15:20', null);
INSERT INTO `t_question` VALUES ('896f791e67154bdb9e8074c12b36c3ac', 'checkbox', '9e1d078156264050a52547013be02eb0', '902ca2d18fe84a02891226f5c4f80a3d', '0', null, null, '1008', '2020-03-19 21:55:32', null);
INSERT INTO `t_question` VALUES ('8f15cfb516584ff98544cf598a6309dd', 'rate', '61e072ac351a40cf9e81235752250f25', '3d45d72a4700441eb3013036ae7ba52d', '0', null, null, '1003', '2020-03-19 21:38:50', null);
INSERT INTO `t_question` VALUES ('8faa6d3ac9274c0a9ab3de584c76a66f', 'textarea', '6b4d4efdb1784108a76412af5e2803f0', 'ca8b56e0ac1a4d3aab2726d1262c5b4a', '0', null, null, '1002', '2020-03-19 19:03:27', null);
INSERT INTO `t_question` VALUES ('91d6418e22744e598b3403aa42386d27', 'radio', '5f7249a7e84845d68657435dd94455ee', '6af3e3c9f0a441989e22f3ae23ae935f', '0', null, null, '1000', '2020-03-19 19:34:51', null);
INSERT INTO `t_question` VALUES ('94b773f92d8e44df8d225231c3e0dbd9', 'radio', '360c10dbc8f14ca889271704ca0225aa', '5058645c8ab04f31b8948dd1615ce32f', '0', null, null, '1007', '2020-03-19 19:30:17', null);
INSERT INTO `t_question` VALUES ('9663d3dd6892487788a99279aab17a49', 'radio', '9e1d078156264050a52547013be02eb0', '11b33c6c00fa42d1866034337e2b8a0e', '0', null, null, '1007', '2020-03-19 21:55:32', null);
INSERT INTO `t_question` VALUES ('99561dd6cae643ce95e1046827cce5ad', 'checkbox', '360c10dbc8f14ca889271704ca0225aa', '0a2acd84a62c4beebb20bf0cbdb6960d', '0', null, null, '1001', '2020-03-19 19:26:44', null);
INSERT INTO `t_question` VALUES ('9c2ca107092a4affa6bb9729256b6ddd', 'radio', '9e1d078156264050a52547013be02eb0', '7a2486916fc44f8abb279ab5e1723516', '0', null, null, '1000', '2020-03-19 21:55:32', null);
INSERT INTO `t_question` VALUES ('9d82d8308c8447778ce35b8941b8584a', 'radio', '023f1c2f46ee483c935f81a1e539b2fe', '1fa52caba3c643a395169b3ef34589a5', '1', null, null, '1007', '2020-03-19 20:16:56', null);
INSERT INTO `t_question` VALUES ('9d9719db89764a6fb5c5e8cbcea0a9e8', 'radio', '360c10dbc8f14ca889271704ca0225aa', 'ba7a8451c7474efe9e61a786439e1b82', '0', null, null, '1003', '2020-03-19 19:28:18', null);
INSERT INTO `t_question` VALUES ('a01cb4bef8bc4a40bb72b8385706d4b6', 'textarea', 'c344bfc0eebe42b4bd9461ed4998c291', '2bc6eefab1c94f6aaa45ca09280c1e57', '0', null, null, '1002', '2020-03-19 22:00:59', null);
INSERT INTO `t_question` VALUES ('aa4f1a24b1e4479a99c0be47645f63fb', 'radio', '9e1d078156264050a52547013be02eb0', 'de3e4a3b3169433e8a68425ccbc1c733', '0', null, null, '1014', '2020-03-19 21:55:32', null);
INSERT INTO `t_question` VALUES ('adb3ef3f07554aa18814c5593d048d24', 'radio', '023f1c2f46ee483c935f81a1e539b2fe', '529843bd84464110afb58efc378ca0d3', '1', null, null, '1003', '2020-03-19 19:46:16', null);
INSERT INTO `t_question` VALUES ('b249984371314b4989a1625b002a4d46', 'radio', '023f1c2f46ee483c935f81a1e539b2fe', '822920a68322404a9749d9b42742a16f', '1', null, null, '1006', '2020-03-19 20:16:37', null);
INSERT INTO `t_question` VALUES ('b3bdb3e4bc3f4c9abba88bee51ba36bb', 'radio', 'c344bfc0eebe42b4bd9461ed4998c291', '359bd884ccb74cf49e06fe634c57be9e', '1', null, null, '1006', '2020-03-19 22:00:59', null);
INSERT INTO `t_question` VALUES ('b4fb5eb84638460eaf6cd2e00e3ddec1', 'checkbox', 'ba729e9f54524158bb42900f4cbb8df5', '625314f363cd4141b7e11fab14b8518b', '0', null, null, '1003', '2020-03-19 21:46:10', null);
INSERT INTO `t_question` VALUES ('b7dedd2d80ec45ed9b6fc6e60077e268', 'checkbox', '5f7249a7e84845d68657435dd94455ee', '142fbeabee4c415395ac2bf47ff336c9', '0', null, null, '1009', '2020-03-19 19:39:20', null);
INSERT INTO `t_question` VALUES ('ba69d0fedec9402aadf0dc16bbf7eaad', 'rate', 'd776f8480b7f45dbb11d6a264cc56bed', '55853b0efcc64018a2bca53a7d5f2c4c', '0', null, null, '1001', '2020-03-19 19:19:24', null);
INSERT INTO `t_question` VALUES ('bb71e3a0817448a287d7413dc91eee20', 'radio', '5f7249a7e84845d68657435dd94455ee', '9b8100624c7f4f18a59213f8d132569d', '0', null, null, '1013', '2020-03-19 19:41:19', null);
INSERT INTO `t_question` VALUES ('c204c3c880bc438f83df5835192b98ab', 'radio', '9e1d078156264050a52547013be02eb0', 'c3ec6f33576149c48967f76a6f57178e', '0', null, null, '1001', '2020-03-19 21:55:32', null);
INSERT INTO `t_question` VALUES ('c3235c67a8384087836fd66ccbb76a5d', 'radio', '88e85c5bf29c4e839194a4c6a5f12696', 'e622828dfc304e83936c7d0f151238a1', '0', null, null, '1005', '2020-03-19 19:14:13', null);
INSERT INTO `t_question` VALUES ('c4c778fecb3e454cb3980456acd5b4cc', 'radio', '5f7249a7e84845d68657435dd94455ee', 'd1df94cd4bdf49488418b96a05cc8298', '0', null, null, '1007', '2020-03-19 19:37:45', null);
INSERT INTO `t_question` VALUES ('c959b779d89b4a37a8f798f4bc0acf81', 'radio', '88e85c5bf29c4e839194a4c6a5f12696', '1850b05538f041e4bbc8112e2233a0e9', '0', null, null, '1007', '2020-03-19 19:15:48', null);
INSERT INTO `t_question` VALUES ('cc6e1c4f63eb480e9edf9f1665e1e3c0', 'textarea', '44db89b84629446c9bf9ba3f25c653ff', '4adc7cf9f20e45e0962f42a3ebd9d906', '1', null, null, '1001', '2020-03-19 21:10:17', null);
INSERT INTO `t_question` VALUES ('cd04f29136d64458ac2a0b5ffbd9fac1', 'radio', 'ba729e9f54524158bb42900f4cbb8df5', '34a4b7a6ab484132a3cc5518b0fdfe43', '0', null, null, '1000', '2020-03-19 21:43:47', null);
INSERT INTO `t_question` VALUES ('d2d35e74d4424d3cb5cfa35150ce5279', 'textarea', '6b4d4efdb1784108a76412af5e2803f0', '106d9541ad724e7b909f856708b7577f', '0', null, null, '1003', '2020-03-19 19:03:40', null);
INSERT INTO `t_question` VALUES ('d5c0c8c2c8ca43369e36ac0b1583922c', 'radio', '5f7249a7e84845d68657435dd94455ee', '6becaf43f8d8451a88cea429ede483eb', '0', null, null, '1001', '2020-03-19 19:35:12', null);
INSERT INTO `t_question` VALUES ('d7cd6846f56b4773a7957cdab2b2229b', 'radio', '968b4712ebff4d55a847eb52033b8a9e', 'f569d5142f304bfb81e108bb6d2301dc', '0', null, null, '1000', '2020-03-23 22:41:13', null);
INSERT INTO `t_question` VALUES ('dbcf2d344ded4adb8047e13b6def0b76', 'rate', 'ba729e9f54524158bb42900f4cbb8df5', '09cc96e38b02494ea047fd772369853b', '0', null, null, '1006', '2020-03-19 21:49:38', null);
INSERT INTO `t_question` VALUES ('dcbd208f4cd1442994fb36fbcdd961b3', 'radio', '023f1c2f46ee483c935f81a1e539b2fe', 'c923f8c360744b978f1e28f92c7c019a', '1', null, null, '1004', '2020-03-19 19:48:55', null);
INSERT INTO `t_question` VALUES ('de946c42fd9d4907ac1ea088e5ba4ab7', 'radio', '792013f5afad486a9c32295ebf5a175f', '6c938c2fa1744f7eba28e53b169c9135', '0', null, null, '1000', '2020-03-19 17:30:44', null);
INSERT INTO `t_question` VALUES ('de9f3ffd9d474d3aba5b1574ec377970', 'checkbox', '9e1d078156264050a52547013be02eb0', '18c6f4bb42254d11bbd84e82cb7619c6', '0', null, null, '1009', '2020-03-19 21:55:32', null);
INSERT INTO `t_question` VALUES ('e0214d41c34d49d1ad0ff5a7e2880a09', 'radio', 'c344bfc0eebe42b4bd9461ed4998c291', '00e08ebfd814410d9c7ec02c248c82c7', '1', null, null, '1008', '2020-03-19 22:00:59', null);
INSERT INTO `t_question` VALUES ('e2afc29089f84825b645fcb581e91ac7', 'radio', '5f7249a7e84845d68657435dd94455ee', '2d205fb586f34be1863bee20e92a262b', '0', null, null, '1011', '2020-03-19 19:40:44', null);
INSERT INTO `t_question` VALUES ('e750f0bd7d91445887731d68ae76ebe2', 'radio', 'ba729e9f54524158bb42900f4cbb8df5', 'f5c0124c6fc74587a0fa495127065913', '0', null, null, '1008', '2020-03-19 21:50:47', null);
INSERT INTO `t_question` VALUES ('e77aac02d10e432caeb54ab418426c5d', 'radio', '44db89b84629446c9bf9ba3f25c653ff', '7c0f30017dd440b2ba28a12de21be433', '1', null, null, '1002', '2020-03-19 21:10:35', null);
INSERT INTO `t_question` VALUES ('ea1b9b99ce904cffa49a50b9501394fb', 'radio', '023f1c2f46ee483c935f81a1e539b2fe', '8a4ae59245b04c5f8313f469a99ad18f', '1', null, null, '1005', '2020-03-19 20:15:45', null);
INSERT INTO `t_question` VALUES ('f5ea4207ae6a4a8a8a17a7d8a65112df', 'radio', 'ba729e9f54524158bb42900f4cbb8df5', '8f558ea2be8240e0aeb8fcdd0bd58794', '0', null, null, '1007', '2020-03-19 21:49:52', null);
INSERT INTO `t_question` VALUES ('f8f85a67fcb44198a14ba92e790a6867', 'checkbox', '88e85c5bf29c4e839194a4c6a5f12696', '39522a4b4e204fe59cf0983227d4c4d9', '0', null, null, '1002', '2020-03-19 19:12:01', null);
INSERT INTO `t_question` VALUES ('fcaffd6a15d9425f94939563601e663d', 'radio', '61e072ac351a40cf9e81235752250f25', '46caaea0489e4bbf9b476fc7737b0192', '0', null, null, '1001', '2020-03-19 21:38:02', null);
INSERT INTO `t_question` VALUES ('fe98c3cc33324671ab3adc18da85471c', 'textarea', '792013f5afad486a9c32295ebf5a175f', '9fc5cd8a3915413b88204547ac9fda76', '0', null, null, '999', '2020-03-19 17:30:48', null);

-- ----------------------------
-- Table structure for `t_question_bank`
-- ----------------------------
DROP TABLE IF EXISTS `t_question_bank`;
CREATE TABLE `t_question_bank` (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `belong_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `qs_item_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `folder` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_question_bank
-- ----------------------------
INSERT INTO `t_question_bank` VALUES ('02c3e48704cd4b06a6beea93907d7710', 'admin', 'checkbox', '74f6311805714adaba804be83cfb6e61', '2020-03-19 22:29:53', '上网行为');
INSERT INTO `t_question_bank` VALUES ('1ac712c0606041fd9b88949f7c3285a7', 'admin', 'radio', '529a75fe627c4ec88062b44e5ef0c352', '2020-03-19 22:30:08', '上网行为');
INSERT INTO `t_question_bank` VALUES ('1d9ecfd5b90b4460aa523b752709a634', 'admin', 'textarea', '76637df8251a48609a8798929f71daf5', '2020-03-19 19:05:22', '联系方式');
INSERT INTO `t_question_bank` VALUES ('595d0171dcea4209986a2e6c552cefcd', 'admin', 'rate', '6205cf76ea574717963972e6b5cdf05b', '2020-03-19 22:26:28', '满意度');
INSERT INTO `t_question_bank` VALUES ('5c71546a9ae54b31bee0a0092fbbf669', 'admin', 'checkbox', '0db08599e240456fb4c6c969a9f5d9c7', '2020-03-19 22:30:00', '上网行为');
INSERT INTO `t_question_bank` VALUES ('5e29a3e1d27647a59a7507aaf45b7e33', 'admin', 'checkbox', '233b5853e7564856a66abbd8b01d79fd', '2020-03-19 22:29:55', '上网行为');
INSERT INTO `t_question_bank` VALUES ('5e5e303f548348a9be43ad42a63b20e4', 'admin', 'radio', '167240aaa1e24f5183684b1d33be77d4', '2020-03-19 22:29:02', '人口属性');
INSERT INTO `t_question_bank` VALUES ('63b070f259d74d5b957024f437d438a6', 'admin', 'textarea', '796c525d8e1247f58b5c65a21aade29e', '2020-03-19 19:05:26', '联系方式');
INSERT INTO `t_question_bank` VALUES ('8a47b457576943cd84fc9b2b5f11ac57', 'admin', 'radio', '84aea8d11a9048abbf04ab23af1d77d3', '2020-03-19 22:29:06', '人口属性');
INSERT INTO `t_question_bank` VALUES ('977ec04f083945ed97e4ad727d03a0b8', 'admin', 'radio', '8c2e3b75e2ee409ba561c2b0ad3bcbe8', '2020-03-19 22:30:06', '上网行为');
INSERT INTO `t_question_bank` VALUES ('9a14a7643b5346508daecd7fad721e0c', 'admin', 'textarea', 'a96526c7065641688c161f0660166110', '2020-03-19 19:05:24', '联系方式');
INSERT INTO `t_question_bank` VALUES ('9e3447c71467444e8d5f263f5ebea0ad', 'admin', 'rate', '29cca468926b4ca2ba5cacde084ba4ff', '2020-03-19 19:21:15', '满意度');
INSERT INTO `t_question_bank` VALUES ('9f11f06d1f2d4bad90a5c33097a0ce45', 'admin', 'checkbox', '33849be19e6d435897a241e7fb5e800c', '2020-03-19 22:30:01', '上网行为');
INSERT INTO `t_question_bank` VALUES ('a2bb1601c4464f2aad53a61b863e540c', 'admin', 'radio', '5412bc52e4204df0b3c58de3d594d6fa', '2020-03-19 22:30:03', '上网行为');
INSERT INTO `t_question_bank` VALUES ('ada83bac7b1544f7bbeacf9d8bffc711', 'admin', 'radio', '7b227bcfb14e4eca840a0e4db224ed03', '2020-03-19 22:28:58', '人口属性');
INSERT INTO `t_question_bank` VALUES ('b1aee8fcdeaf484daf40c74baa5ba44d', 'admin', 'radio', '66e8b5f9d6364c3ea7e85332c95f774a', '2020-03-19 22:30:05', '上网行为');
INSERT INTO `t_question_bank` VALUES ('c710dd8594e64bb0a8b35f4dd6956cbe', 'admin', 'rate', '618eff2f90844850a3ecd98d944c7f2e', '2020-03-19 19:21:18', '满意度');
INSERT INTO `t_question_bank` VALUES ('d0f92e4a370d47f6912f43a31ef9e7a4', 'admin', 'checkbox', '74dc6803a2994476a6b06e3cbd90bf8f', '2020-03-19 22:29:57', '上网行为');
INSERT INTO `t_question_bank` VALUES ('d38f5c8861954c4eaba1468a1ebb878b', 'admin', 'radio', '1b6362a2ebba40459abf114f35609079', '2020-03-19 22:29:00', '人口属性');
INSERT INTO `t_question_bank` VALUES ('e3b89868f96341c4a5433452d8c57ce0', 'admin', 'textarea', 'eb1098c34ceb4e7d842cd5b12a1f3c44', '2020-03-19 19:05:18', '联系方式');
INSERT INTO `t_question_bank` VALUES ('ffa7e4a020fe43ff9d6e1a95e98f1eef', 'admin', 'textarea', 'ba3bee5247db4a6fa56b0e0da7882f82', '2020-03-19 22:28:56', '人口属性');

-- ----------------------------
-- Table structure for `t_survey`
-- ----------------------------
DROP TABLE IF EXISTS `t_survey`;
CREATE TABLE `t_survey` (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` text,
  `introduction` text,
  `number` int(11) DEFAULT NULL,
  `total_time` int(11) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT NULL,
  `en_handle` int(11) DEFAULT NULL,
  `en_an_date` datetime DEFAULT NULL,
  `creator` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `visibility` int(11) DEFAULT '1',
  `visits` int(11) DEFAULT '0',
  `quote` int(11) DEFAULT '0',
  `reference_to` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_survey
-- ----------------------------
INSERT INTO `t_survey` VALUES ('023f1c2f46ee483c935f81a1e539b2fe', '网课问卷调查-学生版', '亲爱的同学们，在延迟开学期间，请您花一点时间，填答以下有关网络课程的调查问卷。问卷采取匿名方式，请认真作答。“固居于室，得以静心，专注于学，突破提升”。希望你秉持学校和老师的教诲，在家长的悉心关怀下，', '9', '0', '2020-03-19 19:44:15', '2020-03-19 20:18:10', null, null, 'admin', '0', '1', '0', '1', null);
INSERT INTO `t_survey` VALUES ('360c10dbc8f14ca889271704ca0225aa', '校园公众号粉丝调查', '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', '11', '5', '2020-03-19 19:04:32', '2020-03-19 21:04:47', null, null, 'admin', '1', '1', '5', '0', null);
INSERT INTO `t_survey` VALUES ('44db89b84629446c9bf9ba3f25c653ff', '在线课程报名表', '在线课程开始报名啦！选择你想上的课程，留下联系方式。', '3', '0', '2020-03-19 21:09:48', '2020-03-19 21:11:08', null, null, 'admin', '0', '1', '0', '0', null);
INSERT INTO `t_survey` VALUES ('5f7249a7e84845d68657435dd94455ee', '外卖需求', '本次的调查情景均指白领/学生在工作日选择午餐时关于外卖需求的情况', '16', '0', '2020-03-19 19:34:35', '2020-03-19 20:23:03', null, null, 'admin', '0', '1', '0', '1', null);
INSERT INTO `t_survey` VALUES ('61e072ac351a40cf9e81235752250f25', '客户满意度调查表', '您好，非常感谢您对XXX的大力支持和信任。 为了更进一步提高服务质量，特就XXX的业务、服务、维护等方面征求意见。我们真诚的希望您能填写这份问券，提供宝贵的意见和建议。', '5', '0', '2020-03-19 21:35:23', '2020-03-19 21:39:03', null, null, 'admin', '0', '1', '0', '0', null);
INSERT INTO `t_survey` VALUES ('6b4d4efdb1784108a76412af5e2803f0', '联系方式', '问卷网题库', '4', '0', '2020-03-19 19:02:32', '2020-03-19 19:04:00', null, null, 'admin', '0', '1', '0', '0', null);
INSERT INTO `t_survey` VALUES ('792013f5afad486a9c32295ebf5a175f', '人口属性', '问卷网题库', '5', '0', '2020-03-19 16:36:10', '2020-03-19 22:20:12', null, null, 'admin', '0', '1', '0', '0', null);
INSERT INTO `t_survey` VALUES ('88e85c5bf29c4e839194a4c6a5f12696', '上网行为', '腾讯问卷题库', '9', '0', '2020-03-19 19:10:22', '2020-03-19 22:25:24', null, null, 'admin', '0', '1', '0', '0', null);
INSERT INTO `t_survey` VALUES ('968b4712ebff4d55a847eb52033b8a9e', '问卷标题', '为了给您提供更好的服务，希望您能抽出几分钟时间，将您的感受和建议告诉我们，我们非常重视每位用户的宝贵意见，期待您的参与！现在我们就马上开始吧！', '1', '2', '2020-03-23 01:40:25', '2020-03-23 22:41:13', null, null, 'admin', '1', '0', '33', '0', null);
INSERT INTO `t_survey` VALUES ('9e1d078156264050a52547013be02eb0', '2020年春季上班族外卖需求调查', '本次的调查情景均指白领/学生在工作日选择午餐时关于外卖需求的情况', '16', '0', '2020-03-19 21:55:32', '2020-03-19 21:56:30', null, null, 'admin', '0', '1', '0', '0', null);
INSERT INTO `t_survey` VALUES ('ba729e9f54524158bb42900f4cbb8df5', '大学生在校消费调查表', '感谢您能抽出几分钟时间来参加本次答题，现在我们就马上开始吧！！', '9', '0', '2020-03-19 21:43:12', '2020-04-01 00:29:54', '0', '2020-04-01 00:00:00', 'admin', '0', '1', '0', '0', null);
INSERT INTO `t_survey` VALUES ('c344bfc0eebe42b4bd9461ed4998c291', '2020年学生在线学习情况问卷调查问卷', '本问卷用于测试答卷统计功能，请大家随意填写，谢谢。', '9', '70', '2020-03-19 22:00:59', '2020-03-19 22:04:26', null, null, 'admin', '1', '1', '22', '0', null);
INSERT INTO `t_survey` VALUES ('d776f8480b7f45dbb11d6a264cc56bed', '满意度', '腾讯问卷题库', '3', '0', '2020-03-19 19:18:44', '2020-03-19 19:20:43', null, null, 'admin', '0', '1', '0', '0', null);

-- ----------------------------
-- Table structure for `t_survey_recycle`
-- ----------------------------
DROP TABLE IF EXISTS `t_survey_recycle`;
CREATE TABLE `t_survey_recycle` (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `survey_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total_time` int(11) DEFAULT NULL,
  `submit_date` datetime DEFAULT NULL,
  `device_info` varchar(255) DEFAULT NULL,
  `data_source` varchar(255) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_survey_recycle
-- ----------------------------

-- ----------------------------
-- Table structure for `t_survey_tag`
-- ----------------------------
DROP TABLE IF EXISTS `t_survey_tag`;
CREATE TABLE `t_survey_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` char(32) DEFAULT NULL,
  `tag_name` varchar(255) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_survey_tag
-- ----------------------------
INSERT INTO `t_survey_tag` VALUES ('26', '360c10dbc8f14ca889271704ca0225aa', '满意度', '2020-03-19 19:32:11');
INSERT INTO `t_survey_tag` VALUES ('27', '5f7249a7e84845d68657435dd94455ee', '外卖', '2020-03-19 19:42:45');
INSERT INTO `t_survey_tag` VALUES ('29', '023f1c2f46ee483c935f81a1e539b2fe', '网络课程', '2020-03-19 21:05:58');
INSERT INTO `t_survey_tag` VALUES ('30', '44db89b84629446c9bf9ba3f25c653ff', '网络课程', '2020-03-19 21:11:20');
INSERT INTO `t_survey_tag` VALUES ('31', '61e072ac351a40cf9e81235752250f25', '满意度', '2020-03-19 21:39:13');
INSERT INTO `t_survey_tag` VALUES ('32', '360c10dbc8f14ca889271704ca0225aa', '校园', '2020-03-19 21:42:50');
INSERT INTO `t_survey_tag` VALUES ('33', 'ba729e9f54524158bb42900f4cbb8df5', '校园', '2020-03-19 21:51:33');
INSERT INTO `t_survey_tag` VALUES ('34', 'ba729e9f54524158bb42900f4cbb8df5', '消费', '2020-03-19 21:51:39');
INSERT INTO `t_survey_tag` VALUES ('35', '360c10dbc8f14ca889271704ca0225aa', '公众号', '2020-03-19 21:51:58');
INSERT INTO `t_survey_tag` VALUES ('36', '023f1c2f46ee483c935f81a1e539b2fe', '校园', '2020-03-19 21:57:28');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '1',
  `salt` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('2ad0df3f9dae4d28ae361c7d5abc5b9f', 'q', 'q@qq.me', 'bd808184773461aa8d57d69c7a8038ca', '2020-03-24 00:09:59', '2020-04-01 00:12:54', '1', 'SURVEY2020406357', '200000');
INSERT INTO `t_user` VALUES ('5e3e32c8e6644a3ab4cee65b894ab5d1', 'admin', 'admin@mail.me', '38f8712d0d1c841ed765bf6c6e9e1cd6', '2020-03-24 00:27:01', '2020-04-01 00:48:35', '1', 'SURVEY2020881257', '100000');
