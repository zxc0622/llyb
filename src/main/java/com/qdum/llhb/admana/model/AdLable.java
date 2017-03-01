package com.qdum.llhb.admana.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.constant.BaseConstants;

/**
 * 广告管理——广告标签
 * 
 * @author rongchao
 *
 */
public class AdLable extends Model<AdLable> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2604323717097925180L;

	public static final AdLable dao = new AdLable();

	/**
	 * 普通广告类型
	 */
	public static final String GENERAL_AD_TYPE = "C";

	/**
	 * 首页广告类型
	 */
	public static final String INDEX_AD_TYPE = "M";

	public static final String ID = "id";// 主键
	public static final String PAR_ID = "par_id";// 父页面ID
	public static final String TYPE = "type";// M-表示首页广告，C-表示普通广告
	public static final String S_TYPE = "s_type";// 分类2
	public static final String T_TYPE = "t_type";// 分类3
	public static final String NAME = "name"; // 名称
	public static final String SHOW_ORDER = "show_order";// 显示顺序
	public static final String ADV_NUM = "adv_num";// 广告数量
	public static final String REMARKS = "remarks";// 备注
	public static final String DEL_FLAG = "del_flag";// 删除标识，默认为0，删除为1

	public Long getId() {
		return getLong(ID);
	}

	public Long getParId() {
		return getLong(PAR_ID);
	}

	public String getType() {
		return get(TYPE);
	}

	public String getStype() {
		return get(S_TYPE);
	}

	public String getTtype() {
		return get(T_TYPE);
	}

	public String getName() {
		return get(NAME);
	}

	public Integer getShowOrder() {
		return getInt(SHOW_ORDER);
	}

	public Integer getAdvNum() {
		return getInt(ADV_NUM);
	}

	public String getRemarks() {
		return REMARKS;
	}

	public Boolean getDelFlag() {
		return getBoolean(DEL_FLAG);
	}

	public void setId(Long id) {
		set(ID, id);
	}

	public void setParId(Long parId) {
		set(PAR_ID, parId);
	}

	public void setType(String type) {
		set(TYPE, type);
	}

	public void setStype(String sType) {
		set(S_TYPE, sType);
	}

	public void setTtype(String tType) {
		set(T_TYPE, tType);
	}

	public void setName(String name) {
		set(NAME, name);
	}

	public void setShowOrder(Integer showOrder) {
		set(SHOW_ORDER, showOrder);
	}

	public void setAdvNum(Integer advNum) {
		set(ADV_NUM, advNum);
	}

	public void setRemarks(String remarks) {
		set(REMARKS, remarks);
	}

	public void setDelFlag(Boolean delFlag) {
		set(DEL_FLAG, delFlag);
	}

	/**
	 * 获取普通广告标签
	 * 
	 * @author rongchao
	 *
	 * @return
	 */
	public List<AdLable> getGeneralAdLableList() {
		String sql = "select * from bm_adv_label where type = ? and del_flag = ? order by par_id , show_order ";
		return this.find(sql, GENERAL_AD_TYPE, BaseConstants.NOT_DELETE);
	}
	/**
	 * 首页广告标签
	 *@author wcl 
	 */
	public List<Record> searchManagement(){
	String sql="SELECT"+
					" s.id,"+
					" s.pic_addr AS picAddr,"+
					" s.redirct_href AS redirctHref,"+
					" s.show_name AS showName,"+
					" t.s_type AS sType,"+
					" t.t_type AS tType"+
					" FROM"+
					" bm_adv_label t"+
					" LEFT JOIN bm_adv_images s ON t.id = s.label_id"+
					" AND s.del_flag = '0'"+
				//	" AND s.create_by = '"+id+"'"+
					" WHERE"+
					" t.type = 'M'"+
					" AND t.del_flag = '0'";
		return Db.find(sql);
	}

	/**
	 * 取广告
	 */
	public List<Record> getAdsByType(long id,String t1,String t2){
		String sql = "SELECT m.* FROM bm_adv_label l LEFT JOIN bm_adv_images m on l.id=m.label_id and m.del_flag='0' WHERE l.par_id=? and l.type=? and l.s_type=?";
		return Db.find(sql,id,t1,t2);
	}

	/**
	 * 首页广告 zhangxm
	 */
	public List<Record> getIndexImg() {
		String sql = "SELECT a.* FROM ((SELECT i.id,l.type,l.s_type as stype,l.t_type as ttype,i.pic_addr as addr,i.redirct_href as href,i.show_name as imgname FROM bm_adv_label AS l " +
				"INNER JOIN bm_adv_images i ON l.id=i.label_id WHERE l.par_id='1' " +
				"AND l.type='C' AND i.del_flag='0' ) UNION " +
				"(SELECT i.id,l.type,l.s_type,l.t_type as ttype,i.pic_addr,i.redirct_href AS href,i.show_name AS imgname FROM bm_adv_label AS l " +
				"INNER JOIN bm_adv_images i ON l.id=i.label_id WHERE type='M' " +
				"AND i.del_flag='0')) a ORDER BY a.id";
		return Db.find(sql);
	}
	/**
	 * 根据类型获取广告 zhangxm
	 * @param type
	 * @param stype
	 * @param ttype
	 * @return
	 */
	public List<Record> getAds(String parId,String type ,String stype ,String ttype) {
		String sql = "SELECT i.id,l.type,l.s_type as stype,l.t_type as ttype,i.pic_addr as addr,i.redirct_href as href,i.show_name as imgname " +
				"FROM bm_adv_label l INNER JOIN bm_adv_images i ON l.id=i.label_id " +
				"AND i.del_flag='0' WHERE l.del_flag='0' ";
		if(parId != null && !"".equals(parId)){
			sql+="AND l.par_id='"+parId+"' ";
		}
		if(type != null && !"".equals(type)){
			sql+="AND l.type='"+type+"' ";
		}
		if(stype != null && !"".equals(stype)){
			sql+="AND l.s_type='"+stype+"' ";
		}	
		if(ttype != null && !"".equals(ttype)){
			sql+="AND l.t_type='"+ttype+"' ";
		}
		sql+="ORDER BY i.id";
		return Db.find(sql);
	}


    public List<Record> getAdsLabel() {
        String sql = " SELECT t.s_type as type,max(t.name) as name FROM bm_adv_label t ";
        sql += " where t.type = 'M' and t.s_type not in ('S4','S5','S6') and t.del_flag = '0' " ;
        sql += "group by t.s_type order by s_type ";
        return Db.find(sql);
    }
}
