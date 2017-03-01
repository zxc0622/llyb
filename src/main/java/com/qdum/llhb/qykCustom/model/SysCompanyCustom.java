package com.qdum.llhb.qykCustom.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

/**
 * 企业自定义表
 */
public class SysCompanyCustom extends Model<SysCompanyCustom> {

	private static final long serialVersionUID = 1L;
	public static SysCompanyCustom dao = new SysCompanyCustom();
	private SysCompanyCustom sysCompanyCustom;

	/**
	 * 根据企业id获取自定义信息
	 * 
	 * @param companyId
	 *            企业id
	 * @return
	 */
	public List<SysCompanyCustom> getCustomMsg(int companyId) {
		List<SysCompanyCustom> customMsg = dao
				.find("select * from sys_company_custom where "
						+ "company_id=? and show_flag=1 and del_flag=0 order by seq",
						companyId);
		return customMsg;
	}
	
	//获取企业模块类型
	public Integer [] getModuleTypeArray(int companyId){
		List<SysCompanyCustom> customMsg = dao
		.find("select module_type from sys_company_custom where "
				+ "company_id=? and show_flag=1 and del_flag=0 order by seq",
				companyId);
		Integer[] moduleTypeArray=new Integer[11];
		int length=customMsg.size();
		for (int i=0;i<length;i++) {
			moduleTypeArray[i]=customMsg.get(i).getInt("module_type");
		}
		return moduleTypeArray;
	}

	/**
	 * 获取企业的具体模块信息
	 * 
	 * @param companyId
	 *            企业id
	 * @param moduleTypeCode
	 *            模块类型代码
	 * @return
	 */
	public SysCompanyCustom getModuleMsg(Object companyId, int moduleTypeCode) {
		return dao.findFirst(
				"select * from sys_company_custom where company_id=? "
						+ "and show_flag=1 and del_flag=0 and module_type=?",
				companyId, moduleTypeCode);
	}

	/**
	 * 更新common字段
	 * 
	 * @return
	 */
	public boolean updateCommonById(int id, String value) {
		sysCompanyCustom = dao.findById(id);
		sysCompanyCustom.set("common", value);
		return sysCompanyCustom.update();
	}

	/**
	 * 根据企业id和模块类型获取信息
	 * 
	 * @param companyId 企业id
	 * @param moduleTypeCode 模块类型代码
	 * @return 
	 */
	public SysCompanyCustom getCustomMsg(int companyId,
			int moduleTypeCode) {
		sysCompanyCustom = dao
				.findFirst(
						"select * from sys_company_custom where company_id=? and module_type=?",
						companyId, moduleTypeCode);
		return sysCompanyCustom;
	};
	
	/**
	 * 根据用户id获取shop_id
	 * @param userId 用户Id
	 * @return
	 */
	public String getShopIdByUserId(long userId){
		String sql = "SELECT id FROM cs_settings_basic WHERE user_id=? AND del_flag = 0";
		List<Record> r = Db.find(sql,userId);
		if(r.isEmpty()){
			return null;
		}else{
			return r.get(0).getLong("id").toString();
		}
	}

	/**
	 * 根据企业id和模块类型更新模块的显示状态
	 * @param companyId 企业id
	 * @param moduleType 模块类型
	 * @param showFlag 是否显示
	 * @return
	 */
	public boolean updateShowFlag(long companyId,int moduleType,int showFlag){
		String sql = "UPDATE sys_company_custom SET show_flag=? WHERE"
				+ " company_id=? AND module_type=? AND del_flag=0";
		int result = Db.update(sql,showFlag,companyId,moduleType);
		if(result > 0){
			return true;
		}else{
			return false;
		}
	} 
	
	/**
	 * 根据企业id获取用户隐藏的模块
	 * @param companyId
	 *            企业id
	 * @return
	 */
	public List<Record> hideModules(int companyId) {
		List<Record> customMsg = Db.find("select a.id,b.label module_type from sys_company_custom a " +
						"left join sys_dict b on a.module_type=b.`value` " +
						"where b.type='module_type' and a.company_id=? and a.show_flag=0 " +
						"and a.del_flag=0 order by a.seq",
						companyId);
		return customMsg;
	}
}
