package com.qdum.llhb.qykCustom.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

/**
 * 企业自定义-服务案例
 */
public class SysCompanyCustomServiceCase extends
		Model<SysCompanyCustomServiceCase> {

	private static final long serialVersionUID = 1L;
	public static SysCompanyCustomServiceCase dao = new SysCompanyCustomServiceCase();

	/**
	 * 查询前8条案例信息
	 * @param userID
	 * @return
	 */
	public List<Record> getCaseByUserID(Long userId){
		String sql = "SELECT * FROM inma_case_info WHERE (user_id =? AND sta =2 AND del_flag = 0) ORDER BY create_date DESC LIMIT 8";
		return Db.find(sql,userId);
	}

	//根据服务类型的id查询案例
	public List<Record> getCaseByTypeID(long userId, String type_id){
		String sql = "SELECT * FROM inma_case_info WHERE user_id=? "
				+ " AND type_id2 = ? AND del_flag=0;";
		return Db.find(sql,userId,type_id);
	}
	
}
