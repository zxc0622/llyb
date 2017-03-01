package com.qdum.llhb.ypcd.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

/**
 * 横幅model
 *
 * @author wf
 */

public class Banner extends Model<Banner> {
    private static final long serialVersionUID = 1L;
    //以下常量用来查询企业信息页面,页签对应的横幅
    public static final int HOMEPAGE_BANNER = 0;//首页
    public static final int COMPANY_INTRODUCTION_BANNER = 1;//公司介绍
    public static final int CASE_BANNER = 2;//案例介绍
    public static final int SUPPLY_BANNER = 3;//供应产品
    public static final int NEWS_BANNER = 4;//新闻中心
    public static final int HONOR_BANNER = 5;//荣誉资质
    public static final int CONTACT_BANNER = 6;//联系方式
    public static final int ALBUM_BANNER = 7;//公司相册


    public static Banner dao = new Banner();

    public static String ID = "id";            // 编号
    public static String PARENT_ID = "parent_id";    // 父级编号
    public static String PARENT_IDS = "parent_ids";    // 所有父级编号
    //public static String CODE   		= "code";		// 编码
    public static String NAME = "name";       // 名称
    public static String TYPE = "type";        // 类型
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

    public void setType(String type) {
        set(TYPE, type);
    }

    public String getType() {
        return get(TYPE);
    }

    //列表
    public Page<Record> getBannersByUserId(int pageNumber, int pageSize, Long id, String condition) {
        String sql = "  FROM cs_manage_banner cmb LEFT JOIN sys_dict sd on(cmb.shop_channel=sd.value) WHERE cmb.del_flag = '0' and sd.type='ban_type' and cmb.create_by =" + id;
        if (condition != null && !condition.equals("0")) {
            sql += " and cmb.shop_channel=" + Long.parseLong(condition) + " order by cmb.create_date desc";
        } else {
            sql += " order by cmb.create_date desc";
        }
        return Db.paginate(pageNumber, pageSize, "SELECT cmb.*,sd.label ", sql);
    }

    //获取对象
    public Banner getBannerById(Long id) {
        return Banner.dao.findFirst("SELECT * FROM cs_manage_banner WHERE id=?", id);
    }

    public Record getRecordById(Long id) {
        return Db.findFirst("SELECT * FROM cs_manage_banner WHERE id=?", id);
    }

    //加载记录
    public Banner getBanRecordByUserId(Long userId) {
        String sql = "SELECT cmb.*,csb.id as shopId FROM sys_user su LEFT JOIN cs_settings_basic csb on (su.id=csb.user_id) LEFT JOIN cs_manage_banner cmb ON(su.id=cmb.create_by) WHERE su.id=" + userId + " ORDER BY cmb.create_date";
        return Banner.dao.findFirst(sql);
    }

    /**
     * 获取横幅图片
     */
    public List<Record> gethengF(String id, int banner) {
        String whereSql = null;
        switch (banner) {
            case 0://首页
                whereSql = " and t.shop_channel = '1' ";
                break;
            case 1://公司介绍
                whereSql = " and t.shop_channel = '3' ";
                break;
            case 2://案例介绍
                whereSql = " and t.shop_channel = '10' ";
                break;
            case 3://供应产品
                whereSql = " and t.shop_channel = '4' ";
                break;
            case 4://新闻中心
                whereSql = " and t.shop_channel = '5' ";
                break;
            case 5://荣誉资质
                whereSql = " and t.shop_channel = '6' ";
                break;
            case 6://联系方式
                whereSql = " and t.shop_channel = '8' ";
                break;
            case 7://公司相册
                whereSql = " and t.shop_channel = '9' ";
                break;
            default:
                break;
        }
        String sql = "	select t.ad_pic as adPic, t.* from  cs_manage_banner t " +
                "  LEFT JOIN cs_settings_basic f ON " +
                "  t.shop_id=f.id" +
                "  and f.del_flag='0'" +
                "  LEFT JOIN sys_company q ON" +
                "  q.user_id=f.user_id" +
                "  AND q.del_flag='0'" +
                "  WHERE t.del_flag='0'" +whereSql+
                "  AND q.id= ?" +
                "  order by t.create_date DESC" +
                "  limit 1";
        return Db.find(sql, id);
    }
}
