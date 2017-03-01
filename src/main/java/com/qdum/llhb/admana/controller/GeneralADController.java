package com.qdum.llhb.admana.controller;

import java.util.List;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.qdum.llhb.admana.model.AdImages;
import com.qdum.llhb.admana.model.AdLable;
import com.qdum.llhb.common.controller.CommonController;
import com.qdum.llhb.ws.vo.AjaxBean;

/**
 * 广告管理——普通广告
 * 
 * @author rongchao
 *
 */
@ControllerBind(controllerKey = "/infomaintain/ad/general")
@Before(AdminInterceptor.class)
public class GeneralADController extends CommonController {

	private static final Logger LOGGER = Logger.getLogger(GeneralADController.class);

	private Boolean isSuccess = false;

	private String msg = "操作失败!";

	public void index() {
		List<AdLable> lableList = AdLable.dao.getGeneralAdLableList();
		setAttr("labels", lableList);
		render("admana.jsp");
	}

	/**
	 * 获取广告图片
	 * 
	 * @author rongchao
	 *
	 */
	public void getAdImages() {
		Long labelID = getParaToLong("lableID");
		AjaxBean aj = new AjaxBean();
		if (labelID == null || labelID == 0L) {
			isSuccess = false;
			msg = "操作失败,获取参数lableID失败！";
			LOGGER.error("获取广告图片失败，原因:获取参数<lableID>失败，参数<lableID>不存在或为0");
			aj.setIsSuccess(isSuccess);
			aj.setMsg(msg);
			renderJson(aj);
			return;
		}
		List<AdImages> list = AdImages.dao.getAdImagesByLabelID(labelID);
		isSuccess = true;
		msg = "操作成功！";
		aj.setIsSuccess(isSuccess);
		aj.setMsg(msg);
		aj.setObj(list);
		renderJson(aj);
	}

	/**
	 * 保存图片
	 * 
	 * @author rongchao
	 *
	 */
	public void saveImg() {
		AjaxBean aj = new AjaxBean();
		try {
			List<AdImages> adImagesList = this.getModels(AdImages.class, "adImages");
			Long lableID = getParaToLong("labelID");
			if (lableID == null || lableID == 0L) {
				LOGGER.error("上传图片失败！原因：参数<lableID>无效。参数<lableID>为空!");
				isSuccess = false;
				msg = "上传图片失败！";
				aj.setIsSuccess(isSuccess);
				aj.setMsg(msg);
				renderJson(aj);
				return;
			}
			AdImages.dao.saveOrUpdateAdImages(adImagesList, lableID);
			isSuccess = true;
			msg = "上传图片成功！";
		} catch (Exception e) {
			isSuccess = false;
			msg = "上传图片失败，原因:".concat(e.getMessage());
			LOGGER.error(msg, e);
			e.printStackTrace();
		}
		aj.setIsSuccess(isSuccess);
		aj.setMsg(msg);
		renderJson(aj);
	}

	public void delImg() {
		AjaxBean aj = new AjaxBean();
		Long imgID = getParaToLong("imgID");
		if (imgID == null || imgID == 0L) {
			LOGGER.error("删除图片失败！原因：参数<imgID>无效。参数<imgID>为空!");
			isSuccess = false;
			msg = "删除图片失败！";
			aj.setIsSuccess(isSuccess);
			aj.setMsg(msg);
			renderJson(aj);
			return;
		}
		boolean delflag = AdImages.dao.delImgByImgID(imgID);
		if (delflag) {
			isSuccess = true;
			msg = "删除图片成功！";
		} else {
			isSuccess = false;
			msg = "删除图片失败！";
		}
		aj.setIsSuccess(isSuccess);
		aj.setMsg(msg);
		renderJson(aj);
	}
}
