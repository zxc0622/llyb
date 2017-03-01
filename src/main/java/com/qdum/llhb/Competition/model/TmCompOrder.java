package com.qdum.llhb.Competition.model;

import com.jfinal.plugin.activerecord.*;
import com.qdum.llhb.Competition.enumvalue.BidPriceStatusEnum;
import com.qdum.llhb.Competition.vo.BidPriceInfo;
import com.qdum.llhb.Competition.vo.CompetitionPageInfo;
import com.qdum.llhb.common.constant.BaseConstants;
import com.qdum.llhb.common.utils.DateUtils;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import org.apache.log4j.Logger;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;


/**
 * Created by Administrator on 2015/12/18.
 */
public class TmCompOrder extends Model<TmCompOrder> {

    private static final Logger LOGGER = Logger.getLogger(TmCompOrder.class);

    private static final long serialVersionUID = 1L;
    public static TmCompOrder dao = new TmCompOrder();

    /**
     * 查询user参与的所有竞价
     */
    public List<Record> getOrdersByUser(long uid,String text){
        StringBuffer sb  = new StringBuffer();
        sb.append("SELECT if(c.update_date is null, c.create_date, c.update_date) time, c.*,i.comp_title FROM tm_comp_order c LEFT JOIN inma_competition_info i on c.comp_id=i.id WHERE c.user_id=? and c.del_flag='0' ");
        if(null !=text&&!text.equals("")){
            sb.append(" and i.comp_title LIKE '%").append(text).append("%'");
        }
        sb.append(" ORDER BY time desc");
        return Db.find(sb.toString(),uid);
    }
    
    /**
     * 获取发起竞价记录
     * */
    public List<Record> getStartOrder(long userId, String compTitle){
    	String sql = "select ci.comp_title comp_title, if(co.update_date is null, co.create_date, co.update_date)time, co.* " +
    				"from tm_comp_order co " +
    				"left join inma_competition_info ci on co.comp_id=ci.id " +
    				"where co.del_flag=0 and ci.create_by = "+userId+" ";
    	if(compTitle != null && !"".equals(compTitle)){
    		sql += " and ci.comp_title like '%"+compTitle+"%' ";
    	}
    	sql += " order by time desc";
    	return Db.find(sql);
    }
    /**
     * 通过id 获取竞价订单
     * */
    public Record getOrderById(long id){
    	String sql = "select ci.create_by sell_user_id, co.* from tm_comp_order co " +
    			"left join inma_competition_info ci on co.comp_id = ci.id " +
    			"where co.del_flag =0 and co.id="+id;
    	return Db.findFirst(sql);
    }
    /**
     * 通过用户id获取所有参加过的竞价记录
     * @param userId
     * @author zhaoyl
     * @time 2016年1月22日15:35:57
     * */
    public List<Record> getAllRecordByUserId(long userId, String text){
    	String sql = "SELECT icr.id r_id, icr.user_id r_user_id, icr.bid_price r_bid_price, icr.create_date r_create_date,ici.comp_title, IF ( icr.user_id != tco.user_id, 0, 1 ) is_win_bid, tco.* " +
    			"FROM ( SELECT nr.last_time, cr.* FROM inma_competition_record cr " +
    			"RIGHT JOIN ( " +
    				"SELECT MAX(r.create_date) last_time, r.comp_id " +
    				"FROM inma_competition_record r " +
    				"WHERE r.del_flag = 0 AND r.user_id = ? " +
    				"GROUP BY r.comp_id ) nr ON cr.comp_id = nr.comp_id AND cr.create_date = nr.last_time ) icr " +
    			"LEFT JOIN ( SELECT * FROM tm_comp_order co WHERE co.del_flag = 0 ) tco ON icr.comp_id = tco.comp_id " +
    			"LEFT JOIN inma_competition_info ici ON icr.comp_id = ici.id";
    	if(text != null && !"".equals(text)){
    		sql += " where ici.comp_title like '%"+text+"%'";
    	}
    	sql += " order by icr.last_time desc";
    	return Db.find(sql,userId);
    }
    /**
     * 获取所有记录
     * @param
     * @return
     * @author zhaoyl
     * @time 2016年1月27日15:04:10
     * */
    public List<Record> getAll(){
    	String sql = "SELECT ci.city_name, IF ( o.update_date IS NULL, o.create_date, o.update_date ) time, ci.comp_title, ci.u_name, u.login_name b_name, o.* " +
    			"FROM tm_comp_order o " +
    			"LEFT JOIN sys_user u ON o.user_id = u.id " +
    			"LEFT JOIN " +
    				"( SELECT a. NAME city_name, u1.login_name u_name, i.* " +
    				"FROM inma_competition_info i " +
    				"LEFT JOIN sys_user u1 ON i.create_by = u1.id " +
    				"LEFT JOIN sys_area a ON i.city_id = a.id WHERE i.del_flag = 0 ) ci ON o.comp_id = ci.id " +
    			"WHERE o.del_flag = 0 ORDER BY time DESC";
    	return Db.find(sql);
    }
}

