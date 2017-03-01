package com.qdum.llhb.salesmancode.controller;

import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.salesmancode.model.SalesmanCode;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ws.vo.AjaxBean;

/**
 * 业务员编码管理Controller
 * @author zhaoyl
 * @time 2016年1月8日10:07:11
 * */
@ControllerBind(controllerKey="/salesmancode")
public class SalesmanCodeController extends Controller {
	public void index(){
		String name = getPara("name");
		setAttr("name",name);
		String href = getPara("href");
		setAttr("href",href);
		int pageSize = 8;//默认每页条数
		String pageSizeStr = getPara("pageSize");
		if(pageSizeStr != null && !"".equals(pageSizeStr)){
			pageSize = Integer.parseInt(pageSizeStr);
		}
		String searchName = getPara("searchName");
		setAttr("searchName",searchName);
		if(searchName == null){
			searchName = "";
		}
		Page<Record> saleCodePage = SalesmanCode.dao.getSaleCodePage(getParaToInt(0,1), pageSize, searchName);
		if(saleCodePage != null){
			setAttr("saleCodeList",saleCodePage.getList());
			setAttr("recordPage", saleCodePage);
		}
		render("codeManage.jsp");
	}
	public void getCode(){
		String name = getPara("name");
		boolean nameIsRepeat = nameIsRepeat(name);
		AjaxBean bean = new AjaxBean();
		if(!nameIsRepeat){
			String code = "";
			boolean isRepeat = true;
			while(isRepeat){
				code = generateShortUuid();
				isRepeat = isRepeat(name,code);
			}
			SalesmanCode sc = new SalesmanCode();
			sc.set("name", name);
			sc.set("code", code);
			HttpServletRequest request = getRequest();
			String href = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/reg?serviceCode="+code;
			sc.set("href", href);
			sc.set("create_by", UserUtils.getUser().getId());
			sc.set("create_date", new Date());
			boolean isSave = sc.save();
			if(isSave){
				bean.setIsSuccess(true);
				bean.setMsg("生成成功");
				bean.setObj(SalesmanCode.dao.getSalesCodeByName(name));
				renderJson(bean);
			}else{
				bean.setIsSuccess(false);
				bean.setMsg("生成失败，请重新生成");
				renderJson(bean);
			}
		}else{
			bean.setIsSuccess(false);
			bean.setMsg("此人已存在");
			renderJson(bean);
		}
	}
	/**
	 * 姓名或重复性验证
	 * */
	public boolean nameIsRepeat(String name){
		Record record = SalesmanCode.dao.getSalesCodeByName(name);
        return record != null;
	}
	/**
	 * 姓名或编码重复性验证
	 * @return boolean  true -- 重复, false -- 没有重复
	 * */
	public boolean isRepeat(String name, String code){
		Record record = SalesmanCode.dao.getSalesCode(name, code);
        return record != null;
	}
	/**
	 * 编码库
	 * */
	public static String[] chars = new String[]{"a", "b", "c", "d", "e", "f",
        "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s",
        "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5",
        "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I",
        "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",
        "W", "X", "Y", "Z"};
	/**
	 * 生成编码
	 * */
	public static String generateShortUuid() {
	    StringBuffer shortBuffer = new StringBuffer();
	    String uuid = UUID.randomUUID().toString().replace("-", "");
	    for (int i = 0; i < 8; i++) {
	        String str = uuid.substring(i * 4, i * 4 + 4);
	        int x = Integer.parseInt(str, 16);
	        shortBuffer.append(chars[x % 0x3E]);
	    }
	    return shortBuffer.toString();
	}
	/**
	 * 删除记录
	 * */
	/*public void delete(){
		String id = getPara("id");
		boolean isUpdate = SalesmanCode.dao.findById(id).set("del_flag", 1).update();
		if(isUpdate){
			redirect("/salesmancode/index");
		}
	}*/
}
