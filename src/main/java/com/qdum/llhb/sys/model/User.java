package com.qdum.llhb.sys.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.NumberUtil;

public class User extends Model<User> {
	/**
	 * +-------------+--------------+------+-----+---------+----------------+ |
	 * Field | Type | Null | Key | Default | Extra |
	 * +-------------+--------------+------+-----+---------+----------------+ |
	 * id | bigint(20) | NO | PRI | NULL | auto_increment | | login_name |
	 * varchar(100) | YES | MUL | NULL | | | password | varchar(100) | YES | |
	 * NULL | | | type | int(1) | YES | | NULL | | | name | varchar(15) | YES |
	 * | NULL | | | login_ip | varchar(100) | YES | | NULL | | | login_date |
	 * datetime | YES | | NULL | | | on_state | int(1) | YES | | 0 | | |
	 * create_by | bigint(20) | YES | | NULL | | | create_date | datetime | YES
	 * | | NULL | | | update_by | bigint(20) | YES | | NULL | | | update_date |
	 * datetime | YES | MUL | NULL | | | email | varchar(50) | YES | | NULL | |
	 * | remarks | varchar(255) | YES | | NULL | | | del_flag | int(1) | YES |
	 * MUL | 0 | |
	 * +-------------+--------------+------+-----+---------+----------------+ 15
	 * rows in set
	 */
	private static final long serialVersionUID = 1L;
	public static final User dao = new User();

	public static final String ID = "id";
	public static final String OFFICE_ID = "office_id";
	public static final String COMPANY_ID = "company_id";
	public static final String LOGIN_NAME = "login_name";
	public static final String TYPE = "type"; // 字典表中的用户类型
	public static final String PASSWORD = "password";
	public static final String NAME = "name";
	public static final String ON_STATE = "on_state"; // 当前使用状态
	public static final String REMARKS = "remarks";
	public static final String HEAD_OFFICE = "head_office";
	public static final String DEL_FLAG = "del_flag";
	public static final String LOGIN_IP = "login_ip";
	public static final String LOGIN_DATE = "login_date";
	public static final String OPENID = "openid";
	public static final String CREATE_BY = "create_by"; // 创建人
	public static final String UPDATE_BY = "update_by"; // 修改人
	public static final String CREATE_DATE = "create_date"; // 创建人
	public static final String UPDATE_DATE = "update_date"; // 修改人
	public static final String OPERATOR_CODE = "operator_code"; // 业务员唯一编码
	public static final String HEAD_IMG = "head_img"; // 头像
	public static final String EMAIL = "email";
	public static final String EMAIL_VALIDATE_CODE = "email_validate_code";// 邮箱验证码
	public static final String EMAIL_VERIFY = "email_verify";// 邮箱是否通过
	public static final String MONEY = "money";// 优蚁币

	public BigDecimal getMoney() {
		return get(MONEY);
	}

	public void setMoney(BigDecimal money) {
		set(MONEY, money);
	}

	public static String getEmail() {
		return EMAIL;
	}

	public void setEmail(String email) {
		set(EMAIL, email);
	}

	public static String getEmailValidateCode() {
		return EMAIL_VALIDATE_CODE;
	}

	public void setEmailValidateCode(String email_validate_code) {
		set(EMAIL_VALIDATE_CODE, email_validate_code);
	}

	public static String getEmailVerify() {
		return EMAIL_VERIFY;
	}

	public void setEmailverify(Integer email_verify) {
		set(EMAIL_VERIFY, email_verify);
	}

	public String getHeadImg() {
		return getStr(HEAD_IMG);
	}

	public void setHeadImg(String headImg) {
		set(HEAD_IMG, headImg);
	}

	public void setOperatorCode(String operatorCode) {
		set(OPERATOR_CODE, operatorCode);
	}

	public String getOperatorCode() {
		return getStr(OPERATOR_CODE);
	}

	public void setId(Long id) {
		set(ID, id);
	}

	public Long getId() {
		return getLong(ID);
	}

	public Long getOfficeId() {
		return getLong(OFFICE_ID);
	}

	public void setOfficeId(Long officeId) {
		set(OFFICE_ID, officeId);
	}

	public Long getCompanyId() {
		return getLong(COMPANY_ID);
	}

	public void setCompanyId(Long companyId) {
		set(COMPANY_ID, companyId);
	}

	public void setName(String name) {
		set(NAME, name);
	}

	public String getName() {
		return get(NAME);
	}

	public void setType(Integer type) {
		set(TYPE, type);
	}

	public Integer getType() {
		return get(TYPE);
	}

	public void setLoginName(String login_name) {
		set(LOGIN_NAME, login_name);
	}

	public String getLoginName() {
		return get(LOGIN_NAME);
	}

	public void setPassword(String password) {
		set(PASSWORD, password);
	}

	public String getPassword() {
		return get(PASSWORD);
	}

	public Integer getOnState() {
		return get(ON_STATE);
	}

	public void setOnState(Integer onState) {
		set(ON_STATE, onState);
	}

	public void setRemarks(String remarks) {
		set(REMARKS, remarks);
	}

	public String getRemarks() {
		return get(REMARKS);
	}

	public void setHeadOffice(Integer headOffice) {
		set(HEAD_OFFICE, headOffice);
	}

	public Integer getHeadOffice() {
		return NumberUtil.toInteger(get(HEAD_OFFICE));
	}

	public void setDelFlag(Integer delFlag) {
		set(DEL_FLAG, delFlag);
	}

	public Integer getDelFlag() {
		return NumberUtil.toInteger(get(DEL_FLAG));
	}

	public void setLoginIp(String loginIp) {
		set(LOGIN_IP, loginIp);
	}

	public String getLoginIp() {
		return get(LOGIN_IP);
	}

	public void setLoginDate(Date loginDate) {
		set(LOGIN_DATE, loginDate);
	}

	public Date getLoginDate() {
		return (Date) get(LOGIN_DATE);
	}

	public Long getCreateBy() {
		return getLong(CREATE_BY);
	}

	public void setCreateBy(Long createBy) {
		set(CREATE_BY, createBy);
	}

	public Date getCreateDate() {
		return (Date) get(CREATE_DATE);
	}

	public void setCreateDate(Date createDate) {
		set(CREATE_DATE, createDate);
	}

	public Long getUpdateBy() {
		return getLong(UPDATE_BY);
	}

	public void setUpdateBy(Long createBy) {
		set(UPDATE_BY, createBy);
	}

	public Date getUpdateDate() {
		return getDate(UPDATE_DATE);
	}

	public void setUpdateDate(Date createDate) {
		set(UPDATE_DATE, createDate);
	}

	public String getOpenId() {
		return get(OPENID);
	}

	public void setOpenId(String openId) {
		set(OPENID, openId);
	}

	public boolean isAdmin() {
		return isAdmin(this.getId());
	}

	public static boolean isAdmin(Long id) {
		return id != null && id.equals(1L);
	}

	/**
	 * 根据登录名找到相应的用户
	 * 
	 * @param username
	 *            登录名 <表中登录名需要唯一>
	 * @return
	 */
	public User findByUsername(String username) {
		User user = User.dao
				.findFirst(
						"select * from sys_user where login_name=? and del_flag = 0 and on_state= 0",
						username);
		return user;
	}

	public User findByUsernameOrPhone(String username) {
		User user = User.dao
				.findFirst(
						"select u.* from sys_user u left join sys_person p on u.id = p.user_id where (login_name=? or p.phone = ? or u.email = ?) and u.del_flag = 0 and u.on_state= 0 and ( u.email_verify is null or u.email_verify = 1)",
						username, username, username);
		return user;
	}

	/**
	 * 根据登录名找到相应的用户
	 * 
	 * @param username
	 *            登录名 <表中登录名需要唯一>,Id 用户id
	 * @return
	 */
	public User findByUsernameByAjax(String username, Long id) {
		String sql = "select * from sys_user where login_name=? and del_flag = 0";
		if (id != null) {
			sql += " and id !=" + id;
		}
		User user = User.dao.findFirst(sql, username);
		return user;
	}

	/**
	 * 获取指定角色下的所有用户
	 * 
	 * @param roleId
	 * @return
	 */
	public List<User> findByRoleId(Long roleId) {
		List<User> user = User.dao
				.find("select * from sys_user_role sur LEFT JOIN sys_user su on sur.user_id = su.id where sur.role_id = ?",
						roleId);
		return user;
	}

	/**
	 * 删除用户所有角色关联
	 */
	public void removeAllRole() {
		Db.update("delete from sys_user_role where user_id=? ", getId());
	}

	/**
	 * 建立角色权限关联
	 * 
	 * @param roleIds
	 */
	public void addAllRole(List<Long> roleIds) {
		for (int i = 0; i < roleIds.size(); i++) {
			Db.update(
					"INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (?, ?);",
					getId(), roleIds.get(i));
		}
	}

	/**
	 * 建立角色权限关联
	 * 
	 * @param roleIds
	 */
	public void addAllRole(Long[] roleIds) {
		for (int i = 0; i < roleIds.length; i++) {
			Db.update(
					"INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (?, ?);",
					getId(), roleIds[i]);
		}
	}

	/**
	 * 根据用户的id建立角色权限关联
	 */
	public Boolean addRole(Long roleId, Long id) {
		if (id == null) {
			int i = Db
					.update("INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (?, ?);",
							getId(), roleId);
			return i > 0;
		} else {
			Db.update(
					"update `sys_user_role` set user_id=?,role_id=? where user_id=?",
					getId(), roleId, getId());
			return true;
		}
	}

	/**
	 * 检索菜单列表
	 * 
	 * @return
	 */
	public List<Menu> getMenuList() {
		if (isAdmin()) {
			return Menu.dao.findAllList();
		} else {
			return Menu.dao.findByUserId(getId());
		}
	}

	/**
	 * 获取用户权限名称集合
	 * 
	 * @return
	 */
	public String getRoleNames() {
		List<Role> roles = Role.dao.findByUserId(getId());
		String roleNames = "";
		for (int i = 0; i < roles.size(); i++) {
			if (i == 0) {
				roleNames = roleNames + roles.get(i).getName();
			} else {
				roleNames = roleNames + "," + roles.get(i).getName();
			}
		}
		return roleNames;
	}

	/**
	 * 获取用户所有角色ID
	 * 
	 * @return
	 */
	public String getRoleIds() {
		List<Role> roles = Role.dao.findByUserId(getId());
		String roleIds = "";
		for (int i = 0; i < roles.size(); i++) {
			if (i == 0) {
				roleIds = roleIds + roles.get(i).getId();
			} else {
				roleIds = roleIds + "," + roles.get(i).getId();
			}
		}
		return roleIds;
	}

	/**
	 * 根据roleId获得用户Id
	 * 
	 * @param roleId
	 * @return
	 */
	public String getUserIds(Long roleId) {
		List<User> users = findByRoleId(roleId);
		String userIds = "";
		for (int i = 0; i < users.size(); i++) {
			if (i == 0) {
				userIds = userIds + users.get(i).getId();
			} else {
				userIds = userIds + "," + users.get(i).getId();
			}
		}
		return userIds;
	}

	/**
	 * 对用户进行保存
	 */
	public Boolean save(User user) {

		if (user.getId() == null || user.getId() == 0L) {
			user.save();
		} else {
			user.update();
		}
		return true;
	}

	/**
	 * 通过部门id获取该部门所有员工的信息
	 */
	public List<User> findByOfficeId() {
		return User.dao.find("select * from sys_user where office_id =? ",
				getOfficeId());
	}

	/**
	 * 当保存客户信息时，根据帐号电话查询电话是否唯一
	 * 
	 * @param mobile
	 */

	public List<User> getUserByMobile(Long mobile) {
		return User.dao
				.find("select mobile from sys_user where mobile =?  and del_flag = '0'",
						mobile);
	}

	/**
	 * 当修改客户信息时，根据帐号电话查询电话是否唯一
	 * 
	 * @param
	 */
	public List<User> updateUserByMobile(Long mobile, Long id) {
		return User.dao
				.find("select mobile from sys_user where mobile=? and id!=? and del_flag = '0'",
						mobile, id);
	}

	/**
	 * 通过login_name来查询查询用户
	 * 
	 * @param mobile
	 * @return
	 */
	public List<User> getUserByLoginName(String mobile) {
		String sql = "select * from sys_user where login_name like '%" + mobile
				+ "%'";
		List<User> users = User.dao.find(sql);
		return users;
	}

	/**
	 * 微信端通过openId获得用户
	 * 
	 * @param openId
	 * @return user
	 */
	public User getUserByOpenId(String openId) {
		String sql = "select * from sys_user where del_flag=0 and openid='"
				+ openId + "'";
		User user = User.dao.findFirst(sql);
		return user;
	}

	/**
	 * 通过companyId获得所有用户信息
	 */
	public List<User> getAllHeadOffice(Long companyId) {
		return User.dao
				.find("SELECT * FROM sys_user WHERE company_id = ? AND head_office = '1' ORDER BY head_office DESC",
						companyId);
	}

	/**
	 * 查询人员
	 */
	public Person getPerson() {
		return Person.dao.findFirst("select * from sys_person where user_id = "
				+ getId() + " and del_flag = 0");
	}

	/**
	 * 根据login_name来获得id
	 */
	public User getIdByName(String name) {
		String sql = "SELECT id FROM sys_user WHERE del_flag='0' and login_name='"
				+ name + "'";
		return User.dao.findFirst(sql);
	}

	/**
	 * 获取信息
	 * 
	 * @param id
	 * @return
	 */
	public List<Record> getMemberMessage(long id) {
		String sql = "SELECT u.id,u.login_name AS loginName,u.on_state AS sta,"
				+ "IFNULL(c.company_name,'') AS cname,IFNULL(c.address,'') "
				+ "as address,IFNULL(c.tel,'') as tel,IFNULL(p.real_name,'') "
				+ "AS realName,p.auth_flag AS authFlag,"
				+ "p.sex,IFNULL(p.phone,'') as phone FROM sys_user u "
				+ "LEFT JOIN sys_person p on u.id=p.user_id "
				+ "LEFT JOIN sys_company c ON u.id=c.user_id AND c.del_flag='0'"
				+ "WHERE u.del_flag='0' AND p.del_flag='0' AND  " + "u.id='"
				+ id + "' ";
		return Db.find(sql);
	}

	/**
	 * 审核列表信息
	 */
	public Page<Record> getCheckLists(int pageNumber, int pageSize,
			String leibie, String title, String con) {
		String sql = " FROM sys_user su LEFT JOIN sys_person p on su.id=p.user_id and p.del_flag='0' LEFT JOIN sys_company sc on sc.user_id=su.id LEFT JOIN sys_person_approve pa on pa.user_id=su.id WHERE su.del_flag='0' and sc.type is NULL and p.auth_flag='"
				+ con + "' ";
		if (leibie != null && !leibie.equals("")) {
			sql += " and su.type='" + leibie + "'";
		}
		if (title != null && !title.equals("")) {
			sql += " and (su.login_name LIKE '%" + title
					+ "%' or su.`name` LIKE '%" + title + "%')";
		}
		if (con.equals("0")) {
			sql += " ORDER BY IFNULL(su.update_date,su.create_date) desc";
		} else {
			sql += " ORDER BY IFNULL(pa.create_date,'') desc";
		}
		return Db
				.paginate(
						pageNumber,
						pageSize,
						"SELECT su.id as uid, IFNULL(su.update_date,su.create_date) as time, su.*,p.phone,pa.*,pa.create_date as dates ",
						sql);
	}

	public Record getUserPerson(String uid) {
		String sql = "SELECT su.*,su.id as uid,p.*,p.id as pid,a.`name` as aname,s.`name` as sname FROM sys_user su LEFT JOIN sys_person p on p.user_id=su.id and p.del_flag='0' LEFT JOIN sys_area a on p.loc_prov_id=a.id LEFT JOIN sys_area s ON p.loc_city_id=s.id WHERE su.del_flag='0' and su.id=?";
		return Db.findFirst(sql, uid);
	}

	/**
	 * 环评报价
	 */
	public List<Record> getComplex() {
		String sql = "SELECT * FROM(SELECT @num :=1 AS num,e.name,e.create_date as date, e.pro_name,e.comp_name,h.header_type_name AS hname,a.`name` as aname,aa.`name` as aaname FROM "
				+ " eq_eia_record e   LEFT JOIN sys_area a  on a.id=e.prov_id and a.del_flag='0' LEFT JOIN sys_area aa"
				+ " ON aa.id=e.city_id AND aa.del_flag='0' LEFT JOIN t_offer_header h on h.header_id=e.pro_header  WHERE  e.del_flag='0' and e.pro_name is not NULL "
				+ " UNION SELECT @num :=2 AS num,e.name,e.create_date as date,e.pro_name,e.comp_name,h.Survey_header_type_name as hname,a.`name` as aname,aa.`name` as"
				+ " aaname FROM eq_monitor_record e  LEFT JOIN sys_area a  on a.id=e.prov_id and a.del_flag='0' LEFT JOIN sys_area aa ON aa.id=e.city_id AND aa.del_flag='0' LEFT JOIN"
				+ "  t_survey_header h ON h.Survey_header_id = e.pro_header WHERE  e.del_flag='0' and e.pro_name is not NULL ) as m ORDER BY m.date desc LIMIT 0,20";

		return Db.find(sql);

	}

	/**
	 * 根据环保类型查找需求
	 */

	public List<Record> getRequirementByen(String envrioment) {
		String sql = "SELECT *from t_requirement r WHERE r.del_flag = '0' and r.remarks= ? ORDER BY r.create_date desc limit 0,10";
		return Db.find(sql, envrioment);
	}

	/**
	 * 根据requirementId获取环保业务需求详情.
	 */
	public Record getRequirementById(String id) {
		String sql = "SELECT *from t_requirement r WHERE r.id = ?";
		return Db.findFirst(sql, id);

	}

	/**
	 * 后台首页信息 zhangxm
	 */
	public Record getIndexInfo(Long id) {
		String sql = "SELECT u.id, u.login_name AS loginName, u.`name` AS uname,IF(c.type IS NULL,'个人','企业') AS label,"
				+ " IF(c.type IS NULL,pe.dataCompletion,ce.dataCompletion) AS dataCompletion, pe.personauth, "
				+ "c.youyi_flag AS youauth, c.auth_flag AS comauth,u.head_img as headImg,u.operator_code FROM sys_user AS u "
				+ "INNER JOIN sys_company AS c ON u.id = c.user_id AND c.del_flag = '0' "
				+ "LEFT JOIN ( SELECT (IF (ISNULL(p.email), 0, 60) + IF (p.dept='' OR p.dept IS NULL, 0, 10) +"
				+ " IF (p.pro_title='' OR p.pro_title IS NULL, 0, 10) + IF (p.qq_num='' OR p.qq_num IS NULL, 0, 10) +"
				+ " IF (p.auth_flag = 0, 0, 10) ) AS dataCompletion, p.user_id, p.auth_flag AS personauth "
				+ "FROM sys_person p WHERE p.del_flag = '0' AND p.user_id = '"
				+ id
				+ "') AS pe ON u.id = pe.user_id "
				+ "LEFT JOIN (SELECT (IF(com.company_name IS NULL,0,20)+IF(com.company_type_id IS NULL,0,50)+ "
				+ "IF(com.perform_img IS NULL OR com.perform_img='',0,5) + IF(com.logo_img IS NULL "
				+ "OR com.logo_img='',0,5)+ IF(com.postal_code IS NULL OR com.postal_code='',0,5) + "
				+ "IF(com.fax IS NULL OR com.fax='',0,5) + IF(com.email IS NULL OR com.email='',0,5) + "
				+ "IF(com.company_url IS NULL OR com.company_url='',0,5)"
				+ ") AS dataCompletion,com.user_id AS uid "
				+ "FROM sys_company com WHERE com.user_id='"
				+ id
				+ "' AND com.del_flag='0') ce ON ce.uid=u.id "
				+ " LEFT JOIN sys_user_qq qq on u.id = qq.`user_id` and qq.`del_flag` = '0' "
				+ "WHERE u.del_flag = '0' AND u.id ='" + id + "'";
		return Db.findFirst(sql);
	}

	/**
	 * 获取用户列表分页
	 * 
	 * @author zhaoyl
	 * @time 2015年12月4日16:30:36
	 */
	public Page<Record> getUserList(int pageNumber, int pageSize,
			String account, String name, String phone, String type) {
		String select = "SELECT (@rownum:=@rownum+1) row_num, sp.user_id sp_userid, sp.phone sp_phone, n_d.label n_label, n_u.*";
		String sqlExceptSelect = "from (select @rownum:=0)r, (SELECT  if(sc.type is NULL,0,1)u_r, if(sc.type is NULL,su.type,sc.type)n_type, sc.id sc_id, sc.user_id sc_user_id, su.type su_type, sc.type sc_type, su.* from sys_company sc right JOIN sys_user su ON sc.user_id=su.id) n_u "
				+ "LEFT JOIN (SELECT *from sys_dict d1 WHERE d1.del_flag=0 and d1.type='user_type') n_d ON n_d.value = n_u.n_type "
				+ "LEFT JOIN sys_person sp ON sp.user_id = n_u.id "
				+ "where n_u.del_flag=0 ";
		if (account != null && !"".equals(account)) {
			sqlExceptSelect += " AND n_u.login_name like '%" + account + "%'";
		}
		if (name != null && !"".equals(name)) {
			sqlExceptSelect += " AND n_u.name like '%" + name + "%'";
		}
		if (phone != null && !"".equals(phone)) {
			sqlExceptSelect += " AND sp.phone like '%" + phone + "%'";
		}
		if (type != null && !"".equals(type)) {
			sqlExceptSelect += " AND n_u.n_type = '" + type + "'";
		}
		return Db.paginate(pageNumber, pageSize, select, sqlExceptSelect);
	}

	/**
	 * 方法getNewUsers的功能描述:获取
	 * 
	 * @author yaoyt
	 * @time 15/12/29 下午2:03
	 */
	public Page<Record> getNewUsers(Integer pageNumber, int pageSize,
			String startTime, String endTime, String account, String name,
			String type) {
		StringBuffer sb = new StringBuffer();
		sb.append(" from ( ");
		sb.append(" select u.id,u.login_name,c.company_name,IF(c.type is null,'个人','企业') as leibie, ");
		sb.append(" u.create_date,IF(c.type is null,u.name,c.contact) as lxr,p.phone,c.phone as tel, ");
		sb.append(" u.email,c.id as c_id  from sys_user u  ");
		sb.append(" left join sys_company c on u.id = c.user_id ");
		sb.append(" left join sys_person p on u.id = p.user_id ");
		sb.append(" ) c ");
		sb.append(" where 1 = 1");
		if (null != startTime && !"".equals(startTime)) {
			sb.append(" and c.create_date >= '").append(startTime).append("'");
		}
		if (null != endTime && !"".equals(endTime)) {
			sb.append(" and c.create_date <= '").append(endTime)
					.append(" 23:59:59'");
		}
		if (null != account && !"".equals(account)) {
			sb.append(" and c.login_name like '%").append(account).append("%'");
		}
		if (null != name && !"".equals(name)) {
			sb.append(" and c.lxr like '%").append(name).append("%'");
		}
		if (null != type && !"".equals(type)) {
			sb.append(" and c.leibie = '").append(type).append("'");
		}

		sb.append(" order by c.create_date desc");
		return Db.paginate(pageNumber, pageSize, "select * ", sb.toString());

	}

	/**
	 * 根据ID查看此需求环保信息.
	 * 
	 * @author zhangwn
	 */
	public Record getEnviromentById(String id) {
		String sql = "SELECT *from t_requirement r WHERE r.id=" + id;
		return Db.findFirst(sql);

	}

	/**
	 * 根据环保需求ID查看此信息被查看的次数.
	 * 
	 * @author zhangwn
	 */
	public Record getEnviromentCountById(String id) {
		String sql = "SELECT count(DISTINCT c.user_id) AS usercount FROM sys_youyi_cost_record c WHERE c.hb_id = "
				+ id;
		return Db.findFirst(sql);
	}

	/**
	 * 方法updateSalesmanCode的功能描述:更新用户的业务员编码
	 * 
	 * @author yaoyt
	 * @time 16/1/12 上午9:57
	 */
	public void updateSalesmanCode(User user, String salesmanCode) {
		StringBuffer sb = new StringBuffer();
		sb.append(" update sys_user set operator_code = ? where id = ? and del_flag = '0'");
		Db.update(sb.toString(), salesmanCode, user.getId());
	}

	/**
	 * 方法findByPhoneNum的功能描述:根据手机号查询用户
	 * 
	 * @author yaoyt
	 * @time 16/3/14 下午3:41
	 */
	public User findByPhoneNum(String phone) {
		StringBuffer sb = new StringBuffer();
		sb.append(" select u.* from sys_user u left join sys_person p on u.id = p.user_id where (p.phone = ? or u.login_name = ?)  and u.del_flag = '0' and u.on_state = '0'");
		return dao.findFirst(sb.toString(), phone, phone);
	}

	public Record findUserByNameOrPhone(String nameOrPhone) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(" select * from sys_user u left join sys_person p on u.id = p.user_id  where u.del_flag = '0' and (u.login_name = ? or p.phone = ?)");
		Record r = Db.findFirst(buffer.toString(), nameOrPhone, nameOrPhone);
		return r;
	}

	/**
	 * 方法findUserByEmail的功能描述：查询是否为激活用户
	 */
	public Record findUserByEmail(String email, Integer email_verify) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(" select * from sys_user u left join sys_person p on u.id = p.user_id  where u.del_flag = '0' and (u.login_name = ?  or u.email= ?) and email_verify = ?");
		Record r = Db.findFirst(buffer.toString(), email, email, email_verify);
		return r;
	}

	/**
	 * 方法findUserByValidatecodeAndEmailcode功能表述:查询用户
	 */
	public List<Record> findUserByValidatecodeAndEmailcode(String validatecode,
			String emailcode) {
		String sql = " SELECT *from sys_user u where u.email_validate_code = '"
				+ validatecode + "'" + "and u.email='" + emailcode + "'";
		return Db.find(sql);
	}

	/**
	 * 方法updateUserByEmailAndcCode的功能描述：通过邮箱名和验证码更新用的email_verify字段
	 */
	public boolean updateUserByEmailAndcCode(String email,
			String email_validate_code) {
		int i = Db
				.update("update `sys_user` set email_verify=1 where email=? and email_validate_code=?",
						email, email_validate_code);
		return i > 0;
	}

	/**
	 * 方法updateUserByEmail的功能表述:更新用户
	 */
	public void updateUserByEmail(String password, String create_date,
			String validateCode, String email) {
		Db.update(
				"update `sys_user` set password =? , create_date=?,email_validate_code=?  where email = ?",
				password, create_date, validateCode, email);
	}

	/**
	 * 方法selectUserByEmail的功能描述：通过邮箱查询用户
	 */
	public Record selectUserByEmail(String email) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(" select *from sys_user u where u.del_flag='0' and u.email = ? ");
		Record r = Db.findFirst(buffer.toString(), email);
		return r;
	}

	/**
	 * 方法updateUserByEmail的功能描述：通过邮箱更新用户
	 */
	public boolean updateUserByEmail(String password, String email) {
		int flag = Db.update(
				"update `sys_user` set password = ? where email = ?", password,
				email);
		return flag > 0;
	}

	public static Record getContactInfo(Long userId) {
		StringBuffer sb = new StringBuffer();
		sb.append(" select u.id,u.email,p.phone from sys_user u left join sys_person p  on u.id = p.user_id where u.id = ? and u.del_flag = '0'");
		return Db.findFirst(sb.toString(), userId);
	}

	/**
	 * 根据用户Id获取用户.
	 */
	public Record getUserbyId(Long id) {
		String sql = "select *from sys_user u where u.id= " + id;
		return Db.findFirst(sql);
	}

	/**
	 * 根据时间和需求类型爱查找环保需求
	 * 
	 * @author zwn
	 * @date 2016-4-27 下午2:14:59
	 */
	public List<Record> getRequirementbyDate(String enviroment,
			String startTime, String endTime) {
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT *from  t_requirement r WHERE ");
		if (enviroment.equals("环保业务")) {
			// 不需要加条件.
			sb.append(" 1=1");
		} else {
			sb.append(" r.remarks='").append(enviroment).append("'");
		}
		sb.append(" and r.create_date>='").append(startTime).append("'");
		if (null != endTime && !"".equals(endTime)) {
			sb.append(" and r.create_date <= '").append(endTime)
					.append(" 23:59:59'");
		}
		sb.append(" and r.del_flag=0 and r.trade_status != '提交' limit 0,30");
		return Db.find(sb.toString());
	}

	/**
	 * 获得全部的环保类型.
	 * 
	 * @author zwn
	 * @date 2016-4-25 下午3:49:51
	 */
	public List<Record> getRequirementEn() {
		//String sql = "SELECT DISTINCT r.remarks  from t_requirement r WHERE r.del_flag = '0' ORDER BY r.create_date desc";
		String sql = "SELECT DISTINCT r.remarks from t_requirement r WHERE r.del_flag = '0'";
		return Db.find(sql);
	}

	/**
	 * 查看环保信息的公司有哪些.
	 * 
	 * @author zhangwn
	 */
	public List<Record> getCompanyName(String requireId) {
		String sql = "SELECT DISTINCT com.company_name FROM sys_company AS com RIGHT JOIN ( SELECT * FROM sys_youyi_cost_record c WHERE c.hb_id = ? ) AS y ON com.user_id = y.user_id ORDER BY y.id DESC";
		return Db.find(sql, requireId);
	}

	/**
	 * 查找环保需求,如果flag=true,查询30条记录.否则查询全部由记录.
	 * 
	 * @author zwn
	 * @date 2016-4-28 上午10:01:57
	 */
	public List<Record> getRequirement(boolean flag) {
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT *from t_requirement r WHERE r.del_flag = '0' and r.trade_status != '提交' ORDER BY r.create_date desc ");
		if (flag == true) {
			sb.append("limit 0, 30");
		}
		return Db.find(sb.toString());
	}

	public Page<Record> getgetRequirementEnByTime(Integer pageNumber,
			int pageSize, String enType, String startTime, String endTime) {
		StringBuffer sb = new StringBuffer();
		sb.append(" from t_requirement r WHERE r.del_flag = '0' ");
		if (null != enType && !"".equals(enType)) {
			sb.append(" and r.remarks= '").append(enType).append("'");
		}
		if (null != startTime && !"".equals(startTime)) {
			sb.append(" and r.create_date>=' ").append(startTime).append("'");
		}
		if (null != endTime && !"".equals(endTime)) {
			sb.append("and r.create_date<='").append(endTime)
					.append(" 23:59:59' ORDER BY r.create_date desc ");
		}
		return Db.paginate(pageNumber, pageSize, "select *", sb.toString());

	}

	/**
	 * 通过用户id查询手机号码
	 * 
	 * @param user_id
	 * @return
	 */
	public String findPhoneById(String user_id) {
		String sql = "select sp.phone from sys_user su inner join sys_person sp "
				+ "on su.id = sp.user_id where su.id =  " + user_id;
		return Db.findFirst(sql).get("phone");
	}

	public List<Record> findUserByType(String qunType) {
		String sql = "select distinct s.user_id from ( ";
		sql += " select s.user_id,ifnull(s.type,1) as s_type from sys_company s where s.del_flag = 0 ";
		sql += " ) s where s.s_type = ?";
		return Db.find(sql, qunType);
	}

	// 根据企业id获取用户信息
	public User getUserByCompanyId(Long companyId) {
		return dao
				.findFirst(
						"select a.* from sys_user a LEFT JOIN sys_company b on a.id=b.user_id  where b.id=?",
						companyId);
	}
}
