package com.qdum.llhb.backmana.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.backmana.model.Quirement;
import com.qdum.llhb.backmana.model.SupplyInfo;
import com.qdum.llhb.reg.model.Company;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@ControllerBind(controllerKey = "/userhomepage")
public class UserHomePageController extends Controller {

	// 个人用户首页
	public void index_v1() {
		User user = UserUtils.getUser();
		String dc = User.dao.getIndexInfo(user.getId()).get("dataCompletion").toString();// 资料完成度
		setAttr("dc", dc);// 资料完成度
  
        Company c = Company.dao.findCompanytypeByUserId(user.getId());
		String type = c == null ? "2" : String.valueOf(c.get("type"));
		if ("1".equals(type)) {// 环保企业
			initHbfwJspData(user);//初始化环保企业页面所需数据
			render("hbHomePage.jsp");
		} else {// 其他企业,产废企业
			initCfJspData(user);
			render("cfHomePage.jsp");
		}
	

	}
	
	//初始化非环保企业页面所需数据
	private void initCfJspData(User user) {
		List<Record> cf = SupplyInfo.dao.getMySupplys(-1, user.getId());//发布的环保需求
		List<Record> re = SupplyInfo.dao.getReCommendCompanys(30, user.getId());//推荐的公司
		List<Record> ss = SupplyInfo.dao.getSeenSupplys(user.getId());//查看当前用户的环保需求的公司
		Map<String,List<Record>> ssMaps = getSeenSupplyFromList(ss);//整理查看当前用户需求的公司,同一条需求对应多个
		List<Record> trade_status = SupplyInfo.dao.getSupplyTradeStatus(user.getId());//获得环保信息状态的条数
		Map<String,Integer> ts = getMapFromList(trade_status);
		int totalNum = SupplyInfo.dao.getCountSupplys(user.getId());//
		List<Record> remarks = SupplyInfo.dao.getRemarks();//筛选条件
		setAttr("cf", cf);
		setAttr("re", re);
		setAttr("ss", ss);
		setAttr("ssMaps", ssMaps);
		setAttr("remarks", remarks);
		setAttr("totalNum",totalNum);
		setAttr("ts", ts);//发布信息状态的条数
	}
	
	//初始化环保企业页面所需数据
	private void initHbfwJspData(User user) {
		String money = user.get("money") == null ? "0.00": user.get("money").toString();// 优蚁币
		List<Record> hbfw = SupplyInfo.dao.getSupplys(30,user.getId());//环保需求信息
		List<Record> payHbfw = SupplyInfo.dao.getPaySupplys(-1, user.getId());// 已查看的环保需求
		List<Record> remarks = SupplyInfo.dao.getRemarks();//筛选条件
		float totalCosts = getTotalCosts(payHbfw);//查看环保需求花费的优蚁币
		setAttr("hbfw", hbfw);
		setAttr("payHbfw", payHbfw);
		setAttr("totalCosts", totalCosts);
		setAttr("money", money);
		setAttr("remarks", remarks);
		
	}
	
	private Map<String, Integer> getMapFromList(List<Record> trade_status) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		for(Record re: trade_status){
			String ts = re.get("trade_status");
			int num = Integer.parseInt(re.get("num").toString());
			if (ts!=null) {
				map.put(ts, num);
			}
		}
		return map;
	}
	//整理查看当前用户需求的公司,同一条需求对应多个
	private Map<String,List<Record>> getSeenSupplyFromList(List<Record> ss) {
		List<Record> list = null;
		Map<String,List<Record>> map = new HashMap<String, List<Record>>();
		for(Record re :ss){
			list = new ArrayList<Record>();
			String id = re.get("id").toString();
			String remarks = re.get("remarks").toString();
			String date = re.get("create_date").toString().substring(0,10);
			String key = id+"_"+remarks+"（"+date+"）";
			if(map.keySet().contains(key)){
				list = map.get(key);
			}
			list.add(re);
			map.put(key, list);
		}
		return map;
	}
	
	// 查看过的环保需求信息花的优蚁币
	private float getTotalCosts(List<Record> payHbfw) {
		float totalCosts = 0;
		for (Record re : payHbfw) {
			String costs = re.get("costs").toString();
			if (!"-1".equals(costs)) {
				totalCosts += Float.valueOf(costs);
			}
		}
		return totalCosts;
	}
	/**
	 * 异步请求筛选查看的环保信息
	 */
	public void getHbxqAjax(){
		User user = UserUtils.getUser();
		String date = getPara("date");
		String remarks = getPara("remarks");
		if(remarks!=null && "全部".equals(remarks)){
			remarks = null;
		}
		List<Record> hbxq = SupplyInfo.dao.getPaySupplys(-1, user.getId(), date, remarks);
		renderJson(hbxq);
	}
	/**
	 * 异步请求筛选发布的环保信息
	 */
	public void getCfxqAjax(){
		User user = UserUtils.getUser();
		String date = getPara("date");
		String remarks = getPara("remarks");
		if(remarks!=null && "全部".equals(remarks)){
			remarks = null;
		}
		List<Record> cfxq = SupplyInfo.dao.getMySupplys(-1, user.getId(), date, remarks);
		renderJson(cfxq);
	}
	//查看用户环保需求的公司
	class SeenMySupplyCompanys{
		int id;//用户发布环保需求id
		String remarks;//
		String date;//发布时间
		List<Record> companys;//查看该记录的公司
	}
	
	/**
	 * 得到环保需求的数据,跳转到环保编辑页面.
	 * @author zhangwn
	 */
	
	public void editRequriement(){
		String id = getPara("id");
		String remarks = getPara("remarks");
		String name = getPara("name");
		String phone = getPara("phone");
		String tradeStatus = getPara("trade_status");
		String create_date = getPara("create_date");
        Quirement re = Quirement.dao.getQuirementById(id);
		setAttr("id", id);
		setAttr("remarks", remarks);
		setAttr("name",name);
		setAttr("phone",phone);
		setAttr("tradeStatus", tradeStatus);
		setAttr("create_date",create_date);
        setAttr("requirement_describe",re.getStr("requirement_describe"));
        setAttr("company_name",re.getStr("company_name"));
		render("editRequriement.jsp");
		
	}
	 /**
     * 根据环保需求ID更新环保环保需求信息.
     * @author zhangwn
     */
    public void updateRequrieInfo(){
    	String requrieId = getPara("requrieId");
    	String requiredescrip = getPara("requiredescrip");
    	String name = getPara("name");
    	String companyName = getPara("companyName");
    	Quirement re = Quirement.dao.getQuirementById(requrieId);
    	re.set("requirement_describe", requiredescrip);
    	re.set("name", name);
    	re.set("company_name", companyName);
		re.set("create_date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
    	re.update();
		renderText("ok");
    }
    
    /**
     * 修改环保需求状态
     */
    public void editReqStatus(){
    	List<Record> rs = SupplyInfo.dao.getAllSupplysByStatus(null,null,"提交");//所有状态为提交的环保信息
    	List<Record> remarks = SupplyInfo.dao.getRemarks();//筛选条件
    	setAttr("rs", rs);
    	setAttr("remarks",remarks);
    	render("editReqStatus.jsp");
    }
    /**
     * 异步请求所有状态为提交的环保信息
     */
    public void getSomeSupplyAjax(){
    	String date = getPara("date");
		String remarks = getPara("remarks");
		if(remarks!=null && "全部".equals(remarks)){
			remarks = null;
		}
    	List<Record> rs = SupplyInfo.dao.getAllSupplysByStatus(date, remarks,"提交");//所有状态为提交的环保信息
    	renderJson(rs);
    }
    /**
     * 保存修改后的环保需求
     */
    public void save(){
    	String ids= getPara("ids");
    	String status = getPara("status");
    	String[] idArr = ids.split("_");
    	String[] statusArr = status.split("_");
    	
    	if(idArr.length!=statusArr.length){
    		renderJson(false);
    		return;
    	}
    	//int counts = 0;//更新的条数
    	for(int i=0;i<idArr.length;i++){
    		SupplyInfo.dao.updateTradeStatus(idArr[i],statusArr[i]);
    		//counts +=count;
    	}
    	renderJson(true);
    }
    
    
    //===========================================V2版本====================================================
    
	public void index() {
		User user = UserUtils.getUser();
		String dc = User.dao.getIndexInfo(user.getId()).get("dataCompletion").toString();// 资料完成度
		setAttr("dc", dc);// 资料完成度
  
        Company c = Company.dao.findCompanytypeByUserId(user.getId());
		String type = c == null ? "2" : String.valueOf(c.get("type"));
		if ("1".equals(type)) {// 环保企业
			setAttr("isHbc",1);
			
			//String money = user.get("money") == null ? "0.00": user.get("money").toString();// 优蚁币
			//List<Record> hbfw = SupplyInfo.dao.getSupplys(30,user.getId());//推荐的环保需求信息
//			List<Record> payHbfw = SupplyInfo.dao.getPaySupplys(-1, user.getId());// 已查看的环保需求
//			List<Record> remarks = SupplyInfo.dao.getRemarks();//筛选条件
//			float totalCosts = getTotalCosts(payHbfw);//查看环保需求花费的优蚁币
			//setAttr("hbfw", hbfw);
//			setAttr("payHbfw", payHbfw);
//			setAttr("totalCosts", totalCosts);
//			setAttr("money", money);
//			setAttr("remarks", remarks);
			
			Page<Record> rs = SupplyInfo.dao.getRecommendSupplys(1, 10, user.getId());//系统推荐需求
			setAttr("rs", rs.getList());
			setAttr("recomTotalPage", rs.getTotalPage());
			
			Page<Record> payHbfw = SupplyInfo.dao.getPaySupplys_v2(1, 10, user.getId());// 已查看的环保需求
			setAttr("payHbfw", payHbfw.getList());
			setAttr("payHbfwTotalPage", payHbfw.getTotalPage());
			
		} else {// 其他企业,产废企业
			setAttr("isHbc",0);
		}
		
		//List<Record> cf = SupplyInfo.dao.getMySupplys(-1, user.getId());//发布的环保需求
//		List<Record> re = SupplyInfo.dao.getReCommendCompanys(30, user.getId());//推荐的公司
//		List<Record> ss = SupplyInfo.dao.getSeenSupplys(user.getId());//查看当前用户的环保需求的公司
//		Map<String,List<Record>> ssMaps = getSeenSupplyFromList(ss);//整理查看当前用户需求的公司,同一条需求对应多个
//		List<Record> trade_status = SupplyInfo.dao.getSupplyTradeStatus(user.getId());//获得环保信息状态的条数
//		Map<String,Integer> ts = getMapFromList(trade_status);
//		int totalNum = SupplyInfo.dao.getCountSupplys(user.getId());
//		List<Record> remarks = SupplyInfo.dao.getRemarks();//筛选条件
//		setAttr("cf", cf);
//		setAttr("re", re);
//		setAttr("ss", ss);
//		setAttr("ssMaps", ssMaps);
//		setAttr("remarks", remarks);
//		setAttr("totalNum",totalNum);
//		setAttr("ts", ts);//发布信息状态的条数
		
		Page<Record> cf = SupplyInfo.dao.getMySupplys_v2(1, 8, user.getId(), null, null, null);//发布的环保需求
		setAttr("cf", cf.getList());
		setAttr("cfTotalPage", cf.getTotalPage());
		
		Page<Record> ss = SupplyInfo.dao.getSeenSupplys_v2(1, 10, user.getId());//查看当前用户的环保需求的公司
		setAttr("ss", ss.getList());
		setAttr("ssTotalPage", ss.getTotalPage());
		
		render("../v2/userhomepage/homePage.jsp");
	}
	
	
	/**
	 *分页 获取推荐的需求ajax
	 */
	public void getRecommendByPage(){
		String pageNumber = getPara("pageNumber");
		int pn = Integer.parseInt(pageNumber);
		User user = UserUtils.getUser();
		Page<Record> rs = SupplyInfo.dao.getRecommendSupplys(pn, 10, user.getId());//系统推荐需求
		renderJson(JSONArray.fromObject(rs.getList()));
	}
	
	/**
	 *分页 获取看过的的需求ajax
	 */
	public void getHaveSeen(){
		String pageNumber = getPara("pageNumber");
		int pn = Integer.parseInt(pageNumber);
		User user = UserUtils.getUser();
		Page<Record> payHbfw = SupplyInfo.dao.getPaySupplys_v2(pn, 10, user.getId());// 已查看的环保需求
		renderJson(JSONArray.fromObject(payHbfw.getList()));
	}
	
	/**
	 *分页 获取看过的的需求ajax
	 */
	public void getMyReq(){
		String pageNumber = getPara("pageNumber");
		int pn = Integer.parseInt(pageNumber);
		User user = UserUtils.getUser();
		Page<Record> cf = SupplyInfo.dao.getMySupplys_v2(pn, 8, user.getId(), null, null, null);//发布的环保需求
		renderJson(JSONArray.fromObject(cf.getList()));
	}
    
	/**
	 * 分页 查看当前用户的环保需求的公司ajax
	 */
	public void getLookMe(){
		String pageNumber = getPara("pageNumber");
		int pn = Integer.parseInt(pageNumber);
		User user = UserUtils.getUser();
		Page<Record> ss = SupplyInfo.dao.getSeenSupplys_v2(pn, 10, user.getId());//查看当前用户的环保需求的公司
		renderJson(JSONArray.fromObject(ss.getList()));
	}
	
    /**
     * 推荐需求弹框
     */
	public void showRecommendReq(){
		String rid = getPara("rid");
		String sql = "SELECT c.id AS rid,"
				+ " DATE_FORMAT( c.create_date, '%Y-%m-%d %H:%i:%S' ) AS ctime,"
				+ " DATE_FORMAT( r.create_date, '%Y-%m-%d %H:%i:%S' ) AS rtime,"
				+ " DATE_FORMAT( r.push_overdue_date, '%Y-%m-%d %H:%i:%S' ) AS ptime,"
				+ " c. STATUS AS sta,c.create_date as cd, r.* FROM t_requirement_company c"
				+ " LEFT JOIN t_requirement r ON r.id = c.requirement_id"
				+ " WHERE c.del_flag = 0 AND c.id = ?";
		Record rr = Db.findFirst(sql,rid);
		if(rr == null){
			renderJson(JSONObject.fromObject(null));
			return;
		}
		Date pod = rr.getDate("cd");
		long odate = pod.getTime() + 1*24*60*60*1000;
		int sta = rr.getInt("sta");
		if(sta == 0 || sta == 1){
			if(odate < System.currentTimeMillis()){
				//过期了
				Db.update("UPDATE t_requirement_company SET status=4 WHERE id=?",rid);
				rr.set("sta", 4);
			}else{
				if(sta == 0){
					Db.update("UPDATE t_requirement_company SET status=1 WHERE id=?",rid);
				}
				rr.set("sta", 1);
			}
		}
		setAttr("rr", rr);
		render("../v2/userhomepage/homePage-recommendReq.jsp");
	}
	
	/**
	 * 接单或者拒绝
	 */
	public void acceptOrRefuse(){
		String rid = getPara("recommendId");
		String flag = getPara("flag");//接单或者拒绝标志，2接单，3拒绝
		String sql = "SELECT c.id AS rid,"
				+ " DATE_FORMAT( c.create_date, '%Y-%m-%d %H:%i:%S' ) AS ctime,"
				+ " DATE_FORMAT( r.create_date, '%Y-%m-%d %H:%i:%S' ) AS rtime,"
				+ " DATE_FORMAT( r.push_overdue_date, '%Y-%m-%d %H:%i:%S' ) AS ptime,"
				+ " c. STATUS AS sta,c.create_date as cd, r.* FROM t_requirement_company c"
				+ " LEFT JOIN t_requirement r ON r.id = c.requirement_id"
				+ " WHERE c.del_flag = 0 AND c.id = ?";
		Record rr = Db.findFirst(sql,rid);
		if(rr == null){
			renderText("该记录不存在，如有疑问请联系客服");
			return;
		}
		
		Date pod = rr.getDate("cd");
		long odate = pod.getTime() + 1*24*60*60*1000;
		int sta = rr.getInt("sta");
		int fflag = rr.getInt("finsh_flag");
		if(sta == 0 || sta == 1){
			if(fflag == 1 || odate < System.currentTimeMillis()){
				//过期了
				Db.update("UPDATE t_requirement_company SET status=4 WHERE id=?",rid);
				rr.set("sta", 4);
				renderText("已过期");
			}else{
				
				Db.update("UPDATE t_requirement_company SET status=? WHERE id=?",flag,rid);
				Db.update("UPDATE t_requirement SET finsh_flag=1 WHERE id=?",rr.get("id"));
				
				rr.set("sta", Integer.parseInt(flag));//修改推送记录的处理状态
				rr.set("finsh_flag", 2);//修改需求的接单标志
				renderText("ok");
				return;
			}
		}
		renderText("该单已被处理，如有疑问请联系客服");
	}
	
	/**
	 * 我看过的需求弹框
	 */
	public void showHaveSeenReq(){
		String rid = getPara("rid");
		User user = UserUtils.getUser();
		String rsql = "SELECT * FROM t_requirement WHERE id=? AND del_flag=0";
		Record rec = Db.findFirst(rsql,rid);
		if(rec.getLong("create_by") != null && rec.getLong("create_by").equals(user.getId())){
			//判断是否是自己发的需求
			setAttr("err",2);//是自己发的需求
			setAttr("rr",rec);
		}else{
			String sql = "SELECT * FROM sys_youyi_cost_record WHERE user_id=? AND hb_id=? AND del_flag=0";
			List<Record> cr = Db.find(sql,user.getId(),rid);
			if(cr.size() > 0){
				setAttr("err",0);//已支付
				setAttr("rr",rec);
			}else{
				setAttr("err",1);//未支付
			}
		}
		render("../v2/userhomepage/homePage-haveSeenReq.jsp");
		
	}
	
	/**
     * 修改环保需求状态
     */
    public void editReqStatus_v2(){
    	List<Record> rs = SupplyInfo.dao.getAllSupplysByStatus(null,null,"提交");//所有状态为提交的环保信息
    	List<Record> remarks = SupplyInfo.dao.getRemarks();//筛选条件
    	setAttr("rs", rs);
    	setAttr("remarks",remarks);
    	render("../v2/userhomepage/editReqStatus.jsp");
    }
	
}
