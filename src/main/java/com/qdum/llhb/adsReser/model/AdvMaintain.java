package com.qdum.llhb.adsReser.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

import java.util.List;

/**
 * Created by Administrator on 2015/12/17.
 */
public class AdvMaintain extends Model<AdvMaintain> {
    private static final long serialVersionUID = -2604323717097925180L;

    public static final AdvMaintain dao = new AdvMaintain();

    public List<Record> getRecord(String chanId){
        String sql = "SELECT * FROM inma_adv_maintain m where m.del_flag='0' ";
        if(null!= chanId&&!chanId.equals("")){
            sql += "  and m.channel_id="+chanId;
        }
        sql +=" order by m.create_by desc";
        return Db.find(sql);
    }

    public Record getRecordByChannelAndId(String chanId,String mid){
        String sql = "SELECT * FROM inma_adv_maintain m where m.del_flag='0' ";
        if(null!= chanId&&!chanId.equals("")){
            sql += " and  m.channel_id="+chanId +" and m.id="+mid;
        }
        sql +=" order by m.create_by desc";
        return Db.findFirst(sql);
    }
    /**
     * 根据id取
     */
    public Record getRecordById(String id){
        return  Db.findFirst("SELECT * FROM inma_adv_maintain m WHERE m.del_flag='0' and m.id=?",id);
    }
}
