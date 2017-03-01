package com.qdum.llhb.qiugou.controller;


import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import com.jfinal.ext.weixin.kit.PropKit;
import com.qdum.llhb.memPoint.controller.PointController;
import org.apache.fop.fo.pagination.Title;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.admana.model.AdLable;
import com.qdum.llhb.backmana.model.BusinessCollect;
import com.qdum.llhb.backmana.model.SupplyHotQuery;
import com.qdum.llhb.backmana.model.SupplyInfo;
import com.qdum.llhb.common.security.shiro.SystemAuthorizingRealm.Principal;
import com.qdum.llhb.qiugou.model.CostRecord;
import com.qdum.llhb.qiugou.model.DemandViewHistory;
import com.qdum.llhb.qiugou.model.Qiugou;
import com.qdum.llhb.sys.model.Area;
import com.qdum.llhb.sys.model.Dict;
import com.qdum.llhb.sys.model.DictPcr;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

/**
 * 用户注册
 * @author wf
 *
 */
@ControllerBind(controllerKey = "/qiugou")
@Before(AdminInterceptor.class)
public class QiugouController extends Controller {
	private static int pageSettingNum = Integer.parseInt(PropKit.get("pageNumber"));

    public void index() {
        //判断是否为企业,若不是,则跳转到企业信息页面维护企业信息 yaoyt@2016.3.11
        if(!UserUtils.isCompany()){
            getSession().setAttribute("tip","请先完善公司资料再进行固废求购");
            redirect("/hyzl/EnterpriseDataZero");
            return;
        }

        List<DictPcr> hangyefirst = DictPcr.dao.findByType("supply_type");
        List<Dict> danweiList = Dict.dao.getDictsByType("unit_type");
        List<Dict> timeList = Dict.dao.getDictsByType("period_type");
        String paramId = getPara("paramId");

        if (paramId != null) {
            Record record = Qiugou.dao.getRecordById(Integer.parseInt(paramId));
            setAttr("record", record);
            String see = getPara("see");
            if (see != null) {
                Qiugou qg = Qiugou.dao.getById(Integer.parseInt(paramId));
                qg.set("page_view", qg.getPageView() + 1);
                qg.update();
            }
        }
        setAttr("hangyefirst", hangyefirst);
        setAttr("timeList", timeList);
        setAttr("danweiList", danweiList);
        render("add.jsp");
    }


    //保存信息
	public void saveInfo(){
		User user = UserUtils.getUser();  
		String qiugouId = getPara("qiugouId");
		boolean flag = false;
		Qiugou qg = null;
		if(!qiugouId.equals("")){
			qg = Qiugou.dao.getById(getParaToInt("qiugouId"));
		}
		if(qg == null){
			qg = new Qiugou();
			flag  = true; 
		}
		
		String pastTime=getPara("baozhiqi");
		Date date= new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(pastTime.indexOf("-") != -1){
			try {
				date=sdf.parse(pastTime);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if("".equals(getPara("beginPrice"))){
			qg.set("low_price",null);
		}else{
			qg.set("low_price",getPara("beginPrice"));
		}
		if("".equals(getPara("endPrice"))){
			qg.set("high_price",null);
		}else{
			qg.set("high_price",getPara("endPrice"));
		}
		qg.set("info_type_first", getParaToLong("hangyeone"));
		qg.set("info_type_second", getParaToLong("hangyetwo"));
		qg.set("info_title", getPara("title"));
		qg.set("key_words", getPara("keyword"));
		qg.set("details", getPara("txt"));
		qg.set("past_date", date);
		qg.set("unit", getPara("danwei"));
		qg.set("pic1", getPara("fileone"));
		qg.set("pic2", getPara("filetwo"));
		qg.set("pic3", getPara("filethree"));
		qg.set("amount", getParaToLong("mount"));
		
		if(flag == true){
			qg.set("create_by",user.getId());
			qg.set("create_date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			qg.save();
		}else{
			qg.set("update_by", user.getId());
			qg.set("sta", "1");
			qg.set("update_date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			qg.update();
		}

		renderText("ok");		
	}
	/**
	 * 未通过 已通过 审核中 已过期
	 */
	public void qiugouPass(){
			User user = UserUtils.getUser();
		    int order = getParaToInt("order");
		    String one = "0";
			String two = "0";
			String title = "";
			try {
				one = getPara("one");
				two = getPara("two");
				title = getPara("title");
			} catch (Exception e) {
				one = "0";
				two = "0";
				title = "";
			}
			if(one!=null&&!one.equals("")&&!one.equals("0")&&!one.equals("undefined")){
				Long conLong = Long.parseLong(one);
				if(conLong != 0l){
					DictPcr d = DictPcr.dao.findById(conLong);
					setAttr("first1", d.getParentId());
					setAttr("second1", d.getId());
					setAttr("secondList1", DictPcr.dao.getChildList(d.getParentId()));
					setAttr("eee", 1);
				}
			}
			if(two!=null&&!two.equals("")&&!two.equals("0")&&!two.equals("undefined")){
				Long conLong = Long.parseLong(two);
				if(conLong != 0l){
					DictPcr d = DictPcr.dao.findById(conLong);
					setAttr("first", d.getParentId());
					setAttr("second", d.getId());
					setAttr("secondList", DictPcr.dao.getChildList(d.getParentId()));
				}
			}
		int yeshu = pageSettingNum;
		try {
			yeshu  =getParaToInt("paginateFenye");
			setAttr("paginateFenye",yeshu);
		} catch (Exception e) {
			yeshu = pageSettingNum;
		}
		    List<DictPcr> demands = DictPcr.dao.findByType("supply_type");
		    Page<Record> records = Qiugou.dao.getFullRecords(getParaToInt(0, 1),yeshu,one,two,title,order,user.getId());
		    if(records != null){
		    	int aa = records.getList().size();
		    	if(aa ==1){
		    		setAttr("toRaw", aa);
		    	}
		    }
		    
	    	
		    setAttr("records", records.getList());
    		setAttr("recordPage", records);
    		setAttr("one", one);
    		setAttr("two", two);
    		setAttr("title", title);
    		setAttr("demands", demands);
	    	/*String conditon  = getPara("conditon");
	    	User user = UserUtils.getUser();
	    	Long conLong = -1l;
	    	int index = 3;
	    	if(conditon != "") {
	    		try {
					conLong = Long.parseLong(conditon);
					if(conLong != 0l){
						DictPcr d = DictPcr.dao.findById(conLong);
						setAttr("first", d.getParentId());
						setAttr("second", d.getId());
						setAttr("secondList", DictPcr.dao.getChildList(d.getParentId()));
						index=2;
						setAttr("secondLiebiao", conditon);
					}
				} catch (NumberFormatException e) {
					index = 0;
					setAttr("sousuoText", conditon);
				}
			}else{
				setAttr("conditon", null);
			}
	    	List<DictPcr> demands = DictPcr.dao.findByType("supply_type");
	    	Page<Record> records = Qiugou.dao.getFullRecords(getParaToInt(0, 1),10,conditon,index,order,user.getId());
	    	int aa = records.getList().size();
	    	if(aa ==1){
	    		setAttr("toRaw", aa);
	    	}
    		setAttr("records", records.getList());
    		setAttr("recordPage", records);
	    	setAttr("demands", demands);
	    	setAttr("conditon", conditon);*/
	    	setAttr("order", order);
			render("qiugouPass.jsp");
	}

	//搜索列表
	/*public void sousuo(){
		String text = getPara("text");
		Page<Record> recordCon = Qiugou.dao.getFullRecords(getParaToInt(0, 1),10,null,getParaToInt("index"));
		renderJson(recordCon);
	}*/
	//加载二级分类
	public void getSecond(){
		List<DictPcr> dictChils = DictPcr.dao.getChildrenByParent("supply_type", getParaToLong("parent"));
		renderJson(dictChils);
	}
	//显示二级列表的数据
	/*public void getListSecond(){
		Page<Record> recordCon = Qiugou.dao.getFullRecords(getParaToInt(0, 1),10,getPara("second"),2);
		
	}*/
	//删除选中
	public void delete(){
		String [] numbers = getPara("number").split(",");
		int[] numInt = new int[numbers.length];
		for(int i=0;i<numbers.length;i++){
			numInt[i]=Integer.parseInt(numbers[i].toString());
			Qiugou qg  = Qiugou.dao.getById(numInt[i]);
			qg.set("del_flag", true);
			qg.update();
		}
		renderText("ok");
	}
	
	//求购列表
	public void list(){
		Page<Record> re = Qiugou.dao.getPublishList(getParaToInt(0, 1),16);
		String typeid = getPara("typeid");
		if(typeid == null||"".equals(typeid)){
			typeid = "429"; 
		}
		List<Record> qg = Qiugou.dao.getBytype(Long.parseLong(typeid));
		List<DictPcr> dps = DictPcr.dao.getDictsByTypeDesc("supply_type", 428l);
		List<Record> cls = Qiugou.dao.getActiveDemand(0, 14);
		Page<Record> rrs = Qiugou.dao.getActiveDemandPage(getParaToInt(0, 1), 14);
		setAttr("comList",rrs.getList() );//公司
		setAttr("recordPage", rrs);
		Record lists = Qiugou.dao.getCompanyCount();
		setAttr("count", lists.get("id"));
		setAttr("dps", dps);
		setAttr("qgList", qg);
		setAttr("pageNumber", 0);
		setAttr("length", re.getList().size());
		setAttr("recordPage", re);
		setAttr("qiugouList", re.getList());
		render("qiugouList.jsp");
	}
	//type列表
	public void typeList(){
		String typeid = getPara("typeid");
		if(typeid == null||"".equals(typeid)||typeid.equals("undefined")){
			typeid = "429"; 
		}
		List<Record> qg = Qiugou.dao.getBytype(Long.parseLong(typeid));
		renderJson(qg);
	}
	//换一换
	public void getList(){
		Record list = Qiugou.dao.getActiveDemandCount();
		long pa = getParaToLong("pageNum");
		int ipa  = getParaToInt("pageNum");
		long li = (long) Math.floor(list.getLong("cut")/14)+1 ;
		List<Record> lists = null;
		if(pa==(li+1)){
			ipa = 0;
			setAttr("pa", pa);
		}
		lists = Qiugou.dao.getActiveDemand(ipa,14);
		renderJson(lists);
	}
	/**
	 * 求购详情
	 */
	
	public void details(){
		User user = UserUtils.getUser();  
		Record re = Qiugou.dao.getDetails(getPara("id"));
		Long userid = 0l;
		if(re != null){
			int status = 0;
			org.apache.shiro.web.mgt.DefaultWebSecurityManager sm = (DefaultWebSecurityManager) SecurityUtils.getSecurityManager();
			DefaultWebSessionManager dsm = (DefaultWebSessionManager) sm.getSessionManager();
			SessionDAO dao = dsm.getSessionDAO();
			//获取当前系统中所有有效session
			Collection<Session> sessions = dao.getActiveSessions();
			for (Session se : sessions) {
				SimplePrincipalCollection spc = (SimplePrincipalCollection)(se.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY));
				if(null != spc){
					Principal p = (Principal)(spc.getPrimaryPrincipal());
					if(p.getLoginName().equals(re.get("login_name"))){
						status = 1;
						break;
					}
				}
			}
			List<Record> res = Qiugou.dao.getDetails(0,12,re.getLong("create_by"), getParaToInt("id"));
			List<Record> resOther = Qiugou.dao.getDetailsOther(0,12,re.getLong("create_by"));
			List<Record> bus = Qiugou.dao.getActiveDemand(0,10);//推荐商家
			List<Record> adrecord = AdLable.dao.getAdsByType(3l,"c","s1");
			setAttr("adlists", adrecord);
			setAttr("qiugouid", getPara("id"));
			setAttr("bus",bus);
			setAttr("reads", Qiugou.dao.getByRead());
			setAttr("qiugouOther", resOther);
			setAttr("qiugous", res);
			setAttr("status",status);
			setAttr("qiugou", re);
			setAttr("id", getParaToInt("id"));
            BigDecimal youyiMoney = new BigDecimal("0");
			if(user.getId()!=null){
				userid = user.getId();
                //浏览历史记录保存
                DemandViewHistory rd = new DemandViewHistory();
                rd.set("demand_id", getParaToInt("id"));
                rd.set("view_user", userid);
                rd.set("create_by",user.getId());
                rd.set("create_date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
                rd.save();
                youyiMoney = User.dao.findById(userid).getMoney();
			}
            setAttr("youyiMoney",youyiMoney == null ? new BigDecimal("0") : youyiMoney);
			//浏览次数
			Qiugou q = Qiugou.dao.findById(getPara("id"));
			q.set("page_view", q.getLong("page_view")+1);
			q.update();
			Record money = Qiugou.dao.getComInfo(getPara("id"));
			setAttr("m", money);
			Record c = null;
			if(user.getId()!=null){
				c = CostRecord.dao.getByDemand(getPara("id"), user.getId());
				if(c!= null){
					setAttr("showone", "0");
				}else{
					setAttr("showone", "1");
				}
			}else{
				setAttr("showone", "1");
			}
			setAttr("userid", user);
			render("qiugouDetails.jsp");
		}else{
			redirect("/qiugou/list");
		}
		
	}
	/**
	 * 详情换页 上
	 */
	/*public void huanyeup(){
		User user = UserUtils.getUser();  
		List<Record> res = Qiugou.dao.getDetails(getParaToInt("pageNumber"),4,user.getId(), getParaToInt("id"));
		renderJson(res);
	}
	*//**
	 * 详情换页 下
	 *//*
	public void huanyedown(){
		List<Record> resOther = Qiugou.dao.getDetailsOther(getParaToInt("pageNumber"),4,getParaToLong("id"));
		renderJson(resOther);
	}*/

	
	/**
	 * 收藏
	 */
	public void collect(){
		User user = UserUtils.getUser();
		Record re = Qiugou.dao.getDetails(getPara("id"));
		String msg="";
		if(user.get("id") !=null){
			BusinessCollect c =null;
			c = BusinessCollect.dao.findCollet("1", getPara("collectId"), user.getId());
			if(c == null){
				c = new BusinessCollect();
				c.set("type","2");
				c.set("collect_id",getPara("collectId"));
				c.set("create_by",user.getId());
				c.set("create_date",new Date());
				boolean r = c.save();
				if(r == true){
					msg="收藏成功！";
				}else{
					msg="收藏失败！";
				}
			}else{
				msg="已收藏！";
			}
		}else{
			msg="请先登录再收藏";
		}
		renderText(msg);
	}
	/**
	 * 求购列表搜索
	 */
	public void searchList(){
		List<DictPcr> solids = DictPcr.dao.findByType("supply_type");
		if(solids.size() > 0){
			 Long parentId = this.getParaToLong("parentId");
            if (parentId == null || parentId == 0L || parentId == 1L) {
                parentId = solids.get(0).getId();//顶级分类，分类名称 
            }
            DictPcr solid = DictPcr.dao.findById(parentId);//一级分类
            List<DictPcr> solidsChilds=DictPcr.dao.getChildList(parentId);//二级分类
            setAttr("solid", solid);
            setAttr("solids", solids);
            setAttr("solidsChilds", solidsChilds);
		}
		List<Record> adrecord = AdLable.dao.getAdsByType(3l,"c","s1");
		setAttr("adlists", adrecord);
		setAttr("searchtext", getPara("searchtext"));
		List<Record> pro =  Area.dao.getChildList2("1");//省
		List<Record> bus=SupplyInfo.dao.getActiveCompany(10);//推荐商家
		setAttr("pro", pro);
		setAttr("bus",bus);
		setAttr("typeId",getPara("typeId"));
		setAttr("title",getPara("title"));
		render("listSearch.jsp");
	}
	/**
	 * 获取列表
	 */
	public void supplyPage(){
		String remark = getPara("remark");
		SupplyHotQuery h = null; 
		String typeId = "" ;
		if(remark != null && !"".equals(remark)){
			if("1".equals(remark)){
				typeId = getPara("firstType");
			}else if("2".equals(remark)){
				typeId = getPara("secondType");
			}
			h=SupplyHotQuery.dao.findHot("D", typeId);
			if(h==null){
				h = new SupplyHotQuery();
				h.set("type_id",typeId);
				h.set("query_count", 1);
				h.set("type", "D");
				h.save();
			}else{
				h.set("query_count", h.getLong("query_count")+1);
				h.update();
			}
		}
		String title=  getPara("title");
		if(null!=title&&!title.equals("")){
			SupplyHotQuery q = SupplyHotQuery.dao.getRecordByWordAndType("D",title);
			if(null!= q){
				q.set("query_count",q.getLong("query_count")+1).update();
			}else {
				q = new SupplyHotQuery();
				q.set("type","D").set("query_count",1).set("query_word",title).save();
			}
		}

		List<Record> s = null;
		s = Qiugou.dao.getDemands(getParaToInt("pageNum"), 16 , getPara("firstType"), getPara("secondType"),title,getPara("provId"), getPara("order"));
		renderJson(s);
	}
	/**
	 * 获取条数
	 */
	public void getSupplyNum(){
		long count = Qiugou.dao.getDemandCount(getPara("firstType"), getPara("secondType"), getPara("title"),getPara("provId"), getPara("order")).getLong("count");
		renderJson(count);
	}
	//显示所有求购的列表
	public void listall(){
		Page<Record> re = Qiugou.dao.getPublishList(getParaToInt(0, 1),16);
		renderJson(re.getList());
	}
	/**
	 * 支付优蚁币
	 */
	public void paymoney(){
		User user = UserUtils.getUser();
		String flag  = "";
		if(user.getId() != null){
			User u = User.dao.findById(getPara("uid"));
			if(u.get("money")==null){
				flag = "余额不足";
			}else if((((BigDecimal)u.get("money")).compareTo(BigDecimal.valueOf(50d)))==-1){
				flag = "余额不足";
			}else{
                BigDecimal remain = ((BigDecimal) u.get("money")).subtract(BigDecimal.valueOf(50d));
				u.set("money",remain);
				u.update();
				CostRecord r = new CostRecord();
				r.set("user_id", user.getId());
				r.set("demand_id", getParaToLong("did"));
				r.set("costs", 50);
                r.set("remain",remain);
				r.set("create_by", user.getId());
				r.set("create_time", new Date());
				r.save();
				flag = "成功支付";
			}
		}else{
			flag = "请先登录";
		}
		renderText(flag);
	}
}

	

