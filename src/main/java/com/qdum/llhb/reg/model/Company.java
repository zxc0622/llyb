package com.qdum.llhb.reg.model;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.sys.utils.UserUtils;

/**
 * 个人信息类
 * 
 * @author wf
 *
 */
public class Company extends Model<Company> {
	private static final long serialVersionUID = 1L;
	public static Company dao = new Company();

	public static final String COMPANY_NAME = "company_name";
	public static final String USER_ID = "user_id"; // 用户Id
	public static final String CONTACT = "contact";
	public static final String EMAIL = "email";
	public static final String PHONE = "phone";
	public static final String CREATE_BY = "create_by"; // 字典表中的用户类型
	public static final String CREATE_DATE = "create_date";

	public void setCompanyName(String name) {
		set(COMPANY_NAME, name);
	}

	public String getCompanyName() {
		return get(COMPANY_NAME);
	}

	public void setContact(String name) {
		set(CONTACT, name);
	}

	public String getContact() {
		return get(CONTACT);
	}

	public void setEmail(String name) {
		set(EMAIL, name);
	}

	public String getEmail() {
		return get(EMAIL);
	}

	public void setPhone(String name) {
		set(PHONE, name);
	}

	public String getPhone() {
		return get(PHONE);
	}

	public void setCreateBy(long name) {
		set(CREATE_BY, name);
	}

	public long getCreateBy() {
		return getLong(CREATE_BY);
	}

	public Date getCreateDate() {
		return (Date) get(CREATE_DATE);
	}

	public void setCreateDate(Date createDate) {
		set(CREATE_DATE, createDate);
	}

	public Company findXinxi(long userId) {// u.facePic,
		String sql = "SELECT sc.*,su.login_name,su.password,su.type,su.name,su.create_by,su.create_date,su.update_date,su.email,su.del_flag FROM sys_company sc LEFT JOIN sys_user su on sc.user_id=su.id WHERE su.del_flag='0' AND sc.user_id=?";
		return Company.dao.findFirst(sql, userId);
	}

	/**
	 * 个企首页，类型
	 */
	public Company findUsertypeByUserId(long userId) {
		String sql = "SELECT IF(c.type IS NULL,0,1) as type FROM sys_company c INNER JOIN sys_user u ON c.user_id=u.id AND u.del_flag='0' WHERE c.del_flag='0' AND c.user_id='"
				+ userId + "'";
		return this.findFirst(sql);
	}

	/**
	 * 企业类型
	 * 
	 * @param userId
	 * @return Company 如果是环保公司,type为1,其他为0
	 */
	public Company findCompanytypeByUserId(long userId) {
		String sql = "SELECT case when c.type='5' then 1 else 0 end type FROM sys_company c INNER JOIN sys_user u ON c.user_id=u.id AND u.del_flag='0' WHERE c.del_flag='0' AND c.auth_flag='1' AND c.user_id='"
				+ userId + "'";
		return this.findFirst(sql);
	}

	/**
	 * 取公司的名
	 */
	public Record getCompanyNameLoginName(long uid) {
		StringBuffer sb = new StringBuffer();
		sb.append(
				"SELECT IFNULL(c.company_name,u.login_name) as name FROM sys_company c LEFT JOIN sys_user u on u.id=c.user_id WHERE c.user_id=? and c.del_flag='0'");
		return Db.findFirst(sb.toString(), uid);
	}

	public List<Record> getAuthCompany() {
		String sql = "SELECT *from sys_company p where p.type = '4' and p.auth_flag = '1' and p.del_flag = '0' ";
		return Db.find(sql);
	}

	/**
	 * 根据名称查询环保公司
	 * 
	 * @param company_name
	 *            如果为null查询所有的环保公司
	 * @return
	 */
	public List<Record> getHbCompany(String company_name) {
		String cn = " and p.company_name like '%" + company_name + "%'";
		StringBuffer sql = new StringBuffer(
				"SELECT * from sys_company p where p.type = '5' and p.auth_flag = '1' and p.del_flag = '0' ");
		if (company_name != null && company_name.length() > 0) {
			sql.append(cn);
		}
		return Db.find(sql.toString());
	}
	
	/**
	 * 根据名称查询环保公司，或者分页查询
	 * @param company_name 公司名
	 * @param pageNumber 页码
	 * @param pageSize 页面大小
	 * @return
	 */
	public Page<Record> getHbCompanyByPage(String company_name,int pageNumber, int pageSize) {
		String select = "SELECT * ";
		String sqlExceptSelect = "from sys_company p where p.type = '5'"
				+ " and p.auth_flag = '1' and p.del_flag = '0'";
		if (StringUtils.isNotBlank(company_name)) {
			sqlExceptSelect = sqlExceptSelect + " and p.company_name like '%" + company_name + "%'";
		}
		return Db.paginate(pageNumber, pageSize, select, sqlExceptSelect);
	}

	/**
	 * 推荐服务
	 * 
	 * @param hbfwIds
	 * @param company_ids
	 * @return
	 */
	public boolean recommend(String[] hbfwIds, String[] companyIds) {
		int size = 0;
		for (int i = 0; i < hbfwIds.length; i++) {
			for (int j = 0; j < companyIds.length; j++) {
				String sql = "insert into t_requirement_company(requirement_id,user_id)  " + "select '" + hbfwIds[i]
						+ "',su.id from sys_company sc inner join sys_user su on sc.user_id = su.id where sc.id ="
						+ companyIds[j] + "";
				Db.update(sql);
				size++;
			}
		}
		return size > 0;
	}
	
	/**
	 * 推荐服务
	 * 
	 * @param hbfwIds 需求id数组
	 * @param company_id 环保公司企业id
	 * @return
	 */
	public boolean recommend_v2(String[] hbfwIds, String companyId) {
		int size = 0;
		long userid = UserUtils.getUser().getId();
		Calendar cd = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String ctime = sdf.format(cd.getTime());
		cd.add(Calendar.DAY_OF_YEAR, 1);
		String otime =  sdf.format(cd.getTime());
		for (int i = 0; i < hbfwIds.length; i++) {
			String sql1 = "INSERT INTO t_requirement_company ( requirement_id, user_id, create_by, create_date )"
					+ " SELECT "+hbfwIds[i]+", su.id, "+userid+", '"+ctime+"' FROM sys_company sc"
					+ " INNER JOIN sys_user su ON sc.user_id = su.id WHERE sc.id = "+companyId;
			String sql2 = "UPDATE t_requirement SET push_flag=1,push_overdue_date='"+otime+"' WHERE id="+hbfwIds[i];
			Db.update(sql1);//记录推送
			Db.update(sql2);//更新需求
			size++;
		}
		return size > 0;
	}
	
	/**
	 * 删除推荐
	 * 
	 * @param hbId
	 *            环保需求id
	 */
	public void deleteRecomComp(String hbId) {
		String sql = "delete from t_requirement_company  where requirement_id = " + hbId;
		Db.update(sql);
	}

	/**
	 * 通过用户id查询公司信息
	 * 
	 * @param userId
	 * @return
	 * @date 2016年5月16日下午4:37:50
	 */
	public Record getCompanyByUserId(String userId) {
		String sql = "select su.name,sp.sex,sp.phone per_phone,sa1.name pro_name,sa2.name city_name,sc.* from sys_user su left join sys_company sc on su.id = sc.user_id "
				+ " left join sys_person sp on sp.user_id =su.id  left join sys_area sa1 on sc.loc_prov_id = sa1.id"
				+ " left join sys_area sa2  on sc.loc_city_id = sa2.id where sc.user_id = " + userId
				+ " and sc.del_flag=0";
		return Db.findFirst(sql);
	}
	/**
	 * 通过企业id查询企业
	 * @param company_id
	 * @return
	 * @date 2016年5月24日下午2:50:07
	 */
	public Record getCompanyById(String company_id){
		String sql = "select * from sys_company sc where sc.del_flag = 0  and sc.id=" + company_id;
		return Db.findFirst(sql);
	}
	
	/**
	 * 获取所有的企业
	 * @param paraToInt
	 * @param yeshu 
	 * @param company_name
	 * @return
	 * @date 2016年5月27日上午10:29:46
	 */
	public Page<Record> getFullRecords(Integer pageNumber, int pageSize, String company_name) {
		StringBuffer sqlExceptSelect = new StringBuffer(" from sys_company sc where sc.del_flag=0 ");
		String sqlOrder = " order by sc.create_date ";
		String sqlCompanyName = " and sc.company_name like '%"+company_name+"%'";
		if(company_name!=null&&company_name.length()>0){
			sqlExceptSelect.append(sqlCompanyName);
		}
		sqlExceptSelect.append(sqlOrder);
		return Db.paginate(pageNumber, pageSize, "select sc.* ", sqlExceptSelect.toString());
	}
}
