package com.jfinal.ext.interceptor;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

public class AdminInterceptor implements Interceptor {
	private static List<String> actionKeyList = new ArrayList<String>();
	@Override
	public void intercept(ActionInvocation ai) {
		String actionKey = ai.getActionKey();
		if (!UserUtils.isCompany()) {
			if (actionKeyList.contains(actionKey)) {
				Controller con = ai.getController();
				con.getSession().setAttribute("tip","请先完善公司资料再进行操作!");
				con.redirect("/hyzl/EnterpriseDataZero");
				return;
			}
		}
		ai.invoke();
	}
	
	/**
	 * 初始化要拦截的ActionKey集合
	 */
	static {
		/**信息管理*/
		actionKeyList.add("/solidsupply/solidAdd");//固废供应
		actionKeyList.add("/qiugou");//固废求购
		actionKeyList.add("/ws/productwaste/pwbaseinfo");//危废服务
		actionKeyList.add("/competition/inforMan/add");//竞价
		actionKeyList.add("/ws/environment/servicelist");//危废服务(处置方)
		actionKeyList.add("/proManage/add");//商品管理
		
		/**云铺管理*/
		actionKeyList.add("/ypcd/menu/setOfCloudinit");//商铺设置
		actionKeyList.add("/ypcd/website");//微网站设置
		actionKeyList.add("/llhb/ypcd/banner");//横幅管理
		actionKeyList.add("/ypcd/adsManage/adsAdd");//广告管理
		//店铺管理
		actionKeyList.add("/ypcd/business/businessInformation");//旺铺管理
		actionKeyList.add("/ypcd/album/albumManagementInit");//相册管理
		actionKeyList.add("/ypcd/honor/honorQualification");//荣誉资质
		actionKeyList.add("/ypcd/profile/companyProfile");//诚信档案
		actionKeyList.add("/ypcd/friendship/FriendLyLinkInit");//友情链接
		actionKeyList.add("/ypcd/news/companyNewsAdd");//公司新闻
		
		/**会员资料*/
		
		/**会员服务*/
		actionKeyList.add("/memSerevice/message");//站内短信
		actionKeyList.add("/memSerevice/communication");//站内交流
		actionKeyList.add("/memSerevice/business");//商机收藏
		actionKeyList.add("/memSerevice/remind/add");//交易提醒
		//actionKeyList.add("/404");//邮件订阅
		//actionKeyList.add("/404");//排名推广
		actionKeyList.add("/adsReser/index");//广告预定
		
		/**问答帖子*/
		
		/**优蚁币管理*/
		actionKeyList.add("/memPoint/memIndex/convert");//优蚁币兑换
		actionKeyList.add("/youyimoney/level");//优蚁币等级
		//actionKeyList.add("/404");//优蚁币任务
		
		/**资讯维护*/
		actionKeyList.add("/infomaintain");//资讯维护
		actionKeyList.add("/infomaintain/quotation");//行情中心
		
		/**系统审核*/
		actionKeyList.add("/auditList/personalAudit");//个人审核
		actionKeyList.add("/auditList/companyAudit/companyAuditInit");//公司审核
		actionKeyList.add("/auditList/supplyAudit");//供应审核
 		actionKeyList.add("/auditList/qiugouAudit");//求购审核
		actionKeyList.add("/auditList/productAudit");//商品审核
		
		
		/**广告管理*/
		actionKeyList.add("/infomaintain/management/homeManagementInit");//首页广告
		actionKeyList.add("/infomaintain/ad/general");//其他广告
		
		/**公告管理*/
		actionKeyList.add("/notice/AnnouncementList");//公告列表
		
		/**数据收集*/
		actionKeyList.add("/dataCollection/protection/proteList");//环保列表
		actionKeyList.add("/dataCollection/user");//账户列表
		actionKeyList.add("/ws/youyi");//危废服务列表
		actionKeyList.add("/dataCollection/demands/");//求购列表
		actionKeyList.add("/dataCollection/supply");//供应列表
		actionKeyList.add("/dataCollection/product");//商品列表
		actionKeyList.add("/dataCollection/loginLog");//登录日志
	
		
	}
}
