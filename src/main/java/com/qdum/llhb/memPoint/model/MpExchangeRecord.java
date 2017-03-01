package com.qdum.llhb.memPoint.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

import java.util.List;

/**
 * Created by Administrator on 2016/1/12.
 */
public class MpExchangeRecord extends Model<MpExchangeRecord>{
    private  static  final  long serialVersionUID = 1L;
    public static MpExchangeRecord dao = new MpExchangeRecord();
    /**
     *
     */
    public MpExchangeRecord getExchangeRecord(long uid,String pid){
        String sql = "SELECT * FROM mp_exchange_record r WHERE r.del_flag=0 and r.user_id=? and r.pro_id=?";
        return MpExchangeRecord.dao.findFirst(sql,uid,pid);
    }
    /**
     * 某用户的兑换记录
     */
    public List<Record> getRecordList(long uid){
        String sql = "SELECT * FROM mp_exchange_record r WHERE r.del_flag=0 and r.user_id=? ORDER BY r.create_date DESC";
        return  Db.find(sql,uid);
    }
    /**
     * 取所有记录
     */
    public List<Record> getAll(){
        StringBuffer sb  =new StringBuffer();
        sb.append("SELECT r.*,u.login_name FROM mp_exchange_record r LEFT JOIN sys_user u on u.id=r.user_id WHERE r.del_flag=0 ORDER BY r.create_date desc LIMIT 0,3");
        return  Db.find(sb.toString());
    }

}
