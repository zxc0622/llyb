package com.qdum.llhb.Competition.model;

import com.jfinal.plugin.activerecord.*;
import com.qdum.llhb.Competition.enumvalue.BidPriceStatusEnum;
import com.qdum.llhb.Competition.vo.CompetitionPageInfo;
import com.qdum.llhb.Competition.vo.BidPriceInfo;
import com.qdum.llhb.common.constant.BaseConstants;
import com.qdum.llhb.common.utils.DateUtils;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import org.apache.log4j.Logger;

import java.util.*;


/**
 * 竞价信息表
 * Created by wangfeng on 2015/12/18.
 */
public class Competition extends Model<Competition> {

    private static final Logger LOGGER = Logger.getLogger(Competition.class);

    private static final long serialVersionUID = 1L;
    public static Competition dao = new Competition();


    public Record getById(String id) {
        String sql = "SELECT * FROM inma_competition_info c WHERE c.id = ? and c.del_flag='0'";
        return Db.findFirst(sql, id);
    }
    public List<Record> getCompetitionId(String id) {
        String sql = "SELECT * FROM inma_competition_remind c WHERE c.id = '"+id+"' and c.del_flag='0'";
        return Db.find(sql);
    }
    public List<Record> getCompetitionInfoId(String id) {
        String sql = "SELECT * FROM inma_competition_info c WHERE c.id = '"+id+"' and c.del_flag='0'";
        return Db.find(sql);
    }
    public void updateCompetition(String id){
    	String sql =" update inma_competition_remind set remarks=IFNULL(remarks,'0')+1 where id='"+id+"'";
    	Db.update(sql);
    }
    /**
     * 审核操作
     * con--状态   leibie--类别
     */
    public Page<Record> getRecordBySta(int pageNumber, int pageSize, String con, String title, String leibie, long uid) {
        String sql = "  FROM inma_competition_info c LEFT JOIN sys_dict_pcr p on p.id=c.type_first LEFT JOIN sys_dict d on d.`value`=c.comp_period and d.type='period_type' WHERE c.del_flag='0' and c.create_by=? ";
        if (title != null && !title.equals("")) {
            sql += " and c.comp_title LIKE '%" + title + "%'";
        }
        if (leibie != null && !leibie.equals("") && !leibie.equals("0")) {
            sql += " and c.type_first='" + leibie + "'";
        }
        if (con.equals("4")) {
            sql += " and  DATE_ADD(c.comp_start_time,INTERVAL d.`value` day)<NOW() ";
        } else {
            sql += " and c.sta='" + con + "' and DATE_ADD(c.comp_start_time,INTERVAL d.`value` day)>NOW()  ";
        }
        sql += " ORDER BY instime DESC";
        return Db.paginate(pageNumber, pageSize, "SELECT c.*,p.name as pname, IFNULL(c.update_date,c.create_date) as instime  ", sql, uid);
    }
   /**
    * 固废竞价首页--通过类型二获取列表 并且通过添加数量排序
    * @author zhaoyl
    * @time 2015年12月23日10:42:40
    */
   public List<Record> getListByType(String typeFirst){
	   String sql = "SELECT ci.type_second,dp.NAME dp_name, count(*) count " +
	   		"FROM inma_competition_info ci " +
	   		"LEFT JOIN sys_dict_pcr dp ON ci.type_second = dp.id " +
	   		"WHERE ci.del_flag = 0 and ci.type_first = "+typeFirst+" " +
	   		"GROUP BY ci.type_second,dp.name " +
	   		"ORDER BY count DESC";
	   return Db.find(sql);
   }
   /**
    * 固废竞价首页--通过省市获取列表 并且通过添加数量排序
    * @author zhaoyl
    * @time 2015年12月23日10:42:40
    */
   public List<Record> getListByProv(){
	   String sql = "SELECT ci.prov_id, a.NAME a_name, count(*) count " +
	   		"FROM inma_competition_info ci " +
	   		"LEFT JOIN sys_area a ON ci.prov_id = a.id " +
	   		"WHERE ci.del_flag = 0 " +
	   		"GROUP BY ci.prov_id,a.name " +
	   		"ORDER BY count DESC";
	   return Db.find(sql);
   }

    /**
     * 固废竞价首页--获取审核通过的全部列表
     *
     * @param isComp--是否竞价 true:竞价中  false:未开始
     * @author zhaoyl
     * @time 2015年12月23日10:42:40
     */
    public List<Record> getList(boolean isComp) {
        String sql = "select cr1.max_price, cr2.count price_count,cm.count pay_count, ci.id, ci.starting_price, ci.pic1, ci.pic2, ci.pic3, ci.comp_title, ci.page_view, ci.last_time, ci.comp_start_time, now() cur_time, ci.comp_period " +
                "from( select date_add(comp_start_time, interval comp_period day)last_time, c.*from inma_competition_info c)ci " +
                "LEFT JOIN (select max(bid_price) max_price, comp_id from inma_competition_record group by comp_id) cr1 ON cr1.comp_id = ci.id " +
                "LEFT JOIN (select count(*) count, comp_id from inma_competition_record group by comp_id) cr2 ON cr2.comp_id = ci.id " +
                "LEFT JOIN (select count(*) count, comp_id from inma_competition_margin_pay group by comp_id) cm ON cm.comp_id = ci.id " +
                "where ci.del_flag=0 and ci.sta=2 ";
        if (isComp) {
            sql += " and (last_time >= now() and comp_start_time <= now()) order by last_time";
        } else {
            sql += " and (comp_start_time >= now()) order by comp_start_time desc";
        }
        return Db.find(sql);
    }

    /**
     * 审核列表
     */
    public Page<Record> getCheckLists(int pageNumber, int pageSize, String leibie, String title, String con) {
        String sql = " FROM inma_competition_info idi LEFT JOIN sys_dict_pcr p on idi.type_first=p.id and p.del_flag='0'" +
                "  LEFT JOIN inma_competition_approve da on idi.id=da.comp_id LEFT JOIN sys_user su on su.id=idi.create_by and su.del_flag='0'\n" +
                " LEFT JOIN sys_person sp ON sp.user_id = su.id AND sp.del_flag = '0' LEFT JOIN sys_company sc ON sc.user_id = su.id AND sc.del_flag = '0' WHERE idi.del_flag='0' and idi.sta=? ";
        if (leibie != null && !leibie.equals("")) {
            sql += " and idi.type_first='" + leibie + "'";
        }
        if (title != null && !title.equals("")) {
            sql += " and idi.comp_title LIKE '%" + title + "%'";
        }
        if (con.equals("1")) {
            sql += " ORDER BY IFNULL(idi.update_date,idi.create_date) desc";
        } else {
            sql += " ORDER BY IFNULL(da.create_date,idi.create_date) desc";
        }
        return Db.paginate(pageNumber, pageSize, "SELECT IF(sc.type IS NULL OR sc.type = '',su.login_name,sc.company_name) AS uname, idi.id AS iid, IFNULL( idi.update_date, idi.create_date ) AS time, IF ( sc.type IS NULL, '个人', '企业' ) AS types, IF(sp.auth_flag=1,'ge','geno') AS pauth,IF(sc.auth_flag=1,'qi','qino') AS cauth, idi.*, p.`name` AS pname, su.login_name, IFNULL( da.create_date, idi.create_date ) AS dates", sql, con);
    }

    //=================================== by rongchao===========================================

    /**
     * 根据id获取竞品信息详情
     *
     * @param id 竞品信息id
     * @return
     */
    public CompetitionPageInfo getInfoForCompetitionPage(Long id) {
        CompetitionPageInfo competitionPageInfo = new CompetitionPageInfo();
        competitionPageInfo.setCompetitionRecords(this.getCompetitionRecords(id, 1, BaseConstants.COMPETITION_RECODER_PAGESIZE));
        Record competitionDetail = this.getCompetitionByID(id);
        competitionPageInfo.setCompetitionDetail(prepareDetailInfo(competitionDetail.getColumns()));
        return competitionPageInfo;
    }

    /**
     * 准备竞价详情数据
     *
     * @param detailInfo
     */
    private Map<String, Object> prepareDetailInfo(Map<String, Object> detailInfo) {
        int compPeriod = Integer.valueOf(detailInfo.get("comp_period").toString());
        Date compStartTime = (Date) detailInfo.get("comp_start_time");
        // 创建 Calendar 对象
        Calendar calendar = Calendar.getInstance();
        // 初始化 Calendar 对象，但并不必要，除非需要重置时间
        calendar.setTime(compStartTime);
        calendar.add(Calendar.DAY_OF_MONTH, compPeriod);
        Date compEndTime = calendar.getTime();
        detailInfo.put("comp_start_time", DateUtils.formatDate(compStartTime, "yyyy-MM-dd HH:mm"));
        detailInfo.put("comp_end_time", DateUtils.formatDate(compEndTime, "yyyy-MM-dd HH:mm"));
        if (new Date().getTime() < compStartTime.getTime()) {
            //未到竞拍时间
            BidPriceInfo bidPriceInfo = new BidPriceInfo();
            bidPriceInfo.setDistanceType(BidPriceStatusEnum.NOT_COME.getValue());
            bidPriceInfo.setTimeDistance(getSTimeDistance(compStartTime));
            detailInfo.put("bidPriceInfo", bidPriceInfo);
        } else if (new Date().getTime() < compEndTime.getTime() && new Date().getTime() > compStartTime.getTime()) {
            //在竞价时间内
            BidPriceInfo bidPriceInfo = new BidPriceInfo();
            bidPriceInfo.setDistanceType(BidPriceStatusEnum.WITHIN.getValue());
            bidPriceInfo.setTimeDistance(getSTimeDistance(compEndTime));
            detailInfo.put("bidPriceInfo", bidPriceInfo);
        } else {
            BidPriceInfo bidPriceInfo = new BidPriceInfo();
            bidPriceInfo.setDistanceType(BidPriceStatusEnum.END.getValue());
            detailInfo.put("bidPriceInfo", bidPriceInfo);
        }
        return detailInfo;
    }

    /**
     * 获取时间间距(秒)
     *
     * @return
     */
    private long getSTimeDistance(Date date) {
        long surplusMillTime = date.getTime() - new Date().getTime();
        long surplusTime = 0L;
        if (surplusMillTime > 0L) {
            surplusTime = surplusMillTime / 1000;
        }
        return surplusTime;
    }


    /**
     * 根据id获取竞品信息详情
     *
     * @param id 竞品信息id
     * @return
     */
    public Record getCompetitionByID(Long id) {
        User user = UserUtils.getUser();
        Long userID = null;
        if (user != null) {
            userID = user.getId();
        }
        StringBuffer sb = new StringBuffer();
        sb.append("SELECT * FROM")
                .append(" ((")
                .append("SELECT * FROM")
                .append(" ((")
                .append("SELECT * FROM")
                .append(" ((")
                .append("SELECT * FROM")
                .append(" ((")
                .append(" SELECT * FROM")
                .append(" ((")
                .append(" SELECT * FROM")
                .append(" ((")
                .append(" SELECT * FROM")
                .append(" ((")
                .append(" SELECT * FROM inma_competition_info")
                .append(" LEFT JOIN")
                .append(" (SELECT id AS area_prov_id,name AS prov_name FROM sys_area WHERE del_flag = '0')")
                .append(" AS tmp_area")
                .append(" ON tmp_area.area_prov_id = inma_competition_info.prov_id) AS tmp_info")
                .append(" LEFT JOIN")
                .append(" (SELECT id AS area_city_id,name AS city_name FROM sys_area WHERE del_flag = '0')")
                .append(" AS tmp_city")
                .append(" ON tmp_info.city_id = tmp_city.area_city_id)")
                .append(" where del_flag = '0' and id = ?) AS info")
                .append(" LEFT JOIN")
                .append(" (select comp_id as bm_comp_id , COUNT(*) as bmNum FROM inma_competition_margin_pay where del_flag = '0' and comp_id = ?)")
                .append(" AS apply")
                .append(" ON info.id = apply.bm_comp_id)) as info_bm")
                .append(" LEFT JOIN")
                .append(" (SELECT comp_id as remind_comp_id , COUNT(*) as remindNum from inma_competition_remind where del_flag = '0' and comp_id = ?)")
                .append(" AS remind")
                .append(" ON info_bm.id = remind.remind_comp_id)) AS info_bm_remind")
                .append(" LEFT JOIN")
                .append(" (SELECT comp_id as recoder_comp_id , bid_price FROM inma_competition_record WHERE del_flag = '0' and comp_id = ? ORDER BY create_date DESC LIMIT 0,1)")
                .append(" AS recoder")
                .append(" ON info_bm_remind.id = recoder.recoder_comp_id)) AS info_bm_remud_record")
                .append(" LEFT JOIN ")
                .append(" (SELECT comp_id AS margin_comp_id , margin_money AS user_margin_money FROM inma_competition_margin_pay WHERE del_flag = '0' and comp_id = ? AND user_id = ? ) as user_margin")
                .append(" ON info_bm_remud_record.id = user_margin.margin_comp_id)) AS info_bm_remud_record_margin")
                .append(" LEFT JOIN")
                .append(" (SELECT comp_id AS user_remind_comp_id , create_time AS remind_create_time FROM inma_competition_remind WHERE del_flag = '0' and comp_id = ? AND user_id = ? ) AS user_remind")
                .append(" ON info_bm_remud_record_margin.id = user_remind.user_remind_comp_id)) AS info_bm_remud_record_margin_userRemind")
                .append(" LEFT JOIN")
                .append(" (SELECT id AS typeID ,name AS typeName FROM sys_dict_pcr WHERE del_flag = '0') AS tb_type")
                .append(" ON info_bm_remud_record_margin_userRemind.type_first = tb_type.typeID)");
        return Db.findFirst(sb.toString(), id, id, id, id, id, userID, id, userID);
    }

    /**
     * 　根据id获取竞买记录
     *
     * @param id
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public Page<Record> getCompetitionRecords(Long id, int pageNumber, int pageSize) {
        return Db.paginate(pageNumber, pageSize, "SELECT bid_price , nick_name , create_date", "from inma_competition_record where del_flag = '0' and comp_id = ? order by bid_price desc", id);
    }

    /**
     * 根据id获取竞价
     *
     * @param id
     * @return
     */
    public Record getCompByID(Long id) {
        String sql = "SELECT * FROM inma_competition_info c WHERE c.id = ? and c.del_flag = '0'";
        return Db.findFirst(sql, id);
    }

    /**
     * 更新竞价围观数
     *
     * @param id
     * @return
     */
    public Boolean updateCompPageView(Long id) {
        Record record = this.getCompByID(id);
        Long pageView = record.getLong("page_view");
        if (pageView == null) {
            pageView = 0L;
        }
        record.set("page_view", pageView + 1);
        return Db.update(TableMapping.me().getTable(this.getClass()).getName(), record);
    }

    //==============================end rongchao=====================================
   /**
    * 固废竞价首页--分类查询竞价列表
    * @author zhaoyl
    * @param
    * @time 2015年12月28日15:31:21
    */
   public Page<Record> getList(int pageNumber, int pageSize, String compSatus, String typeFirst, String typeSecond, String typeThird, String provId, String cityId, String compSta, String compTitle, String orderBy, String sort){
	   String select = "select cr1.max_price, cr2.count price_count,cm.count pay_count, ci.id, ci.starting_price, ci.pic1, ci.pic2, ci.pic3, ci.comp_title," +
	   					"ci.page_view, ci.last_time, ci.comp_start_time, now() cur_time, ci.comp_period, if(comp_start_time >= now(),1,0) is_will_comp, " +
	   					"if(last_time >= now() and comp_start_time <= now(),1,0) is_comping, if(last_time < now(), 1,0) is_end_comp";
	   String sqlExceptSelect ="from( select date_add(comp_start_time, interval comp_period day)last_time, c.*from inma_competition_info c)ci " +
		   		"LEFT JOIN (select max(bid_price) max_price, comp_id from inma_competition_record group by comp_id) cr1 ON cr1.comp_id = ci.id " +
		   		"LEFT JOIN (select count(*) count, comp_id from inma_competition_record group by comp_id) cr2 ON cr2.comp_id = ci.id " +
		   		"LEFT JOIN (select count(*) count, comp_id from inma_competition_margin_pay group by comp_id) cm ON cm.comp_id = ci.id "+
		   		"where ci.del_flag=0 and ci.sta=2 ";
	   if(compSatus!=null && !compSatus.equals("")){
		   if(compSatus.equals("0")){
			   sqlExceptSelect += " and (comp_start_time >= now()) ";
		   }else if(compSatus.equals("1")){
			   sqlExceptSelect += " and (last_time >= now() and comp_start_time <= now()) ";
		   }else if(compSatus.equals("2")){
			   sqlExceptSelect += " and (last_time < now()) ";
		   }
	   }
	   if(typeFirst!=null && !typeFirst.equals("")){
		   sqlExceptSelect += " and ci.type_first='"+typeFirst+"' ";
	   }
	   if(typeSecond!=null && !typeSecond.equals("")){
		   sqlExceptSelect += " and ci.type_second='"+typeSecond+"' ";
	   }
	   if(typeThird!=null && !typeThird.equals("")){
		   sqlExceptSelect += " and ci.type_third='"+typeThird+"' ";
	   }
	   if(provId!=null && !provId.equals("")){
		   sqlExceptSelect += " and ci.prov_id='"+provId+"' ";
	   }
	   if(cityId!=null && !cityId.equals("")){
		   sqlExceptSelect += " and ci.city_id='"+cityId+"' ";
	   }
	   if(compSta!=null && !compSta.equals("")){
		   sqlExceptSelect += " and ci.comp_sta='"+compSta+"' ";
	   }
	   if(compTitle!=null && !compTitle.equals("")){
		   sqlExceptSelect += " and ci.comp_title like '%"+compTitle+"%' ";
	   }
	   sqlExceptSelect += " ORDER BY is_comping DESC, is_will_comp DESC, is_end_comp DESC";
	   if(orderBy !=null && !orderBy.equals("")){
		   sqlExceptSelect += ", "+orderBy+" "+sort;
	   }else{
		   sqlExceptSelect += ", page_view DESC";
	   }
	   return Db.paginate(pageNumber, pageSize, select, sqlExceptSelect);
   }
    public Competition getInfoMax(long compID){
        StringBuffer sb = new StringBuffer();
        sb.append("SELECT ici.id as icid,ici.comp_sta FROM inma_competition_info ici LEFT JOIN sys_dict d ON ici.comp_period = d.`value`  WHERE DATE_ADD( ici.comp_start_time, INTERVAL d.`value` DAY ) < NOW() AND ici.comp_sta = '0' and ici.id=?");
        return Competition.dao.find(sb.toString(),compID).get(0);
    }

}

