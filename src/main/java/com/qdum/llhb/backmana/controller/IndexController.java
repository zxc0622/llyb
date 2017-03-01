package com.qdum.llhb.backmana.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.admana.model.AdImages;
import com.qdum.llhb.admana.model.AdLable;
import com.qdum.llhb.advisorCase.model.AdvisorCase;
import com.qdum.llhb.backmana.model.SupplyInfo;
import com.qdum.llhb.backmana.model.SysCooperationWebsite;
import com.qdum.llhb.common.utils.DateUtils;
import com.qdum.llhb.common.utils.IpUtils;
import com.qdum.llhb.hyzl.model.CompanyZl;
import com.qdum.llhb.hyzl.model.Member;
import com.qdum.llhb.infomaintain.model.InfoMaintain;
import com.qdum.llhb.notice.model.Notic;
import com.qdum.llhb.problem.model.Problem;
import com.qdum.llhb.productmana.model.Product;
import com.qdum.llhb.protection.model.EqEia;
import com.qdum.llhb.recruitment.model.RecuitmentInfomation;
import com.qdum.llhb.sys.model.Area;
import com.qdum.llhb.sys.model.Dict;
import com.qdum.llhb.sys.model.DictPcr;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.DictUtils;
import com.qdum.llhb.sys.utils.ProvinceCityUtil;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ws.vo.AjaxBeanTime;

public class IndexController extends Controller{
	@ActionKey("/index_v1")
	public void index_v1(){
		List<Record> re = SupplyInfo.dao.getRecommends(6);//搜索
		//String num = SupplyInfo.dao.getNewSolid().get("num").toString();//本月新增供求
		//List<Record> ds=SupplyInfo.dao.getNewSuAndDe(10);//供求动态
		//List<DictPcr> solids = DictPcr.dao.findByType("supply_type");
		List<Record> mat = DictPcr.dao.getFirstChildren("material_type");//原料分类
		List<Record> ser = DictPcr.dao.getFirstChildren("service_type");//服务分类
		List<Record> equ = DictPcr.dao.getFirstChildren("equipment_type");//设备分类
		String proNum = Product.dao.getNowCount().get("proNum").toString(); //新增商品数
		List<Record> news = InfoMaintain.dao.getIndexInfo("ep_news", 7);//环保动态
		List<Record> know = InfoMaintain.dao.getIndexInfo("ep_know", 7);//环保知识
		List<Record> show = InfoMaintain.dao.getIndexInfo("ep_show", 7);//展会信息
        List<Record> com = CompanyZl.dao.getCompanyByType("", 10);//获取环保业务提供商
        List<Record> youYiNews = InfoMaintain.dao.getIndexInfo("youyi_news", 7);  //获取优蚁新闻
        List<Record> hbTypes = DictPcr.dao.getFirstChildren("hb_type");//服务业务分类
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String startTime = sdf.format(DateUtils.getMonthFirstDay());
        //获取当月新增供求数
        String newHbNum = CompanyZl.dao.getNewHbNum();
       // List<Record> crs = User.dao.getComplex();
        List<Record> crs = User.dao.getRequirement(true);
        List<Record> cts = User.dao.getRequirementEn();
        for(int i=0;i<news.size();i++){
			if(news.get(i).get("content")!=null){
				String con = news.get(i).get("content").toString();
				news.get(i).set("content",DictUtils.delHTMLTag(con));
			}
		}
		for(int i=0;i<know.size();i++){
			if(know.get(i).get("content")!=null){
				String con = know.get(i).get("content").toString();
				know.get(i).set("content",DictUtils.delHTMLTag(con));
			}
		}
		for(int i=0;i<show.size();i++){
			if(show.get(i).get("content")!=null){
				String con = show.get(i).get("content").toString();
				show.get(i).set("content",DictUtils.delHTMLTag(con));
			}
		}
        for(int i=0;i<youYiNews.size();i++){
            if(youYiNews.get(i).get("content")!=null){
                String con = youYiNews.get(i).get("content").toString();
                youYiNews.get(i).set("content",DictUtils.delHTMLTag(con));
            }
        }


		ProvinceCityUtil addressUtils = new ProvinceCityUtil();
		try {
			String localIp = IpUtils.getRemoteHost(getRequest());
			//String localIp = "222.43.54.110";//用于测试的ip
			List<String> address =addressUtils.getAddresses("ip="+localIp, "utf-8");//得到省市区
			long proid = Area.dao.getIdByNameMohu(address.get(0).substring(0,2)).get("id");//得到省id
			setAttr("oriProId",proid);
			long cityid = this.getIdAddddress(address.get(1));//得到市id
			setAttr("oriCityId",cityid);

		} catch (Exception e) {

		}
		List<Record> ads = AdLable.dao.getIndexImg();
        List<Record> adsLabel = AdLable.dao.getAdsLabel();
		User user = UserUtils.getUser();
		List<Area> provinceList = Area.dao.getChildList("0,1,");
		Record eqcount = EqEia.dao.getEqCount();//报价人数
		setAttr("eqcount", eqcount);
		setAttr("provinceList", provinceList);
		setAttr("mat", mat);
		setAttr("ser", ser);
		setAttr("equ", equ);
		//setAttr("solids", solids);
		//setAttr("num",num);
		setAttr("re",re);
		//setAttr("ds",ds);
		setAttr("proNum",proNum);
		setAttr("news",news);
		setAttr("know",know);
		setAttr("show",show);
        setAttr("youYiNews",youYiNews);
		setAttr("user",user);
        setAttr("adsLabel",adsLabel);//首页广告
		setAttr("ads",ads);//首页广告
        setAttr("com",com);//环保业务提供商
        setAttr("hbTypes",hbTypes);//
        setAttr("sss",crs);
        setAttr("cts",cts);
        setAttr("newHbNum",newHbNum);
        setAttr("startTime", startTime);
		List<Record> list =Notic.dao.findNoticW();
		if(!(list.isEmpty())){
			setAttr("noticList",list);
		}
		List<Record> list5 =Problem.dao.findQuesListFive();
		if(!(list5.isEmpty())){
			setAttr("problemList",list5);
		}
		
		//人才招聘
		List<Record> list6 = RecuitmentInfomation.dao.getLastest(20);
		if(!(list6.isEmpty())){
			//保证集合长度为3的倍数
			int length = list6.size();
			int cutLen = length%3;
			//System.out.println("-------------初始长度--"+length);
			for(int i = 0;i<cutLen;i++){
				list6.remove(list6.size()-1);
			}
			//System.out.println("-------------end长度--"+list6.size());

			setAttr("recuInfoList",list6);
		}
        //获取最新的签约公司
        List<Record> newComs = Member.member.getNewComs();
        setAttr("newComs",newComs);
		render("index.jsp");
	}
	
	//进入新版首页
	@ActionKey("/index")
	public void index(){
		
		List<Record> ads = AdLable.dao.getIndexImg();
		setAttr("ads",ads);//首页广告
		List<Record> list =Notic.dao.findNoticW();
		if(!(list.isEmpty())){
			setAttr("noticList",list);
		}
		
		//用于判断是否为首页
		setAttr("isIndex",1);
		
		//banner图和链接从数据库获取
		List<AdImages> bannerlist = AdImages.dao.getAdImagesByLabelID(8L);
		setAttr("bannerlist",bannerlist);
		
		//3F
		//环保顾问咨询分类
		List<Dict> consultTypes = Dict.dao.getDictsByType("need_sc_type");
		setAttr("consultTypes",consultTypes);
		
		//4F
		//环保需求
		List<Record> crs = User.dao.getRequirement(true);
		setAttr("crs", crs);
		List<Record> quotes = User.dao.getComplex();
		setAttr("quotes", quotes);
		
		List<Record> news = InfoMaintain.dao.getIndexInfo("ep_news", 8);//行业资讯-环保动态
		List<Record> know = InfoMaintain.dao.getIndexInfo("ep_know", 10);//常见环保问题-环保知识
		//List<Record> show = InfoMaintain.dao.getIndexInfo("ep_show", 8);//展会信息
		List<Record> youyiList = InfoMaintain.dao.getIndexInfo("youyi_news",8);//优蚁资讯
		for(int i=0;i<news.size();i++){
			if(news.get(i).get("content")!=null){
				String con = news.get(i).get("content").toString();
				news.get(i).set("content",DictUtils.delHTMLTag(con));
			}
		}
		for(int i=0;i<know.size();i++){
			if(know.get(i).get("content")!=null){
				String con = know.get(i).get("content").toString();
				know.get(i).set("content",DictUtils.delHTMLTag(con));
			}
		}
		for(int i=0;i<youyiList.size();i++){
			if(youyiList.get(i).get("content")!=null){
				String con = youyiList.get(i).get("content").toString();
				youyiList.get(i).set("content",DictUtils.delHTMLTag(con));
			}
		}
		setAttr("news",news);
		setAttr("know",know);
		setAttr("youyiList",youyiList);
		
		//5F优质企业查询
		List<Record> yzqy1 =Db.find("SELECT s.total_score AS score,c.id AS companyId,c.logo_img AS logo"
				+ " FROM sys_company_score s LEFT JOIN sys_company c"
				+ " ON s.company_id = c.id"
				+ " WHERE s.hbCompany_type=1 AND s.del_flag=0 AND c.del_flag=0"
				+ " ORDER BY s.total_score DESC LIMIT 15");
		
		List<Record> yzqy2 =Db.find("SELECT s.total_score AS score,c.id AS companyId,c.logo_img AS logo"
				+ " FROM sys_company_score s LEFT JOIN sys_company c"
				+ " ON s.company_id = c.id"
				+ " WHERE s.hbCompany_type=2 AND s.del_flag=0 AND c.del_flag=0"
				+ " ORDER BY s.total_score DESC LIMIT 15");
		
		List<Record> yzqy3 =Db.find("SELECT s.total_score AS score,c.id AS companyId,c.logo_img AS logo"
				+ " FROM sys_company_score s LEFT JOIN sys_company c"
				+ " ON s.company_id = c.id"
				+ " WHERE s.hbCompany_type=3 AND s.del_flag=0 AND c.del_flag=0"
				+ " ORDER BY s.total_score DESC LIMIT 15");
		
		List<Record> yzqy4 =Db.find("SELECT s.total_score AS score,c.id AS companyId,c.logo_img AS logo"
				+ " FROM sys_company_score s LEFT JOIN sys_company c"
				+ " ON s.company_id = c.id"
				+ " WHERE s.hbCompany_type=4 AND s.del_flag=0 AND c.del_flag=0"
				+ " ORDER BY s.total_score DESC LIMIT 15");
		
		setAttr("yzqy1", yzqy1);
		setAttr("yzqy2", yzqy2);
		setAttr("yzqy3", yzqy3);
		setAttr("yzqy4", yzqy4);
		
		//6F环保商城分类查询
		List<Record> mat = DictPcr.dao.getFirstChildren("material_type");//原料分类
		List<Record> ser = DictPcr.dao.getFirstChildren("service_type");//服务分类
		List<Record> equ = DictPcr.dao.getFirstChildren("equipment_type");//设备分类
		setAttr("mat", mat);
		setAttr("ser", ser);
		setAttr("equ", equ);
		
		//7F人才招聘
		List<Record> recuInfoList = RecuitmentInfomation.dao.getLastest(20);
		setAttr("recuInfoList",recuInfoList);
		
		//明星案例
		List<AdvisorCase> caseList= AdvisorCase.dao.getCaseOnIndex();
		setAttr("caseList",caseList);
		
		//推荐企业
		List<Record> allRecoList = Db.find("SELECT * FROM bm_index_reco_adv WHERE del_flag=0");
		List<List<Record>> recoList = new ArrayList<List<Record>>();
		List<Record> temp = new ArrayList<Record>();
		for(int i=0;i<allRecoList.size();i++){
			if( i == (allRecoList.size()-1)){
				temp.add(allRecoList.get(i));
				recoList.add(temp);
				temp = new ArrayList<Record>();
			}else if(i!=0 && i%15 == 0){
				recoList.add(temp);
				temp = new ArrayList<Record>();
				temp.add(allRecoList.get(i));
			}else{
				temp.add(allRecoList.get(i));
			}
		}
		setAttr("recoList",recoList);
		render("index_v2.jsp");
	}

	/**
	 * 得到地址id
	 */
	public long getIdAddddress(String name){
		return Area.dao.getIdByNameMohu(name.substring(0,name.length()-1)).get("id");
	}
	
	@ActionKey("/")  //设置欢迎页面,系统默认展示页面
	public void welcome(){
		index();
	}

	/**
	 * 环保商城
	 * @throws ParseException 
	 */
	@ActionKey("/index/getProList")
	public void getProList() throws ParseException{
		List<Record> pros = Product.dao.indexEqriList(getPara("typeFirst"), getPara("typeSecond"), getPara("title"),getPara("order"), 8);
		//获取当前时间,比较.
		AjaxBeanTime ajaxTime = new AjaxBeanTime();
		List<Record> longPros = new ArrayList<Record>()  ;
		List<Record> shortPros = new ArrayList<Record>()  ;
		String nowDate= DateUtils.getDateTime();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		int a = pros.size();
		for (int i = 0; i < pros.size(); i++) {
			long time = DateUtils.pastMinutes(df.parse(nowDate),pros.get(i).getDate("time"));
			if(time>7*24*60){
				longPros.add(pros.get(i));
			}else{
				shortPros.add(pros.get(i));
			}
		}
		ajaxTime.setLongTime(longPros);
		ajaxTime.setShortTime(shortPros);
		renderJson(ajaxTime);
	}

    /**
     *方法getCompanyByType的功能描述:获取服务企业
     *@author yaoyt
     *@time 16/3/28 下午5:35
     */
    @ActionKey("/index/getCompanyByType")
    public void getCompanyByType(){
        String type = getPara("type");
        String num = getPara("num");
        List<Record> com = CompanyZl.dao.getCompanyByType(type, Integer.valueOf(num));//获取环保业务提供商
        renderJson(com);
    }

    /**
     *方法getRandomCompanyByType的功能描述:查询随机企业
     *@author yaoyt
     *@time 4/11/16 5:05 PM
     */
    @ActionKey("/index/getRandomCompanyByType")
    public void getRandomCompanyByType(){
        String type = getPara("type");
        String num = getPara("num");
        Integer pageNum = getParaToInt("pageNum");
        Page<Record> com = CompanyZl.dao.getRandomCompanyByType(type, Integer.valueOf(num),pageNum);//获取环保业务提供商
        renderJson(com);
    }

    /**
     *方法showComing的功能描述:
     *@author yaoyt
     *@time 4/8/16 10:25 AM
     */
    @ActionKey("/index/showComing")
    public void showComing(){
        render("showComing.jsp");
    }
   
    /**
     * 方法  根据时间和环保类型查找需求
     */
    @ActionKey("/index/selectRequriebyDate")
    public void selectRequriebyDate(){
    	String enviroment = getPara("enviroment");
    	String startTime = getPara("startTime");
    	String endTime = getPara("endTime");
    	List<Record> re = null;
		re = User.dao.getRequirementbyDate(enviroment,startTime, endTime);
    	renderJson(re);
    }
    
    /**
     * 设置首页底部的合作网站
     */
    @ActionKey("/index/setCooperationWebsite")
    public void setCooperationWebsite(){
    	List<Record> websiteTypeList = Db.find("SELECT * FROM sys_dict WHERE type='website_type' AND del_flag=0 ORDER BY sort");
    	setAttr("wtl",websiteTypeList);
    	if(!websiteTypeList.isEmpty()){
    		long id = websiteTypeList.get(0).getLong("id");
    		List<Record> websiteInfoList = Db.find("SELECT * FROM sys_cooperation_website WHERE type=? AND del_flag=0",id);
    		setAttr("wil",websiteInfoList);
    	}
    	render("setCooperationWebsite.jsp");
    }
    
    @ActionKey("/index/setCooperationWebsite/saveWebsiteType")
    public void saveWebsiteType(){
		String name = getPara("name");
	    String type = getPara("type");
	    String desc = getPara("desc");
	    String sort = getPara("sort");
	    String aora = getPara("aora");//添加为1，修改为2
	    String id = getPara("id");
	    String value = "1";
	    Long userId = UserUtils.getUser().getId();
	    
	    Dict dict = new Dict();
	    if(aora.equals("1")){
	    	//添加为分类
	    	dict.set("label", name);
	    	dict.set("value", value);
	    	dict.set("type", type);
	    	dict.set("description", desc);
	    	dict.set("sort", sort);
	    	dict.set("create_by", userId);
	    	dict.set("create_date", formatTime(new Date()));
	    	boolean b = dict.save();
	    	JSONObject json = new JSONObject();
	    	if(b){
	    		json.put("sta", "ok");
	    		json.put("typeId", dict.get("id"));
	    		renderJson(json);
	    	}else{
	    		json.put("sta", "fail");
	    		renderJson(json);
	    	}
	    }else if(aora.equals("2")){
	    	//修改分类
	    	dict = Dict.dao.findById(id);
	    	dict.set("label", name);
	    	dict.set("sort", sort);
	    	dict.set("update_by", userId);
	    	dict.set("update_date", formatTime(new Date()));
	    	boolean b = dict.update();
	    	JSONObject json = new JSONObject();
	    	if(b){
	    		json.put("sta", "ok");
	    		renderJson(json);
	    	}else{
	    		json.put("sta", "fail");
	    		renderJson(json);
	    	}
	    }
	    
    }
    
    @ActionKey("/index/setCooperationWebsite/deleteWebsiteType")
    public void deleteWebsiteType(){
    	String id = getPara("id");
        Long userId = UserUtils.getUser().getId();
        
        String sql = "UPDATE sys_dict SET del_flag=1, update_by=?, update_date = NOW() WHERE (id=?)";
        int result = Db.update(sql,userId,id);
        if(result > 0){
	        String sql2 = "UPDATE sys_cooperation_website SET del_flag=1,update_by=?,update_date=NOW() WHERE type=?";
	        int result2 = Db.update(sql2,userId,id);
	        
	    	if(result2 > 0){
	    		renderText("ok");
	    	}else{
	    		renderText("fail");
	    	}
        }else{
        	renderText("fail");
        }
    }
    
    @ActionKey("/index/setCooperationWebsite/saveWebsiteInfo")
    public void saveWebsiteInfo(){
    	String id = getPara("id");
	    String name = getPara("name");
	    String url = getPara("url");
	    String type = getPara("type");
	    String sort = getPara("sort");
	    String aora = getPara("aora");//添加为1，修改为2
	    Long userId = UserUtils.getUser().getId();
	    
	    SysCooperationWebsite scw = new SysCooperationWebsite();
	    if(aora.equals("1")){
	    	//添加
	    	scw.set("site_name", name);
	    	scw.set("site_url", url);
	    	scw.set("type", type);
	    	scw.set("sort", sort);
	    	scw.set("update_by", userId);
	    	scw.set("update_date", formatTime(new Date()));
	    	boolean b = scw.save();
	    	JSONObject json = new JSONObject();
	    	if(b){
	    		json.put("sta", "ok");
	    		json.put("id", scw.get("id"));
	    		json.put("name", name);
	    		json.put("url", url);
	    		json.put("sort", sort);
	    	}else{
	    		json.put("sta", "fail");
	    	}
	    	renderJson(json);
	    }else if(aora.equals("2")){
	    	//修改
	    	scw = SysCooperationWebsite.dao.findById(id);
	    	scw.set("site_name", name);
	    	scw.set("site_url", url);
	    	scw.set("sort", sort);
	    	scw.set("update_by", userId);
	    	scw.set("update_date", formatTime(new Date()));
	    	boolean b = scw.update();
	    	JSONObject json = new JSONObject();
	    	if(b){
	    		json.put("sta", "ok");
	    	}else{
	    		json.put("sta", "fail");
	    	}
	    	renderJson(json);
	    }
	    
    }
    
    @ActionKey("/index/setCooperationWebsite/deleteWebsiteInfo")
    public void deleteWebsiteInfo(){
    	String id = getPara("id");
        Long userId = UserUtils.getUser().getId();
        
        String sql = "UPDATE sys_cooperation_website SET del_flag=1,update_by=?,update_date=NOW() WHERE id=?";
        int result = Db.update(sql,userId,id);
        if(result >0){
        	renderText("ok");
        }else{
        	renderText("fail");
        }
    }
    
    @ActionKey("/index/setCooperationWebsite/getWebsiteInfo")
    public void getWebsiteInfo(){
    	String id = getPara("id");
    	String sql = "SELECT * FROM sys_cooperation_website WHERE type=? AND del_flag=0";
    	List<Record> infoList = Db.find(sql,id);
    	renderJson(JSONArray.fromObject(infoList));
    }
    
    public String formatTime(Date date){
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	return sdf.format(date);
    }
}
