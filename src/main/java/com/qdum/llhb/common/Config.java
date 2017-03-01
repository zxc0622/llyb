package com.qdum.llhb.common;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.ext.handler.UrlSkipHandler;
import com.jfinal.ext.plugin.shiro.ShiroInterceptor;
import com.jfinal.ext.plugin.shiro.ShiroPlugin;
import com.jfinal.ext.route.AutoBindRoutes;
import com.jfinal.ext.weixin.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.render.ViewType;
import com.qdum.llhb.Competition.model.Competition;
import com.qdum.llhb.Competition.model.CompetitionMargin;
import com.qdum.llhb.Competition.model.CompetitionMarginBack;
import com.qdum.llhb.Competition.model.CompetitionRecord;
import com.qdum.llhb.Competition.model.CompetitionRemind;
import com.qdum.llhb.Competition.model.TmCompOrder;
import com.qdum.llhb.Competition.model.TmTradeRecord;
import com.qdum.llhb.admana.model.AdImages;
import com.qdum.llhb.admana.model.AdLable;
import com.qdum.llhb.adsReser.model.AdvBook;
import com.qdum.llhb.adsReser.model.AdvChannel;
import com.qdum.llhb.adsReser.model.AdvMaintain;
import com.qdum.llhb.advisorCase.model.AdvisorCase;
import com.qdum.llhb.advisorConsult.model.AdvisorConsult;
import com.qdum.llhb.audit.model.CompetitionApprove;
import com.qdum.llhb.audit.model.PersonApprove;
import com.qdum.llhb.audit.model.ProductApprove;
import com.qdum.llhb.audit.model.QiugouApprove;
import com.qdum.llhb.audit.model.SupplyApprove;
import com.qdum.llhb.backmana.model.BusinessCollect;
import com.qdum.llhb.backmana.model.Quirement;
import com.qdum.llhb.backmana.model.SupplyHotQuery;
import com.qdum.llhb.backmana.model.SupplyInfo;
import com.qdum.llhb.backmana.model.SupplyViewHistory;
import com.qdum.llhb.backmana.model.SysCooperationWebsite;
import com.qdum.llhb.common.handler.SessionHandler;
import com.qdum.llhb.common.handler.UrlHandler;
import com.qdum.llhb.companyScore.model.CompanyScore;
import com.qdum.llhb.forum.model.ForumAnnouncements;
import com.qdum.llhb.forum.model.ForumBoardList;
import com.qdum.llhb.forum.model.ForumBoardMaster;
import com.qdum.llhb.forum.model.ForumMessage;
import com.qdum.llhb.forum.model.ForumPost;
import com.qdum.llhb.forum.model.ForumPostAttachment;
import com.qdum.llhb.forum.model.ForumReply;
import com.qdum.llhb.forum.model.ForumReplyTrace;
import com.qdum.llhb.forum.model.ForumSearchHistory;
import com.qdum.llhb.forum.model.ForumUserBlacklist;
import com.qdum.llhb.fund.model.Fund;
import com.qdum.llhb.hyzl.model.CompanyZl;
import com.qdum.llhb.hyzl.model.Member;
import com.qdum.llhb.infomaintain.model.InfoMaintAttachment;
import com.qdum.llhb.infomaintain.model.InfoMaintain;
import com.qdum.llhb.integration.model.Integration;
import com.qdum.llhb.memPoint.model.ItemPoint;
import com.qdum.llhb.memPoint.model.MpExchangeRecord;
import com.qdum.llhb.memPoint.model.MpMememberAddr;
import com.qdum.llhb.memPoint.model.MpProductInfo;
import com.qdum.llhb.memPoint.model.PointChangeDetail;
import com.qdum.llhb.memPoint.model.PointMain;
import com.qdum.llhb.memService.model.Attachment;
import com.qdum.llhb.memService.model.BlackList;
import com.qdum.llhb.memService.model.ChatHistory;
import com.qdum.llhb.memService.model.ChatRecord;
import com.qdum.llhb.memService.model.Message;
import com.qdum.llhb.memService.model.MessageText;
import com.qdum.llhb.memService.model.TradeRemind;
import com.qdum.llhb.notice.model.Notic;
import com.qdum.llhb.problem.model.Problem;
import com.qdum.llhb.productmana.ProdTypeUtils;
import com.qdum.llhb.productmana.model.PraiseLabel;
import com.qdum.llhb.productmana.model.PraisePic;
import com.qdum.llhb.productmana.model.Product;
import com.qdum.llhb.productmana.model.ProductPraise;
import com.qdum.llhb.productmana.model.ProductType;
import com.qdum.llhb.protection.model.EqEia;
import com.qdum.llhb.protection.model.EqMonitor;
import com.qdum.llhb.protection.model.OfferDetails;
import com.qdum.llhb.protection.model.OfferDetailsRemark;
import com.qdum.llhb.protection.model.OfferHeader;
import com.qdum.llhb.protection.model.OfferLine;
import com.qdum.llhb.protection.model.SurveyDetails;
import com.qdum.llhb.protection.model.SurveyHeader;
import com.qdum.llhb.protection.model.SurveyLine;
import com.qdum.llhb.qiugou.model.CostRecord;
import com.qdum.llhb.qiugou.model.DemandViewHistory;
import com.qdum.llhb.qiugou.model.Qiugou;
import com.qdum.llhb.quotation.model.Quotation;
import com.qdum.llhb.qyk.model.Leave;
import com.qdum.llhb.qykCustom.model.SysCompanyBanner;
import com.qdum.llhb.qykCustom.model.SysCompanyCourse;
import com.qdum.llhb.qykCustom.model.SysCompanyCustom;
import com.qdum.llhb.qykCustom.model.SysCompanyCustomNavigation;
import com.qdum.llhb.qykCustom.model.SysCompanyCustomServiceType;
import com.qdum.llhb.qykCustom.model.SysCompanyHead;
import com.qdum.llhb.qykCustom.model.SysCompanyServiceProvition;
import com.qdum.llhb.qykCustom.model.SysCompanySummary;
import com.qdum.llhb.qykCustom.model.SysCompanyTeam;
import com.qdum.llhb.recruitment.model.RecuitmentInfomation;
import com.qdum.llhb.reg.model.Company;
import com.qdum.llhb.reg.model.SmsRecord;
import com.qdum.llhb.reg.model.UserRole;
import com.qdum.llhb.salesmancode.model.SalesmanCode;
import com.qdum.llhb.spread.modle.QueryRankiing;
import com.qdum.llhb.suggestion.model.Suggestion;
import com.qdum.llhb.sys.model.Area;
import com.qdum.llhb.sys.model.ClassInfo;
import com.qdum.llhb.sys.model.ClassTeacher;
import com.qdum.llhb.sys.model.Department;
import com.qdum.llhb.sys.model.Dict;
import com.qdum.llhb.sys.model.DictPcr;
import com.qdum.llhb.sys.model.Dormitory;
import com.qdum.llhb.sys.model.EmailRecord;
import com.qdum.llhb.sys.model.ForumBoard;
import com.qdum.llhb.sys.model.LoginLog;
import com.qdum.llhb.sys.model.Menu;
import com.qdum.llhb.sys.model.OperationRecord;
import com.qdum.llhb.sys.model.Organization;
import com.qdum.llhb.sys.model.Person;
import com.qdum.llhb.sys.model.Role;
import com.qdum.llhb.sys.model.SettingBasic;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.model.UserLog;
import com.qdum.llhb.sys.model.UserQq;
import com.qdum.llhb.sys.utils.QuartzPlugin;
import com.qdum.llhb.trademana.model.AlipayPayRecord;
import com.qdum.llhb.trademana.model.AlipayPlatPayRecord;
import com.qdum.llhb.trademana.model.RechargeRecord;
import com.qdum.llhb.trademana.model.RepositRecord;
import com.qdum.llhb.ws.model.EpOperation;
import com.qdum.llhb.ws.model.OperationLogs;
import com.qdum.llhb.ws.model.PwOperation;
import com.qdum.llhb.ws.model.ServiceDetails;
import com.qdum.llhb.ws.model.ServiceMain;
import com.qdum.llhb.ws.model.WsDocument;
import com.qdum.llhb.ws.model.WsServiceCount;
import com.qdum.llhb.ypcd.model.Ads;
import com.qdum.llhb.ypcd.model.Album;
import com.qdum.llhb.ypcd.model.AlbumImages;
import com.qdum.llhb.ypcd.model.Banner;
import com.qdum.llhb.ypcd.model.Basic;
import com.qdum.llhb.ypcd.model.Case;
import com.qdum.llhb.ypcd.model.Category;
import com.qdum.llhb.ypcd.model.FriendLike;
import com.qdum.llhb.ypcd.model.Honor;
import com.qdum.llhb.ypcd.model.LeaveMessage;
import com.qdum.llhb.ypcd.model.News;
import com.qdum.llhb.ypcd.model.NewsClassfy;
import com.qdum.llhb.ypcd.model.Website;

public class Config extends JFinalConfig {

    Routes routes;

	public void afterJFinalStart() {
		//System.out.println("jfinal");
		QuartzPlugin plugin = new QuartzPlugin();
		//plugin.start();
		
		//加载商品类型
		CacheKit.remove("prod", "prodTypes");
		ProdTypeUtils.getProdType();
	}

	public void beforeJFinalStop() {
	}

	@Override
	public void configConstant(Constants me) {
		PropKit.load("config.properties");
		// System.out.println(PropKit.get("123123"));
		// loadPropertyFile("config.properties");
		// me.setDevMode(getPropertyToBoolean("devMode"));
		me.setDevMode(Boolean.valueOf(PropKit.get("devMode")));
		// 设置jfinal默认的保存路径
		me.setUploadedFileSaveDirectory(PropKit.get("uploadDirTemp"));
		//me.setEncoding("utf-8");
		me.setBaseViewPath("/WEB-INF/views");
		me.setViewType(ViewType.JSP);

		me.setError403View("/WEB-INF/views/error/403.jsp");
		me.setError404View("/WEB-INF/views/error/404.jsp");
		me.setError500View("/WEB-INF/views/error/500.jsp");

	}

	@Override
	public void configRoute(Routes me) {
		this.routes = me;
		// 自动注册路由
		me.add(new AutoBindRoutes());

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.jfinal.config.JFinalConfig#configPlugin(com.jfinal.config.Plugins)
	 */
	@Override
	public void configPlugin(Plugins me) {

		// 配置C3p0数据库连接池插件
		/*
		 * C3p0Plugin c3p0Plugin = new C3p0Plugin(getProperty("jdbc.url"),
		 * getProperty("jdbc.username"), getProperty("jdbc.password") .trim());
		 */
		C3p0Plugin c3p0Plugin = new C3p0Plugin(PropKit.get("jdbc.url"), PropKit.get("jdbc.username"),
				PropKit.get("jdbc.password").trim());
		me.add(c3p0Plugin);

		// 配置ActiveRecord插件
		ActiveRecordPlugin arpMysql = new ActiveRecordPlugin("mysql", c3p0Plugin);
		me.add(arpMysql);

		// 将数据库表与该类进行匹配
		arpMysql.setShowSql(Boolean.valueOf(PropKit.get("devMode")));
		// 基础设置
		arpMysql.addMapping("sys_user", User.class);// 用户表
		arpMysql.addMapping("sys_user_log", UserLog.class);// 用户表
		arpMysql.addMapping("sys_role", Role.class);// 角色表
		arpMysql.addMapping("sys_area", Area.class);// 省市区域表
		arpMysql.addMapping("sys_menu", Menu.class);// 菜单表
		arpMysql.addMapping("sys_dict", Dict.class);// 字典表
		arpMysql.addMapping("sys_class", ClassInfo.class);// 班级信息表
		arpMysql.addMapping("sys_dormitory", Dormitory.class);// 宿舍信息表
		arpMysql.addMapping("sys_person", Person.class);// 人员信息表
		arpMysql.addMapping("sys_department", Department.class);// 学员部门
		arpMysql.addMapping("sys_organization", Organization.class);// 机构管理
		arpMysql.addMapping("sys_class_teacher", ClassTeacher.class);// 收费模板表
		arpMysql.addMapping("sys_oper_record", OperationRecord.class);// 日志操作表
		arpMysql.addMapping("sys_company", CompanyZl.class);// 企业表
        arpMysql.addMapping("t_member", Member.class);// 企业表
		arpMysql.addMapping("sys_user_qq", UserQq.class);// QQ信息表
        arpMysql.addMapping("sys_email_record", EmailRecord.class);// 邮件发送记录表
        arpMysql.addMapping("t_requirement", Quirement.class);// 邮件发送记录表


        /******************** wf start **********************/
		arpMysql.addMapping("sys_company", Company.class);// 公司信息表
		arpMysql.addMapping("inma_demand_info", Qiugou.class);// 求购信息表
		arpMysql.addMapping("cs_settings_basic", SettingBasic.class);// 基本设置表
		arpMysql.addMapping("cs_manage_banner", Banner.class);// 横幅表
		arpMysql.addMapping("cs_shop_leave_message",LeaveMessage.class );//留言表
		arpMysql.addMapping("ms_mail_messagetext", MessageText.class);// 信件信息表
		arpMysql.addMapping("ms_mail_message", Message.class);// 信件表
		arpMysql.addMapping("ms_mail_attachment", Attachment.class);// 附件表
		arpMysql.addMapping("ms_mail_black_list", BlackList.class);// 黑名单表
		arpMysql.addMapping("sys_user_role", UserRole.class);// 用户角色表
		arpMysql.addMapping("inma_demand_view_history", DemandViewHistory.class);// 求购视图历史表
		arpMysql.addMapping("eq_eia_record", EqEia.class);// 环评报价表
		arpMysql.addMapping("eq_monitor_record", EqMonitor.class);// 检测报价表
		arpMysql.addMapping("t_offer_detail", OfferDetails.class);// 环评细节表
		arpMysql.addMapping("t_offer_detail_remark", "remark_id", OfferDetailsRemark.class);// 环评细节表
		arpMysql.addMapping("t_offer_header", OfferHeader.class);// 环评头表
		arpMysql.addMapping("t_offer_lines", OfferLine.class);// 环评行表
		arpMysql.addMapping("t_survey_detail", SurveyDetails.class);// 检测细节表
		arpMysql.addMapping("t_survey_header", SurveyHeader.class);// 检测头表
		arpMysql.addMapping("t_survey_lines", SurveyLine.class);// 检测行表
		arpMysql.addMapping("sys_sms_record", SmsRecord.class);// 检测行表
		arpMysql.addMapping("inma_demand_approve", QiugouApprove.class);//求购审核
		arpMysql.addMapping("sys_person_approve", PersonApprove.class);//求购审核
		arpMysql.addMapping("sys_youyi_cost_record", CostRecord.class);//支付记录
		arpMysql.addMapping("inma_adv_book", AdvBook.class);//
		arpMysql.addMapping("inma_competition_info", Competition.class);//竞品信息
		arpMysql.addMapping("inma_competition_approve", CompetitionApprove.class);//
		arpMysql.addMapping("forum_posts", ForumPost.class);//论坛发帖
		arpMysql.addMapping("forum_posts_attachments", ForumPostAttachment.class);//论坛发帖附件
		arpMysql.addMapping("forum_board_list", ForumBoardList.class);//论坛分区
		arpMysql.addMapping("forum_post_reply", ForumReply.class);//回复
		arpMysql.addMapping("forum_reply_trace", ForumReplyTrace.class);//回复轨迹
		arpMysql.addMapping("forum_message", ForumMessage.class);//论坛消息
		arpMysql.addMapping("inma_adv_channel", AdvChannel.class);
		arpMysql.addMapping("inma_adv_maintain", AdvMaintain.class);
        arpMysql.addMapping("mp_product_info", MpProductInfo.class);
        arpMysql.addMapping("mp_member_address", MpMememberAddr.class);
		arpMysql.addMapping("mp_exchange_record", MpExchangeRecord.class);
		arpMysql.addMapping("tm_comp_order", TmCompOrder.class);//竞价订单表
		arpMysql.addMapping("tm_trade_record", TmTradeRecord.class);//交易记录表
		/******************** wf end **********************/
		/******************** wcl start **********************/
		arpMysql.addMapping("cs_settings_menu", com.qdum.llhb.ypcd.model.Menu.class);// 云铺菜单表
		arpMysql.addMapping("cs_settings_basic", Basic.class);// 云铺基本设置表
		arpMysql.addMapping("cs_settings_category", Category.class);// 云铺栏目表
		arpMysql.addMapping("cs_manage_news", News.class);// 新闻
		arpMysql.addMapping("cs_manage_news_category", NewsClassfy.class);// 新闻分类
		arpMysql.addMapping("cs_manage_certificate", Honor.class);// 资质管理表----update：zhaoyl
		arpMysql.addMapping("inma_case_info", Case.class);// 成功案例表----update：周翔
																	
		arpMysql.addMapping("cs_manage_image_host", Album.class);// 相册
		arpMysql.addMapping("cs_manage_href", FriendLike.class);// 相册
		arpMysql.addMapping("cs_shop_leave_message", Leave.class);// 在线留言实体
		arpMysql.addMapping("cs_manage_image_detail", AlbumImages.class);// 图片表
		arpMysql.addMapping("nm_notice_detail", Notic.class);// 公告表
		arpMysql.addMapping("bm_self_help_detail", Problem.class);// 常见问题表
		arpMysql.addMapping("mp_product_info", Integration.class);// 积分兑换商品表
		
		/******************** wcl end **********************/
		/******************** zxm start **********************/
		arpMysql.addMapping("sys_dict_pcr", DictPcr.class);// 字典表
		arpMysql.addMapping("inma_supply_info", SupplyInfo.class);// 固废供应表
		arpMysql.addMapping("cs_manage_ad", Ads.class);// 固废供应表
		arpMysql.addMapping("ms_chat_record", ChatRecord.class);// 站内交流 聊天记录表
		arpMysql.addMapping("ms_chat_history", ChatHistory.class);// 站内交流 会话表
		arpMysql.addMapping("idx_supply_hot_query", SupplyHotQuery.class);// 热搜
		arpMysql.addMapping("ms_business_collect", BusinessCollect.class);// 收藏表inma_supply_view_history
		arpMysql.addMapping("inma_supply_view_history", SupplyViewHistory.class);// 浏览记录表
		arpMysql.addMapping("inma_supply_approve", SupplyApprove.class);//供应审核
		arpMysql.addMapping("sys_login_log", LoginLog.class);//登录日志表
		/******************** zxm end **********************/

		/******************** zhaoyl start **********************/
		arpMysql.addMapping("sys_dict_pcr", ProductType.class);/// 字典表
		arpMysql.addMapping("inma_product_info", Product.class);// 信息管理-商品表
		arpMysql.addMapping("cs_shop_we_website", Website.class);// 云铺-微网站表
		arpMysql.addMapping("ms_trade_remind", TradeRemind.class);// 会员服务-交易提醒表
		arpMysql.addMapping("ms_business_collect", BusinessCollect.class);// 商机收藏表
		arpMysql.addMapping("inma_product_praise", ProductPraise.class);// 环保商城详情-商品评价表
		arpMysql.addMapping("inma_product_praise_label", PraiseLabel.class);// 环保商城详情-评价标签表
		arpMysql.addMapping("inma_product_praise_pic", PraisePic.class);// 环保商城详情-评价图片表
		arpMysql.addMapping("nm_news_detail", InfoMaintain.class);// 资讯维护表
		arpMysql.addMapping("nm_news_attachment", InfoMaintAttachment.class);// 资讯附件表
		arpMysql.addMapping("inma_product_approve", ProductApprove.class);// 商品审核维护表
		arpMysql.addMapping("nm_quotations_detail", Quotation.class);// 行情中心维护表
		arpMysql.addMapping("forum_announcements", ForumAnnouncements.class);// 论坛公告表
		arpMysql.addMapping("forum_board_master", ForumBoardMaster.class);// 论坛版主表
		arpMysql.addMapping("forum_user_blacklist", ForumUserBlacklist.class);// 禁言用户表
		arpMysql.addMapping("forum_search_history", ForumSearchHistory.class);// 热门搜索表
		arpMysql.addMapping("ws_business_href_info", SalesmanCode.class);//业务员编码
		arpMysql.addMapping("mp_point_main", PointMain.class);//积分主表
		arpMysql.addMapping("mp_item_point", ItemPoint.class);//积分项目表
		arpMysql.addMapping("mp_point_change_detail", PointChangeDetail.class);//积分改变细节表
		arpMysql.addMapping("inma_query_ranking", QueryRankiing.class);//积分改变细节表
		arpMysql.addMapping("forum_board_list", ForumBoard.class);//积分改变细节表
		arpMysql.addMapping("inma_competition_margin_pay_back", CompetitionMarginBack.class);//积分改变细节表
		/******************** zhaoyl end **********************/
		
        /******************** rongchao start **********************/
        arpMysql.addMapping("ws_ep_operation", EpOperation.class);// 危废服务环保企业操作状态表
        arpMysql.addMapping("ws_operation_logs", OperationLogs.class); // 危废服务操作日志表
        arpMysql.addMapping("ws_pw_operation", PwOperation.class);// 危废服务产废企业操作状态表
        arpMysql.addMapping("ws_service", ServiceMain.class);// 危废服务主表
        arpMysql.addMapping("ws_service_details", ServiceDetails.class);// 危废服务废物明细表

        arpMysql.addMapping("bm_adv_label", AdLable.class);// 广告管理——广告标签
        arpMysql.addMapping("bm_adv_images", AdImages.class);// 广告管理——广告图片明细
        arpMysql.addMapping("sys_suggestion", Suggestion.class);// 广告管理——广告图片明细
        arpMysql.addMapping("inma_competition_margin_pay", CompetitionMargin.class);// 竞价保证金提交列表
        arpMysql.addMapping("inma_competition_record", CompetitionRecord.class);// 信息管理竞价记录表
        arpMysql.addMapping("inma_competition_remind", CompetitionRemind.class);// 信息管理竞价提醒记录表
        arpMysql.addMapping("tm_fund", Fund.class);// 资金表
        arpMysql.addMapping("tm_alipay_pay_record", AlipayPayRecord.class);// 用户支付宝状态记录表
        arpMysql.addMapping("tm_alipay_plat_pay_record", AlipayPlatPayRecord.class);// 平台付款支付宝状态记录表
        arpMysql.addMapping("tm_recharge_record", RechargeRecord.class);// 充值/提现记录表
        arpMysql.addMapping("tm_reposit_record", RepositRecord.class);// 提现记录表
        /******************** rongchao end **********************/

		/******************** ZhouX start **********************/
		arpMysql.addMapping("nm_hr_detail", RecuitmentInfomation.class);//招聘信息 表
		/******************** ZhouX end   **********************/
		
		/******************** 企业库自定义 start **********************/
        arpMysql.addMapping("sys_company_custom", SysCompanyCustom.class);// 企业自定义表
        arpMysql.addMapping("sys_company_custom_navigation", SysCompanyCustomNavigation.class);// 企业自定义导航栏
        arpMysql.addMapping("sys_company_custom_course", SysCompanyCourse.class);// 公司历程
        arpMysql.addMapping("sys_company_custom_service_provition", SysCompanyServiceProvition.class);// 公司历程
        arpMysql.addMapping("sys_company_custom_head", SysCompanyHead.class);// 企业头部信息
        arpMysql.addMapping("sys_company_custom_banner", SysCompanyBanner.class);// 企业banner信息
        arpMysql.addMapping("sys_company_custom_service", SysCompanyCustomServiceType.class);// 企业banner信息
        arpMysql.addMapping("sys_company_custom_summary", SysCompanySummary.class);// 企业简介信息
        arpMysql.addMapping("sys_company_team", SysCompanyTeam.class);// 企业团队实力
        /******************** 企业库自定义 end **********************/
        
        arpMysql.addMapping("sys_cooperation_website", SysCooperationWebsite.class);// 企业团队实力

        /******************** 环保顾问 start **********************/
        arpMysql.addMapping("advisor_case", AdvisorCase.class);
        arpMysql.addMapping("advisor_consult", AdvisorConsult.class);
        /******************** 环保顾问 end **********************/
        
        /******************** 危废附件表start **********************/
        arpMysql.addMapping("ws_document", WsDocument.class);
        /******************** 危废附件表 end **********************/
        
        /******************** 危废服务废物总重总价表start **********************/
        arpMysql.addMapping("ws_service_count", WsServiceCount.class);
        /******************** 危废服务废物总重总价表end **********************/
        
        /******************** 企业评分表start **********************/
        arpMysql.addMapping("sys_company_score", CompanyScore.class);
        /******************** 企业评分表end **********************/

        // 加载Shiro插件
		me.add(new ShiroPlugin(routes));
		// 加载缓存插件
		me.add(new EhCachePlugin());
		me.add(new QuartzPlugin());
	}

	@Override
	public void configInterceptor(Interceptors me) {
		// shiro拦截机
		me.add(new ShiroInterceptor());
	}

	@Override
	public void configHandler(Handlers me) {
//		me.add(new LoggerHandler());
		me.add(new SessionHandler());
		me.add(new UrlHandler());
		me.add(new UrlSkipHandler("/servlet/validateCodeServlet", true));
	}

}
