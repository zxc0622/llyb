package com.qdum.llhb.hyzl.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.sys.model.Role;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

/**
 * 企业实体
 */
public class CompanyZl extends Model<CompanyZl> {

    private static final long serialVersionUID = 1L;
    public static CompanyZl dao = new CompanyZl();

    public static final String ID = "id";
    public static final String USERID = "user_id";//当前用户ID
    public static final String HBCOMPANYTYPE = "hbCompany_type";//环保公司的类型，sys_dict表type为hbCompany_type的value值，可多选，逗号隔开
    public static final String COMPANYNAME = "company_name";//公司名称
    public static final String ENTERPRISETYPE = "company_type_id";//公司类型
    public static final String PERFORMIMG = "perform_img";//形象照片
    public static final String LOGOIMG = "logo_img";//logo照片
    public static final String SHENG = "loc_prov_id"; //省
    public static final String SHI = "loc_city_id"; //市
    public static final String ADDRESS = "address";//公司地址
    public static final String POSTALCODE = "postal_code";//邮政编码
    public static final String PHONEENTERPRISE = "phone";//电话
    public static final String COMPANYFAX = "fax";//公司传真
    public static final String EMAIL = "email";//邮箱
    public static final String LICENSEIMG = "license_img";//营业执照
    public static final String COMPANYURL = "company_url";//公司网址
    public static final String CATEGORY = "category_id";//行业类别
    public static final String MAJOR = "major";//主营业务
    public static final String COMPANYCODE = "company_code";//组织机构代码
    public static final String QUALIMG = "qual_img";//资质证书
    public static final String WASTE = "waste_type_first";//处废一级菜单
    public static final String ZJCFNAME = "waste_type_second";//处废二级菜单
    public static final String ZJCFNAME3 = "waste_type_third";//处废三级菜单
    public static final String DELFLAG = "del_flag";
    public static final String AUTHFLAG = "auth_flag";
    public static final String CREATEDATE = "create_date";//创建时间
    public static final String CREATEBY = "create_by";//创建人
    public static final String XMAPCODE = "loc_x";//X坐标
    public static final String YMAPCODE = "loc_y";//Y坐标
    public static final String TYPE = "type";//用户状态
    public static final String UPDATEDATE = "update_date";//更新时间

    public void setId(Long id) {
        set(ID, id);
    }

    public Long getId() {
        return getLong(ID);
    }

    public void setType(String type) {
        set(TYPE, type);
    }

    public String getType() {
        return get(TYPE);
    }
    
    public void setHbcompanytype(String hbcompanytype) {
        set(HBCOMPANYTYPE, hbcompanytype);
    }

    public String getHbcompanytype() {
        return get(HBCOMPANYTYPE);
    }

    public void setUserid(Long userid) {
        set(USERID, userid);
    }

    public Long getUserid() {
        return getLong(USERID);
    }

    public String getCompanyname() {
        return get(COMPANYNAME);
    }

    public void setCompanyname(String companyName) {
        set(COMPANYNAME, companyName);
    }

    public String getEnterprisetype() {
        return get(ENTERPRISETYPE);
    }

    public void setEnterprisetype(String enterpriseType) {
        set(ENTERPRISETYPE, enterpriseType);
    }

    public String getPerformimg() {
        return get(PERFORMIMG);
    }

    public void setPerformimg(String performImg) {
        set(PERFORMIMG, performImg);
    }

    public String getLogoimg() {
        return get(LOGOIMG);
    }

    public void setLogoimg(String logoImg) {
        set(LOGOIMG, logoImg);
    }

    public Long getSheng() {
        return getLong(SHENG);
    }

    public void setSheng(Long sheng) {
        set(SHENG, sheng);
    }

    public Long getShi() {
        return get(SHI);
    }

    public void setShi(Long shi) {
        set(SHI, shi);
    }

    public String getAddress() {
        return get(ADDRESS);
    }

    public void setAddress(String address) {
        set(ADDRESS, address);
    }

    public String getPostalcode() {
        return get(POSTALCODE);
    }

    public void setPostalcode(String postalCode) {
        set(POSTALCODE, postalCode);
    }

    public String getPhoneenterprise() {
        return get(PHONEENTERPRISE);
    }

    public void setPhoneenterprise(String phoneEnterprise) {
        set(PHONEENTERPRISE, phoneEnterprise);
    }

    public String getCompanyfax() {
        return get(COMPANYFAX);
    }

    public void setCompanyfax(String companyFax) {
        set(COMPANYFAX, companyFax);
    }

    public String getEmail() {
        return get(EMAIL);
    }

    public void setEmail(String email) {
        set(EMAIL, email);
    }

    public String getLicenseimg() {
        return get(LICENSEIMG);
    }

    public void setLicenseimg(String licenseImg) {
        set(LICENSEIMG, licenseImg);
    }

    public String getCompanyurl() {
        return get(COMPANYURL);
    }

    public void setCompanyurl(String companyUrl) {
        set(COMPANYURL, companyUrl);
    }

    public Long getCategory() {
        return get(CATEGORY);
    }

    public void setCategory(Long category) {
        set(CATEGORY, category);
    }

    public String getMajor() {
        return get(MAJOR);
    }

    public void setMajor(String major) {
        set(MAJOR, major);
    }

    public String getCompanycode() {
        return get(COMPANYCODE);
    }

    public void setCompanycode(String companyCode) {
        set(COMPANYCODE, companyCode);
    }

    public String getQualimg() {
        return get(QUALIMG);
    }

    public void setQualimg(String qualImg) {
        set(QUALIMG, qualImg);
    }

    public Long getWaste() {
        return get(WASTE);
    }

    public void setWaste(Long waste) {
        set(WASTE, waste);
    }

    public Long getZjcfname() {
        return get(ZJCFNAME);
    }

    public void setZjcfname(Long zjcfName) {
        set(ZJCFNAME, zjcfName);
    }

    public Long getZjcfname3() {
        return get(ZJCFNAME3);
    }

    public void setZjcfname3(Long zjcfName3) {
        set(ZJCFNAME3, zjcfName3);
    }

    public Integer getDelflag() {
        return get(DELFLAG);
    }

    public void setDelflag(Integer delFlag) {
        set(DELFLAG, delFlag);
    }

    public Integer getAuthflag() {
        return get(AUTHFLAG);
    }

    public void setAuthflag(Integer authFlag) {
        set(AUTHFLAG, authFlag);
    }

    public String getCreatedate() {
        return get(CREATEDATE);
    }

    public void setCreatedate(String createDate) {
        set(CREATEDATE, createDate);
    }

    public String getUpdatedate() {
        return get(UPDATEDATE);
    }

    public void setUpdatedate(String updateDate) {
        set(UPDATEDATE, updateDate);
    }

    public Long getCreateby() {
        return get(CREATEBY);
    }

    public void setCreateby(Long createby) {
        set(CREATEBY, createby);
    }

    public String getXmapcode() {
        return get(XMAPCODE);
    }

    public void setXmapcode(String Xmapcode) {
        set(XMAPCODE, Xmapcode);
    }

    public String getYmapcode() {
        return get(YMAPCODE);
    }

    public void setYmapcode(String Ymapcode) {
        set(YMAPCODE, Ymapcode);
    }

    /**
     * 查询公司资料
     *
     * @return
     */
    public List<CompanyZl> findCompany(Long userId) {
        String sql = "select * from sys_company where user_id='" + userId + "' and type is not null  and type !='' and del_flag='0'";
        return find(sql);
    }

    /**
     * 查询公司资料
     *
     * @return
     */
    public List<Record> findCompanyR(Long userId) {
        String sql = "select * from sys_company where user_id='" + userId + "' and del_flag='0'";
        return Db.find(sql);
    }

    /**
     * 根据公司名称查询企业
     */
    public List<Record> findCompanyName(String name) {
        String sql = "select * from sys_company where type is not null  and type !='' and del_flag='0' ";
        if (name != null && !(name.equals(""))) {
            sql += " and company_name like '%" + name + "%'";
        }
        return Db.find(sql);
    }

    /**
     * 查询公司资料
     *
     * @return
     */
    public List<CompanyZl> findCompanyS(String id) {
        String sql = "select * from sys_company where id='" + id + "' and del_flag='0'";
        return find(sql);
    }

    /**
     * 查询公司资料 详细版
     */
    public List<Record> findCompanys(Long userId) {
        String sql = "select " +
                " t.company_name as companyname," +
                " t.address AS address," +
                " t.company_type_id as enterprisetype," +
                " t.phone as phoneenterprise," +
                " t.major," +
                " t.fax as companyfax," +
                " t.email," +
                " t.license_img as licenseimg," +
                " t.company_url as companyurl," +
                " t.postal_code as postalcode," +
                " t.contact," +
                " s.name," +
                " a.name AS username" +
                " from sys_company t " +
                " left join sys_dict_pcr s" +
                " on t.category_id =s.id" +
                " LEFT JOIN sys_user a" +
                " on t.user_id=a.id" +
                " where t.user_id='" + userId + "'";
        return Db.find(sql);
    }

    /**
     * 首页-查询公司资料 详细版
     */
    public List<Record> findCompanysSY(Long userId) {
        String sql = "select " +
                " t.company_name as companyname," +
                " t.address AS address," +
                " t.company_type_id as enterprisetype," +
                " t.phone as phoneenterprise," +
                " t.major," +
                " t.fax as companyfax," +
                " t.email," +
                " t.logo_img as logoimg," +
                " t.license_img as licenseimg," +
                " t.company_url as companyurl," +
                " t.postal_code as postalcode," +
                " t.perform_img as performImg," +
                " t.contact," +
                " t.registered_fund as resfund," +
                " s.name," +
                " a.name AS username," +
                " a.id AS userId, " +
                " a.login_name AS loginname," +
                " b.name as prov," +
                " c.name as city," +
                " d.phone as personPhone," +
                " d.show_phone as showPhone," +
                " d.real_name as realName," +
                " f.shop_desc as shopDesc," +
                " f.jingying_type as jingyingType," +
                " f.seo_setting as page_desc," +
                " f.key_words as seo_key_words" +
                " from sys_company t " +
                " left join sys_dict_pcr s" +
                " on t.category_id =s.id" +
                " and s.del_flag='0'" +
                " LEFT JOIN sys_user a" +
                " on t.user_id=a.id" +
                " and a.del_flag='0'" +
                " LEFT JOIN sys_area b ON t.loc_prov_id=b.id" +
                " AND b.del_flag='0'" +
                " LEFT JOIN sys_area c ON t.loc_city_id=c.id" +
                " AND c.del_flag='0'" +
                " LEFT JOIN sys_person d on a.id=d.user_id" +
                " and d.del_flag='0'" +
                " LEFT JOIN cs_settings_basic f ON a.id=f.user_id" +
                " and f.del_flag='0'" +
                " where t.id=?" +
                " and t.del_flag='0'";
        return Db.find(sql, userId);
    }

    /**
     * 查询公司资料 详细版 根据企业ID查询
     */
    public List<Record> findCompanyIds(String userId) {
        String sql = "select " +
                " t.company_name as companyname," +
                " t.address AS address," +
                " t.user_id AS userId," +
                " t.user_id AS usid," +
                " t.company_type_id as enterprisetype," +
                " t.phone as phoneenterprise," +
                " t.major," +
                " t.fax as companyfax," +
                " t.email," +
                " t.license_img as licenseimg," +
                " t.company_url as companyurl," +
                " t.postal_code as postalcode," +
                " t.contact," +
                " s.name," +
                " a.login_name AS username" +
                " from sys_company t " +
                " left join sys_dict_pcr s" +
                " on t.category_id =s.id" +
                " and s.del_flag='0'" +
                " LEFT JOIN sys_user a" +
                " on t.user_id=a.id" +
                " and a.del_flag='0'" +
                " where t.id='" + userId + "'" +
                " and t.del_flag='0'";
        return Db.find(sql);
    }

    /**
     * 查询所有企业信息
     */
    public Page<Record> searchAllCompany(int pageNumber, int pageSize, String authFlag, String companyName, String companyType) {
        String sql = "";
        sql = " from sys_company t " +
                " left join sys_dict_pcr s" +
                " on t.category_id =s.id" +
                " and s.del_flag='0'" +
                " LEFT JOIN sys_user a" +
                " on t.user_id=a.id" +
                " and a.del_flag='0'" +
                " LEFT JOIN sys_area b ON t.loc_prov_id=b.id" +
                " AND b.del_flag='0'" +
                " LEFT JOIN sys_area c ON t.loc_city_id=c.id" +
                " AND c.del_flag='0'" +
                " LEFT JOIN sys_person d on a.id=d.user_id" +
                " and d.del_flag='0'" +
                " LEFT JOIN cs_settings_basic f ON a.id=f.user_id" +
                " and f.del_flag='0'" +
                " LEFT JOIN (select e.user_id,e.del_flag,max(e.create_date) create_date from sys_company_approve e  where  e.del_flag='0'  group by e.user_id ,e.del_flag) e ON t.user_id=e.user_id" +
                " and e.del_flag='0'" +
                " where t.del_flag='0'" +
                " and t.auth_flag='" + authFlag + "'";
        if (companyName != null && !(companyName.equals(""))) {
            sql += " and ( t.company_name like '%" + companyName + "%'";
            sql += "  OR a.`name` LIKE '%" + companyName + "%'";
            sql += "  OR b.`name` LIKE '%" + companyName + "%'";
            sql += "  OR c.`name` LIKE '%" + companyName + "%'";
            sql += "  OR s.`name` LIKE '%" + companyName + "%'";
            sql += "  OR DATE_FORMAT(t.create_date, '%Y-%m-%d') LIKE '%" + companyName + "%'";
            sql += " )";
        }
        if (companyType != null && !(companyType.equals("0")) && !(companyType.equals("")) && !(companyType.equals("null"))) {
            sql += " and t.type='" + companyType + "'";
        }
        sql += " and t.type is not null";
        sql += " and t.type !=''";
        if ("1".equals(authFlag)) {
            sql += " order by approveDate desc";
        } else {
            sql += " order by t.create_date desc";
        }

        return Db.paginate(pageNumber, pageSize, "select t.id,t.user_id as userId,t.company_name as companyname,t.type,b.name as prov,c.name as city,s.name,DATE_FORMAT(t.create_date, '%Y-%m-%d') as createDate,a.name as userName,DATE_FORMAT(e.create_date, '%Y-%m-%d') as approveDate", sql);
    }

    /**
     * 更新或插入
     *
     * @param
     */
    public void saveorUpdate(CompanyZl company) {

        User user = UserUtils.getUser();
        List<Record> list = CompanyZl.dao.findCompanyR(user.getId());
        if (list.isEmpty()) {
            company.save();
            updateNewuserMoney(user.getId());
        } else {
            Record record = list.get(0);
            int auth_flag = record.getInt("auth_flag");

            String sql = "update sys_company set  " +
                    " hbCompany_type ='" + company.getHbcompanytype() + "' ," +
                    " company_name ='" + company.getCompanyname() + "' ," +
                    " email ='" + company.getEmail() + "', " +
                    " phone ='" + company.getPhoneenterprise() + "', " +
                    " company_type_id ='" + company.getEnterprisetype() + "', " +
                    " type ='" + company.getType() + "', " +
                    " perform_img ='" + company.getPerformimg() + "', " +
                    " logo_img ='" + company.getLogoimg() + "', " +
                    " loc_prov_id ='" + company.getSheng() + "', " +
                    " loc_city_id ='" + company.getShi() + "', " +
                    " address ='" + company.getAddress() + "', " +
                    " postal_code ='" + company.getPostalcode() + "', " +
                    " fax ='" + company.getCompanyfax() + "', " +
                    " license_img ='" + company.getLicenseimg() + "', " +
                    " company_url ='" + company.getCompanyurl() + "', " +
                    " category_id ='" + company.getCategory() + "', " +
                    " major ='" + company.getMajor() + "', " +
                    " waste_type_first ='" + company.getWaste() + "', " +
                    " waste_type_second ='" + company.getZjcfname() + "', " +
                    " waste_type_third ='" + company.getZjcfname3() + "', " +
                    " company_code ='" + company.getCompanycode() + "', " +
                    " loc_x ='" + company.getXmapcode() + "', " +
                    " loc_Y ='" + company.getYmapcode() + "', " +
                    " qual_img ='" + company.getQualimg() + "', " +
                    " update_date ='" + company.getCreatedate() + "' ";

            //当之前的提交未通过,再次进行修改后,将auth_flag从-1 --> 0
            if (auth_flag == -1) {
                sql = sql + ", auth_flag = '" +0+"' ";
            }
            sql = sql + " where user_id='" + user.getId() + "'";
            Db.update(sql);
        }
    }

    /**
     * 更新用户角色
     *
     * @param userID
     * @param roleType
     * @return
     */
    public Boolean updateUserRole(long userID, String roleType) {
        //1.删除用户的企业角色
        Role.dao.deleteUserCompRoles(userID);
        //2.绑定用户的企业角色
        Role role = Role.dao.findRoleByName(getRoleNameByType(roleType));
        User user = Role.dao.assignUserToRole(userID, role.getId());
        return Boolean.TRUE;
    }

    /**
     * 通过类别获取角色名称
     *
     * @param roleType
     * @return
     */
    private String getRoleNameByType(String roleType) {
        if ("3".equals(roleType)) {
            return "产废企业";
        } else if ("4".equals(roleType)) {
            return "处置企业";
        } else if ("5".equals(roleType)) {
            return "环保企业";
        } else if ("6".equals(roleType)) {
            return "其他";
        }
        return null;


    }

    /**
     * 方法getCompanyByType的功能描述:获取环保业务提供商
     *
     * @author yaoyt
     * @time 16/3/28 下午2:33
     */
    public List<Record> getCompanyByType(String type, int i) {
        StringBuffer sb = new StringBuffer();
        sb.append(" select s.id,s.company_name as name,s.perform_img,s.logo_img as img,s.hbType,if(s.update_date,s.create_date,s.update_date) as time,c.shop_desc ");
        sb.append(" from sys_company s left join cs_settings_basic c on s.user_id = c.user_id where s.del_flag = 0 and s.type is not null ");
        if (null != type && !"".equals(type) && !"undefined".equals(type)) {
            sb.append("  and s.hbType like '%").append(type).append("%' ");
        } else {
            sb.append("  and s.hbType is not null");
        }
        sb.append(" order by time desc limit 0,").append(i);
        return Db.find(sb.toString());
    }

    /**
     * 方法getRandomCompanyByType的功能描述:获取随机环保业务提供商
     *
     * @author yaoyt
     * @time 4/11/16 5:06 PM
     */
    public Page<Record> getRandomCompanyByType(String type, int i, int pageNum) {

        StringBuffer sb = new StringBuffer();
        sb.append(" select s.id,s.company_name as name,s.perform_img,s.logo_img as img,s.hbType,if(s.update_date,s.create_date,s.update_date) as time,c.shop_desc ");
        sb.append(" from sys_company s left join cs_settings_basic c on s.user_id = c.user_id where s.del_flag = 0 and s.type is not null ");
        if (null != type && !"".equals(type) && !"undefined".equals(type)) {
            sb.append("  and s.hbType like '%").append(type).append("%' ");
        } else {
            sb.append("  and s.hbType is not null");
        }
        sb.append(" ");
        return Db.paginate(pageNum, i, "select * ", "from ( " + sb.toString() + " ) b order by time desc");
    }

    /**
     * 方法getNewHbNum的功能描述:获取当月新增环保供求数量
     *
     * @author yaoyt
     * @time 16/3/28 下午6:21
     */
    public String getNewHbNum() {
        StringBuffer sb = new StringBuffer();
        sb.append(" select sum(o.num) num from ( ");
        sb.append(" select count(*) as num from t_requirement c ");
        sb.append(" where c.create_date >= DATE_ADD(curdate(),interval -day(curdate())+1 day) ");
        //sb.append(" union all ");
        //sb.append(" select count(*) as num from eq_monitor_record e ");
        //sb.append(" where e.create_date >= DATE_ADD(curdate(),interval -day(curdate())+1 day) ");
        //sb.append(" union all ");
        //sb.append(" select count(*) as num from eq_eia_record r ");
        //sb.append(" where r.create_date >= DATE_ADD(curdate(),interval -day(curdate())+1 day) ) o");
        sb.append(" ) o");
        return Db.find(sb.toString()).get(0).get("num").toString();
    }

    /**
     * 方法insertNewuserMoney功能描述:给每位Newuser赠送1000元友谊币.
     *
     * @author zhangwn
     */
    public void updateNewuserMoney(Long id) {
        String sql = "UPDATE sys_user u set u.money='1000' WHERE u.del_flag='0' and u.id=" + id;
        Db.update(sql);
    }
}
