package com.qdum.llhb.qyk.controller;

import java.util.List;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.StringUtils;
import com.qdum.llhb.hyzl.model.CompanyZl;
import com.qdum.llhb.ypcd.model.Album;
import com.qdum.llhb.ypcd.model.Banner;
import com.qdum.llhb.ypcd.model.News;
@ControllerBind(controllerKey = "/Library/homeAlbum")
public class EnterpriseAlbumController extends Controller{

	/**
	 * 相册
	 */
	@ActionKey("/homepage/image")
	public void  enterpriseAlbum(){
		String enterpriseId =getPara();
        if(StringUtils.isBlank(enterpriseId)){
            enterpriseId = getPara("enterpriseId");
        }
		setAttr("enterpriseId", enterpriseId);
		List<Record> comp=News.dao.findId(enterpriseId);
			if(!(comp.isEmpty())){
				List<Record> list= Album.dao.enterpriseAlbum(comp.get(0).get("id").toString());
				if(!(list.isEmpty())){
					setAttr("album", list);
				List<Record> list3=News.dao.findPageNewsIDS(comp.get(0).get("id").toString());
				if(!(list3.isEmpty())){
					setAttr("nsList", list3);
				}
			}
		}
		List<Record> list2 =CompanyZl.dao.findCompanysSY(StringUtils.isNotBlank(enterpriseId)?Long.valueOf(enterpriseId):-1);
		if(!(list2.isEmpty())){
			setAttr("companyList", list2.get(0));
		}
		List<Record> hengF=Banner.dao.gethengF(enterpriseId,Banner.ALBUM_BANNER);
		if(!(hengF.isEmpty())){
			setAttr("hengF", hengF.get(0));
		}
		render("EnterpriseAlbum.jsp");
	}
}
