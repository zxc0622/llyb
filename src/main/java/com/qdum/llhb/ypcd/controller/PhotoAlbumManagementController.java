package com.qdum.llhb.ypcd.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.hyzl.model.DictPcr;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ypcd.model.Album;
import com.qdum.llhb.ypcd.model.AlbumImages;
import com.qdum.llhb.ypcd.model.Basic;
@ControllerBind(controllerKey = "/ypcd/album")
@Before(AdminInterceptor.class)
public class PhotoAlbumManagementController extends Controller{
	/**
	 * 添加相册初始化
	 */
	public void albumManagementInit(){
		List<Record> list = DictPcr.dao.findAllList("album_type");
		setAttr("albumFl", list);
		String id=getPara("itemid");
		setAttr("itemid",id);
		User user = UserUtils.getUser();
		List<Record> list3 =Basic.dao.findBasicId(user.getId());
		if(!(list3.isEmpty())){
			setAttr("shop",list3.get(0).get("id"));
			if(id!=null&&!("".equals(id))){
				List<Record> list2=Album.dao.searchAlbum(id,list3.get(0).get("id").toString());
				if(!(list2.isEmpty())){
					setAttr("albumList", list2.get(0));
				}
			}
		}
		
		render("PhotoAlbumManagementAdd.jsp");
	}
	/**
	 * 保存修改
	 */
	public void saveAlbum(){
		String id =getPara("id");
		String categoryId =getPara("categoryId");
		String imgName =getPara("imgName");
		String coverImg =getPara("coverImg");
		String hostDesc =getPara("hostDesc");
		String shopId=getPara("shopId");
		String pubLev=getPara("pubLev");
		User user = UserUtils.getUser();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if("".equals(id)||id==null){
			Album album = new Album();
			album.set("category_id", categoryId);
			album.set("name", imgName);
			album.set("shop_id", shopId);
			album.set("cover_img", coverImg);
			album.set("host_desc", hostDesc);
			album.set("sta","1");
			album.set("del_flag","0");
			album.set("create_by",user.getId());
			album.set("create_date", sdf.format(new Date()));
			if(pubLev.equals("开放")){
				pubLev="1";
			}else if(pubLev.equals("密码验证")){
				pubLev="2";
			}else if(pubLev.equals("问题验证")){
				pubLev="3";
			}
			album.set("pub_lev",pubLev);
			album.save();
		}else{
			Album album = new Album();
			album.set("id", id);
			album.set("name", imgName);
			album.set("cover_img", coverImg);
			album.set("sta", "1");
			album.set("host_desc", hostDesc);
			if(pubLev.equals("开放")){
				pubLev="1";
			}else if(pubLev.equals("密码验证")){
				pubLev="2";
			}else{
				pubLev="3";
			}
			album.set("pub_lev",pubLev);
			album.set("update_date", sdf.format(new Date()));
			album.update();
		}
		redirect("/ypcd/album/albumReviewInit?status=1");
	}
	/**
	 * 相册展示页面初始化
	 */
	public void albumReviewInit(){
		 User user = UserUtils.getUser();
		 List<Record> list1 = DictPcr.dao.findAllList("album_type");
		 setAttr("albumFl", list1);
		 String status =getPara("status");
		 String title=getPara("title");
		 String cateId=getPara("cateId");
		 setAttr("title", title);
		 setAttr("status", status);
		 setAttr("cateId", cateId);
		 List<Record> list3 =Basic.dao.findBasicId(user.getId());
		 if(!(list3.isEmpty())){
			 Page<Record> list =Album.dao.searchAlbumReview(getParaToInt(0, 1),8,title,status,cateId,Long.valueOf(list3.get(0).get("id").toString()));
			 if(!(list.getList().isEmpty())){
					setAttr("reviewList",list.getList());
					setAttr("recordPage", list);
			 }
		 }
		
		 render("AlbumReview.jsp");
	}
	/**
	 * 单挑删除
	 */
	public void delAlbum(){
		String id =getPara("id");
		String flag="";
		try {
			Album album=new Album();
			album.set("id", id);
			album.set("del_flag", "1");
			album.update();
			flag="0";
		} catch (Exception e) {
			flag="1";
		}
	
		renderJson(flag);
	}
	/**
	 * 批量删相册
	 */
	public void deleteAlbum(){
		String[] choose=getParaValues("choose");
		String status =getPara("statusV");
		if(choose!=null&&choose.length!=0){
			for (int i = 0; i < choose.length; i++) {
				Album album=new Album();
				album.set("id", choose[i]);
				album.set("del_flag", "1");
				album.update();
			}
		}
		redirect("/ypcd/album/albumReviewInit?status="+status+"");
	}
	/**
	 * 管理图片初始化页面
	 */
	public void manaangementImageInit(){
		String id=getPara("itemid");
		String status=getPara("status");
		setAttr("status", status);
		String ss=getSessionAttr("hostId");
		if(id==null||id.equals("")){
			id=ss;
		}
		List<Record> list = AlbumImages.dao.searchImages(id);
		if(!(list.isEmpty())){
			setAttr("imgList", list);
		}
		List<Record> list1 =Album.dao.searchImageName(id);
		if(!(list1.isEmpty())){
			setAttr("imgName", list1.get(0));
		}
		setAttr("itemid", id);
		render("ManagementImage.jsp");
	}
	/**
	 * 保存图片
	 */
	public void saveImg(){
		String hostId=getPara("hostId");
		String imgSrc=getPara("imgSrc");
		String imgID[]=getParaValues("imgID");
		String picSrc[]=getParaValues("picSrc");
		setSessionAttr("hostId", hostId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(imgID!=null&&!(imgID.equals(""))){
			for (int i = 0; i < imgID.length; i++) {
				AlbumImages albumImages = new AlbumImages();
				albumImages.set("id", imgID[i]);
				if(picSrc[i]!=null||!(picSrc[i].equals(""))){
					albumImages.set("image", picSrc[i]);	
				}
				albumImages.set("update_date", sdf.format(new Date()));
				albumImages.update();
			}
		}
		if(imgSrc!=null&&!(imgSrc.equals(""))){
			AlbumImages albumImages = new AlbumImages();
			albumImages.set("host_id", hostId);
			albumImages.set("image", imgSrc);
			albumImages.set("create_date", sdf.format(new Date()));
			albumImages.save();
		}
		redirect("/ypcd/album/manaangementImageInit");
	}
	/**
	 * 删除
	 */
	public void delImg(){
		String id =getPara("id");
		String flag="";
		try {
			AlbumImages albumImages = new AlbumImages();
			albumImages.set("id", id);
			albumImages.set("del_flag", "1");
			albumImages.update();
			flag="0";
		} catch (Exception e) {
			flag="1";
		}
		renderJson(flag);
	}
}
