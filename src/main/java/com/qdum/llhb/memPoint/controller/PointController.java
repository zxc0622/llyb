package com.qdum.llhb.memPoint.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.memPoint.model.ItemPoint;
import com.qdum.llhb.memPoint.model.PointChangeDetail;
import com.qdum.llhb.memPoint.model.PointMain;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;


import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


/**
 * @author zhaoyl
 * @time 2016年1月12日14:17:52
 * */
//@ControllerBind(controllerKey="/getPoint")
public class PointController extends Controller {
	/**
	 * 日常登录添加积分
	 * @return boolean
	 * */
	public boolean dailyLoginPoint(){
		User user = UserUtils.getUser();
		if(user == null){
			return false;
		}
		long userId = user.getId();
		List<Record> loginList = PointChangeDetail.dao.getLoginUserLogo(userId,"daily_login");//获取今日登陆日志
		if(loginList.isEmpty()){//判断今日已经是否登陆
			Record daily = ItemPoint.dao.getPoint("daily_login");
			PointMain userPoint = PointMain.dao.getUserPoint(userId);
			BigDecimal dailyPointBD= daily.get("points");//每日登录积分
			Double dailyPoint = dailyPointBD.doubleValue();
			double pointCount = 0.0;
			//向积分主表写入数量主表
			if(userPoint == null){
				pointCount = dailyPoint;
				userPoint = new PointMain();
				userPoint.set("user_id", userId);
				userPoint.set("point_num", pointCount);
				userPoint.set("create_by", userId);
				userPoint.set("create_date", new Date());
				userPoint.save();
			}else{
				BigDecimal dbTemp = userPoint.get("point_num");
				pointCount = dbTemp.doubleValue() + dailyPoint;
				userPoint.set("point_num", BigDecimal.valueOf(pointCount));
				userPoint.set("update_by", userId);
				userPoint.set("update_date", new Date());
				userPoint.update();
			}
			//写入积分变换细则表
			PointChangeDetail pcd = new PointChangeDetail();
			pcd.set("item_type", "daily_login");
			pcd.set("login_user", userId);
			pcd.set("points", BigDecimal.valueOf(dailyPoint));
			pcd.set("remain_points", BigDecimal.valueOf(pointCount));
			pcd.set("create_by", userId);
			pcd.set("create_date", new Date());
			return(pcd.save());
			
		}else{
			return false;
		}
	}
	/**
	 * 注册完成并填写完全资料
	 * @param userType -- 个人：person  公司：company
	 * @param userId -- 完成注册用户的id
	 * @return boolean
	 * */
	
	public boolean regUserPoint(String userType, Long userId){
		if(userId == null){
			return false;
		}
		if("company".equals(userType)){
			userType = "company_info";
		}else if("person".equals(userType)){
			userType = "person_info";
		}else{
			return false;
		}
		List<Record> list = PointChangeDetail.dao.getRegUserLogo(userId,userType);//获取注册并填写资料完成记录
		if(list.isEmpty()){
			Record daily = ItemPoint.dao.getPoint(userType);
			PointMain userPoint = PointMain.dao.getUserPoint(userId);
			if(userPoint == null){
				userPoint = new PointMain();
				userPoint.set("user_id", userId);
				userPoint.set("point_num", 0);
				userPoint.set("create_by", userId);
				userPoint.set("create_date", new Date());
				userPoint.save();
			}
			BigDecimal dailyPointBD= new BigDecimal(daily.get("points").toString());//获取注册并完成资料的积分
			BigDecimal dbTemp = new BigDecimal(userPoint.get("point_num").toString());//获取用户已有积分
			userPoint.set("point_num", BigDecimal.valueOf(dbTemp.doubleValue() + dailyPointBD.doubleValue()));
			userPoint.set("update_by", userId);
			userPoint.set("update_date", new Date());
			userPoint.update();
			//写入积分变换细则表
			PointChangeDetail pcd = new PointChangeDetail();
			pcd.set("item_type", userType);
			pcd.set("reg_user", userId);
			pcd.set("points", BigDecimal.valueOf(dailyPointBD.doubleValue()));//当前得到的积分
			pcd.set("remain_points", BigDecimal.valueOf(dbTemp.doubleValue() + dailyPointBD.doubleValue()));//当前得到的总积分
			pcd.set("create_by", userId);
			pcd.set("create_date", new Date());
			return(pcd.save());
		}else{
			return false;
		}
	}
	/**
	 * 邀请个人、产废、环保企业注册    userType 的值必须为  person、pw或ep否者能添加成功
	 * @param userType -- 个人：person  产废企业：pw  环保企业：ep
	 * @param inviteUserId  --被邀请人的用户id
	 * @param inviteByUserId  --邀请人的用户id
	 * return boolean
	 * */
	
	public boolean invite(String userType,long inviteUserId,long inviteByUserId){
		if("person".equals(userType)){
			userType = "invite_person";
		}else if("pw".equals(userType)){
			userType = "invite_pw";
		}else if("ep".equals(userType)){
			userType = "invite_ep";
		}else{
			return false;
		}
		Record daily = ItemPoint.dao.getPoint(userType);
		BigDecimal dailyPointBD= daily.get("points");//获取注册并完成资料的积分
		PointMain userPoint = PointMain.dao.getUserPoint(inviteByUserId);
		BigDecimal dbTemp = userPoint.get("point_num");//获取用户已有积分
		userPoint.set("point_num", BigDecimal.valueOf(dbTemp.doubleValue() + dailyPointBD.doubleValue()));
		userPoint.set("update_by", inviteUserId);
		userPoint.set("update_date", new Date());
		userPoint.update();
		//写入积分变换细则表
		PointChangeDetail pcd = new PointChangeDetail();
		pcd.set("item_type", userType);
		pcd.set("invite_user", inviteUserId);
		pcd.set("invite_by_user", inviteByUserId);
		pcd.set("points", BigDecimal.valueOf(dailyPointBD.doubleValue()));//当前得到的积分
		pcd.set("remain_points", BigDecimal.valueOf(dbTemp.doubleValue() + dailyPointBD.doubleValue()));//当前得到的总积分
		pcd.set("create_by", inviteByUserId);
		pcd.set("create_date", new Date());
		return(pcd.save());
	}
	/**
	 * 预约看场
	 * */
	public void orderSee(){
		
	}
	/**
	 * 评价环保公司
	 * @param serviceId 该危废服务id
	 * @return boolean
	 * */
	public boolean evelEPService(long serviceId){
		User user = UserUtils.getUser();
		if(user == null){
			return false;
		}
		long userId = user.getId();
		Record daily = ItemPoint.dao.getPoint("eval_ep");
		BigDecimal dailyPointBD= new BigDecimal(daily.get("points").toString());//获取注册并完成资料的积分
		PointMain userPoint = PointMain.dao.getUserPoint(userId);
		BigDecimal dbTemp = userPoint.get("point_num");//获取用户已有积分
		userPoint.set("point_num", BigDecimal.valueOf(dbTemp.doubleValue() + dailyPointBD.doubleValue()));
		userPoint.set("update_by", userId);
		userPoint.set("update_date", new Date());
		userPoint.update();
		//写入积分变换细则表
		PointChangeDetail pcd = new PointChangeDetail();
		pcd.set("item_type", "eval_ep");
		pcd.set("eval_ep_service", serviceId);
		pcd.set("points", BigDecimal.valueOf(dailyPointBD.doubleValue()));//当前得到的积分
		pcd.set("remain_points", BigDecimal.valueOf(dbTemp.doubleValue() + dailyPointBD.doubleValue()));//当前得到的总积分
		pcd.set("create_by", userId);
		pcd.set("create_date", new Date());
		return(pcd.save());
	}
	/**
	 * 发布供应、求购、商品获取积分      type必须为一下类型，否则无法添加成功
	 * @param type 供应：supply  求购：demand  商品：product 
	 * @param id 为要添加产品的id
	 * */
	public boolean publish(String type, long id, Long userId){
		if(userId == null){
			return false;
		}
		if("supply".equals(type)){
			type = "publish_supply";
		}else if("demand".equals(type)){
			type = "publish_demand";
		}else if("product".equals(type)){
			type = "publish_product";
		}else{
			return false;
		}
		Record daily = ItemPoint.dao.getPoint("publish_info");
		BigDecimal dailyPointBD= daily.get("points");//获取注册并完成资料的积分
		PointMain userPoint = PointMain.dao.getUserPoint(userId);
		if(userPoint == null){
			userPoint = new PointMain();
			userPoint.set("user_id", userId);
			userPoint.set("point_num", 0);
			userPoint.set("create_by", userId);
			userPoint.set("create_date", new Date());
			userPoint.save();
		}
		BigDecimal dbTemp =  new BigDecimal( userPoint.get("point_num").toString() );//获取用户已有积分
		userPoint.set("point_num", BigDecimal.valueOf(dbTemp.doubleValue() + dailyPointBD.doubleValue()));
		userPoint.set("update_by", userId);
		userPoint.set("update_date", new Date());
		userPoint.update();
		//写入积分变换细则表
		PointChangeDetail pcd = new PointChangeDetail();
		pcd.set("item_type", "publish_info");
		pcd.set(type, id);
		pcd.set("points", BigDecimal.valueOf(dailyPointBD.doubleValue()));//当前得到的积分
		pcd.set("remain_points", BigDecimal.valueOf(dbTemp.doubleValue() + dailyPointBD.doubleValue()));//当前得到的总积分
		pcd.set("create_by", userId);
		pcd.set("create_date", new Date());
		return(pcd.save());
	}
	/**
	 * 收藏环保公司日常任务
	 * @param type 供应：supply  求购：demand  商品：product 
	 * @param id 为要添加产品的id
	 * */
	public boolean dailyCollectStore(String type, long id){
		User user = UserUtils.getUser();
		if(user == null){
			return false;
		}
		long userId = user.getId();
		if("supply".equals(type)){
			type = "daily_store_supply";
		}else if("demand".equals(type)){
			type = "daily_store_demand";
		}else if("product".equals(type)){
			type = "daily_store_product";
		}else{
			return false;
		}
		Record daily = ItemPoint.dao.getPoint("daily_store");
		BigDecimal dailyPointBD= daily.get("points");//获取注册并完成资料的积分
		PointMain userPoint = PointMain.dao.getUserPoint(userId);
		BigDecimal dbTemp = userPoint.get("point_num");//获取用户已有积分
		userPoint.set("point_num", BigDecimal.valueOf(dbTemp.doubleValue() + dailyPointBD.doubleValue()));
		userPoint.set("update_by", userId);
		userPoint.set("update_date", new Date());
		userPoint.update();
		//写入积分变换细则表
		PointChangeDetail pcd = new PointChangeDetail();
		pcd.set("item_type", "daily_store");
		pcd.set(type, id);
		pcd.set("points", BigDecimal.valueOf(dailyPointBD.doubleValue()));//当前得到的积分
		pcd.set("remain_points", BigDecimal.valueOf(dbTemp.doubleValue() + dailyPointBD.doubleValue()));//当前得到的总积分
		pcd.set("create_by", userId);
		pcd.set("create_date", new Date());
		return(pcd.save());
	}
	/**
	 * 分享获取积分
	 * @param href 要分享的连接地址
	 * */
	public boolean shareHref(String href){
		User user = UserUtils.getUser();
		if(user == null){
			return false;
		}
		long userId = user.getId();
		//long userId = 154L;
		//String href = "www.baidu.com";
		Record daily = ItemPoint.dao.getPoint("daily_share");
		BigDecimal dailyPointBD= daily.get("points");//获取注册并完成资料的积分
		PointMain userPoint = PointMain.dao.getUserPoint(userId);
		BigDecimal dbTemp = userPoint.get("point_num");//获取用户已有积分
		userPoint.set("point_num", BigDecimal.valueOf(dbTemp.doubleValue() + dailyPointBD.doubleValue()));
		userPoint.set("update_by", userId);
		userPoint.set("update_date", new Date());
		userPoint.update();
		//写入积分变换细则表
		PointChangeDetail pcd = new PointChangeDetail();
		pcd.set("item_type", "daily_share");
		pcd.set("daily_share_href", href);
		pcd.set("points", BigDecimal.valueOf(dailyPointBD.doubleValue()));//当前得到的积分
		pcd.set("remain_points", BigDecimal.valueOf(dbTemp.doubleValue() + dailyPointBD.doubleValue()));//当前得到的总积分
		pcd.set("create_by", userId);
		pcd.set("create_date", new Date());
		return(pcd.save());
	}
	/**
	 * 评论环保商城商品获取积分
	 * @param
	 * @return boolean
	 * */
	public boolean commentProduct(long commentId){
		User user = UserUtils.getUser();
		if(user == null){
			return false;
		}
		long userId = user.getId();
		Record daily = ItemPoint.dao.getPoint("daily_comment");
		BigDecimal dailyPointBD= daily.get("points");//获取注册并完成资料的积分
		PointMain userPoint = PointMain.dao.getUserPoint(userId);
		BigDecimal dbTemp = userPoint.get("point_num");//获取用户已有积分
		userPoint.set("point_num", BigDecimal.valueOf(dbTemp.doubleValue() + dailyPointBD.doubleValue()));
		userPoint.set("update_by", userId);
		userPoint.set("update_date", new Date());
		userPoint.update();
		//写入积分变换细则表
		PointChangeDetail pcd = new PointChangeDetail();
		pcd.set("item_type", "daily_comment");
		pcd.set("daily_comment_pro", commentId);
		pcd.set("points", BigDecimal.valueOf(dailyPointBD.doubleValue()));//当前得到的积分
		pcd.set("remain_points", BigDecimal.valueOf(dbTemp.doubleValue() + dailyPointBD.doubleValue()));//当前得到的总积分
		pcd.set("create_by", userId);
		pcd.set("create_date", new Date());
		return(pcd.save());
	}

	/**
	 * 回帖
	 * @param commentId
	 * @return
     */
	public boolean Replyforum(long commentId){
		User user = UserUtils.getUser();
		if(user == null){
			return false;
		}
		long userId = user.getId();
		Record daily = ItemPoint.dao.getPoint("reply_post");
		BigDecimal dailyPointBD= daily.get("points");//获取注册并完成资料的积分
		PointMain userPoint = PointMain.dao.getUserPoint(userId);
		BigDecimal dbTemp = userPoint.get("point_num");//获取用户已有积分
		userPoint.set("point_num", BigDecimal.valueOf(dbTemp.doubleValue() + dailyPointBD.doubleValue()));
		userPoint.set("update_by", userId);
		userPoint.set("update_date", new Date());
		userPoint.update();
		//写入积分变换细则表
		PointChangeDetail pcd = new PointChangeDetail();
		pcd.set("item_type", "reply_post");
		pcd.set("reply_id", commentId);
		pcd.set("points", BigDecimal.valueOf(dailyPointBD.doubleValue()));//当前得到的积分
		pcd.set("remain_points", BigDecimal.valueOf(dbTemp.doubleValue() + dailyPointBD.doubleValue()));//当前得到的总积分
		pcd.set("create_by", userId);
		pcd.set("create_date", new Date());
		return(pcd.save());
	}
	/**
	 * fa帖
	 * @param commentId
	 * @return
	 */
	public boolean Postforum(long commentId){
		User user = UserUtils.getUser();
		if(user == null){
			return false;
		}
		long userId = user.getId();
		Record daily = ItemPoint.dao.getPoint("post");
		BigDecimal dailyPointBD= daily.get("points");//获取注册并完成资料的积分
		PointMain userPoint = PointMain.dao.getUserPoint(userId);
		BigDecimal dbTemp = userPoint.get("point_num");//获取用户已有积分
		userPoint.set("point_num", BigDecimal.valueOf(dbTemp.doubleValue() + dailyPointBD.doubleValue()));
		userPoint.set("update_by", userId);
		userPoint.set("update_date", new Date());
		userPoint.update();
		//写入积分变换细则表
		PointChangeDetail pcd = new PointChangeDetail();
		pcd.set("item_type", "post");
		pcd.set("post_id", commentId);
		pcd.set("points", BigDecimal.valueOf(dailyPointBD.doubleValue()));//当前得到的积分
		pcd.set("remain_points", BigDecimal.valueOf(dbTemp.doubleValue() + dailyPointBD.doubleValue()));//当前得到的总积分
		pcd.set("create_by", userId);
		pcd.set("create_date", new Date());
		return(pcd.save());
	}

}
