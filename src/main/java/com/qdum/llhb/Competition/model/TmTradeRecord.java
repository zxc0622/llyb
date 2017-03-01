package com.qdum.llhb.Competition.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

import org.apache.log4j.Logger;


/**
 * Created by Administrator on 2015/12/18.
 */
public class TmTradeRecord extends Model<TmTradeRecord> {

    private static final Logger LOGGER = Logger.getLogger(TmTradeRecord.class);

    private static final long serialVersionUID = 1L;
    public static TmTradeRecord dao = new TmTradeRecord();

    /**
     * 通过订单id 和 用户id 和 收入类型获取订单记录
     * */
    public Record getOrder(long orderId, long userId, String type){
    	String sql = "select *from tm_trade_record where del_flag =0 and order_id=? and user_id = ? and record_type = ?";
    	return Db.findFirst(sql, orderId, userId, type);
    } 
}

