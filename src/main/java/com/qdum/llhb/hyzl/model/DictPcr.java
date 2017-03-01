package com.qdum.llhb.hyzl.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

/**
 * 字典
 * @author wcl
 */

public class DictPcr extends Model<DictPcr>{
	private static final long serialVersionUID = 1L;

	public static DictPcr dao = new DictPcr();
	
	public static String ID     		= "id";			// 编号
	public static String PARENT_ID  	= "parent_id";	// 父级编号
	public static String PARENT_IDS 	= "parent_ids";	// 所有父级编号
	//public static String CODE   		= "code";		// 编码
	public static String NAME           = "name";       // 名称
	public static String TYPE 		   = "type";		// 类型
	//public static String DEL_FLAG 	   = "del_flag";
	//public static String CREATE_BY     = "create_by";	 //创建人
	//public static String UPDATE_BY 	   = "update_by";	 //修改人
	//public static String CREATE_DATE   = "create_date"; //创建时间
	//public static String UPDATE_DATE   = "update_date"; //修改时间
	//public static String REMARKS       = "remarks";     //备注信息

	public void setId(Long id) {
		set(ID, id);
	}
	
	public Long getId() {
		return getLong(ID);
	}
	public void setparentid(Long parentId) {
		set(PARENT_ID, parentId);
	}
	public Long getparentid() {
		return getLong(PARENT_ID);
	}
	public void setparentids(String parentIds) {
		set(PARENT_IDS, parentIds);
	}
	public String getparentids() {
		return get(PARENT_IDS);
	}
	public void setName(String name) {
		set(NAME, name);
	}
	public String getName() {
		return get(PARENT_IDS);
	}
	public void setType(String type){
		set(TYPE, type);
	}
	public String getType() {
		return get(TYPE);
	}
	/**
	 * 查询行业类别
	 * @return
	 */
	public List<Record> findAllList(String str) {
		
		String sql = "SELECT"+
						" t.id as id,"+
						" t.parent_id as parent_id,"+
						"  t.parent_ids as parent_ids,"+
						" 	t.name as name"+
						" 	FROM"+
						" 		sys_dict_pcr t"+
						" 	WHERE"+
						" 		t.del_flag = '0'"+
						" 	AND t.type = '"+str+"'"+
						" 	AND t.id <> '0'"+
						" 	ORDER BY"+
						" CASE"+
						" 	WHEN t.parent_id = '1' THEN"+
						" 	t.id"+
						" 	ELSE"+
						" 		t.parent_id"+
						" 	END,"+
						" 	 t.id";
		List<Record> list = Db.find(sql);
		return list;
	}
	/**
	 * 查询废物类别
	 */
	public List<Record> findChuFeiList(String parentId){
		String sql="select id,name from sys_dict_pcr where type='waste_type' and parent_id='"+parentId+"' and del_flag='0'";
		List<Record> list = Db.find(sql);
		return list;
	}

}
