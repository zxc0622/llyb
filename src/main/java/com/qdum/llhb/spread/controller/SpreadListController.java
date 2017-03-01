package com.qdum.llhb.spread.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.backmana.model.SupplyInfo;
import com.qdum.llhb.hyzl.model.CompanyZl;
import com.qdum.llhb.qiugou.model.Qiugou;
import com.qdum.llhb.spread.modle.QueryRankiing;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

@ControllerBind(controllerKey="/spread")
public class SpreadListController extends Controller {

	/**
	 * 推广关键词列表
	 */
	public void spreadList(){
		String pageSize = getPara("pageSize");
		if(null == pageSize || "".equals(pageSize)){
			pageSize = "8";
		}
		String leibie=getPara("leibie");
		String spreadName=getPara("spreadName");
		setAttr("leibie",leibie);
		setAttr("spreadName",spreadName);
		Page<Record> list =QueryRankiing.dao.findSpreadList(getParaToInt(0, 1),Integer.valueOf(pageSize),leibie,spreadName);
		if(!(list.getList().isEmpty())){
			setAttr("spreadList", list.getList());
			setAttr("recordPage", list);
		}
		render("PromotionKeyWords.jsp");
	}
	/**
	 * 新增推广关键词
	 */
	public void infoSpread(){
		String id =getPara("id");
		String allLb=getPara("allLb");
		String lbName=getPara("lbName");
		setAttr("allLb", allLb);
		setAttr("lbName", lbName);
		setAttr("id", id);
		String compName =getPara("compName");
		String spreadName=getPara("spreadName");
		String bid=getPara("bid");
		String startTime=getPara("startTime");
		String endTime=getPara("endTime");
		String xiangYid=getPara("xiangYid");
		String leibie=getPara("leibie");
		setAttr("compName", compName);
		setAttr("spreadName", spreadName);
		setAttr("startTime", startTime);
		setAttr("bid", bid);
		setAttr("endTime", endTime);
		setAttr("xiangYid", xiangYid);
		setAttr("leibie", leibie);
		if(id!=null&&!(id.equals(""))){
			List<Record> list =QueryRankiing.dao.findSpreadId(id,allLb);
			if(!(list.isEmpty())){
				setAttr("spread", list.get(0));
			}
		}
		
		if(allLb!=null&&!(allLb.equals("0"))){
			if(allLb.equals("E")){
				List<Record> list =CompanyZl.dao.findCompanyName(lbName);
				if(!(list.isEmpty())){
					setAttr("companyList", list);
				}
			}else if(allLb.equals("S")){
				List<Record> list =SupplyInfo.dao.searchGyName(lbName);
				if(!(list.isEmpty())){
					setAttr("gongyingList", list);
				}
			}else if(allLb.equals("D")){
				List<Record> list =Qiugou.dao.searchQgName(lbName);
				if(!(list.isEmpty())){
					setAttr("qiugouList", list);
				}
			}
			
			
		}
		render("infoSpread.jsp");
	}
	/**
	 * 保存关键词
	 */
	public void saveSpread(){
		String leibie =getPara("leibie");
		String spreadName =getPara("spreadName");
		String bid=getPara("bid");
		String startTime=getPara("startTime");
		String endTime=getPara("endTime");
		String xiangYid=getPara("xiangYid");
		String compName=getPara("compName");
		String id=getPara("id");
		List<Record> list =QueryRankiing.dao.findSpreadId(id,leibie);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		User user = UserUtils.getUser();
		if(!(list.isEmpty())){
			QueryRankiing queryRankiing =new QueryRankiing();
			queryRankiing.set("id", id);
			queryRankiing.set("rank_type", leibie);
			queryRankiing.set("name", spreadName);
			queryRankiing.set("bid", bid);
			queryRankiing.set("bid_id", xiangYid);
			queryRankiing.set("update_date", sdf.format(new Date()));
			queryRankiing.set("start_time", startTime);
			queryRankiing.set("end_time", endTime);
			queryRankiing.set("comp_name", compName);
			queryRankiing.update();
		}else{
			QueryRankiing queryRankiing =new QueryRankiing();
			queryRankiing.set("rank_type", leibie);
			queryRankiing.set("name", spreadName);
			queryRankiing.set("bid", bid);
			queryRankiing.set("bid_id", xiangYid);
			queryRankiing.set("create_date", sdf.format(new Date()));
			queryRankiing.set("create_by",user.getId());
			queryRankiing.set("start_time", startTime);
			queryRankiing.set("end_time", endTime);
			queryRankiing.set("comp_name", compName);
			queryRankiing.save();
		}
		redirect("/spread/spreadList");
	}
	/**
	 * 单条删除常见问题
	 */
	public void delSpread(){
		String id =getPara("id");
		String flag="";
		try {
			QueryRankiing queryRankiing=new QueryRankiing();
			queryRankiing.set("id", id);
			queryRankiing.set("del_flag", "1");
			queryRankiing.update();
			flag="0";
		} catch (Exception e) {
			flag="1";
		}
		renderJson(flag);
	}
}
