package com.qdum.llhb.personal.controller;


import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.jfinal.plugin.activerecord.Record;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.qdum.llhb.common.utils.PageUtils;
import com.qdum.llhb.reg.model.Company;
import com.qdum.llhb.sys.model.Area;
import com.qdum.llhb.sys.model.Dict;
import com.qdum.llhb.sys.model.Person;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

/**
 * 用户资料
 * @author wf
 *
 */
@ControllerBind(controllerKey = "/perinfo")
public class PersonalController extends Controller {
	
	public void index(){
		User user = UserUtils.getUser();
		User u = User.dao.findByUsername(user.getLoginName());
		Record person =Person.dao.findXinxiRecord(user.getId());
		
		List<Area> provinceList = Area.dao.getChildList("0,1,");
		setAttr("provinceList", provinceList);
		setAttr("username", user.getLoginName());
		String proId = null;
		String cityId = null;
		List<Area> cityListOnly = null;
		try {
			proId = person.get("loc_prov_id");
			cityId = person.get("loc_city_id");
			String province = "0,1,"+proId+",";
			cityListOnly = Area.dao.getChildList(province);
		}catch(Exception e){
		}
        //当person.show_phone==null,设置为false,当为0是也是false,表示显示手机号码
        if(person.get("show_phone")==null){
            person.set("show_phone",false);
        }
		/**
		 * 企业
		 */
		setAttr("provinceId",proId);
	    setAttr("cityId",cityId);
	    setAttr("user", u);
		setAttr("person", person);
		setAttr("cityListOnly", cityListOnly);
		System.out.println(getSession().getAttribute("tip"));
        render("personalInfo.jsp");
			
	}
	/**
	 * 获取某省份的所有城市
	 */
	public void getCity(){
		String province = getPara("province");
		province  = "0,1,"+province+",";
		List<Area> cityList = Area.dao.getChildList(province);
		renderJson(cityList);
		
	}
	/**
	 * 保存信息
	 */
	public void saveInfo(){
		String sex=  getPara("sex");
		String email = getPara("email");
		String name= getPara("tname");
		String depart = getPara("depart");
		String zhiwu = getPara("zhiwu");
		String qqnum = getPara("qqnum");
		String province = getPara("province");
	    String city = getPara("city");
		String leibie = getPara("leibie");
		String sp = getPara("isShowPhone");
		Boolean showPhone = Boolean.valueOf(getPara("isShowPhone"));//是否显示手机号码
		if(leibie.equals("普通个人")){
			leibie = "个人";
		}else if(leibie.equals("环保工程师")){
			leibie = "工程师";
		}
		if(sex.equals("男")){
			sex="M";
		}else{
			sex = "F";
		}
		int type = Integer.parseInt(Dict.dao.getIdByName(leibie,"user_type").getValue());
		User user = UserUtils.getUser(); 
		Person person =Person.dao.findXinxi(user.getId());
		Company comp = Company.dao.findXinxi(user.getId());
		//String ff  =comp.get("type");
		user.set("login_name", getPara("username"));
		user.set("type", type);
		user.set("email", email);
		user.set("name", name);
		user.set("head_img",getPara("touxiang"));
		user.set("update_date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		user.update();

		//设置是否显示手机号码
		person.set("show_phone",showPhone?"0":"1");
		person.set("qq_num", qqnum);
		person.set("email", email);
		person.set("sex", sex);
		person.set("loc_prov_id", province);
		person.set("loc_city_id", city);
		person.set("dept", depart);
		person.set("pro_title", zhiwu);
		person.set("real_name", name);
		person.set("update_by", user.getId());
		person.set("update_date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		person.update();
		comp.set("email", email);
		comp.set("loc_prov_id", province);
		comp.set("loc_city_id", city);
		comp.set("update_by", user.getId());
		comp.set("update_date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		comp.update();
		renderText("ok");
	}
	/**
	 * @author zhaoyl
	 * @time 2015年11月26日15:39:49
	 * 认证服务jsp跳转 
	 * */
	public void authService(){
		render("AuthenticationService.jsp");
	}
	/**
	 * 修改手机号
	 */
	public void editphone(){
		User user = UserUtils.getUser(); 
		boolean flag = false;
		Person person =Person.dao.findXinxi(user.getId());
		if(person!=null){
			flag = person.set("phone", getPara("tel")).update();
		}
		renderJson(flag);
	}
	/**
	 * 个人资料校验用户名
	 */
	public void checkusername(){
		String msg = "";
		 User u = User.dao.findByUsername(getPara("name"));
		 if(u==null){
			 msg="ok";
		 }else{
			 msg="该用户名已经存在";
		 }
		renderText(msg);
	}
}
