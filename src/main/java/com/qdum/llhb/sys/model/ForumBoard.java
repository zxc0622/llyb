package com.qdum.llhb.sys.model;

import java.util.Date;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

public class ForumBoard extends Model<ForumBoard> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static ForumBoard dao = new ForumBoard();
	
	public static final String ID = "id";//编号
	public static final String PARENT_ID = "par_id"; //父级编号
	public static final String BOARD_NAME = "board_name"; //板块名称
	public static final String SHOW_ORDER = "show_order";//排序
	public static final String CREATE_BY = "create_by";		//创建人
	public static final String UPDATE_BY = "update_by";		//修改人
	public static final String CREATE_DATE = "create_date";	//创建人
	public static final String UPDATE_DATE = "update_date";	//修改人
	public static final String DEL_FLAG = "del_flag";//删除标记
	public static final String REMARKS = "remarks";//备注信息
	
	public void setId(Long id) {
		set(ID, id);
	}
	public Long getId() {
		return getLong(ID);
	}
	
	public void setParentId(Long parentId) {
		set(PARENT_ID, parentId);
	}
	public Long getParentId() {
		return getLong(PARENT_ID);
	}
	
	
	
	public void setBoardName(String name) {
		set(BOARD_NAME, name);
	}
	public String getBoardName() {
		return get(BOARD_NAME);
	}
	
	
	public void setShowOrder(Long sort) {
		set(SHOW_ORDER, sort);
	}
	public Integer getShowOrder() {
		return getInt(SHOW_ORDER);
	}
	
	public Long getCreateBy() {
		return getLong(CREATE_BY);
	}
	public void setCreateBy(Long createBy ) {
		set(CREATE_BY,createBy);
	}
	public Date getCreateDate() {
		return getDate(CREATE_DATE);
	}
	
	public void setCreateDate(Date createDate ) {
		set(CREATE_DATE,createDate);
	}
	
	public Long getUpdateBy() {
		return getLong(UPDATE_BY);
	}
	public void setUpdateBy(Long createBy ) {
		set(UPDATE_BY,createBy);
	}
	
	public Date getUpdateDate() {
		return getDate(UPDATE_DATE);
	}
	
	public void setUpdateDate(Date createDate ) {
		set(UPDATE_DATE,createDate);
	}
	
	public void setRemarks(String remarks) {
		set(REMARKS, remarks);
	}
	public String getRemarks() {
		return get(REMARKS);
	}
	
	public void setDelFlag(Integer delFlag) {
		set(DEL_FLAG, delFlag);
	}
	public Integer getDelFlag() {
		return getInt(DEL_FLAG);
	}
	
	public ForumBoard getByParId(long parId){
		String sql = "select forum_board_list where del_flag=0 and par_id="+parId;
		return ForumBoard.dao.findFirst(sql);
	}
	
	public List<ForumBoard> getAll(){
		String sql = "select *from forum_board_list where del_flag=0";
		return ForumBoard.dao.find(sql);
	}
	/**
	 * 查找当前菜单的父菜单 
	 * @author wcl
	 * @return
	 */
	public ForumBoard getParentw() {
		ForumBoard d = new ForumBoard();
			if (getParentId()!=null&&getParentId() != 0L) {
			 d = ForumBoard.dao.findById(getParentId());
			}
		return d;
	}
	/**
	 * 删除指定板块
	 * */
	public boolean deleteBoard(long id){
		String sql = "update forum_board_list set del_flag=1 where id="+id;
		return (Db.update(sql)>0? true:false);
	}
	/**
	 * 对菜单进行排序
	 * @param list
	 * @param sourcelist
	 * @param parentId
	 */
	public static void sortList(List<ForumBoard> list, List<ForumBoard> sourcelist, Long parentId) {
		for (int i=0; i<sourcelist.size(); i++) {
			ForumBoard e = sourcelist.get(i);
			Long DictPcrParentId = e.getParentId();
			if (DictPcrParentId != null && DictPcrParentId.equals(parentId)) {
				list.add(e);
				// 判断是否还有子节点, 有则继续获取子节点
				for (int j=0; j<sourcelist.size(); j++) {
					ForumBoard child = sourcelist.get(j);
					Long childId = child.getParentId();
					if (childId != null && childId.equals(e.getId())) {
						sortList(list, sourcelist, e.getId());
						break;
					}
				}
			}
		}
	}
}
