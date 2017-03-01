package com.qdum.llhb.productmana.model;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.google.common.collect.Lists;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.NumberUtil;
import com.qdum.llhb.sys.utils.DictUtils;

public class Product extends Model<Product> {

    private static final long serialVersionUID = 1L;
    public static final Product dao = new Product();

    public static final String ID = "id";
    public static final String TYPE_FIRST = "type_first";        //商品类型   1 2 3
    public static final String TYPE_SECOND = "type_second";
    public static final String TYPE_THIRD = "type_third";
    public static final String PRO_NAME = "pro_name";
    public static final String PROV_ID = "prov_id";        //省市id
    public static final String CITY_ID = "city_id";
    public static final String PRO_DESC = "pro_desc";
    public static final String PIC1 = "pic1";            //产品照片 1 2 3
    public static final String PIC2 = "pic2";
    public static final String PIC3 = "pic3";
    public static final String PAST_DATE = "past_date";        //过期时间
    public static final String LOW_PRICE = "low_price";
    public static final String HIGH_PRICE = "high_price";
    public static final String UNIT = "unit";            //单位
    public static final String AMOUNT = "amount";            //产品总量
    public static final String STA = "sta";            //审核状态
    public static final String PAGE_VIEW = "page_view";        //浏览量
    public static final String CREATE_BY = "create_by";        //创建人
    public static final String CREATE_DATE = "create_date";    //创建时间
    public static final String UPDATE_BY = "update_by";        //修改人
    public static final String UPDATE_DATE = "update_date";    //修改时间
    public static final String REMARKS = "remarks";
    public static final String DEL_FLAG = "del_flag";

    public static final String SEO_KEY_WORDS = "seo_key_words";
    public static final String PAGE_DESC = "page_desc";

    public String getSeoKeyWords() {
        return getStr(SEO_KEY_WORDS);
    }

    public String getPageDesc() {
        return getStr(PAGE_DESC);
    }

    public void setSeoKeyWords(String seoKeyWords) {
        set(SEO_KEY_WORDS, seoKeyWords);
    }

    public void setPageDesc(String pageDesc) {
        set(PAGE_DESC, pageDesc);
    }

    public int getId() {
        return getInt(ID);
    }

    public void setTypeFirst(long typeFirst) {
        set(TYPE_FIRST, typeFirst);
    }

    public long getTypeFirst() {
        return getLong(TYPE_FIRST);
    }

    public void setTypeSecond(long typeSecond) {
        set(TYPE_SECOND, typeSecond);
    }

    public long getTypeSecond() {
        return getLong(TYPE_SECOND);
    }

    public void setTypeThird(long typeThird) {
        set(TYPE_THIRD, typeThird);
    }

    public long getTypeThird() {
        return getLong(TYPE_THIRD);
    }

    public void setProName(String proName) {
        set(PRO_NAME, proName);
    }

    public String getProName() {
        return get(PRO_NAME);
    }

    public void setProvId(long provId) {
        set(PROV_ID, provId);
    }

    public long getProvId() {
        return getLong(PROV_ID);
    }

    public void setCityId(long cityId) {
        set(CITY_ID, cityId);
    }

    public long getCityId() {
        return getLong(CITY_ID);
    }

    public void setProDesc(String proDesc) {
        set(PRO_DESC, proDesc);
    }

    public String getProDesc() {
        return get(PRO_DESC);
    }

    public void setPicOne(String picOne) {
        set(PIC1, picOne);
    }

    public String getPicOne() {
        return get(PIC1);
    }

    public void setPicTwo(String picTwo) {
        set(PIC2, picTwo);
    }

    public String getPicTwo() {
        return get(PIC2);
    }

    public void setPicThree(String picThree) {
        set(PIC3, picThree);
    }

    public String getPicThree() {
        return get(PIC3);
    }

    public void setPastDate(Date pastDate) {
        set(PAST_DATE, pastDate);
    }

    public Date getPastDate() {
        return getDate(PAST_DATE);
    }

    public void setLowPrice(BigDecimal lowPrice) {
        set(LOW_PRICE, lowPrice);
    }

    public BigDecimal getLowPrice() {

        return getBigDecimal(LOW_PRICE);
    }

    public void setHighPrice(BigDecimal highPrice) {
        set(HIGH_PRICE, highPrice);
    }

    public BigDecimal getHighPrice() {
        return get(HIGH_PRICE);
    }

    public void setUnit(long unit) {
        set(UNIT, unit);
    }

    public long getUnit() {
        return getLong(UNIT);
    }

    public void setAmount(BigDecimal amount) {
        set(AMOUNT, amount);
    }

    public BigDecimal getAmount() {
        return get(AMOUNT);
    }

    public void setSta(int sta) {
        set(STA, sta);
    }

    public int getSta() {
        return getInt(STA);
    }

    public void setPageView(long pageView) {
        set(PAGE_VIEW, pageView);
    }

    public long getPageView() {
        return get(PAGE_VIEW);
    }

    public long getCreateBy() {
        return getLong(CREATE_BY);
    }

    public void setCreateBy(long createBy) {
        set(CREATE_BY, createBy);
    }

    public Date getCreateDate() {
        return (Date) get(CREATE_DATE);
    }

    public void setCreateDate(Date createDate) {
        set(CREATE_DATE, createDate);
    }

    public long getUpdateBy() {
        return getLong(UPDATE_BY);
    }

    public void setUpdateBy(long createBy) {
        set(UPDATE_BY, createBy);
    }

    public Date getUpdateDate() {
        return getDate(UPDATE_DATE);
    }

    public void setUpdateDate(Date createDate) {
        set(UPDATE_DATE, createDate);
    }

    public void setRemarks(String remarks) {
        set(REMARKS, remarks);
    }

    public String getRemarks() {
        return get(REMARKS);
    }

    public void setDelFlag(int delFlag) {
        set(DEL_FLAG, delFlag);
    }

    public int getDelFlag() {
        return NumberUtil.toInteger(get(DEL_FLAG));
    }

    /**
     * 通过创建人获取已发布商品
     */
    public List<Record> findByCreateBy(long id, long creteBy) {
        Date date = new Date();
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String curDate = sf.format(date);
        String sql = "select c.auth_flag, p.* from inma_product_info p "
                + "left join sys_company c on c.user_id = p.create_by "
                + "where p.del_flag=0 and p.sta=2 and p.past_date > '" + curDate + "' and p.id != ? and p.create_by=" + creteBy
                + " limit 0,12";
        return Db.find(sql, id);
    }
    
    /**
     * 通过创建人获取已发布商品详细版
     */
    public List<Record> findByCreateBy_v2(long id, long creteBy, int pageSize) {
        Date date = new Date();
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String curDate = sf.format(date);
        String sql = "SELECT c.auth_flag, a3. NAME AS prov, a4. NAME AS city, di. NAME AS fname, di2. NAME AS sname,"
        		+ " di3. NAME AS tname,	co.company_name, p.* FROM inma_product_info p LEFT JOIN sys_company c ON c.user_id = p.create_by"
        		+ " LEFT JOIN sys_area a3 ON p.prov_id = a3.id LEFT JOIN sys_area a4 ON p.city_id = a4.id"
        		+ " LEFT JOIN sys_dict_pcr di ON p.type_first = di.id"
        		+ " LEFT JOIN sys_dict_pcr di2 ON p.type_second = di2.id"
        		+ " LEFT JOIN sys_dict_pcr di3 ON p.type_third = di3.id "
        		+ " LEFT JOIN sys_company co ON p.create_by = co.user_id"
                + " where p.del_flag=0 and p.sta=2 and p.past_date > '" + curDate + "' and p.id != ? and p.create_by=" + creteBy
                + " limit 0,"+pageSize;
        return Db.find(sql, id);
    }

    /**
     * 通过商品类型获取已发布商品
     */
    public List<Record> findByType(long typeFirst, long createBy) {
        Date date = new Date();
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String curDate = sf.format(date);
        String sql = "select c.auth_flag, c.address, p.* from inma_product_info p "
                + "left join sys_company c on c.user_id = p.create_by "
                + "where p.del_flag=0 and p.sta=2 and p.past_date > '" + curDate + "' and p.type_first = " + typeFirst + " and p.create_by!=" + createBy
                + " order by rand() limit 0,12";
        return Db.find(sql);
    }

    /**
     * 通过id 查询  关联区域表 类型表
     */
    public List<Record> findAllInfo(long createBy, long id) {
        String sql = "SELECT sd.label unit_name, d1.name first_name, d1.id first_id, d2.name second_name, d2.id second_id, d3.name third_name, d3.id third_id,"
                + "a1.name prov_name, a1.id prov_id, a2.id city_id, a2.name city_name, p.* "
                + "FROM inma_product_info p "
                + "LEFT JOIN sys_dict_pcr d1 ON p.type_first = d1.id "
                + "LEFT JOIN sys_dict_pcr d2 ON p.type_second = d2.id "
                + "LEFT JOIN sys_dict_pcr d3 ON p.type_third = d3.id "
                + "LEFT JOIN sys_area a1 ON p.prov_id = a1.id "
                + "LEFT JOIN sys_area a2 ON p.city_id = a2.id "
                + "LEFT JOIN (select *from sys_dict where del_flag=0 and type='unit_type') sd ON p.unit = sd.value "
                + "WHERE p.del_flag=0 AND p.id = " + id;
        if (createBy != 0) {
            sql += " AND p.create_by = " + createBy;
        }
        return Db.find(sql);
    }


    /**
     * 查询商品总数
     */
    public List<Product> findCount(int sta, long createBy) {
        String sql = "select id ,past_date from inma_product_info "
                + "where del_flag=0 and sta=" + sta + " and create_by=" + createBy;
        return Product.dao.find(sql);
    }

    /**
     * 通过商品类型查询商品总数
     */
    public List<Product> findCountByTypeFirst(int sta, long createBy, long typeFirst) {
        String sql = "select id,past_date from inma_product_info "
                + "where del_flag=0 and sta=" + sta + " and create_by=" + createBy + " and type_first=" + typeFirst;
        return Product.dao.find(sql);
    }

    /**
     * 通过商品名称查询商品总数
     */
    public List<Product> findCountByProName(int sta, long createBy, String proName) {
        String sql = "select id,past_date from inma_product_info "
                + "where del_flag=0 and sta=" + sta + " and create_by=" + createBy + " and pro_name like '%" + proName + "%'";
        return Product.dao.find(sql);
    }

    /**
     * 通过商品类型和名称查询商品总数
     */
    public List<Product> findCountByTypeFirstAndProName(int sta, long createBy, long typeFirst, String proName) {
        String sql = "select id,past_date from inma_product_info "
                + "where del_flag=0 and sta=" + sta + " and create_by=" + createBy + " and type_first=" + typeFirst + " and pro_name like '%" + proName + "%'";
        return Product.dao.find(sql);
    }

    /**
     * 查询所有商品通过状态sta，并按时间降序排列
     * 未通过：0
     * 审核中：1
     * 审核通过：2
     */
    public List<Record> findProBySta(int sta, long createBy) {
        //	String sql = "select *from sys_area where (del_flag=0 and create_by=1) order by update_date desc limit 0,2";
        return Db.find("select *, IFNULL(update_date,create_date)time from inma_product_info where (del_flag=0 and sta=? and create_by=?) order by time desc", sta, createBy);
    }

    /**
     * 查询所有商品通过状态sta，并按时间降序排列 并分页
     */
    public List<Record> findProByStaPage(int sta, long createBy, int pageIndex, int num) {
        String sql = "select pcr.name,pro.*, IFNULL(pro.update_date,pro.create_date)time from inma_product_info pro,sys_dict_pcr pcr "
                + "where (pro.del_flag=0 and pro.sta=" + sta + " and pro.create_by=" + createBy + " and pro.type_first=pcr.id ) "
                + "ORDER BY time DESC,pro.create_date DESC LIMIT " + pageIndex + "," + num;
        return Db.find(sql);
    }

    /**
     * 通过商品类型查询和商品状态列表 并分页
     */
    public List<Record> findProByTypeFirst(int sta, long createBy, long typeFirst, int pageIndex, int num) {
        String sql = "select pcr.name,pro.*, IFNULL(pro.update_date,pro.create_date)time  from inma_product_info pro,sys_dict_pcr pcr "
                + "where (pro.del_flag=0 and pro.sta=" + sta + " and pro.create_by=" + createBy + " and pro.type_first=" + typeFirst + " and pro.type_first=pcr.id ) "
                + "ORDER BY time DESC,pro.create_date DESC LIMIT " + pageIndex + "," + num;
        return Db.find(sql);
    }

    /**
     * 通过商品名称查询审核中列表
     */
    public List<Record> findProByProName(int sta, long createBy, String proName, int pageIndex, int num) {
        String sql = "select pcr.name,pro.*, IFNULL(pro.update_date,pro.create_date)time  from inma_product_info pro,sys_dict_pcr pcr "
                + "where (pro.del_flag=0 and pro.sta=" + sta + " and pro.create_by=" + createBy + " and pro.type_first=pcr.id and pro.pro_name LIKE'%" + proName + "%') "
                + "ORDER BY time DESC,pro.create_date DESC LIMIT " + pageIndex + "," + num;
        return Db.find(sql);
    }

    /**
     * 通过商品类型和名称查询审核中列表
     */
    public List<Record> findProByTypeFirstAndProName(int sta, long createBy, long typeFirst, String proName, int pageIndex, int num) {
        String sql = "select pcr.name,pro.*, IFNULL(pro.update_date,pro.create_date)time  from inma_product_info pro,sys_dict_pcr pcr "
                + "where (pro.del_flag=0 and pro.sta=" + sta + " and pro.create_by=" + createBy + " and pro.type_first=" + typeFirst + " and pro.type_first=pcr.id and pro.pro_name LIKE'%" + proName + "%') "
                + "ORDER BY time DESC,pro.create_date DESC LIMIT " + pageIndex + "," + num;
        return Db.find(sql);
    }

    /**
     * 查询所有已发布商品，并按时间降序排列 并分页
     */
    public List<Record> findProIssue(int sta, long createBy, String curDate, int pageIndex, int num) {
        String sql = "select pcr.name,pro.*, IFNULL(pro.update_date,pro.create_date)time  from inma_product_info pro,sys_dict_pcr pcr "
                + "where (pro.del_flag=0 and pro.sta=" + sta + " and pro.create_by=" + createBy + " and pro.past_date>='" + curDate + "' and pro.type_first=pcr.id ) "
                + "ORDER BY time DESC,pro.create_date DESC LIMIT " + pageIndex + "," + num;
        return Db.find(sql);
    }

    /**
     * 通过发布商品类型查询和过期时间列表 并分页
     */
    public List<Record> findProByTypeFirstAndIssue(int sta, long createBy, String curDate, long typeFirst, int pageIndex, int num) {
        String sql = "select pcr.name,pro.*, IFNULL(pro.update_date,pro.create_date)time  from inma_product_info pro,sys_dict_pcr pcr "
                + "where (pro.del_flag=0 and pro.sta=" + sta + " and pro.create_by=" + createBy + " and pro.past_date>='" + curDate + "' and pro.type_first=" + typeFirst + " and pro.type_first=pcr.id ) "
                + "ORDER BY time DESC,pro.create_date DESC LIMIT " + pageIndex + "," + num;
        return Db.find(sql);
    }

    /**
     * 通过发布商品名称 过期时间查询审核中列表
     */
    public List<Record> findProByProNameAndIssue(int sta, long createBy, String curDate, String proName, int pageIndex, int num) {
        String sql = "select pcr.name,pro.*, IFNULL(pro.update_date,pro.create_date)time  from inma_product_info pro,sys_dict_pcr pcr "
                + "where (pro.del_flag=0 and pro.sta=" + sta + " and pro.create_by=" + createBy + " and pro.past_date>='" + curDate + "' and pro.type_first=pcr.id and pro.pro_name LIKE'%" + proName + "%') "
                + "ORDER BY time DESC,pro.create_date DESC LIMIT " + pageIndex + "," + num;
        return Db.find(sql);
    }

    /**
     * 通过发布商品类型和名称 过期时间查询审核中列表
     */
    public List<Record> findProByTypeFirstAndProNameAndIssue(int sta, long createBy, String curDate, long typeFirst, String proName, int pageIndex, int num) {
        String sql = "select pcr.name,pro.*, IFNULL(pro.update_date,pro.create_date)time  from inma_product_info pro,sys_dict_pcr pcr "
                + "where (pro.del_flag=0 and pro.sta=" + sta + " and pro.create_by=" + createBy + " and pro.past_date>='" + curDate + "' and pro.type_first=" + typeFirst + " and pro.type_first=pcr.id and pro.pro_name LIKE'%" + proName + "%') "
                + "ORDER BY time DESC,pro.create_date DESC LIMIT " + pageIndex + "," + num;
        return Db.find(sql);
    }

    /**
     * 查询所有已过期商品，并按时间降序排列 并分页
     */
    public List<Record> findProByPastDate(int sta, long createBy, String curDate, int pageIndex, int num) {
        String sql = "select pcr.name,pro.*, IFNULL(pro.update_date,pro.create_date)time  from inma_product_info pro,sys_dict_pcr pcr "
                + "where (pro.del_flag=0 and pro.sta=" + sta + " and pro.create_by=" + createBy + " and pro.past_date<'" + curDate + "' and pro.type_first=pcr.id ) "
                + "ORDER BY time DESC,pro.create_date DESC LIMIT " + pageIndex + "," + num;
        return Db.find(sql);
    }

    /**
     * 通过商品类型查询和过期时间列表 并分页
     */
    public List<Record> findProByTypeFirstAndPastDate(int sta, long createBy, String curDate, long typeFirst, int pageIndex, int num) {
        String sql = "select pcr.name,pro.*, IFNULL(pro.update_date,pro.create_date)time  from inma_product_info pro,sys_dict_pcr pcr "
                + "where (pro.del_flag=0 and pro.sta=" + sta + " and pro.create_by=" + createBy + " and pro.past_date<'" + curDate + "' and pro.type_first=" + typeFirst + " and pro.type_first=pcr.id ) "
                + "ORDER BY time DESC,pro.create_date DESC LIMIT " + pageIndex + "," + num;
        return Db.find(sql);
    }

    /**
     * 通过商品名称 过期时间查询审核中列表
     */
    public List<Record> findProByProNameAndPastDate(int sta, long createBy, String curDate, String proName, int pageIndex, int num) {
        String sql = "select pcr.name,pro.*, IFNULL(pro.update_date,pro.create_date)time  from inma_product_info pro,sys_dict_pcr pcr "
                + "where (pro.del_flag=0 and pro.sta=" + sta + " and pro.create_by=" + createBy + " and pro.past_date<'" + curDate + "' and pro.type_first=pcr.id and pro.pro_name LIKE'%" + proName + "%') "
                + "ORDER BY time DESC,pro.create_date DESC LIMIT " + pageIndex + "," + num;
        return Db.find(sql);
    }

    /**
     * 通过商品类型和名称 过期时间查询审核中列表
     */
    public List<Record> findProByTypeFirstAndProNameAndPastDate(int sta, long createBy, String curDate, long typeFirst, String proName, int pageIndex, int num) {
        String sql = "select pcr.name,pro.*, IFNULL(pro.update_date,pro.create_date)time  from inma_product_info pro,sys_dict_pcr pcr "
                + "where (pro.del_flag=0 and pro.sta=" + sta + " and pro.create_by=" + createBy + " and pro.past_date<'" + curDate + "' and pro.type_first=" + typeFirst + " and pro.type_first=pcr.id and pro.pro_name LIKE'%" + proName + "%') "
                + "ORDER BY time DESC,pro.create_date DESC LIMIT " + pageIndex + "," + num;
        return Db.find(sql);
    }
    /*================环保商城首页=============================== */

    /**
     * @param createBy   创建人
     * @param typeFirst  类型一
     * @param typeSecond 类型二
     * @param typeThird  类型三
     * @param name       产品名字
     * @param prov       省id
     * @param orderBy    排序条件
     * @param sort       排序方式（""为顺序  "DESC"为倒序）
     * @param pageIndex  分页开始
     * @param pageSize   每页条数
     * @author zhaoyl
     * @time 2015年11月2日11:35:47
     */
    public List<Record> findProduct(Object typeFirst, Object typeSecond, Object typeThird, String proName, Object provId, String orderBy, String sort, int pageIndex, int pageSize) {
        Date date = new Date();
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String curDate = sf.format(date);
        String sql = "SELECT sp.auth_flag per_flag, a.name prov_name, b.name city_name, c.id c_id, c.company_name, c.auth_flag, c.youyi_flag, c.x_flag, p.*, IFNULL(p.update_date,p.create_date) time "
                + ",((sp.auth_flag+0.5)*p.page_view) comprehensive "//此为综合排序算法，即（是否优蚁认证（1，0）+0.5）*访问量，在同商品的情况下，是否经过优蚁认证，权重将发生4.5倍的变化。可通过变换常量来减少或增加优蚁认证的权重
                + "from inma_product_info p "
                + "LEFT JOIN sys_company c ON p.create_by = c.user_id "
                + "LEFT JOIN sys_area a ON p.prov_id = a.id "
                + "LEFT JOIN sys_area b ON p.city_id = b.id "
                + "LEFT JOIN sys_person sp ON p.create_by = sp.user_id "
                + "WHERE  p.del_flag = '0' AND p.sta = 2 AND p.past_date > '" + curDate + "' ";
        if (typeFirst != null && !typeFirst.equals("")) {
            sql += " AND p.type_first=" + typeFirst;
        }
        if (typeSecond != null && !typeSecond.equals("")) {
            sql += " AND p.type_second=" + typeSecond;
        }
        if (typeThird != null && !typeThird.equals("")) {
            sql += " AND p.type_third=" + typeThird;
        }
        if (proName != null && !proName.equals("") && !proName.equals("undefined")) {
            sql += " AND p.pro_name LIKE '%" + proName + "%'";
        }
        if (provId != null && !provId.equals("")) {
            sql += " AND p.prov_id=" + provId;
        }
        if (orderBy != null && !orderBy.equals("") && !orderBy.equals("undefined")) {
            sql += " ORDER BY " + orderBy;
        }
        if (sort != null && !sort.equals("undefined") && orderBy != null && !orderBy.equals("")) {
            sql += " " + sort;
        }
        sql += " LIMIT " + pageIndex + "," + pageSize;
        List<Record> temp = Db.find(sql);
        for (int i = 0; i < temp.size(); i++) {
            if (temp.get(i).get("pro_desc") != null) {
                String con = temp.get(i).get("pro_desc").toString();
                temp.get(i).set("pro_desc", DictUtils.delHTMLTag(con));
            }
        }
        return temp;
    }

    /**
     * @param createBy   创建人
     * @param typeFirst  类型一
     * @param typeSecond 类型二
     * @param typeThird  类型三
     * @param name       产品名字
     * @param prov       省id
     * @param orderBy    排序条件
     * @param sort       排序方式（""为顺序  "DESC"为倒序）
     * @param pageIndex  分页开始
     * @param pageSize   每页条数
     * @author zhaoyl
     * @time 2015年11月2日11:35:47
     */
    public List<Product> findProductCount(Object typeFirst, Object typeSecond, Object typeThird, String proName, Object provId) {
        Date date = new Date();
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String curDate = sf.format(date);
        String sql = "SELECT id from inma_product_info "
                + "WHERE del_flag='0' AND sta = 2 AND past_date > '" + curDate + "' ";
        if (typeFirst != null && !typeFirst.equals("")) {
            sql += " AND type_first=" + typeFirst;
        }
        if (typeSecond != null && !typeSecond.equals("")) {
            sql += " AND type_second=" + typeSecond;
        }
        if (typeThird != null && !typeThird.equals("")) {
            sql += " AND type_third=" + typeThird;
        }
        if (proName != null && !proName.equals("") && !proName.equals("undefined")) {
            sql += " AND pro_name LIKE '%" + proName + "%'";
        }
        if (provId != null && !provId.equals("")) {
            sql += " AND prov_id=" + provId;
        }
        return Product.dao.find(sql);
    }

    /**
     * 根据企业ID 查询产品
     */
    public Page<Record> findPrdoductSupply(int pageNumber, int pageSize, String id) {
        String sql = "FROM" +
                " inma_product_info s" +
                " LEFT JOIN sys_company t ON s.create_by = t.user_id" +
                " AND t.del_flag = '0'" +
                " WHERE" +
                " s.del_flag = '0'" +
                " AND s.sta = '2'" +
                " AND t.id = '" + id + "'" +
                " order by s.create_date desc";
        return Db.paginate(pageNumber, pageSize, "select DATE_FORMAT(s.create_date, '%Y-%m-%d') as createDate,s.pro_name as proName,s.pic1,s.pic2,s.pic3,s.id", sql);
    }

    /**
     * 根据企业ID 查询产品最新10条
     */
    public List<Record> findPrdoductSupplyTen(String id) {
        String sql = "select DATE_FORMAT(s.create_date, '%Y-%m-%d') as createDate,s.pro_name as proName,s.pic1,s.pic2,s.pic3,s.id" +
                " FROM" +
                " inma_product_info s" +
                " LEFT JOIN sys_company t ON s.create_by = t.user_id" +
                " AND t.del_flag = '0'" +
                " WHERE" +
                " s.del_flag = '0'" +
                " AND s.sta = '2'" +
                " AND t.id = ?" +
                " order by s.create_date desc" +
                " LIMIT 10";
        return Db.find(sql, id);
    }
    /**
     * 查询热门产品
     */
    public List<Record> findHotPrdoducts() {
        String sql = "select t.id,t.pro_name,t.create_date,t.page_view "+
        " from inma_product_info t"+
        " order by t.page_view desc"+
        " limit 0,6";
        return Db.find(sql);
    }
	/*================环保商城详情=============================== */

    /**
     * 通过商品id查询 已发布的商品
     * 得到商品的详细信息
     */
    public Record findProById(long id) {
        String sql = "SELECT u.login_name, d1.label unit_label, cbf.cf_id, ps.id ps_id, ps.real_name, ps.sex ps_sex, ps.phone ps_phone, a3.name p_prov_name, a4.name p_city_name, d.name first_name, cp.*, p.* "
                + "FROM inma_product_info p "
                + "LEFT JOIN (SELECT a1.name c_prov_name, a2.name c_city_name,c.id c_id, c.company_name, c.user_id, c.tel c_tel, c.email c_email, c.phone c_phone, c.address c_address "
                + "FROM sys_company c "
                + "LEFT JOIN sys_area a1 ON c.loc_prov_id = a1.id "
                + "LEFT JOIN sys_area a2 ON c.loc_city_id = a2.id "
                + "WHERE c.del_flag = 0) cp ON p.create_by = cp.user_id "
                + "LEFT JOIN sys_area a3 ON p.prov_id = a3.id "
                + "LEFT JOIN sys_area a4 ON p.city_id = a4.id "
                + "LEFT JOIN sys_dict_pcr d ON p.type_first = d.id "
                + "LEFT JOIN sys_person ps ON p.create_by = ps.user_id "
                + "LEFT JOIN (SELECT cb.user_id, cf.id cf_id "
                + "FROM cs_manage_cer_faith cf "
                + "LEFT JOIN cs_settings_basic cb ON cb.id = cf.shop_id)cbf ON cbf.user_id = p.create_by "
                + "LEFT JOIN(SELECT *FROM sys_dict WHERE type ='unit_type') d1 ON d1.value = p.unit "
                + "LEFT JOIN sys_user u ON u.id = p.create_by "
                + "WHERE p.del_flag = 0 AND p.sta = 2 AND p.id = ?";
        return Db.findFirst(sql, id);
    }

    /**
     * 获取企业发布产品的数量
     */
    public List<Product> getCompanyPro() {
        Date date = new Date();
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String curDate = sf.format(date);
        String sql = "select count(*) count "
                + "from inma_product_info "
                + "where del_flag=0 and sta=2 and past_date>'" + curDate + "' "
                + "group by create_by order by count desc limit 0,10";
        return Product.dao.find(sql);
    }

    /**
     * 获取推荐企业
     */
    public List<Record> getRecommendCompany() {
        Date date = new Date();
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String curDate = sf.format(date);
        String sql = "SELECT c.id c_id, c.company_name, c.logo_img "
                + "FROM (SELECT count(*) count,p.create_by "
                + "from inma_product_info p "
                + "WHERE p.del_flag=0 AND p.sta=2 AND p.past_date > '" + curDate + "' "
                + "GROUP BY create_by ORDER BY count DESC LIMIT 0,10) pinfo "
                + "LEFT JOIN (SELECT *FROM sys_company WHERE del_flag=0) c ON pinfo.create_by = c.user_id ORDER BY count DESC";
        return Db.find(sql);
    }

    /**
     * 本月新增产品数 zhangxm
     */
    public Record getNowCount() {
        String sql = "SELECT COUNT(p.id) AS proNum FROM inma_product_info p " +
                "WHERE p.del_flag='0' AND p.sta='2' " +
                "AND p.create_date >=DATE_ADD(curdate(),interval -day(curdate())+1 day)";
        return Db.findFirst(sql);
    }

    /**
     * 首页展示列表 zhangxm
     */
    public List<Record> indexPageList(String typeFirst, String typeSecond, String title, String order, int pageSize) {
        String sql = "SELECT p.id,p.pro_name as title,p.pic1,p.pic2,p.pic3,p.low_price,p.page_view,IF(p.create_date>IFNULL(p.update_date,'')," +
                "p.create_date,p.update_date) AS time,c.company_name as cname,c.auth_flag as flag " +
                "FROM inma_product_info p " +
                "INNER JOIN sys_company c ON p.create_by=c.user_id AND c.del_flag='0' " +
                "WHERE p.del_flag='0' AND p.sta='2' AND p.past_date>=NOW() ";
        if (!"".equals(typeFirst) && !"unfefined".equals(typeFirst)) {
            sql += "AND p.type_first='" + typeFirst + "' ";
        }
        if (!"".equals(typeSecond) && !"unfefined".equals(typeSecond)) {
            sql += "AND p.type_second='" + typeSecond + "' ";
        }
        if (!"".equals(title) && !"unfefined".equals(title)) {
            sql += "AND p.pro_name like '%" + title + "%' ";
        }
        sql += " ORDER BY " + order + " limit 0," + pageSize;
        return Db.find(sql);
    }

    /**
     * 首页设备展示列表.
     */
    public List<Record> indexEqriList(String typeFirst, String typeSecond, String title, String order, int pageSize) {
        String sql = "SELECT p.id, p.pro_name AS title, p.pic1, p.pic2, p.pic3, p.low_price, p.page_view, IF ( p.create_date > IFNULL(p.update_date, ''), " +
                "p.create_date, p.update_date ) AS time, c.company_name AS cname, c.auth_flag AS flag, " +
                "1 AS ser FROM inma_product_info p INNER JOIN sys_company c ON p.create_by = c.user_id AND c.del_flag = '0'" +
                " WHERE p.del_flag = '0' AND p.sta = '2' AND p.past_date >= NOW() ";
        if (!"".equals(typeFirst) && !"unfefined".equals(typeFirst)) {
            sql += "AND p.type_first='" + typeFirst + "' ";
        }
        if (!"".equals(typeSecond) && !"unfefined".equals(typeSecond)) {
            sql += "AND p.type_second='" + typeSecond + "' ";
        }
        sql += "AND IF ( p.create_date > IFNULL(p.update_date, ''), p.create_date, p.update_date ) > date_add(now(), INTERVAL - 7 DAY) UNION ALL " +
                "SELECT p.id, p.pro_name AS title, p.pic1, p.pic2, p.pic3, p.low_price, p.page_view, IF ( p.create_date > IFNULL(p.update_date, ''), p.create_date, p.update_date ) " +
                " AS time, c.company_name AS cname, c.auth_flag AS flag, 2 FROM inma_product_info p INNER JOIN sys_company c ON p.create_by = c.user_id AND c.del_flag = '0' WHERE p.del_flag = '0' AND p.sta = '2' AND p.past_date >= NOW() ";

        if (!"".equals(typeFirst) && !"unfefined".equals(typeFirst)) {
            sql += "AND p.type_first='" + typeFirst + "' ";
        }
        if (!"".equals(typeSecond) && !"unfefined".equals(typeSecond)) {
            sql += "AND p.type_second='" + typeSecond + "' ";
        }
        sql += " AND IF ( p.create_date > IFNULL(p.update_date, ''), p.create_date, p.update_date ) < date_add(now(), INTERVAL - 7 DAY) " +
                "ORDER BY ser, " + order + " LIMIT 0, " + pageSize;
        return Db.find(sql);
    }
	
	
	/*================系统商品审核=============================== */

    /**
     * 获取需要审核的商品列表
     */
    public Page<Record> getAuditingPro(int pageNumber, int pageSize, int sta, Object typeFirst, Object proName) {
        String selectPro = "select su.login_name, sp.auth_flag sp_auth, sc.company_name, sc.type sc_type, sc.auth_flag sc_auth, dp.name pcr_name, p.*, IFNULL(p.update_date,p.create_date) time ,a.shenhe_time ";
        String select = "select su.login_name, sp.auth_flag sp_auth, sc.company_name, sc.type sc_type, sc.auth_flag sc_auth, dp.name pcr_name, p.pic1,p.pic2,p.pic3,p.pro_name,p.create_date,p.id, IFNULL(p.update_date,p.create_date) time ,a.shenhe_time ";
        String approveFlag = "";
        if (sta == 2) {
            approveFlag = "Y";
        } else if (sta == 0) {
            approveFlag = "N";
        }
        String sqlExceptSelectPro = " from inma_product_info p  "
                + "left join sys_dict_pcr dp on dp.id = p.type_first "
                + "LEFT JOIN sys_company sc ON sc.user_id = p.create_by "
                + "LEFT JOIN (SELECT u.login_name, p.*from sys_person p LEFT JOIN sys_user u ON p.user_id=u.id) sp ON sp.user_id = p.create_by "
                + "LEFT JOIN (SELECT a.product_id,max(a.create_date) as shenhe_time FROM inma_product_approve a where a.result = '" + approveFlag + "' group by a.product_id ) a on p.id = a.product_id "
                + "where p.del_flag=0 and p.sta = " + sta;

        String sqlExceptSelect = " from inma_product_info p   " +
                " left join sys_dict_pcr dp on dp.id = p.type_first  " +
                " LEFT JOIN sys_company sc ON sc.user_id = p.create_by  " +
                " LEFT JOIN sys_user su on su.id = p.create_by " +
                " LEFT JOIN sys_person sp on sp.user_id = p.create_by " +
                " LEFT JOIN ( " +
                " SELECT  a.product_id ,a.create_date as shenhe_time  " +
                "   FROM inma_product_approve a  " +
                " where a.result = 'Y'  " +
                " and not exists ( " +
                "  select 1 from inma_product_approve i where i.product_id = a.product_id and a.result = i.result and a.id < i.id  " +
                " ) " +
                ") a on p.id = a.product_id  " +
                "where p.del_flag=0 and p.sta = " + sta;
        if (typeFirst != null && !typeFirst.equals("") && typeFirst.toString().matches("[0-9]+")) {
            sqlExceptSelect += " and p.type_first = " + typeFirst;
        }
        if (proName != null && !proName.equals("")) {
            sqlExceptSelect += " and p.pro_name like '%" + proName + "%'";
        }
        sqlExceptSelect += " order by time desc";
        return Db.paginate(pageNumber, pageSize, select, sqlExceptSelect);
    }

    /**
     * 审核选中的元素
     *
     * @param ids[] 要审核的id数组
     */
    public boolean auditing(int sta, String[] ids) {
        String sql = "update inma_product_info "
                + "set sta=" + sta + " where ";
        for (String s : ids) {
            sql += " id=" + s + " or";
        }
        sql = sql.substring(0, sql.lastIndexOf("or"));//删除多余的or
        int result = Db.update(sql);
        //更新成功返回更新条数
        return result > 0;
    }
	/*==============获取全部商品列表===================*/

    /**
     * 获取全部的商品
     *
     * @param pageNumber 当前页面
     * @param pageSize   每页条数
     * @param typeFirst  商品类型
     * @param proName    商品名字
     */
    public Page<Record> getProduct(int pageNumber, int pageSize, Object typeFirst, Object proName) {
        String select = "select sc.type sc_type, sc.company_name, su.login_name, dp.name pcr_name, p.*, IFNULL(p.update_date,p.create_date) time ";
        String sqlExceptSelect = "from inma_product_info p "
                + "left join sys_dict_pcr dp on dp.id = p.type_first "
                + "LEFT JOIN sys_company sc on sc.user_id = p.create_by "
                + "LEFT JOIN sys_user su on su.id = p.create_by "
                + "where p.del_flag=0 ";
        if (typeFirst != null && !typeFirst.equals("") && typeFirst.toString().matches("[0-9]+")) {
            sqlExceptSelect += " and p.type_first = " + typeFirst;
        }
        if (proName != null && !proName.equals("")) {
            sqlExceptSelect += " and p.pro_name like '%" + proName + "%'";
        }
        sqlExceptSelect += " order by time desc";
        return Db.paginate(pageNumber, pageSize, select, sqlExceptSelect);
    }

    /**
     * 通过产品名称和公司id查询产品
     * created by ZhouXiang on 2016/08/05
     * @param name
     * @param enterpriseId
     * @return 产品集合
     */
    public List<Record> getProductByNameAndEId(String name, String enterpriseId) {
        String sql = "select ipf.* from inma_product_info ipf " +
                "inner join sys_company sc on sc.user_id=ipf.create_by " +
                "where sc.id='" + enterpriseId + "' and ipf.del_flag='0' and ipf.sta='2' and ipf.pro_name like '%" + name + "%'";
        return Db.find(sql);
    }
}
