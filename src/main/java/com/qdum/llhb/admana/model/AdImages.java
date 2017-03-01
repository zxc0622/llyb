package com.qdum.llhb.admana.model;

import java.util.Date;
import java.util.List;

import com.jfinal.log.Logger;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.constant.BaseConstants;
import com.qdum.llhb.common.utils.FillFieldsUtils;
import com.qdum.llhb.sys.utils.UserUtils;

/**
 * 广告管理——广告图片明细
 * 
 * @author rongchao
 *
 */
public class AdImages extends Model<AdImages> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4754243357382554633L;

	public static final AdImages dao = new AdImages();

	private static final Logger LOGGER = Logger.getLogger(AdImages.class);

	public static final String ID = "id";// 主键
	public static final String LABEL_ID = "label_id"; // 属于哪个label
	public static final String PIC_ADDR = "pic_addr"; // 图片地址
	public static final String CREATE_BY = "create_by";
	public static final String CREATE_DATE = "create_date";
	public static final String UPDATE_BY = "update_by";
	public static final String UPDATE_DATE = "update_date";
	public static final String REMARKS = "remarks"; // 备注
	public static final String DEL_FLAG = "del_flag"; // 删除标签，默认为0，删除为1
	public static final String SHOW_NAME = "show_name";// 显示名称
	public static final String REDIRCT_HREF = "redirct_href";// 图片路径

	public String getShowName() {
		return getStr(SHOW_NAME);
	}

	public String getRedirctHref() {
		return getStr(REDIRCT_HREF);
	}

	public void setShowName(String showName) {
		set(SHOW_NAME, showName);
	}

	public void setRedirctHref(String redirctHref) {
		set(REDIRCT_HREF, redirctHref);
	}

	public Long getId() {
		return getLong(ID);
	}

	public Long getLabelId() {
		return getLong(LABEL_ID);
	}

	public String getPicAddr() {
		return getStr(PIC_ADDR);
	}

	public Long getCreateBy() {
		return getLong(CREATE_BY);
	}

	public Date getCreateDate() {
		return getDate(CREATE_DATE);
	}

	public Long getUpdateBy() {
		return getLong(UPDATE_BY);
	}

	public Date getUpdateDate() {
		return getDate(UPDATE_DATE);
	}

	public String getRemarks() {
		return getStr(REMARKS);
	}

	public Boolean getDelFlag() {
		return getBoolean(DEL_FLAG);
	}

	public void setId(Long id) {
		set(ID, id);
	}

	public void setLabelId(Long labelId) {
		set(LABEL_ID, labelId);
	}

	public void setPicAddr(String picAddr) {
		set(PIC_ADDR, picAddr);
	}

	public void setCreateBy(Long createBy) {
		set(CREATE_BY, createBy);
	}

	public void setCreateDate(Date createDate) {
		set(CREATE_DATE, createDate);
	}

	public void setUpdateBy(Long updateBy) {
		set(UPDATE_BY, updateBy);
	}

	public void setUpdateDate(Date updateDate) {
		set(UPDATE_DATE, updateDate);
	}

	public void setRemarks(String remarks) {
		set(REMARKS, remarks);
	}

	public void setDelFlag(Boolean delFlag) {
		set(DEL_FLAG, delFlag);
	}

	/**
	 * 获取当前用户的广告图片
	 * 
	 * @author rongchao
	 *
	 * @param userID
	 * @return
	 */
	public List<AdImages> getAdImagesByUserID() {
		String sql = "select * from bm_adv_images where del_flag = ? and create_by = ?";
		return this.find(sql, BaseConstants.NOT_DELETE, UserUtils.getUser().getId());
	}

	/**
	 * 根据label_id获取所有相应的图片
	 * 
	 * @author rongchao
	 *
	 * @param labelID
	 * @return
	 */
	public List<AdImages> getAdImagesByLabelID(Long labelID) {
		String sql = "select * from bm_adv_images where del_flag = ? and label_id = ? order by create_date desc,id desc";
		return this.find(sql, BaseConstants.NOT_DELETE, labelID);
	}

	public List<AdImages> getWSHomeImages() {
		String sql = "select * from bm_adv_images where del_flag = ? and (label_id = ? or label_id = ?) order by create_date desc,id desc";
		return this.find(sql, BaseConstants.NOT_DELETE, 7, 12);
	}

	/**
	 * 保存图片
	 * 
	 * @author rongchao
	 *
	 * @param adImagesList
	 * @param labelID
	 *            label_id
	 * @return
	 */
	public Boolean saveOrUpdateAdImages(List<AdImages> adImagesList, Long labelID) {
		List<AdImages> list = getAdImagesByLabelID(labelID);
		for (AdImages oldAdImage : list) {
			FillFieldsUtils.updateCommonInfo(oldAdImage);
			oldAdImage.setDelFlag(true);
			oldAdImage.update();
		}
		for (AdImages adImages : adImagesList) {
			adImages.setLabelId(labelID);
			FillFieldsUtils.fillCommonInfo(adImages);
			adImages.save();
		}
		return true;
	}

	/**
	 * 根据图片id删除图片
	 * 
	 * @author rongchao
	 *
	 * @param imgID
	 *            广告图片主键id
	 * @return
	 */
	public Boolean delImgByImgID(Long imgID) {
		if (imgID == null || imgID == 0) {
			LOGGER.error("参数<imgID>无效，<imgID>为空，请检查传递的<imgID>是否正确!");
			return false;
		}
		AdImages adImages = this.getImgByImgID(imgID);
		if (adImages == null) {
			LOGGER.error("根据参数<imgID>获取不到相应的广告图片信息，请检查传递的<imgID>是否正确!");
			return false;
		}
		adImages.setDelFlag(true);
		FillFieldsUtils.updateCommonInfo(adImages);
		return adImages.update();
	}

	/**
	 * 根据广告图片id获取图品信息
	 * 
	 * @author rongchao
	 *
	 * @param imgID
	 * @return
	 */
	public AdImages getImgByImgID(Long imgID) {
		if (imgID == null || imgID == 0) {
			LOGGER.error("参数<imgID>无效，<imgID>为空，请检查传递的<imgID>是否正确!");
			return null;
		}
		String sql = "select * from bm_adv_images where del_flag = ? and id = ?";
		return this.findFirst(sql, BaseConstants.NOT_DELETE, imgID);
	}

	/**
	 * 通过label ID 获取对应图片列表
	 * 
	 * @author zhaoyl
	 *
	 * @param labelID
	 * @return
	 */
	public List<AdImages> getImgListByLabelID(Long labelID) {
		String sql = "select * from bm_adv_images where del_flag = ? and label_id = ?";
		return this.find(sql, BaseConstants.NOT_DELETE, labelID);
	}

	/**
	 * 查询黄金广告位
	 */
	public List<Record> getHjImages() {
		String sql = "select s.pic_addr as pic,s.redirct_href as redirctHref  from bm_adv_label  t" + " LEFT JOIN bm_adv_images s"
				+ " on t.id=s.label_id" + " AND s.del_flag='0'" + " WHERE t.type='c'" + " and t.del_flag='0'"
				+ " and t.par_id='5'" + " and t.s_type='s3'";
		return Db.find(sql);
	}
}
