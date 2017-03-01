package com.qdum.llhb.addNeed.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.backmana.model.Quirement;
import com.qdum.llhb.sys.model.User;

@ControllerBind(controllerKey = "/addNeed")
public class AddNeedController extends Controller{

	public static Logger logger = Logger.getLogger(AddNeedController.class);
	/**
	 * 发布需求
	 */
	public void index(){
		List<Record> enprolist1 =  Db.find("SELECT * FROM sys_dict WHERE type='need_sc_type'"
				+ " AND del_flag=0 ORDER BY sort");
		List<Record> enprolist2 =  Db.find("SELECT * FROM sys_dict WHERE type='need_fw_type'"
				+ " AND del_flag=0 ORDER BY sort");
		List<Record> enprolist3 =  Db.find("SELECT * FROM sys_dict WHERE type='need_qt_type'"
				+ " AND del_flag=0 ORDER BY sort");
		setAttr("enprolist1",enprolist1);
		setAttr("enprolist2",enprolist2);
		setAttr("enprolist3",enprolist3);
		render("addNeed.jsp");
	}
	
	/**
	 * 保存需求
	 */
	public void saveNeed(){
		String companytype = getPara("companytype");//公司类型
		String enprotype = getPara("enprotype");//环保类型
		String desc = getPara("desc");//需求详细说明
		String address = getPara("address");//公司地址
		String name = getPara("name");//联系人名字
		
		String company = getPara("company");//公司名称
		String phone = getPara("phone");//联系人手机号
		String mapx = getPara("mapx");//地图x坐标
		String mapy = getPara("mapy");//地图y坐标
		String provincename = getPara("provincename");
		
		String cityname = getPara("cityname");
		String numev = StringUtils.isNotBlank(getPara("step3ComSum"))?getPara("step3ComSum"):"5";//接收几家公司响应
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String stime = sdf.format(date);//接收推荐开始日期
		long now = date.getTime();
		long et = now + getParaToLong("step3DaySum")*24*60*60*1000;
		String etime = sdf.format(new Date(et));//接收推荐结束日期
		
		Record rec = Db.findFirst("select * from need_enprotype where name = '" + enprotype + "'");
		String sgs_type = rec.getStr("sgs_type");
		
		Record pro = Db.findFirst("select * from sys_area where name = '" + provincename + "'");
		Record cit = Db.findFirst("select * from sys_area where name = '"+cityname+"'");
		long provinceid = 0;
		long cityid = 0;
		if(pro != null){
			provinceid = pro.getLong("id");
		}
		if(cit != null){
			cityid = cit.getLong("id");
		}
		
		Quirement qt = new Quirement();
		qt.set("company_type", companytype);
		qt.set("sgs_type", sgs_type);
		qt.set("requirement_describe", desc);
		qt.set("name", name);
		qt.set("phone", phone);
		
		qt.set("company_name", company);
		qt.set("company_address", address);
		qt.set("loc_x", mapx);
		qt.set("loc_y", mapy);
		qt.set("province_id", provinceid);
		
		qt.set("province_name", provincename);
		qt.set("city_id", cityid);
		qt.set("city_name", cityname);
		qt.set("recommend_no", numev);
		qt.set("reco_stime", stime);
		
		qt.set("reco_etime", etime);
		qt.set("create_date", sdf.format(new Date()));
		qt.set("remarks", enprotype);
		qt.set("source_flag", getPara("step3Type"));
		
		boolean b = qt.save();
		if(b){
			Record userRec = Db.findFirst("SELECT u.* FROM sys_user u LEFT JOIN sys_person p ON u.id = p.user_id"
					+ " WHERE ( login_name = ? OR p.phone = ? ) AND u.del_flag = 0"
					+ " AND u.on_state = 0",phone,phone);
			if(userRec != null){
				//用户已存在
				qt.set("create_by", userRec.get("id"));
				qt.update();
				renderText("ok");
			}else{
				//用户不存在，创建账号
				String nowtime = sdf.format(new Date());
				User user = new User();
				user.set("login_name", phone);
				user.set("create_date", nowtime);
				boolean ub = user.save();
				if(ub){
					//创建企业库
					Db.update("insert into sys_company (create_by, del_flag, user_id, create_date)"
							+ " values(1, 0, ?, ?)",user.getId(),nowtime);
					logger.info("===============创建企业库成功=================");
					
					//创建个人资料
					Db.update("insert into sys_person (create_by, del_flag, user_id, create_date,phone)"
							+ " values(1, 0, ?, ?,?)",user.getId(),nowtime,phone);
					logger.info("===============创建个人资料=================");
					
					//分配权限
					Db.update("insert into sys_user_role (user_id, role_id) values(?, 13)",user.getId());
					logger.info("===============分配权限=================");
					
					//创建店铺
					Db.update("insert into cs_settings_basic (template_id,user_id,create_by,create_date)" +
							"VALUES(?,?,?,?)",1,user.getId(),1,nowtime);
					logger.info("===============创建店铺=================");
					
					qt.set("create_by", user.getId());
					qt.update();
					
					renderText("ok");
				}else{
					renderText("fail");
				}
			}
		}else{
			renderText("fail");
		}
		
	}

}
