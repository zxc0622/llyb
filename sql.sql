--数据库更细记录

--咨询服务顾问	2016.12.06
DROP TABLE IF EXISTS `advisor_consult`;
CREATE TABLE `advisor_consult` (
  `id` int(11) NOT NULL auto_increment,
  `type` varchar(50) default NULL COMMENT '类型',
  `title` varchar(255) default NULL COMMENT '主题',
  `content` text COMMENT '内容',
  `contact` varchar(50) default NULL COMMENT '联系人',
  `phone` varchar(50) default NULL COMMENT '手机',
  `email` varchar(50) default NULL COMMENT '邮箱',
  `QQ` varchar(50) default NULL COMMENT 'qq号码',
  `create_date` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '创建时间',
  `remarks` varchar(255) default NULL COMMENT '备注',
  `del_flag` tinyint(255) default '0' COMMENT '删除标志（0未删除，1删除）',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='咨询服务顾问';

--危废类型
update sys_dict_pcr a
left join (SELECT id FROM `sys_dict_pcr` WHERE name='危险废物') b on
    a.parent_id=b.id
set a.remarks=CASE a.name 
when 'HW01' THEN '医疗废物'
when 'HW02' THEN '医药废物'
when 'HW02' THEN '医药废物'
when 'HW03' THEN '废药物、药品'
when 'HW04' THEN '农药废物'
when 'HW05' THEN '木材防腐剂废物'
when 'HW06' THEN '废有机溶剂与含有机溶剂废物'
when 'HW07' THEN '热处理含氰废物'
when 'HW08' THEN '废矿物油与含矿物油废物'
when 'HW09' THEN '油/水、烃/水混合物或乳化液'
when 'HW10' THEN '多氯（溴）联苯类废物'
when 'HW11' THEN '精（蒸）馏残渣'
when 'HW12' THEN '染料、涂料废物'
when 'HW13' THEN '有机树脂类废物'
when 'HW14' THEN '新化学物质废物'
when 'HW15' THEN '爆炸性废物'
when 'HW16' THEN '感光材料废物'
when 'HW17' THEN '表面处理废物'
when 'HW18' THEN '焚烧处置残渣'
when 'HW19' THEN '含金属羰基化合物废物'
when 'HW20' THEN '含铍废物'
when 'HW21' THEN '含铬废物'
when 'HW22' THEN '含铜废物'
when 'HW23' THEN '含锌废物'
when 'HW24' THEN '含砷废物'
when 'HW25' THEN '含硒废物'
when 'HW26' THEN '含镉废物'
when 'HW27' THEN '含锑废物'
when 'HW28' THEN '含碲废物'
when 'HW29' THEN '含汞废物'
when 'HW30' THEN '含铊废物'
when 'HW31' THEN '含铅废物'
when 'HW32' THEN '无机氟化物废物'
when 'HW33' THEN '无机氰化物废物'
when 'HW34' THEN '废酸'
when 'HW35' THEN '废碱'
when 'HW36' THEN '石棉废物'
when 'HW37' THEN '有机磷化合物废物'
when 'HW38' THEN '有机氰化物废物'
when 'HW39' THEN '含酚废物'
when 'HW40' THEN '含醚废物'
when 'HW41' THEN ''
when 'HW42' THEN ''
when 'HW43' THEN ''
when 'HW44' THEN ''
when 'HW45' THEN '含有机卤化物废物'
when 'HW46' THEN '含镍废物'
when 'HW47' THEN '含钡废物'
when 'HW48' THEN '有色金属冶炼废物'
when 'HW49' THEN '其他废物'
when 'HW50' THEN '废催化剂'
END

--20161124 明星案例
--新建明星案例表
DROP TABLE IF EXISTS `advisor_case`;
CREATE TABLE `advisor_case` (
  `id` bigint(20) NOT NULL auto_increment,
  `title` varchar(255) default NULL COMMENT '案例标题',
  `content` text COMMENT '案例内容（html）',
  `seq` int(255) default NULL COMMENT '排序',
  `img` varchar(255) default NULL COMMENT '图片路径',
  `summary` varchar(255) default NULL COMMENT '简介',
  `source` varchar(50) default NULL COMMENT '来源',
  `create_date` timestamp NULL default CURRENT_TIMESTAMP COMMENT '创建时间',
  `del_flag` tinyint(1) default '0' COMMENT '删除标志，默认为0，删除为1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='环保顾问明星案例';

--新增明星案例菜单
INSERT INTO sys_menu(parent_id,parent_ids,name,sort,is_show,href) 
 SELECT id,CONCAT(parent_ids,id) pids,'明星案例',1,1,'/advisorCase' FROM sys_menu WHERE name='信息管理'
 
INSERT INTO sys_role_menu(role_id,menu_id) 
SELECT r.id,m.id from sys_menu m 
JOIN
sys_role r where r.name like '%管理员%' AND m.name='明星案例' 

--20161017
/**
 * 团队实力表
 */
DROP TABLE IF EXISTS `sys_company_team`;
CREATE TABLE `sys_company_team` (
  `id` int(11) NOT NULL auto_increment,
  `company_id` int(11) default NULL COMMENT '企业id',
  `img_url` varchar(100) default NULL COMMENT '头部背景图片',
  `summary` text COMMENT '团队简介',
  `employee` varchar(50) default NULL COMMENT '公司员工数量',
  `experts` varchar(50) default NULL COMMENT '专家团队数量',
  `patent` varchar(50) default NULL COMMENT '专利技术数量',
  `artisan_pic` text COMMENT '技术人员相册,json数组格式：[{"key":"唯一标识","pic":"图片地址","titile":"介绍信息"},...]',
  `update_date` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `del_flag` tinyint(4) default NULL COMMENT '删除表示，默认为0，删除为1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='团队实力';

--20161011
/**
 * 更改服务案例和服务类型的排列顺序
 */
update sys_dict SET `value`=(CASE label WHEN '服务类型' THEN 7 WHEN '服务案例' THEN 6 END) WHERE type='module_type' and `value` in (6,7)
update sys_company_custom SET `module_type`=(CASE seq WHEN 6 THEN 7 WHEN 7 THEN 6 END) WHERE `module_type` in (6,7)

--20161008 uck
/**
 * banner模块测试数据
 */
INSERT INTO `sys_company_custom_banner` VALUES ('1', '3', 'http://localhost:8080/llhb/hyzl/findImgResourcesURL?str=20161007/1475855804730.png', 'https://www.baidu.com/?tn=erer', null, '2016-10-07 23:56:51', '0');
INSERT INTO `sys_company_custom_banner` VALUES ('2', '3', 'http://localhost:8080/llhb/hyzl/findImgResourcesURL?str=20161007/1475854695343.png', 'https://www.baidu.com/?tn=47018152_dg', null, '2016-10-07 23:41:26', '0');
INSERT INTO `sys_company_custom_banner` VALUES ('3', '3', 'http://localhost:8080/llhb/hyzl/findImgResourcesURL?str=20161007/1475854884644.png', 'https://www.baidu.com/?tn=47018152_dg', null, '2016-10-07 23:41:26', '0');

--20161004 uck
/**
 * 头部模块测试数据
 */
INSERT INTO `sys_company_custom_head` VALUES ('1', '1', null, '2016-10-04 10:35:55', '0');

--20160928 uck
ALTER TABLE `sys_company_custom_navigation`
ADD COLUMN `show_flag`  bit(1) NULL DEFAULT  COMMENT '是否显示（1是0否）' AFTER `update_date`;

--20160929 wyp
/*
 * 服务类型测试数据
 */
INSERT INTO `sys_company_custom_service` (`id`, `custom_id`, `items`, `update_date`, `del_flag`) VALUES ('1', '6', '1202,1203,1204,1205,1206,1207,1208,1209,1210,', '2016-09-28 18:35:00', '0');

--20160929 wyp
/*
 * 案例表删除排序字段
 */
ALTER TABLE `inma_case_info`
DROP COLUMN `seq`;

--20160929 wyp
/*
 * 案例表测试数据
 */
INSERT INTO `inma_case_info` ( `user_id`, `case_name`, `type_id`, `case_type`, `prov_id`, `city_id`, `area_id`, `address`, `case_desc`, `pic1`, `pic2`, `pic3`, `price`, `time_length`, `sta`, `page_view`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ( '1', '环评编写服务案例', '1202', '环评编写', '24', '0', '0', '东莞市', '环评编写的案例描述', 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160808/1470622331683.png', NULL, NULL, '999.00', '10', '2', NULL, '1', '2016-09-29 11:47:25', '1', NULL, NULL, '0');
INSERT INTO `inma_case_info` ( `user_id`, `case_name`, `type_id`, `case_type`, `prov_id`, `city_id`, `area_id`, `address`, `case_desc`, `pic1`, `pic2`, `pic3`, `price`, `time_length`, `sta`, `page_view`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ( '1', '环保工程服务案例', '1203', '环保工程', '24', '0', '0', '深圳市', '环保工程的案例描述', 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160808/1470622144203.png', NULL, NULL, '999.00', '10', '2', NULL, '1', '2016-09-29 11:48:25', '1', NULL, NULL, '0');
INSERT INTO `inma_case_info` ( `user_id`, `case_name`, `type_id`, `case_type`, `prov_id`, `city_id`, `area_id`, `address`, `case_desc`, `pic1`, `pic2`, `pic3`, `price`, `time_length`, `sta`, `page_view`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ( '1', '项目验收服务案例', '1204', '项目验收', '24', '0', '0', '广州市', '项目验收的案例描述', 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160808/1470621942334.png', NULL, NULL, '999.00', '10', '2', NULL, '1', '2016-09-29 11:49:25', '1', NULL, NULL, '0');
INSERT INTO `inma_case_info` ( `user_id`, `case_name`, `type_id`, `case_type`, `prov_id`, `city_id`, `area_id`, `address`, `case_desc`, `pic1`, `pic2`, `pic3`, `price`, `time_length`, `sta`, `page_view`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ( '1', '环境检测服务案例', '1205', '环境检测', '24', '0', '0', '惠州市', '环境检测的案例描述', 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160804/1470276842494.jpg', NULL, NULL, '999.00', '10', '2', NULL, '1', '2016-09-29 11:50:25', '1', NULL, NULL, '0');
INSERT INTO `inma_case_info` ( `user_id`, `case_name`, `type_id`, `case_type`, `prov_id`, `city_id`, `area_id`, `address`, `case_desc`, `pic1`, `pic2`, `pic3`, `price`, `time_length`, `sta`, `page_view`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ( '1', '清洁生产服务案例', '1206', '清洁生产', '24', '0', '0', '河源市', '清洁生产的案例描述', 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160712/1468284182888.png', NULL, NULL, '999.00', '10', '2', NULL, '1', '2016-09-29 11:51:25', '1', NULL, NULL, '0');
INSERT INTO `inma_case_info` ( `user_id`, `case_name`, `type_id`, `case_type`, `prov_id`, `city_id`, `area_id`, `address`, `case_desc`, `pic1`, `pic2`, `pic3`, `price`, `time_length`, `sta`, `page_view`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ( '1', '应急预案服务案例', '1207', '应急预案', '24', '0', '0', '韶关市', '应急预案的案例描述', 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160708/1467965531019.png', NULL, NULL, '999.00', '10', '2', NULL, '1', '2016-09-29 11:52:25', '1', NULL, NULL, '0');


--20160929 wyp
/*
 * 产品品表测试数据
 */
INSERT INTO `youyi`.`inma_product_info` ( `type_first`, `type_second`, `type_third`, `pro_name`, `prov_id`, `city_id`, `pro_desc`, `pic1`, `pic2`, `pic3`, `past_date`, `low_price`, `high_price`, `unit`, `unit_desc`, `amount`, `sta`, `page_view`, `seo_key_words`, `page_desc`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`, `seq`) VALUES ( '932', '933', '950', '全自动清洗过滤器', '34', '4512', '<p><strong><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">功能与用途</span></strong><br style=\"white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"/><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">　　RDZD-S型反冲洗式自洁式过滤器广泛用于冶金、化工、石油、造纸、医药、食品、采矿、电力、城市给水领域。诸如：工业废水、循环水的过滤，乳化液的再生，废油过滤处理，冶金行业的连铸水系统、高炉水系统，热轧用高压水除磷系统。是一种先进、高效且易操作的全自动过滤装置。</span><br style=\"white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"/><strong><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">设备结构与工作原理</span></strong><br style=\"white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"/><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">　　RDZD-S型反冲洗式自洁式过滤器由壳体、多元</span><a href=\"http://www.sxrdscl.com/supply/58.html\" target=\"_blank\" style=\"color: rgb(26, 75, 119); white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">滤芯</a><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">、反冲洗机构、电控箱、减速机、电动阀门和差压控制器等部分组成。壳体内的横隔板将其内腔分为上、下两腔，上腔内配有多个过滤芯，这样充分利用了过滤空间，显著缩小了过滤器的体积，下腔内安装有反冲洗吸盘。工作时，浊液经入口进入过滤器下腔，又经隔板孔进入滤芯的内腔。大于过滤芯缝隙的杂质被截留，净液穿过缝隙到达上腔，最后从出口送出。</span><br style=\"white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"/><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">　　反冲洗过滤器芯采用高强度的Johnson楔形滤网，通过压差控制、定时控制自动清洗滤芯。当过滤器内杂质积聚在滤芯表面引起进出口压差增大到设定值，或定时器达到预置时间时，电动控制箱发出信号，驱动反冲洗机构。当反冲洗吸盘口与滤芯进口正对时，排污阀打开，此时系统泄压排水，吸盘与滤芯内侧出现一个相对压力低于滤芯外侧水压的负压区，迫使部分净循环水从滤芯外侧流入滤芯内侧，吸附在滤芯内壁上的杂质微粒随水流进吸盘内并从排污阀排出。特殊设计的Johnson滤网使得滤芯内部产生喷射效果，任何杂质都将被从光滑的内壁上冲走。当过滤器进出口压差恢复正常或定时器设定时间结束，电机停止运转，电动排污阀关闭。整个过程中，物料不断流，反洗耗水量少，实现了连续化，自动化生产。</span><br style=\"white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"/><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">本</span><a href=\"http://www.sxrdscl.com/supply/65.html\" target=\"_blank\" style=\"color: rgb(26, 75, 119); white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">反冲排污过滤器</a><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">特点</span><br style=\"white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"/><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">　　a.自动清洗过滤器减速机构采用NRV型减速机;</span><br style=\"white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"/><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">　　b.密封装置采用CVA62.1-85标准增强四氟双端面密封结构，密封性能可靠、使用寿命长、承压能力强;</span><br style=\"white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"/><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">　　c.顶部设有自动排气阀，结构紧凑、启闭灵敏；</span><br style=\"white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"/><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">　　d.反冲排污过滤器差压取样部分采用D520/7DD型切换差压可调式差压控制器，信号反馈正确；</span><br style=\"white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"/><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">　　e.自洁式过滤器滤芯采用高强度Johnson滤网，缝隙精确率高、有效过滤面积大、压降小，反冲洗效率高；</span><br style=\"white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"/><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">　　f.滤芯花板采用304不锈钢，与反冲洗吸盘工作界面进行镜面处理；</span><br style=\"white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"/><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">　　g.反冲洗排污过滤器洗吸盘采用增强聚四氟乙烯结构及反冲洗吸盘自整机构，能确保吸盘与滤芯花板的长效密封，增强了反冲洗效果;</span><br style=\"white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"/><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">　　h.反清洗过滤器电气控制部分采用PLC可编程控制器，清洗模式采用差压控制、定时控制及手动控制并联模式，清洗程序采用定时定位模式，反洗耗水量小，清洗彻底；</span><br style=\"white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"/><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">　　i.清洗过滤器电控箱采用立柱子全透屏户外防水型结构。</span><br style=\"white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"/><a href=\"http://www.sxrdscl.com/supply/28.html\" target=\"_blank\" style=\"color: rgb(26, 75, 119); white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"><strong>全自动清洗过滤器</strong></a><strong><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">技术参数</span></strong><br style=\"white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"/><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">　　1、公称直径：150、200、250、300、350、400、500、600、700、800、900、1000、1200</span><br style=\"white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"/><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">　　2、设计压力：1.0MPa(另外有1.6MPa和2.5MPa可供选用）</span><br style=\"white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"/><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">　　3、切换差调节范围：0.035-0.15MPa</span><br style=\"white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"/><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">　　4、过滤精度：(1)冲孔板结构：≥1000μm （2）复合编织网结构≥25μm (3)Johnson楔形网：≥50μm</span><br style=\"white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"/><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">　　5、差压设定值调节范围：0.02-0.16MPa&nbsp;</span><br style=\"white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"/><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">　　6、反冲洗时间设定范围：1-24h&nbsp;</span><br style=\"white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"/><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">　　7、工作方式:手动、自动</span><br style=\"white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"/><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">　　8、电动功率：0.5-2.2KW&nbsp;</span><br style=\"white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"/><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">　　9、压力损失:0.02-0.1MPa</span><br style=\"white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"/><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">　　10、电机参数：380V 50HZ</span><br style=\"white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"/><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">　　11、清洗耗水量：主流量的0.5-1%。</span><br style=\"white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"/><strong><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">全自动清洗过滤器安装与使用指南</span></strong><br style=\"white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"/><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">　　为了维修方便，RDZD系列全自动清洗过滤器应在进出口设阀门，并做旁通管路，为了防止过大的杂物进入过滤器，建议在过滤器的入口端安装固定过滤网。</span><br style=\"white-space: normal; padding: 0px; widows: 2; margin: 0px; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\"/><span style=\"widows: 2; font-stretch: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑, Arial, Tahoma, 宋体; orphans: 2; background-color: rgb(255, 255, 255);\">　　另外，安装时应注意外壳上的简头方向与水流方向一致。</span></p>', 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160809/1470711874021.jpg', '', '', '9999-12-31 11:08:53', NULL, NULL, '1', NULL, NULL, '2', '0', '陕西瑞达水处理设备厂家直销', '', '1', '2016-08-09 11:08:53', '1', NULL, NULL, '0', NULL);
INSERT INTO `youyi`.`inma_product_info` ( `type_first`, `type_second`, `type_third`, `pro_name`, `prov_id`, `city_id`, `pro_desc`, `pic1`, `pic2`, `pic3`, `past_date`, `low_price`, `high_price`, `unit`, `unit_desc`, `amount`, `sta`, `page_view`, `seo_key_words`, `page_desc`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`, `seq`) VALUES ( '142', '143', '158', '功能滤芯，活化T33滤芯', '22', '4320', '<p>大/小T33后置功能滤芯，活化T33滤芯,磁化功能滤芯是由食品级的塑料壳体,内盛抗菌活化球、磁化球、矿化球和碱化球等，各种陶瓷球按照科学的配比组成。经过它的水变 成具有活性的小分子团水、偏碱性水和富含微量矿物元素的健康水。外壳有半透明/不透明2种，所有产品可根据用户要求定做。</p><p><img src=\"http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160809/1470712238211004712.jpg\" title=\"1470712238211004712.jpg\" alt=\"111.jpg\"/></p><p><span style=\";font-family:宋体;font-size:14px\">淄博巨东工贸有限公司成立于</span><span style=\";font-family:宋体;font-size:14px\">2007<span style=\"font-family:宋体\">年</span><span style=\"font-family:Calibri\">4</span><span style=\"font-family:宋体\">月</span><span style=\"font-family:Calibri\">4</span><span style=\"font-family:宋体\">日，</span></span><span style=\"font-family: Verdana;letter-spacing: 0;font-size: 13px;background: rgb(255, 255, 255)\">是一家专业研究、生产水处理设备材料的专业性公司，精制各类远红外、负离子等各类水处理原材料，以及各类依托水处理原材料衍生的各类水处理产品</span><span style=\"font-family: 宋体;letter-spacing: 0;font-size: 13px;background: rgb(255, 255, 255)\">，产品种类齐全，</span><span style=\"font-family: Verdana;letter-spacing: 0;font-size: 14px;background: rgb(255, 255, 255)\">根据市场变化推出诸多新型水处理材料产品，涉及除氯球，去余氯球，除氯颗粒，抗菌柱，除氯柱，负电位球，亚硫酸钙球，负电位柱，负离子球，矿化球，麦饭石球，电气石球，远红外球，矿化球，活水球，木鱼石球，去污球，托玛琳球，微晶石，液体钙离子球，远红外球，硅磷晶，保健枕球，磁能净水球，富硒能量球，高能小分子球，负电位片，波动能量球，保健坐垫按摩球，纳米银抗菌球，碱性活化球，玉石负离子球，亚硫酸钙颗粒，洗碗球，吸附球，微孔钙离子球，微晶离子石，钙离子球，锗保健球，钛白球钛能量球，能量杯配料，能量水机配料，热敷球，导热球，桑拿房保健球，纳米杯配料，活性钙离子球，净水器矿化球，填料球，洗衣球，抑菌矿化球，水处理功能<span style=\"font-family:Verdana\">T33</span><span style=\"font-family:宋体\">滤芯，负离子功能滤芯，远红外滤芯，负电位滤芯，亚硫酸钙球滤芯，除氯滤芯，碱性滤芯，矿化滤芯等等。</span></span><span style=\"font-family: 宋体;letter-spacing: 0;font-size: 13px;background: rgb(255, 255, 255)\">欢迎广大新老客户来电咨询或选购！联系人：薛小姐，联系电话：15275995063，QQ:613346165</span></p><p><br/></p>', 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160809/1470712141883.jpg', 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160809/1470712147008.jpg', 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160809/1470712152307.jpg', '9999-12-31 11:10:40', NULL, NULL, '1', NULL, '888888.00', '2', '0', '功能滤芯，活化T33滤芯，磁化功能滤芯，矿化滤芯', '', '1', '2016-08-09 11:10:40', '1', NULL, NULL, '0', NULL);
INSERT INTO `youyi`.`inma_product_info` ( `type_first`, `type_second`, `type_third`, `pro_name`, `prov_id`, `city_id`, `pro_desc`, `pic1`, `pic2`, `pic3`, `past_date`, `low_price`, `high_price`, `unit`, `unit_desc`, `amount`, `sta`, `page_view`, `seo_key_words`, `page_desc`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`, `seq`) VALUES ( '142', '147', '225', '耐酸耐温瓷砖厂家', '21', '4309', '<p><span style=\"font-size: 14pt;\">耐酸瓷砖是以石英、长石、粘土为主要原料，经高温氧化分解制成的耐腐蚀材料，产品背部加燕尾槽，施工时便于与耐酸泥牢固粘接，不易脱落。即可保证工程质量，又能延长工程使用寿命，是化工、石油、电力、化肥、化纤、冶炼、制药、制酸、制碱等工业理想的防腐材料。</span></p><p><span style=\"font-size: 14pt;\">我单位可根据用户要求，生产大小长短规格不同规格的产品。我公司设有一支专业性防腐施工队，拥有一批过硬的设计、施工技术人员，曾服务过大中小化工厂、冶炼厂等各种防腐设备，可承接各类防腐工程及污水工程。</span></p><p><span style=\"font-size: 14pt;\">&nbsp;</span></p><p><span style=\"font-size: 14pt;\"><span style=\"font-weight: 700;\">产品特点</span></span></p><p><span style=\"font-size: 14pt;\">具有耐酸碱度高，吸水率低，在常温下不易氧化，不易被介质污染等性能，除氢氟酸及热磷酸外，对温氯盐水、盐酸、硫酸、硝酸等酸类及在常温下的任何浓度的碱类，均有优良的抗腐作用。并在地下污水道和露天地面等工作地都可发挥其耐腐蚀力。我单位可根据用户要求，生产大小长短规格不同规格的产品。</span></p><p><span style=\"font-size: 14pt;\">由于耐酸砖板结构紧密,吸水率小,所以在常温下也可耐任何浓度的碱性介质,但不耐温度高的熔融碱.耐酸砖含有二氧化硅70%以上,经烧结而成,在化学工业中多应用于砌酸沟、酸井、贮酸库及载酸大的受冲击地面。</span></p><p><span style=\"font-size: 14pt;\">&nbsp;</span></p><p><span style=\"font-size: 14pt;\"><span style=\"font-weight: 700;\">产品</span><span style=\"font-weight: 700;\">特性：</span></span></p><p><span style=\"font-size: 14pt;\">&nbsp;1、具有耐酸度高、耐温耐酸效果好，吸水率低、在常温下不易氧化、不易被介质污染等性。</span></p><p><span style=\"font-size: 14pt;\">&nbsp;2、除氢氟酸以及热磷酸外，对湿氯、盐水、盐酸、硫酸、硝酸等酸类以及在常温下的任何浓度的碱类均有优良的抗腐蚀作用。</span></p><p><span style=\"font-size: 14pt;\">&nbsp;<img src=\"http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160809/1470712372519069608.jpg\" title=\"1470712372519069608.jpg\" alt=\"a-041.jpg\"/></span></p><p><span style=\"font-size: 14pt;\"><span style=\"font-weight: 700;\">产品应用</span></span></p><p><span style=\"font-size: 14pt;\">耐酸砖板用途：耐酸砖广泛应用于石油、化工、制药、食品、造纸、化肥、农药、化纤、纺织、冶炼、电厂等行业，以及塔、池、罐、槽的防腐内衬，并在污水处理工程方面和露天地面等工作场地都发挥其耐酸防腐作用。耐酸砖能耐除氢氟酸、热磷、浓碱之外的大多数介质，对湿氯盐水，盐酸、硫酸、硝酸等酸类及在常温下的任何浓度的碱类，均有优良的抗腐作用。</span></p><p><span style=\"font-size: 14pt;\">&nbsp;</span></p><p><span style=\"font-size: 14pt;\"><span style=\"font-weight: 700;\">使用说明：</span>&nbsp;&nbsp;</span></p><table bordercolor=\"#ffffff\" cellpadding=\"0\" cellspacing=\"1\" width=\"749\" style=\"width: 575px;\"><tbody><tr class=\"firstRow\"><td height=\"20\" style=\"margin: 0px; padding: 0px; cursor: text;\"><br/></td></tr><tr><td height=\"20\" style=\"margin: 0px; padding: 0px; cursor: text;\"><ol style=\"padding: 0px;\" class=\" list-paddingleft-2\"><li><p><span style=\"font-size: 14pt;\">一般环氧树脂，耐酸胶泥、耐酸水泥铺贴，铺贴时可根据上述生产厂家产品使用说明书进行施工；</span></p></li><li><p><span style=\"font-size: 14pt;\">用草酸清洗混凝土表面，达到酸碱中和；</span></p></li><li><p><span style=\"font-size: 14pt;\">工业瓷耐酸砖，间缝宽度约8--10mm，间缝深度与砖厚相平为宜，以防泄露；</span></p></li><li><p><span style=\"font-size: 14pt;\">铺贴完毕后应用槽酸冲刷表面，以助于更加牢固。</span></p></li></ol></td></tr></tbody></table><p><br/></p>', 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160809/1470712223219.JPG', 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160809/1470712241982.JPG', 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160809/1470712256490.JPG', '9999-12-31 11:12:56', '4.20', '12.00', '4', NULL, '1000000.00', '2', '0', '耐酸瓷砖，耐酸耐温砖，瓷砖厂家', '', '1', '2016-08-09 11:12:56', '1', NULL, NULL, '0', NULL);
INSERT INTO `youyi`.`inma_product_info` ( `type_first`, `type_second`, `type_third`, `pro_name`, `prov_id`, `city_id`, `pro_desc`, `pic1`, `pic2`, `pic3`, `past_date`, `low_price`, `high_price`, `unit`, `unit_desc`, `amount`, `sta`, `page_view`, `seo_key_words`, `page_desc`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`, `seq`) VALUES ( '142', '143', '158', '巨东PH碱性滤芯，T33滤芯', '22', '4320', '<p>巨东PH碱性滤芯可以调节酸性水变成偏碱性水。经过检测发现，PH碱性滤芯可以提高水的PH值，短时间就可以达到偏碱性，会调节PH值上升1-2个值。在生命长期的进化过程中，人体形成了较为稳定的呈微碱性的内环境，人体体液在正常状态下的pH值为7.04，也就是说，人体在处于偏碱性状态时，是***平衡、***健康的。但由于现代人大量 摄入高蛋白、高脂肪的偏酸性食物，容易造成人体体质的酸性化，导致身体机能减弱，新陈代谢变得缓慢，各种代谢废物不容易排出，内脏负担加重，***常见的表现是容易疲劳、上火便秘、 感冒，严重的还可能导致高血压等慢性疾病。反之，当人体处于正常的微碱性状态时，新陈代谢就较为活跃，体内废物容易排出，身体免疫力也较强，不易得病。</p><p>联系人：薛小姐，联系电话：15275995063，QQ:613346165</p><p><img src=\"http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160809/1470712429790083512.jpg\" title=\"1470712429790083512.jpg\" alt=\"01.jpg\"/></p>', 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160809/1470712339655.jpg', 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160809/1470712352873.jpg', 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160809/1470712357685.jpg', '9999-12-31 11:14:25', NULL, NULL, '1', NULL, '888888.00', '2', '0', '碱性滤芯，小分子滤芯，矿化滤芯，、磁性滤芯、负电位滤芯、除氯滤芯', '', '1', '2016-08-09 11:14:25', '1', NULL, NULL, '0', NULL);
INSERT INTO `youyi`.`inma_product_info` ( `type_first`, `type_second`, `type_third`, `pro_name`, `prov_id`, `city_id`, `pro_desc`, `pic1`, `pic2`, `pic3`, `past_date`, `low_price`, `high_price`, `unit`, `unit_desc`, `amount`, `sta`, `page_view`, `seo_key_words`, `page_desc`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`, `seq`) VALUES ( '142', '146', '204', '除蓝墨水滤料，净水滤料生产厂家', '22', '4320', '<p><span style=\";font-family:宋体;font-size:14px\">&nbsp; &nbsp; 净水产业的快速发展，带动了功能陶瓷球市场不断发展创新。功能陶瓷球主要应用在净水器过滤、加湿器抗菌、热水器除垢和花洒除氯等。主要产品有麦饭石陶瓷球、电气石陶瓷球、微孔抗菌陶瓷球、负电位陶瓷球、除氯陶瓷球和除垢陶瓷球等产品。</span></p><p><span style=\";font-family:宋体;font-size:14px\">&nbsp;&nbsp;&nbsp;功能陶瓷球的制造主要是利用天然矿石材料，如麦饭石、电气石、火山岩、硅藻土等矿物材料，通过添加抗菌材料、负离子材料和镁合金等材料，再配以高岭土、粘土等陶瓷材料，经混料、造粒、烧结、水洗、筛选等工艺制成。</span><span style=\";font-family:宋体;font-size:14px\">功能陶瓷球对水质的净化和改善有较好的效果，能够实现水质的净化和功能化要求。</span></p><p><span style=\"font-family: Verdana;letter-spacing: 0;font-size: 14px;background: rgb(255, 255, 255)\">&nbsp; &nbsp; &nbsp; 巨东根据市场变化推出诸多新型水处理材料产品，涉及除氯球，去余氯球，除氯颗粒，抗菌柱，除氯柱，负电位球，亚硫酸钙球，负电位柱，负离子球，矿化球，麦饭石球，电气石球，远红外球，矿化球，活水球，木鱼石球，去污球，托玛琳球，微晶石，液体钙离子球，远红外球，硅磷晶，保健枕球，磁能净水球，富硒能量球，高能小分子球，负电位片，波动能量球，保健坐垫按摩球，纳米银抗菌球，碱性活化球，玉石负离子球，亚硫酸钙颗粒，洗碗球，吸附球，微孔钙离子球，微晶离子石，钙离子球，锗保健球，钛白球钛能量球，能量杯配料，能量水机配料，热敷球，导热球，桑拿房保健球，纳米杯配料，活性钙离子球，净水器矿化球，填料球，洗衣球，抑菌矿化球，水处理功能<span style=\"font-family:Verdana\">T33</span><span style=\"font-family:宋体\">滤芯，负离子功能滤芯，远红外滤芯，负电位滤芯，亚硫酸钙球滤芯，除氯滤芯，碱性滤芯，矿化滤芯等等。</span></span><span style=\"font-family: 宋体;letter-spacing: 0;font-size: 13px;background: rgb(255, 255, 255)\">欢迎广大新老客户来电咨询或选购！联系人;薛小姐，联系电话：15275995063，QQ:613346165</span></p><p><span style=\"font-family: 宋体;letter-spacing: 0;font-size: 13px;background: rgb(255, 255, 255)\">&nbsp;</span></p><p><br/></p>', 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160809/1470712648969.png', 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160809/1470712653174.png', 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160809/1470712657956.png', '9999-12-31 11:19:06', NULL, NULL, '1', NULL, '888888.00', '2', '0', '除蓝墨水滤料，净水滤料，功能滤料，功能陶瓷球，净水陶瓷球厂家', '', '1', '2016-08-09 11:19:06', '1', NULL, NULL, '0', NULL);


--20160929 wyp
/*
 * 资质证书表测试数据
 */
INSERT INTO `youyi`.`cs_manage_certificate` ( `shop_id`, `info_title`, `title_color`, `cer_org`, `start_date`, `past_date`, `cer_pic`, `cer_desc`, `sta`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`, `seq`) VALUES ( '8118', '营业执照（三证合一）正本', NULL, '广东省惠州市工商管理局', '2009-03-13 00:00:00', '2029-03-13 00:00:00', 'http://yyhb365.com:80/hyzl/findImgResourcesURL?str=20160808/1470625480779.jpg', '', '1', '7958', '2016-08-08 11:04:45', NULL, NULL, NULL, '0', NULL);
INSERT INTO `youyi`.`cs_manage_certificate` ( `shop_id`, `info_title`, `title_color`, `cer_org`, `start_date`, `past_date`, `cer_pic`, `cer_desc`, `sta`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`, `seq`) VALUES ( '8118', '营业执照（三证合一）副本', NULL, '广东省惠州市工商行政管理局', '2009-03-13 00:00:00', '2029-03-13 00:00:00', 'http://yyhb365.com:80/hyzl/findImgResourcesURL?str=20160808/1470625549971.jpg', '', '1', '7958', '2016-08-08 11:05:51', NULL, NULL, NULL, '0', NULL);
INSERT INTO `youyi`.`cs_manage_certificate` ( `shop_id`, `info_title`, `title_color`, `cer_org`, `start_date`, `past_date`, `cer_pic`, `cer_desc`, `sta`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`, `seq`) VALUES ( '8118', '营业执照', NULL, '上海市松江区市场监督管理局', '2009-06-11 00:00:00', '2019-06-10 00:00:00', 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160808/1470647240592.jpg', '', '1', '7972', '2016-08-08 17:07:28', NULL, NULL, NULL, '0', NULL);
INSERT INTO `youyi`.`cs_manage_certificate` ( `shop_id`, `info_title`, `title_color`, `cer_org`, `start_date`, `past_date`, `cer_pic`, `cer_desc`, `sta`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`, `seq`) VALUES ( '8118', '克莱森商标注册证', NULL, '中华人民共和国国家工商行政管理总局', '2013-09-28 00:00:00', '2023-09-27 00:00:00', 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160808/1470647387857.jpg', '', '1', '7972', '2016-08-08 17:09:49', NULL, NULL, NULL, '0', NULL);

--20160929 wyp
/*
 * 相片详情添加【相片名称字段】
 */
ALTER TABLE `cs_manage_image_detail`
ADD COLUMN `name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片名称' AFTER `host_id`;

--20160929 wyp
/*
 * 相册表测试数据，添加一个相册
 */
INSERT INTO `youyi`.`cs_manage_image_host` (`id`, `shop_id`, `category_id`, `name`, `cover_img`, `host_desc`, `pub_lev`, `pwd`, `ques`, `answer`, `sta`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`, `seq`) VALUES ('1742', '8118', '1078', '设备', 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160808/1470656265840.png', '除尘器', '1', NULL, NULL, NULL, '2', '8118', '2016-08-08 19:37:50', NULL, NULL, NULL, '0', NULL);


--20160929 wyp
/*
 * 相片详情表测试数据
 */
INSERT INTO `youyi`.`cs_manage_image_detail` ( `host_id`, `name`, `image`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ( '1742', NULL, 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160808/1470653402568.png', NULL, '2016-08-08 18:50:02', NULL, '2016-08-08 18:50:10', NULL, '0');
INSERT INTO `youyi`.`cs_manage_image_detail` (`host_id`, `name`, `image`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ( '1742', NULL, 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160808/1470653410272.png', NULL, '2016-08-08 18:50:10', NULL, NULL, NULL, '0');
INSERT INTO `youyi`.`cs_manage_image_detail` (`host_id`, `name`, `image`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ( '1742', NULL, 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160808/1470653417838.jpg', NULL, '2016-08-08 18:50:17', NULL, NULL, NULL, '0');
INSERT INTO `youyi`.`cs_manage_image_detail` ( `host_id`, `name`, `image`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ( '1742', NULL, 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160808/1470654734175.png', NULL, '2016-08-08 19:12:14', NULL, '2016-08-08 19:12:20', NULL, '0');
INSERT INTO `youyi`.`cs_manage_image_detail` (`host_id`, `name`, `image`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ( '1742', NULL, 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160808/1470654740576.png', NULL, '2016-08-08 19:12:20', NULL, NULL, NULL, '0');
INSERT INTO `youyi`.`cs_manage_image_detail` ( `host_id`, `name`, `image`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ( '1742', NULL, 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160808/1470655674255.png', NULL, '2016-08-08 19:27:54', NULL, '2016-08-08 19:28:00', NULL, '0');
INSERT INTO `youyi`.`cs_manage_image_detail` ( `host_id`, `name`, `image`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ( '1742', NULL, 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160808/1470655679967.png', NULL, '2016-08-08 19:28:00', NULL, NULL, NULL, '0');
INSERT INTO `youyi`.`cs_manage_image_detail` ( `host_id`, `name`, `image`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ( '1742', NULL, 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160808/1470656278988.png', NULL, '2016-08-08 19:37:59', NULL, '2016-08-08 19:38:04', NULL, '0');
INSERT INTO `youyi`.`cs_manage_image_detail` (`host_id`, `name`, `image`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ( '1742', NULL, 'http://www.yyhb365.com:80/hyzl/findImgResourcesURL?str=20160808/1470656284379.png', NULL, '2016-08-08 19:38:04', NULL, NULL, NULL, '0');

--20160930 wyp
/*
 * 公司历程测试数据
 */
INSERT INTO `youyi`.`sys_company_custom_course` ( `custom_id`, `course_content`, `seq`, `update_date`, `del_flag`) VALUES ( '5', '今年以来，移动视频直播创业不是一般的热闹，各类直播平台如雨后春笋般的突然就都冒了出来。', '1', '2016-09-30 14:55:31', '0');
INSERT INTO `youyi`.`sys_company_custom_course` ( `custom_id`, `course_content`, `seq`, `update_date`, `del_flag`) VALUES ( '5', '专注手游直播的触手TV今年4月和8月宣布获得两次融资总计8000万美元，而斗鱼直播则在今年8月宣布C轮获得15亿人民币融资。', '2', '2016-09-30 14:55:31', '0');
INSERT INTO `youyi`.`sys_company_custom_course` ( `custom_id`, `course_content`, `seq`, `update_date`, `del_flag`) VALUES ( '5', '原因其实很简单，就是运营成本太高，这其中包括内容、带宽、服务器等日常运营成本。', '3', '2016-09-30 14:55:31', '0');
INSERT INTO `youyi`.`sys_company_custom_course` ( `custom_id`, `course_content`, `seq`, `update_date`, `del_flag`) VALUES ( '5', '实际上，在视频直播创业公司当中也有实现了正向盈利的，已经成功上岸的。', '4', '2016-09-30 14:55:31', '0');
INSERT INTO `youyi`.`sys_company_custom_course` ( `custom_id`, `course_content`, `seq`, `update_date`, `del_flag`) VALUES ( '5', '实际上，触手TV能够实现正向盈利离不开其合作伙伴星域CDN的支持，触手TV COO李强曾粗略算过一笔账：“使用星域CDN至少比其他的CDN厂商便宜三到五倍”。众', '5', '2016-09-30 14:55:32', '0');

--20160930 wyp
/*
 * 售后保障测试数据
 */
INSERT INTO `youyi`.`sys_company_custom_service_provition` ( `custom_id`, `title`, `content`, `update_date`, `del_flag`) VALUES ( '12', NULL, '1', '2016-09-30 17:04:21', '0');
INSERT INTO `youyi`.`sys_company_custom_service_provition` ( `custom_id`, `title`, `content`, `update_date`, `del_flag`) VALUES ( '12', NULL, '2', '2016-09-30 17:04:29', '0');
INSERT INTO `youyi`.`sys_company_custom_service_provition` ( `custom_id`, `title`, `content`, `update_date`, `del_flag`) VALUES ( '12', NULL, '3', '2016-09-30 17:04:45', '0');
INSERT INTO `youyi`.`sys_company_custom_service_provition` ( `custom_id`, `title`, `content`, `update_date`, `del_flag`) VALUES ( '12', NULL, '4', '2016-09-30 17:04:50', '0');

--20161013 wyp
/*
 * sys_company表增加注册资金字段
 */
ALTER TABLE `sys_company`
ADD COLUMN `registered_fund`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册资金' AFTER `license_img`;


--20161013 wyp
/*
 * sys_company_custom_summary增加一个图片字段，保存企业简介子页面左侧图片
 */
ALTER TABLE `sys_company_custom_summary`
ADD COLUMN `subpage_left_img`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业简介子页面左侧图片' AFTER `img`;

--20161013 wyp
/*
 * inma_case_info增加字段
 */
ALTER TABLE `inma_case_info`
ADD COLUMN `start_time`  datetime NULL DEFAULT NULL COMMENT '工程开始时间' AFTER `price`,
ADD COLUMN `end_time`  datetime NULL DEFAULT NULL COMMENT '工程结束时间' AFTER `start_time`,
ADD COLUMN `check_standard`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '验收标准' AFTER `time_length`,
ADD COLUMN `industry_type_id`  bigint(12) NULL DEFAULT NULL COMMENT '所属行业id' AFTER `case_type`,
ADD COLUMN `industry_type_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属行业名称' AFTER `industry_type_id`;



--20161018 wyp
/*
 * inma_case_info增加字段
 */
ALTER TABLE `inma_case_info`
CHANGE COLUMN `industry_type_id` `industry1_type_id`  bigint(12) NULL DEFAULT NULL COMMENT '所属行业id1' AFTER `case_type`,
CHANGE COLUMN `industry_type_name` `industry1_type_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属行业名称1' AFTER `industry1_type_id`,
ADD COLUMN `industry2_type_id`  bigint(12) NULL DEFAULT NULL COMMENT '所属行业id2' AFTER `industry1_type_name`,
ADD COLUMN `industry2_type_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属行业名称2' AFTER `industry2_type_id`;

--20161111 wyp
--添加【模板设置】菜单：
INSERT INTO `sys_menu` ( `parent_id`, `parent_ids`, `name`, `href`, `target`, `icon`, `sort`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ( '376', '0,1,372,376,', '模板设置', '/ypcd/template/templateSetinit', NULL, NULL, '1', '1', NULL, '1', '2016-11-10 10:24:21', NULL, NULL, NULL, '0');
--管理员添加【模板设置】菜单：
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES ('1', '480');
--企业添加【模板设置】菜单：
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES ('15', '480');
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES ('16', '480');
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES ('17', '480');
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES ('18', '480');
--付费标志：
ALTER TABLE `sys_company`
ADD COLUMN `payInfo`  tinyint(4) NULL DEFAULT 0 COMMENT '付费信息，0未付费，1已付费，用于应用模板' AFTER `hbType`;
--新模板初始化标志：
ALTER TABLE `cs_settings_basic`
ADD COLUMN `tem_init`  tinyint(4) NULL DEFAULT 0 COMMENT '新模板初始化记录，0未初始化，1已初始化' AFTER `template_id`;

--20161124wyp
/*
 * 平台底部合作网站表
 */
CREATE TABLE `sys_cooperation_website` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `site_name` varchar(100) DEFAULT NULL COMMENT '网站名',
  `site_url` varchar(200) DEFAULT NULL COMMENT '网站链接',
  `type` int(11) DEFAULT NULL COMMENT '网站分类，对应sys_dict表type为website_type的id',
  `sort` int(2) DEFAULT NULL COMMENT '排序',
  `update_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标识，默认为0，删除为1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='平台底部合作网站表';


--20161124wyp
/*
 * 新增企业评分表
 */
CREATE TABLE `sys_company_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `company_id` bigint(20) NOT NULL COMMENT '企业id,sys_company的id',
  `certificate_score` int(11) DEFAULT NULL COMMENT '行业资质得分',
  `team_score` int(11) DEFAULT NULL COMMENT '团队实力得分',
  `credit_score` int(11) DEFAULT NULL COMMENT '信用评级得分',
  `case_score` int(11) DEFAULT NULL COMMENT '案例得分',
  `total_score` int(11) DEFAULT NULL COMMENT '总得分',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) NOT NULL COMMENT '删除表示，默认为0，删除为1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='企业评分表';



--20161125wyp
/*
 * 危废附件表
 */
CREATE TABLE `ws_document` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `service_id` bigint(20) DEFAULT NULL COMMENT '服务ID，ws_service的id',
  `document_description` varchar(255) DEFAULT NULL COMMENT '关于附件的描述',
  `document_name` varchar(100) DEFAULT NULL COMMENT '附件名称',
  `document_type` int(1) DEFAULT NULL COMMENT '附件类别，1-报价附件，2-合同资料附件',
  `document_url` varchar(200) DEFAULT NULL COMMENT '附件链接',
  `view_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '查看标识，查看为1，默认为0',
  `create_by` bigint(20) NOT NULL COMMENT '上传者的user_id',
  `create_date` datetime NOT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标识，删除为1，默认为0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='危废附件表';

--20161128wyp
/*
 * 新增报价字段
 */
ALTER TABLE `ws_service_details`
ADD COLUMN `quote` decimal(13,2) NULL DEFAULT NULL COMMENT '报价，单位元' AFTER `unit`;


--20161129wyp
/*
 * 危废服务废物总重总价表
 */
CREATE TABLE `ws_service_count` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `service_id` bigint(20) DEFAULT NULL COMMENT '服务ID',
  `other_cost` decimal(13,2) DEFAULT NULL COMMENT '其他费用，单位元',
  `count_Weight` decimal(13,2) DEFAULT NULL COMMENT '危废总重量,吨',
  `count_Quote` decimal(13,2) DEFAULT NULL COMMENT '危废总报价，单位元',
  `create_by` bigint(20) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标识，默认为0，删除为1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='危废服务废物总重总价表';


--20161203wyp
/*
 * 新的案例类型
 */
INSERT INTO `youyi`.`sys_dict_pcr` (`id`, `parent_id`, `parent_ids`, `code`, `name`, `type`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('1272', '0', '0,', NULL, '案例分类', 'case_type', NULL, '1', '2016-12-03 16:32:15', NULL, NULL, NULL, '0');
INSERT INTO `youyi`.`sys_dict_pcr` (`id`, `parent_id`, `parent_ids`, `code`, `name`, `type`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('1273', '1272', '0,1272', NULL, '环境评估与认证', 'case_type', NULL, '1', '2016-12-03 16:33:35', NULL, NULL, NULL, '0');
INSERT INTO `youyi`.`sys_dict_pcr` (`id`, `parent_id`, `parent_ids`, `code`, `name`, `type`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('1274', '1272', '0,1272', NULL, '环境工程与运营', 'case_type', NULL, '1', '2016-12-03 16:34:11', NULL, NULL, NULL, '0');
INSERT INTO `youyi`.`sys_dict_pcr` (`id`, `parent_id`, `parent_ids`, `code`, `name`, `type`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('1275', '1272', '0,1272', NULL, '环境监测', 'case_type', NULL, '1', '2016-12-03 16:34:55', NULL, NULL, NULL, '0');
INSERT INTO `youyi`.`sys_dict_pcr` (`id`, `parent_id`, `parent_ids`, `code`, `name`, `type`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('1276', '1272', '0,1272', NULL, '废物处理处置', 'case_type', NULL, '1', '2016-12-03 16:32:15', NULL, NULL, NULL, '0');
INSERT INTO `youyi`.`sys_dict_pcr` (`id`, `parent_id`, `parent_ids`, `code`, `name`, `type`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('1277', '1273', '0,1272,1273', NULL, '环境评价', 'case_type', '1', '1', '2016-12-03 16:33:35', NULL, NULL, NULL, '0');
INSERT INTO `youyi`.`sys_dict_pcr` (`id`, `parent_id`, `parent_ids`, `code`, `name`, `type`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('1278', '1273', '0,1272,1273', NULL, '清洁生产', 'case_type', '2', '1', '2016-12-03 16:34:11', NULL, NULL, NULL, '0');
INSERT INTO `youyi`.`sys_dict_pcr` (`id`, `parent_id`, `parent_ids`, `code`, `name`, `type`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('1279', '1273', '0,1272,1273', NULL, '应急预案', 'case_type', '3', '1', '2016-12-03 16:34:55', NULL, NULL, NULL, '0');
INSERT INTO `youyi`.`sys_dict_pcr` (`id`, `parent_id`, `parent_ids`, `code`, `name`, `type`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('1280', '1273', '0,1272,1273', NULL, 'ISO14000', 'case_type', '4', '1', '2016-12-03 16:34:55', NULL, NULL, NULL, '0');
INSERT INTO `youyi`.`sys_dict_pcr` (`id`, `parent_id`, `parent_ids`, `code`, `name`, `type`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('1281', '1273', '0,1272,1273', NULL, '工程咨询', 'case_type', '5', '1', '2016-12-03 16:51:14', NULL, NULL, NULL, '0');
INSERT INTO `youyi`.`sys_dict_pcr` (`id`, `parent_id`, `parent_ids`, `code`, `name`, `type`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('1282', '1274', '0,1272,1274', NULL, '大气污染防治', 'case_type', '1', '1', '2016-12-03 16:32:15', NULL, NULL, NULL, '0');
INSERT INTO `youyi`.`sys_dict_pcr` (`id`, `parent_id`, `parent_ids`, `code`, `name`, `type`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('1283', '1274', '0,1272,1274', NULL, '水污染防治', 'case_type', '2', '1', '2016-12-03 16:33:35', NULL, NULL, NULL, '0');
INSERT INTO `youyi`.`sys_dict_pcr` (`id`, `parent_id`, `parent_ids`, `code`, `name`, `type`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('1284', '1274', '0,1272,1274', NULL, '噪声治理', 'case_type', '3', '1', '2016-12-03 16:34:11', NULL, NULL, NULL, '0');
INSERT INTO `youyi`.`sys_dict_pcr` (`id`, `parent_id`, `parent_ids`, `code`, `name`, `type`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('1285', '1274', '0,1272,1274', NULL, '土壤/地下水修复', 'case_type', '4', '1', '2016-12-03 16:34:55', NULL, NULL, NULL, '0');
INSERT INTO `youyi`.`sys_dict_pcr` (`id`, `parent_id`, `parent_ids`, `code`, `name`, `type`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('1286', '1274', '0,1272,1274', NULL, '水体修复', 'case_type', '5', '1', '2016-12-03 16:34:55', NULL, NULL, NULL, '0');
INSERT INTO `youyi`.`sys_dict_pcr` (`id`, `parent_id`, `parent_ids`, `code`, `name`, `type`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('1287', '1276', '0,1272,1276', NULL, '一般固体废弃物', 'case_type', '1', '1', '2016-12-03 16:32:15', NULL, NULL, NULL, '0');
INSERT INTO `youyi`.`sys_dict_pcr` (`id`, `parent_id`, `parent_ids`, `code`, `name`, `type`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('1288', '1276', '0,1272,1276', NULL, '危险固体废弃物', 'case_type', '2', '1', '2016-12-03 16:33:35', NULL, NULL, NULL, '0');
INSERT INTO `youyi`.`sys_dict_pcr` (`id`, `parent_id`, `parent_ids`, `code`, `name`, `type`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('1289', '1276', '0,1272,1276', NULL, '严控废物', 'case_type', '3', '1', '2016-12-03 16:34:11', NULL, NULL, NULL, '0');



--20161203wyp
/*
 * 案例表增加字段
 */
ALTER TABLE `inma_case_info`
MODIFY COLUMN `type_id`  bigint(12) NULL DEFAULT NULL COMMENT '案例类型，对应sys_dict_pcr表的case_type类型的id' AFTER `case_name`,
ADD COLUMN `type_id2`  bigint(12) NULL DEFAULT NULL COMMENT '案例类型，对应sys_dict_pcr表的case_type类型的id' AFTER `case_type`,
ADD COLUMN `case_type2`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '案例类型' AFTER `type_id2`;


--20161205wyp
/*
 * 企业表增加字段
 */
ALTER TABLE `sys_company`
ADD COLUMN `hbCompany_type`  int(2) NULL DEFAULT NULL COMMENT '环保公司的类型，sys_dict表type为hbCompany_type的value值，可多选，逗号隔开' AFTER `type`;
ALTER TABLE `sys_company`
MODIFY COLUMN `hbCompany_type`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '环保公司的类型，sys_dict表type为hbCompany_type的value值，可多选，逗号隔开' AFTER `type`;



--20161205wyp
/*
 * 环保公司类型
 */
INSERT INTO `youyi`.`sys_dict` (`id`, `label`, `value`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('503', '环境评估与认证', '1', 'hbCompany_type', '环保公司类型', '1', '1', '2016-12-05 13:45:31', NULL, NULL, NULL, '0');
INSERT INTO `youyi`.`sys_dict` (`id`, `label`, `value`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('504', '环境工程与运营', '2', 'hbCompany_type', '环保公司类型', '2', '1', '2016-12-05 13:46:11', NULL, NULL, NULL, '0');
INSERT INTO `youyi`.`sys_dict` (`id`, `label`, `value`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('505', '环境监测', '3', 'hbCompany_type', '环保公司类型', '3', '1', '2016-12-05 13:46:11', NULL, NULL, NULL, '0');
INSERT INTO `youyi`.`sys_dict` (`id`, `label`, `value`, `type`, `description`, `sort`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('506', '废物处理处置', '4', 'hbCompany_type', '环保公司类型', '4', '1', '2016-12-05 13:46:11', NULL, NULL, NULL, '0');


--20161207wyp
/*
 *企业评分表新增字段
 */
ALTER TABLE `sys_company_score`
ADD COLUMN `hbCompany_type`  tinyint(1) NOT NULL COMMENT '环保公司的类型，sys_dict表type为hbCompany_type的value值，单值' AFTER `company_id`;


--20161207wyp
/*
 *需求表新增字段
 */
ALTER TABLE `t_requirement`
ADD COLUMN `create_by`  bigint(20) NULL DEFAULT NULL COMMENT '创建人的user_id' AFTER `update_date`;
/*
 *需求表修改字段
 */
ALTER TABLE `t_requirement`
MODIFY COLUMN `trade_status`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '提交' COMMENT '交易状态' AFTER `city_name`;


--20161208wyp
/*
 *危废服务废物总重总价表ws_service_count新增字段
 */
ALTER TABLE `ws_service_count`
ADD COLUMN `user_remarks`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户的备注' AFTER `count_Quote`;

--20161209wyp
/*
 *新增顾问咨询菜单
 */
INSERT INTO `youyi`.`sys_menu` (`id`, `parent_id`, `parent_ids`, `name`, `href`, `target`, `icon`, `sort`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('483', '374', '0,1,372,374', '顾问咨询', '/evmAdvisor/evmAdvisorManage', NULL, NULL, '1', '1', NULL, '1', '2016-12-09 15:25:23', NULL, NULL, NULL, '0');
INSERT INTO `youyi`.`sys_role_menu` (`role_id`, `menu_id`) VALUES ('1', '483');


--20161210wyp
/*
 *新增友情链接菜单
 */
INSERT INTO `youyi`.`sys_menu` (`id`, `parent_id`, `parent_ids`, `name`, `href`, `target`, `icon`, `sort`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('484', '374', '0,1,372,374', '友情链接', '/index/setCooperationWebsite', NULL, NULL, '1', '1', NULL, '1', '2016-12-10 11:58:50', NULL, NULL, NULL, '0');
INSERT INTO `youyi`.`sys_role_menu` (`role_id`, `menu_id`) VALUES ('1', '484');



--20161213wyp
/*
 *修改服务类型表
 */
ALTER TABLE `sys_company_custom_service`
MODIFY COLUMN `items`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业服务类型（取sys_dict_pcr表中type=case_typee的id），各类型id按照顺序排列以逗号分隔。如：12,32,54' AFTER `custom_id`;


--20161214wyp
/*
 *修改企业得分表
 */
ALTER TABLE `sys_company_score`
MODIFY COLUMN `del_flag`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除表示，默认为0，删除为1' AFTER `update_date`;

--20161216wyp
/*
 *补上浏览量
 */
ALTER TABLE `nm_news_detail`
ADD COLUMN `page_view`  bigint(20) NULL DEFAULT NULL COMMENT '浏览量' AFTER `show_order`;

--20161226wyp
/*
 *改了【首页广告】菜单的链接
 */
UPDATE sys_menu SET href='/infomaintain/management/newHomePageManage',update_by=1,update_date=NOW() WHERE `name`='首页广告' AND del_flag=0;


--20170213wyp
/*
 *需求表增加需求来源字段
 */
ALTER TABLE `t_requirement`
ADD COLUMN `source_flag`  tinyint(1) NULL DEFAULT 0 COMMENT '区分需求来源的标志，默认为0(内部发的)，1(用户发的)' AFTER `remarks`;

--20170214wyp
/*
 *需求表修改增加字段
 */
ALTER TABLE `t_requirement`
MODIFY COLUMN `source_flag`  tinyint(1) NULL DEFAULT 0 COMMENT '区分需求来源的标志，默认为0(大厅需求)，1(精准需求)' AFTER `remarks`;

ALTER TABLE `t_requirement`
MODIFY COLUMN `source_flag`  tinyint(1) NULL DEFAULT NULL COMMENT '区分需求来源的标志，0(大厅需求)，1(精准需求),2(大厅和精准)' AFTER `remarks`;

ALTER TABLE `t_requirement`
ADD COLUMN `push_flag`  tinyint(1) NULL DEFAULT 0 COMMENT '推送标志，0（未推送），1（已推送）' AFTER `source_flag`,
ADD COLUMN `push_overdue_date`  datetime NULL DEFAULT NULL COMMENT '推送过期时间' AFTER `push_flag`,
ADD COLUMN `finsh_flag`  tinyint(1) NULL DEFAULT 0 COMMENT '接单标志，0（未接单），1（已接单，该需求不再推送给其他人）' AFTER `push_overdue_date`;



--20170215wyp
/*
 *推送记录表增加字段
 */
ALTER TABLE `t_requirement_company`
MODIFY COLUMN `del_flag`  tinyint(1) NULL DEFAULT 0 COMMENT '删除标志，默认为0，删除为1' AFTER `update_time`;


--20170217wyp
/*
 *推送记录表增加字段
 */
ALTER TABLE `t_requirement_company`
ADD COLUMN `status`  tinyint(1) NULL DEFAULT NULL COMMENT '处理状态，1-查看，2-接单，3-拒绝，4-过期' AFTER `user_id`;

--20170218wyp
/*
 *修改推送记录表字段
 */
ALTER TABLE `t_requirement_company`
MODIFY COLUMN `status`  tinyint(1) NULL DEFAULT 0 COMMENT '处理状态，0-未处理，1-查看，2-接单，3-拒绝，4-过期' AFTER `user_id`;

ALTER TABLE `t_requirement_company`
MODIFY COLUMN `create_date`  datetime NULL DEFAULT NULL COMMENT '操作时间' AFTER `create_by`,
MODIFY COLUMN `update_time`  datetime NULL DEFAULT NULL AFTER `update_by`;

--20170220wyp
/*
 *修改推送记录表字段
 */
ALTER TABLE `t_requirement_company`
MODIFY COLUMN `status`  int(1) NULL DEFAULT 0 COMMENT '处理状态，0-未处理，1-查看，2-接单，3-拒绝，4-过期' AFTER `user_id`;

--20170220wyp
/*
 *修改需求表字段
 */
ALTER TABLE `t_requirement`
MODIFY COLUMN `source_flag`  tinyint(4) NULL DEFAULT NULL COMMENT '区分需求来源的标志，0(大厅需求)，1(精准需求),2(大厅和精准)' AFTER `remarks`,
MODIFY COLUMN `push_flag`  tinyint(4) NULL DEFAULT 0 COMMENT '推送标志，0（未推送），1（已推送）' AFTER `source_flag`,
MODIFY COLUMN `finsh_flag`  tinyint(4) NULL DEFAULT 0 COMMENT '接单标志，0（未接单），1（已接单，该需求不再推送给其他人）' AFTER `push_overdue_date`;
