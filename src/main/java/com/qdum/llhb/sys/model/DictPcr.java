package com.qdum.llhb.sys.model;

import java.util.Date;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.ehcache.CacheKit;
/**
 * 字典表2
 * @author zhangxm
 */
public class DictPcr extends Model<DictPcr> {
	private static final long serialVersionUID = 1L;
	public static DictPcr dao = new DictPcr();
	
	public static final String ID = "id";//编号
	public static final String PARENT_ID = "parent_id"; //父级编号
	public static final String PARENT_IDS = "parent_ids";//parent_ids
	public static final String CODE = "code";//编码
	public static final String NAME = "name";//名称
	public static final String TYPE = "type";//类型
	public static final String SORT = "sort";//排序
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
	
	public void setParentIds(String parentIds) {
		set(PARENT_IDS, parentIds);
	}
	public String getParentIds() {
		return get(PARENT_IDS);
	}
	
	public void setCode(String code) {
		set(CODE, code);
	}
	public String getCode() {
		return get(CODE);
	}
	
	public void setName(String name) {
		set(NAME, name);
	}
	public String getName() {
		return get(NAME);
	}
	
	public void setType(String type) {
		set(TYPE, type);
	}
	public String getType() {
		return get(TYPE);
	}
	
	public void setSort(Long sort) {
		set(SORT, sort);
	}
	public Long getSort() {
		return Long.valueOf(get(SORT) == null ? "0" : get(SORT).toString());
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
	/**
	 * 得到所有未删除的菜单(菜单管理中使用)
	 * @return
	 */
	public List<DictPcr> findAllList() {
		String sql = "select * from sys_dict_pcr where del_flag='0' order by sort";
		List<DictPcr> list = DictPcr.dao.find(sql);
		return list;
	}
	
	/**
	 * 根据类型获取
	 * @param type
	 * @return
	 */
	public List<DictPcr> findByType(String type) {
		String sql = "SELECT * FROM sys_dict_pcr WHERE del_flag = '0' AND type=? ORDER BY id";
		return this.find(sql,type);
	}

    public List<DictPcr> findByTypeOrderById(String type) {
        String sql = "SELECT * FROM sys_dict_pcr WHERE del_flag = '0' AND type=? ORDER BY id";
        return this.find(sql,type);
    }

    public List<Record> findByTypeRecord(String type) {
        String sql = "SELECT * FROM sys_dict_pcr WHERE del_flag = '0' AND type=? ORDER BY sort";
        return Db.find(sql,type);
    }
	/**
	 * 检索所有下一级菜单
	 * @return
	 */
	public List<DictPcr> getChildList(Long parentId) {
		return this.find(" select * from sys_dict_pcr where del_flag='0' and parent_id = ?  ",parentId);
	}
	
	/**
	 * 查找当前菜单的父菜单
	 * @return
	 */
	public DictPcr getParent() {
		DictPcr d = CacheKit.get("DictPcrCache", getParentId());
		if (d == null) {
			if (getParentId() != 0L) {
				d = DictPcr.dao.findById(getParentId());
				CacheKit.put("DictPcrCache", getParentId(), d);
			}
		}
		return d;
	}
	/**
	 * 查找当前菜单的父菜单 
	 * @author wcl
	 * @return
	 */
	public DictPcr getParentw() {
		DictPcr d = new DictPcr();
			if (getParentId()!=null&&getParentId() != 0L) {
			 d = DictPcr.dao.findById(getParentId());
			}
		return d;
	}
	public DictPcr getParents(String id,String flag) {
		DictPcr dictPcr = new DictPcr();
		if(flag.equals("1")){
			dictPcr= DictPcr.dao.findFirst("select * from sys_dict_pcr where id=? ",id);
		}else if(flag.equals("2")){
		    dictPcr = DictPcr.dao.findFirst("select * from sys_dict_pcr where id=? ",getParentId());
		}
		
		return dictPcr;
	}
	
	/**
	 * 对菜单进行排序
	 * @param list
	 * @param sourcelist
	 * @param parentId
	 */
	public static void sortList(List<DictPcr> list, List<DictPcr> sourcelist, Long parentId) {
		for (int i=0; i<sourcelist.size(); i++) {
			DictPcr e = sourcelist.get(i);
			Long DictPcrParentId = e.getParentId();
			if (DictPcrParentId != null && DictPcrParentId.equals(parentId)) {
				list.add(e);
				// 判断是否还有子节点, 有则继续获取子节点
				for (int j=0; j<sourcelist.size(); j++) {
					DictPcr child = sourcelist.get(j);
					Long childId = child.getParentId();
					if (childId != null && childId.equals(e.getId())) {
						sortList(list, sourcelist, e.getId());
						break;
					}
				}
			}
		}
	}

	/**
	 * 根据数据类型查询出该类型下的数据
	 */
	public List<DictPcr> getDictsByType(String type,Long pid) {
		String sql = "select * from sys_dict_pcr where del_flag='0' and type=? and parent_id=?";
		List<DictPcr> list = DictPcr.dao.find(sql, type,pid);
		return list;
	}
	//降序
	public List<DictPcr> getDictsByTypeDesc(String type,Long pid) {
		String sql = "select * from sys_dict_pcr where del_flag='0' and type=? and parent_id=? ORDER BY id DESC";
		List<DictPcr> list = DictPcr.dao.find(sql, type,pid);
		return list;
	}
	/**
	 * 获取所有类型
	 * @return List<Menu>
	 */
	public List<DictPcr> findCategoryList(String type) {
		String sql = "select * from sys_dict_pcr where del_flag='0' and type='"+type+"' order by sort";
		List<DictPcr> list = DictPcr.dao.find(sql);
		return list;
	}
	/**
	 * 获取所有父类型
	 */
	public List<Record> findeFu(){
		String sql = "select * from sys_dict_pcr where del_flag='0' and parent_id='0' order by sort";
		return Db.find(sql);
	}
	//获取子级菜单
	public static void categoryList(List<DictPcr> list, List<DictPcr> sourcelist, Long parentId) {
		for (int i=0; i<sourcelist.size(); i++) {
			DictPcr e = sourcelist.get(i);
			if (e.getParentId() != null && e.getParentId().equals(parentId)) {
				list.add(e);
				// 判断是否还有子节点, 有则继续获取子节点
				for (int j=0; j<sourcelist.size(); j++) {
					DictPcr childe = sourcelist.get(j);
					if (childe.getParentId() != null && childe.getParentId().equals(e.getId())) {
						categoryList(list, sourcelist, e.getId());
						break;
					}
				}
			}
		}
	}
	/**
	 * 
	 */
	public boolean isAdmin() {
		return isAdmin(getId());
	}
	
	public static boolean isAdmin(Long id) {
		return id != null && id.equals(0L);
	}
	/**
	 * 得到该类别的最高父级
	 * wf
	 * @param name
	 * @param type
	 * @return
	 */
	public DictPcr getParentByType(String type){
		return DictPcr.dao.findFirst("select id from sys_dict_pcr WHERE parent_id=0 and  del_flag ='0' and type = '"+type+"'");
	}
	/**
	 * 根据name得到id
	 */
	public DictPcr getIdByName(String name,String type){
		return DictPcr.dao.findFirst("select id,parent_id from sys_dict_pcr WHERE del_flag ='0' and type = '"+type+"'AND name='"+name+"' ");
	}
	/**
	 * 根据parentid得到所有children
	 */
	public List<DictPcr> getChildrenByParent(String type,Long parentid){
		return DictPcr.dao.find("select * from sys_dict_pcr WHERE del_flag ='0' and type = '"+type+"'AND parent_id="+parentid);
	}
	/**
	 * 根据id得到所有name
	 */
	public DictPcr getNameById(String type,Long id){
		return DictPcr.dao.findFirst("select name from sys_dict_pcr WHERE del_flag ='0' and type = '"+type+"'AND id="+id);
	}
	/**
	 * 根据type得到一级菜单
	 */
	public List<Record> getFirstChildren(String type){
		String sql="SELECT p.id,p.parent_id as pid,p.name,p.code FROM sys_dict_pcr p INNER JOIN (SELECT * FROM sys_dict_pcr d WHERE d.type='"+type+"' AND d.parent_id='0' AND d.del_flag='0') dp ON p.parent_id=dp.id AND p.del_flag='0' order by p.sort,p.id";
		return Db.find(sql);
	}
	public List<Record> getAll(){
		String sql = "SELECT * FROM sys_dict_pcr b ";
		return  Db.find(sql);
	}
	public List<Record> getByParId(String id){
		String sql = "SELECT * FROM sys_dict_pcr b WHERE b.parent_id=?";
		return  Db.find(sql,id);
	}
	public void deleteCreate(Long id){
		String sql = "update sys_dict_pcr set  del_flag='1'  WHERE id=?";
		 Db.update(sql,id);
	}
	/**
	 * 安装
	 * @param area
	 */
	public void save(DictPcr area) {
		if (area.getId() == null||area.getId() == 0L) {
			area.save();
		} else {
			area.update();
		}
	}
	/**
	 * 根据id得到
	 */
	public DictPcr getById(String type,Long id){
		return DictPcr.dao.findFirst("select * from sys_dict_pcr WHERE del_flag ='0' and type = '"+type+"'AND id="+id);
	}
	/**
	 *
	 */
	public List<Record> getCodeList(){
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT * FROM sys_dict_pcr p WHERE p.del_flag=0 and p.type='ep_phone'");
		return  Db.find(sb.toString());
	}
	
	//获取危废类型
	public List<DictPcr> getWsTypeList(){
		List<DictPcr> typeList =DictPcr.dao.find("SELECT id,CONCAT(`name`,'(',remarks,')') type from " +
				"sys_dict_pcr where parent_id=(SELECT id FROM `sys_dict_pcr` WHERE name='危险废物');");
		return typeList;
	}
	
}
