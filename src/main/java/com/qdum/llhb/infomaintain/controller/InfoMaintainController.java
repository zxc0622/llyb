package com.qdum.llhb.infomaintain.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.StringUtils;
import com.qdum.llhb.common.utils.UploadFileUtils;
import com.qdum.llhb.infomaintain.model.InfoMaintAttachment;
import com.qdum.llhb.infomaintain.model.InfoMaintain;
import com.qdum.llhb.memService.model.ChatRecord;
import com.qdum.llhb.sys.model.Dict;
import com.qdum.llhb.sys.utils.UserUtils;

@ControllerBind(controllerKey="/infomaintain")
@Before(AdminInterceptor.class)
public class InfoMaintainController extends Controller {
	
	//public static final int PAGE_SIZE = 8;
	public void index(){
		/*int pageNum = 1;
		String pageNumString = getPara("pageNum");
		if(pageNumString!=null && !pageNumString.equals("")){
			pageNum = Integer.parseInt(pageNumString);
		}*/
		int pageSize = 8;//默认每页条数
		String pageSizeStr = getPara("pageSize");
		setAttr("pageSize",pageSizeStr);
		if(pageSizeStr!=null && !"".equals(pageSizeStr) && pageSizeStr.matches("[0-9]+")){
			pageSize = Integer.parseInt(pageSizeStr);
		}
		List<Dict> dictList = Dict.dao.getDictsByType("new_type");
		setAttr("dictList",dictList);
		String type = getPara("type");
		setAttr("type",type);
		String title = getPara("title");
		setAttr("title",title);
		Page<Record> infoPage = InfoMaintain.dao.getInfoPage(getParaToInt(0,1),pageSize,type,title);
		if(infoPage!=null){
			setAttr("infoList",infoPage.getList());
			setAttr("recordPage",infoPage);
		} 
		render("infoManage.jsp");
	}
	public void add(){
		final String type = "new_type";//资讯所属类别
		List<Dict> dictList = Dict.dao.getDictsByType(type);
		setAttr("dictList",dictList);
		String id = getPara("id");
		if(id!=null && !id.equals("") && id.matches("[0-9]+")){
			Record info = InfoMaintain.dao.getById(id);
			info.set("new_content", info.get("new_content").toString().replaceAll("\r\n", ""));
			setAttr("info",info);
			//获取附件列表
			List<Record> infoAttachList = InfoMaintAttachment.dao.getAttachmentById(id);
			setAttr("infoAttachList",infoAttachList);
		}
		render("infoAdd.jsp");
	}
	/*提交*/
	public void submit(){
		String type = getPara("type");
		String title = getPara("title");
		String source = getPara("source");
		String smallImg = getPara("smallImg");
		String content = getPara("content");
		String bigImg = getPara("bigImg");
		String sta = getPara("sta");
		String id = getPara("id");
		String showOrder = getPara("showOrder");
        String pageDesc = getPara("pageDesc");
        String seoKeyWords = getPara("seoKeyWords");
		String[] fileNames = getParaValues("fileName");
		String[] filePaths = getParaValues("filePath");
		InfoMaintain info = new InfoMaintain();
		if(id!=null && !id.equals("") && id.matches("[0-9]+")){
			info = InfoMaintain.dao.findById(id);
		}
		if(!type.equals("ep_show")){//其他类别添加的元素
			String isTop = getPara("isTop");
			if(isTop == null || "".equals(isTop)){
				isTop = "0";
			}
			String isPic = getPara("isPic");
			if(isPic==null || "".equals(isPic)){
				isPic = "0";
			}
            String isYouyi = getPara("isYouyi");
			info.set("isTop", isTop);
			info.set("isPic", isPic);/*
            info.set("isYouyi",isYouyi);*/
			
		}else{//展会信息类别，添加的元素
			String holdPlace = getPara("holdPlace");
			String holdTime = getPara("holdTime");
			String isNewShow = getPara("isNewShow");
			if(isNewShow == null || "".equals(isNewShow)){
				isNewShow = "0";
			}
			info.set("isNewShow",isNewShow);
			info.set("hold_place",holdPlace);
			info.set("hold_time", holdTime);
		}
		info.set("new_type", type);
		info.set("new_title", title);
		info.set("source", source);
		info.set("small_img", smallImg);
		info.set("new_content", content);
		info.set("big_img", bigImg);
		info.set("sta", sta);
        info.set("seo_key_words",seoKeyWords);
        info.set("page_desc",pageDesc);
		if(showOrder!=null && !"".equals(showOrder)){
			info.set("show_order", showOrder);
		}
		if(id!=null && !id.equals("") && id.matches("[0-9]+")){//更新
			info.set("update_by", UserUtils.getUser().getId());
			info.set("update_date", new Date());
			info.update();
			InfoMaintAttachment.dao.delAttch(id);//删除原有附件
			if(filePaths!=null){
				for(int i=0; i<filePaths.length; i++) {
					InfoMaintAttachment infoAttach = new InfoMaintAttachment();
					infoAttach.set("new_id", Long.parseLong(id));
					infoAttach.set("atta_name", fileNames[i]);
					infoAttach.set("atta_addr", filePaths[i]);
					infoAttach.set("create_by", UserUtils.getUser().getId());
					infoAttach.set("create_date", new Date());
					infoAttach.save();
				}
			}
		}else{//添加
			info.set("create_by", UserUtils.getUser().getId());
			info.set("create_date", new Date());
			info.save();
			long infoId = info.getLong("id");
			if(filePaths!=null){
				for(int i=0; i<filePaths.length; i++) {
					InfoMaintAttachment infoAttach = new InfoMaintAttachment();
					infoAttach.set("new_id", infoId);
					infoAttach.set("atta_name", fileNames[i]);
					infoAttach.set("atta_addr", filePaths[i]);
					infoAttach.set("create_by", UserUtils.getUser().getId());
					infoAttach.set("create_date", new Date());
					infoAttach.save();
				}
			}
		}
		redirect("/infomaintain");
	}
	public void preview(){
		setAttr("id",getPara("id"));
		setAttr("type",getPara("type"));
		setAttr("title",getPara("title"));
		setAttr("source",getPara("source"));
		setAttr("smallImg",getPara("smallImg"));
		setAttr("content",getPara("content"));
		setAttr("bigImg",getPara("bigImg"));
		setAttr("isTop",getPara("isTop"));
		setAttr("isPic",getPara("isPic"));
        setAttr("isYouyi",getPara("isYouyi"));
		setAttr("holdPlace",getPara("holdPlace"));
		setAttr("holdTime",getPara("holdTime"));
		setAttr("isNewShow",getPara("isNewShow"));
		setAttr("showOrder",getPara("showOrder"));
        setAttr("pageDesc",getPara("pageDesc"));
        setAttr("seoKeyWords",getPara("seoKeyWords"));
		setAttr("date",new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		setAttr("attachList",mapList(getParaValues("fileName"),getParaValues("filePath")));
		render("infoPreview.jsp");
	}
	/**
	 * 附件包装类
	 * 将名字和路径组合成列表
	 * */
	public List<Map<String,Object>> mapList(String[] fileNames,String[] filePaths ){
		List<Map<String,Object>> list = Lists.newArrayList();
		if(filePaths!=null){
			for(int i=0; i<filePaths.length; i++){
				Map<String,Object> map = Maps.newHashMap();
				map.put("atta_name", fileNames[i]);
				map.put("atta_addr", filePaths[i]);
				list.add(map);
			}
		}
		return list;
	}
	/*删除选择的项*/
	public void delete(){
		String temp = getPara("ids");
		temp = temp.substring(0,temp.length()-1);
		String[] ids = temp.split(",");
		boolean isDelete = false;
		if(ids!=null && ids.length>0){
			isDelete = InfoMaintain.dao.isDelete(ids,UserUtils.getUser().getId());
		}
		if(isDelete){
			renderJson(true);
		}else{
			renderJson(false);
		}
	}
	/**
	 * 资讯-添加附件
	 * */
	public void addAttachment(){
		long attachment_file = 0;
        try {
            attachment_file = getFile("attachment_file").getFile().length();
            if(attachment_file>1024*1024*10){
                renderJson(false);
            }else{
                UploadFileUtils uploadFileImg	=new  UploadFileUtils();
                String filePath =getRequest().getScheme()+"://"+getRequest().getServerName()+":"+getRequest().getServerPort()+getRequest().getContextPath()+"/hyzl/findImgResourcesURL?str="+uploadFileImg.UploadFileMain(getFile("attachment_file"),null);
                renderText(filePath);
            }
        } catch (Exception e) {
            renderJson(false);
        }
	}
	/**
	 * 置顶操作
	 * */
	public void showTop(){
		String id = getPara("id");
		InfoMaintain info = InfoMaintain.dao.findById(id);
		info.set("show_order", 1);
		info.set("update_by", UserUtils.getUser().getId());
		info.set("update_date", new Date());
		boolean isUpdate = info.update();
		if(isUpdate){
			renderJson(true);
		}else{
			renderJson(false);
		}
	}
	
	
}
