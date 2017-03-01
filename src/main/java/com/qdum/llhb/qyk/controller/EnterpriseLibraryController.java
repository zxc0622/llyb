package com.qdum.llhb.qyk.controller;

import java.util.List;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.admana.model.AdImages;
import com.qdum.llhb.backmana.model.SupplyHotQuery;
import com.qdum.llhb.common.utils.StringUtils;
import com.qdum.llhb.qyk.model.Library;
import com.qdum.llhb.sys.model.Area;

@ControllerBind(controllerKey = "/Library")
public class EnterpriseLibraryController extends Controller{
	/**
	 * V1版本 企业库 
	 */
	//@ActionKey("/EntLib")
	public void enterpriseLibraryInit(){
		String prov=getPara("prov");
        if(StringUtils.isBlank(prov)){
            prov = "0";
        }
		setAttr("provs", prov);
		String fenlei=getPara("fenlei");
        if(StringUtils.isBlank(fenlei)){
            fenlei = "环保服务";
        }
		setAttr("fenlei", fenlei);

		String enterprise =getPara("enterprise");

		setAttr("enterprise", enterprise);
		String descSj=getPara("descSj");
		String descRq=getPara("descRq");
		String descXy=getPara("descXy");
		String descXl=getPara("descXl");
		String flag =getPara("flag");
		setAttr("descSj", descSj);
		setAttr("descRq", descRq);
        String pageNum = getPara("pageNum");
        if(org.apache.commons.lang3.StringUtils.isBlank(pageNum)){
            pageNum = "1";
        }
		 Page<Record> list =Library.dao.searchEnterpriseLibrary(Integer.valueOf(pageNum),8,prov,fenlei,descSj,descRq,enterprise);
		 if(!(list.getList().isEmpty())){
			 setAttr("Library", list.getList());
			 setAttr("recordPage", list);
		 }
		List<Record> pro =  Area.dao.getChildList2("1");//省
		setAttr("pro", pro);
		List<Record> images= AdImages.dao.getHjImages();
		if(!(images.isEmpty())){
			setAttr("imagesList", images);
		}
		if(flag!=null&&!(flag.equals(""))){
			SupplyHotQuery shqList=SupplyHotQuery.dao.findWordHot("E", enterprise);
			if(shqList==null||shqList.equals("")){
				SupplyHotQuery shq= new SupplyHotQuery();
				shq.set("type","E");
				shq.set("query_count","1");
				shq.set("query_word",enterprise);
				shq.save();
			}else{
				SupplyHotQuery shq= new SupplyHotQuery();
				shq.set("id",shqList.get("id"));
				shq.set("type","E");
				shq.set("query_count",Long.valueOf(shqList.get("query_count").toString()) +1);
				shq.set("query_word",enterprise);
				shq.update();
			}
		}
		render("EnterpriseLibrary.jsp");
	}
	
	/**
	 * V2版本 企业库 
	 */
	@ActionKey("/EntLib")
	public void index(){
		String sql = "SELECT * FROM `sys_dict` where type='hbCompany_type' and del_flag=0";
		List<Record> types=Db.find(sql);//环保公司类型
		setAttr("types", types);
		List<Record> pro =  Area.dao.getChildList2("1");//省
		setAttr("pro", pro);
		String prov=getPara("prov");
		String type=getPara("type");
		int pageNumber=StringUtils.isBlank(getPara("pageNumber"))?1:getParaToInt("pageNumber");
		String enterprise=getPara("enterprise");
		Page<Record> companyList =Library.dao.searchEnterpriseLibrary(pageNumber,10,prov,type,enterprise);
		if(!(companyList.getList().isEmpty())){
			setAttr("companys", companyList.getList());
		}
		setAttr("pageNumber", companyList.getPageNumber());
		setAttr("totalPage", companyList.getTotalPage());
		setAttr("prov", prov);
		setAttr("type", type);
		
		render("../v2/enterpriseLibrary/enterprise.jsp");
	}
}
