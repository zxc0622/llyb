package com.qdum.llhb.backmana.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;

import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.ext.weixin.kit.PropKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.admana.model.AdLable;
import com.qdum.llhb.backmana.model.BusinessCollect;
import com.qdum.llhb.backmana.model.Quirement;
import com.qdum.llhb.backmana.model.SupplyHotQuery;
import com.qdum.llhb.backmana.model.SupplyInfo;
import com.qdum.llhb.backmana.model.SupplyViewHistory;
import com.qdum.llhb.backmana.service.QuirementService;
import com.qdum.llhb.common.security.shiro.SystemAuthorizingRealm.Principal;
import com.qdum.llhb.common.utils.DateUtils;
import com.qdum.llhb.hyzl.model.CompanyZl;
import com.qdum.llhb.qiugou.model.Qiugou;
import com.qdum.llhb.sys.model.Area;
import com.qdum.llhb.sys.model.Dict;
import com.qdum.llhb.sys.model.DictPcr;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
/**
 * 固废供应
 */
@ControllerBind(controllerKey = "/solidsupply")
@Before(AdminInterceptor.class)
public class SolidSupplyController extends Controller {
	int pageSize = 8;
	private static int pageSettingNum = Integer.parseInt(PropKit.get("pageNumber"));

	public void index_v1(){
		//String num = SupplyInfo.dao.getNewSolid().get("num").toString();//本月新增供求
		//List<Record> d=SupplyInfo.dao.getSupplys(1, 4, null, null, "", "", "s.page_view desc");//供应产品推荐
		//List<Record> supplys=SupplyInfo.dao.getActiveCompany(6);//活跃供应商
		//List<Record> demands=Qiugou.dao.getHotDemand(20);//求购产品
		//List<Record> dem=Qiugou.dao.getActiveDemand(0,6);//活跃采购商
		//List<Record> hotq = SupplyHotQuery.dao.getHotList("S", 11);//热搜
		//List<Record> re = SupplyInfo.dao.getRecommends(6);//推荐
		//List<Record> ads = AdLable.dao.getAds("3","C", "S4", null);//产品小广告
        List<Record> com = CompanyZl.dao.getCompanyByType("", 24);//获取环保业务提供商
        List<Record> hbTypes = DictPcr.dao.getFirstChildren("hb_type");//服务业务分类
        //获取当月新增供求数
        String newHbNum = CompanyZl.dao.getNewHbNum();
     //   List<Record> crs = User.dao.getComplex();
        List<Record> crs = User.dao.getRequirement(true);
        List<Record> cts = User.dao.getRequirementEn();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String startTime = sdf.format(DateUtils.getMonthFirstDay());
        setAttr("startTime", startTime);
        setAttr("cts",cts);
        setAttr("com",com);
        setAttr("hbTypes",hbTypes);
        setAttr("newHbNum",newHbNum);
        setAttr("crs",crs);
//        setAttr("num",num);
//		setAttr("d",d);
//		setAttr("demands",demands);
//		setAttr("re",re);
//		setAttr("hotq",hotq);
//		setAttr("ads",ads);
		render("solidIndex.jsp");
	}
	
	
	/**
	 * 固废供应添加
	 */
	public void solidAdd(){
        //判断是否为企业,若不是,则跳转到企业信息页面维护企业信息 yaoyt@2016.3.11
        if(!UserUtils.isCompany()){
            getSession().setAttribute("tip","请先完善公司资料再进行固废供应");
            redirect("/hyzl/EnterpriseDataZero");
            return;
        }


		List<DictPcr> solids = DictPcr.dao.findByTypeOrderById("supply_type");
		List<Dict> period=Dict.dao.getDictsByType("period_type");//获取有效时间
        List<Dict> unit=Dict.dao.getDictsByType("unit_type");//获取产品单位
		String paramId = getPara("paramId");

		if(paramId != null){
			Record record = Qiugou.dao.getRecordById(Integer.parseInt(paramId));
			setAttr("record", record);
			String see = getPara("see");
			if(see != null){
				SupplyInfo qg  = SupplyInfo.dao.getById(Integer.parseInt(paramId));
				qg.set("page_view",qg.getLong("page_view")+1 );
				qg.update();
			}
		}
        setAttr("solids",solids);
		setAttr("period", period);
        setAttr("unit", unit);
		render("solidAdd.jsp");
	}
	/**
	 * 提交 有id update， 无id save
	 */
	public void saveSolidSupply(){
		User user = UserUtils.getUser();
		String id = getPara("id");
		SupplyInfo solid = null;
		String pastTime=getPara("pastDate");
		Date date= new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(pastTime.indexOf("-") != -1){
			try {
				date=sdf.parse(pastTime);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if(id == "" || id == null){
			solid = new SupplyInfo(); 
			solid.set("create_by",user.getId());
			solid.set("create_date",new Date());
		}else{
			solid = SupplyInfo.dao.findById(getParaToLong("id")); 
			solid.set("update_by",user.getId());
			solid.set("update_date",new Date());
		}
		solid.set("info_type_first",getParaToLong("typeFirst"));
		solid.set("info_type_second",getParaToLong("typeSecond"));
		solid.set("amount",getParaToLong("amount"));
		solid.set("info_title",getPara("infoTitle"));
		solid.set("key_words",getPara("words"));
		solid.set("details",getPara("details"));
		solid.set("pic1",getPara("pic1"));
		solid.set("pic2",getPara("pic2"));
		solid.set("pic3",getPara("pic3"));
		solid.set("unit",getPara("unit"));
		if("".equals(getPara("lowPrice"))){
			solid.set("low_price",null);
		}else{
			solid.set("low_price",getPara("lowPrice"));
		}
		if("".equals(getPara("highPrice"))){
			solid.set("high_price",null);
		}else{
			solid.set("high_price",getPara("highPrice"));
		}
		solid.set("past_date",date);
		solid.set("sta",1);
		boolean result = false;
		if(id == "" || id == null){
			result = solid.save();
		}else{
			result = solid.update();
		}
		renderJson(result);
	}
	/**
	 * 页面跳转0未通过，2已发布，1审核中, 已过期
	 */
	public void solidSupply(){
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
		Page<Record> records = SupplyInfo.dao.getFullRecords(getParaToInt(0, 1),yeshu,one,two,title,order,user.getId());
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
		render("solidSupply.jsp");
	}
	/**
	 * 获取列表 0未通过，2已发布，1审核中, 已过期
	 */
	public void getSolids(){
		User user = UserUtils.getUser();
		if(user !=null){
			List<SupplyInfo> supply = null;
			if(getPara("status") == "" || getPara("status") == null){//已过期
				supply = SupplyInfo.dao.getSolids(user.getId(),getParaToInt("pageNumber"), pageSize,getPara("firstType"),getPara("secondType"),getPara("title"));
			}else{    //未通过，已发布，审核中
				int yeshu = 8;
				try {
					yeshu  =getParaToInt("paginateFenye");
					setAttr("paginateFenye",yeshu);
				} catch (Exception e) {
					yeshu = 8;
				}
				supply = SupplyInfo.dao.getSolids(user.getId(),getPara("status"), getParaToInt("pageNumber"), yeshu,getPara("firstType"),getPara("secondType"),getPara("title"));
			}
			renderJson(supply);
		}else{
			redirect("/login");
		}
		
	}
	/**
	 * 获取条数
	 */
	public void getNum(){
		User user = UserUtils.getUser();
		String status = getPara("status");
		long count = 0 ;
		if(status != null && status != ""){
			count = SupplyInfo.dao.getCount(user.getId(),status,getPara("firstType"),getPara("secondType"),getPara("title")).getLong("count");
		}else{
			count = SupplyInfo.dao.getCount(user.getId(),getPara("firstType"),getPara("secondType"),getPara("title")).getLong("count");
		}
		renderJson(count);
	}
	/**
	 * 删除
	 */
	public void delSupplys(){
		String str = getPara("ids");
		String[] ids = str.split(",");
		boolean result = true;
		for(int i = 0 ; i < ids.length; i++){
			SupplyInfo supply = SupplyInfo.dao.findById(Long.parseLong(ids[i]));
			if(supply == null){}else{
				result = supply.set("del_flag",1).update();
				if(result == false){
					renderJson(result);
					break;
				}
			}
		}
		renderJson(result);
	}
	/**
	 * 固废供应修改
	 */
	public void solidEdit(){
		List<DictPcr> solids = DictPcr.dao.findByType("supply_type");
		List<Dict> period=Dict.dao.getDictsByType("period_type");//获取有效时间
        List<Dict> unit=Dict.dao.getDictsByType("unit_type");//获取产品单位
        setAttr("solids",solids);
		setAttr("period", period);
        setAttr("unit", unit);
        String paramId = getPara("paramId");

        if(paramId != null){
            List<Record> supply = SupplyInfo.dao.getSupplyById(getPara("paramId"));
            if(supply.size() > 0){
                setAttr("supply", supply.get(0));
                setAttr("id", getPara("paramId"));
                render("solidEdit.jsp");
            }
        }

	}
	
	/**
	 * 固废供应列表
	 */
	public void supplyList(){
		List<DictPcr> solids = DictPcr.dao.findByType("supply_type");
		List<Record> pro =  Area.dao.getChildList2("1");//省
		List<Record> ads = AdLable.dao.getAds("3","C", "S1", null);//推荐企业
		setAttr("solids", solids);
		setAttr("pro", pro);
		setAttr("ads",ads);
		setAttr("typeId",getPara("typeId"));
		setAttr("title",getPara("title"));
		render("supplyList.jsp");
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
			h=SupplyHotQuery.dao.findHot("S", typeId);
			if(h==null){
				h = new SupplyHotQuery();
				h.set("type_id",typeId);
				h.set("query_count", 1);
				h.set("type", "S");
				h.save();
			}else{
				h.set("query_count", h.getLong("query_count")+1);
				h.update();
			}
		}
		String title=  getPara("title");
		if(null!=title&&!title.equals("")){
			SupplyHotQuery q = SupplyHotQuery.dao.getRecordByWordAndType("S",title);
			if(null!= q){
				q.set("query_count",q.getLong("query_count")+1).update();
			}else {
				q = new SupplyHotQuery();
				q.set("type","S").set("query_count",1).set("query_word",title).save();
			}
		}
		List<Record> s = null;
		s = SupplyInfo.dao.getSupplys(getParaToInt("pageNum"), 16 , getPara("firstType"), getPara("secondType"), getPara("title"),getPara("provId"), getPara("order"));
		renderJson(s);
	}
	/**
	 * 获取条数
	 */
	public void getSupplyNum(){
		long count = SupplyInfo.dao.getSupplysCount(getPara("firstType"), getPara("secondType"), getPara("title"),getPara("provId"), getPara("order")).getLong("count");
		renderJson(count);
	}
	
	/**
	 * 详情
	 */
	public void getMess(){
        String idp = getPara();
        if(StringUtils.isBlank(idp)){
            idp = getPara("id");
        }
		List<Record> d = SupplyInfo.dao.getSupplyById(idp);
		if(d.size() >0){
			String loginName = d.get(0).getStr("loginName");
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
					if(p.getLoginName().equals(loginName)){
						status = 1;
						break;
					}
				}
			}
			long userId = d.get(0).getLong("userId");
			int id = d.get(0).getInt("id");
			List<Record> o = SupplyInfo.dao.getOthers(id, userId);//获取某公司的其他商品
			long firstType = d.get(0).getLong("tone");
			long secondType = d.get(0).getLong("ttwo");
			List<Record> co = SupplyInfo.dao.getOtherComs(id, firstType, secondType,12); //其他商家相关商品
			if(co.size() <= 12){
				co.addAll(SupplyInfo.dao.getOtherComs(id, firstType, -1,(12-co.size())));
				if(co.size()<= 12){
					co=SupplyInfo.dao.getOtherComs(id, -1, -1,(12-co.size()));
				}
			}
			List<Record> hs = SupplyInfo.dao.getHotSupply();//热门供应
			List<Record> ads = AdLable.dao.getAds("3","C", "S1", null);//推荐企业
			//历史记录
			User user = UserUtils.getUser();
			if(user.getId() != null){
				SupplyViewHistory svh = SupplyViewHistory.dao.findBySupplyId(user.getId(), id);
				boolean result = false;
				if(svh == null){
					svh = new SupplyViewHistory();
					svh.set("supply_id", id);
					svh.set("view_user",user.getId());
					svh.set("create_by", user.getId());
					svh.set("create_date", new Date());
					result = svh.save();
				}else{
					svh.set("update_by", user.getId());
					svh.set("update_date", new Date());
					svh.set("del_flag", 0);
					result = svh.update();
				}
				if(result == false){
					redirect("/solidsupply/supplyList");
				}
			}
			//浏览次数
			SupplyInfo s = SupplyInfo.dao.findById(idp);
			s.set("page_view", s.getLong("page_view")+1);
			s.update();
			setAttr("ads",ads);
			setAttr("hs",hs);
			setAttr("status",status);
			setAttr("d",d.get(0));
			setAttr("o",o);
			setAttr("co",co);
			render("supplyDetail.jsp");
		}else{
			redirect("/solidsupply/supplyList");
		}
	}
	
	public void collect(){
		User user = UserUtils.getUser();
		String msg="";
		if(user.getId() != null){
			BusinessCollect c =null;
			c = BusinessCollect.dao.findCollet("1", getPara("collectId"), user.getId());
			if(c == null){
				c = new BusinessCollect();
				c.set("type","1");
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
			msg="请先登录再收藏！<a style='color:red;' href='javascript:gologin();'>去登录</a>";
		}
		renderText(msg);
	}

    public void hbDemandQuery(){
        String title = getPara("title")  == null ? "" : getPara("title");
        String type = getPara("type") == null ? "" : getPara("type");
        List<Record> hbTypes = DictPcr.dao.getFirstChildren("hb_type");//服务业务分类
        List<Record> ads = AdLable.dao.getAds("3","C", "S1", null);//推荐企业
        setAttr("title",title);
        setAttr("hbTypes",hbTypes);
        setAttr("ads",ads);
        setAttr("type",type);
        Page<Record> page = Quirement.dao.getHbDemandList(getParaToInt("pageNum") == null ? 1 : getParaToInt("pageNum"), 10,title,type);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for(Record q : page.getList()){
            //隐藏姓名
            q.set("name",hideName(q.getStr("name"),1));
            q.set("phone",hideName(q.getStr("phone"),3));
            q.set("trade_status",q.getStr("trade_status").equals("null")? "":q.getStr("trade_status"));
            q.set("create_date",sdf.format(q.get("create_date")));
        }
        setAttr("page",page);
        render("hbDemandList.jsp");
    }

    public void hbDemandPage(){
        String title =  getPara("title");
        String type = getPara("type");
        //Page<Quirement> page = Quirement.dao.getHbDemandList(getParaToInt("pageNum"), 10,title,type);
        renderJson("");
    }

    public String hideName(String name,int length){
        int nameLength = name.length();
        StringBuffer sb = new StringBuffer();
        for(int i = 0; i<nameLength; i++){
            if( i < length -1){
                sb.append(name.charAt(i));
            }else{
                sb.append("*");
            }
        }
        return sb.toString();

    }
    
    
    /**
	 * 新的环保需求
	 */
    @ActionKey("/supply-demand")
	public void index(){
		List<Record> needType =  Db.find("SELECT * FROM sys_dict WHERE"
				+ " type IN ( 'need_sc_type', 'need_fw_type' )"
				+ " AND del_flag = 0 ORDER BY sort");
		//状态为“提交”的最新的20条需求
		Map conditions=new HashMap();
		conditions.put("type", "不限分类");
		conditions.put("startDate", "1999-01-01");
		conditions.put("endDate", "9999-01-01");
		conditions.put("sta", "提交中");
		conditions.put("pageNumber", 1);
		Page<Quirement> qrmPaging = Quirement.dao.selectSolidSupply(conditions);
		setAttr("nt",needType);
		setAttr("crs",QuirementService.qrmListFilter(qrmPaging.getList()));
		setAttr("pageNumber",qrmPaging.getPageNumber());
		setAttr("totalPage",qrmPaging.getTotalPage());
		
		render("../v2/solidsuspply/solidIndex.jsp");
	}
	
	//查询需求
	public void select(){
		Map conditions=new HashMap();
		String type=getPara("type");
		String startDate=getPara("startDate");
		String endDate=getPara("endDate");
		String sta=getPara("sta");
		String pageNumber=getPara("pageNumber");
		conditions.put("type", type);
		conditions.put("startDate", startDate);
		conditions.put("endDate", endDate);
		conditions.put("sta", sta);
		conditions.put("pageNumber", pageNumber);
		Page<Quirement> qrmPaging = Quirement.dao.selectSolidSupply(conditions);
		if(qrmPaging.getTotalRow()==0){
			renderJson(-1);
		}else{
			List qrmMsg=new ArrayList();
			qrmMsg.add(qrmPaging.getPageNumber());
			qrmMsg.add(qrmPaging.getTotalPage());
			qrmMsg.addAll(QuirementService.qrmListFilter(qrmPaging.getList()));
			renderJson(qrmMsg);
		}
	}
}
