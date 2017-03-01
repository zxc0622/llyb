package com.qdum.llhb.quotation.controller;


import java.util.List;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.admana.model.AdImages;
import com.qdum.llhb.infomaintain.model.InfoMaintAttachment;
import com.qdum.llhb.infomaintain.model.InfoMaintain;
import com.qdum.llhb.quotation.model.Quotation;
import com.qdum.llhb.sys.model.Dict;

@ControllerBind(controllerKey="/quoindex")
public class QuotationIndexController extends Controller {
	public static final String TYPE = "quotations_type";
	public static final int pageSize = 10;
	private static final String DEF_INFO_TYPE = "daily_quo";//默认显示类型
	private static final long MID_AD_LABEL_ID = 36;//中间横幅广告
	private static final long BUSSINESS_AD_LABEL_ID = 37;//中间横幅广告
	
	public void index(){
		String type = getPara("type");
		if(type==null || type.equals("")){
			type = DEF_INFO_TYPE;
		}
		setAttr("type",type);
		int pageNumber = 1;
		String temp = getPara("pageNumber");
		if(temp!=null && !temp.equals("") && temp.matches("[0-9]+")){
			pageNumber = Integer.parseInt(temp);
		}
		Page<Record> quoPage = Quotation.dao.getPageByType(pageNumber, pageSize, type, "");
		if(quoPage != null ){
			setAttr("quoList",quoPage.getList());
			setAttr("recordPage",quoPage);
		}
		List<AdImages> mediuAdImgList = AdImages.dao.getImgListByLabelID(MID_AD_LABEL_ID);
		setAttr("mediuAdImgList",mediuAdImgList);
		List<AdImages> companyAdList = AdImages.dao.getImgListByLabelID(BUSSINESS_AD_LABEL_ID);
		setAttr("companyAdList",companyAdList);
		render("quoIndex.jsp");
	}
	/**
	 * 搜索结果
	 * */
	public void search(){
		String title = getPara("title");
		setAttr("title",title);
		int pageNumber = 1;
		String temp = getPara("pageNumber");
		if(temp!=null && !temp.equals("") && temp.matches("[0-9]+")){
			pageNumber = Integer.parseInt(temp);
		}
		Page<Record> quoPage = Quotation.dao.getPageByType(pageNumber, pageSize, "", title);
		if(quoPage != null ){
			setAttr("quoList",quoPage.getList());
			setAttr("recordPage",quoPage);
		}
		List<AdImages> mediuAdImgList = AdImages.dao.getImgListByLabelID(MID_AD_LABEL_ID);
		setAttr("mediuAdImgList",mediuAdImgList);
		List<AdImages> companyAdList = AdImages.dao.getImgListByLabelID(BUSSINESS_AD_LABEL_ID);
		setAttr("companyAdList",companyAdList);
		render("searchResult.jsp");
	}
	/**
	 * 行情详情
	 * */
	public void detail(){
		String id = getPara("id");
		String type = getPara("type");
		setAttr("type",type);
		if(id!=null && !id.equals("") && id.matches("[0-9]+")){
			List<Record> infoList = Quotation.dao.getListByType(type);
			if(infoList!=null){
				/*取出本条信息、上一篇和下一篇*/
				for(int i=0; i<infoList.size(); i++){
					String temp =infoList.get(i).get("id").toString(); 
					if(id.equals(temp)){
						if(i!=0){
							setAttr("prevInfo",infoList.get(i-1));
						}
						setAttr("info",infoList.get(i));
						if(i!=infoList.size()-1){
							setAttr("nextInfo",infoList.get(i+1));
						}
					}
				}
			}
			List<Dict> dictList = Dict.dao.getDictsByType(TYPE);
			setAttr("dictList",dictList);
			render("quoDetail.jsp");
		}else{
			render("/WEB-INF/views/error/404.jsp");
		}
	}
}
