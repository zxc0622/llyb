package com.qdum.llhb.adsReser.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

import java.util.List;

/**
 * Created by Administrator on 2015/12/17.
 */
public class AdvChannel extends Model<AdvChannel> {
    private static final long serialVersionUID = -2604323717097925180L;

    public static final AdvChannel dao = new AdvChannel();

    public Record getRecord(String chanId){
        String sql = "SELECT * FROM inma_adv_channel m where m.del_flag='0' ";
        if(null!= chanId&&!chanId.equals("")){
            sql += "  and m.channel_id="+chanId;
        }
        sql +=" order by m.create_by desc";
        return Db.findFirst(sql);
    }
    public AdvChannel getChannel(String chanId){
        String sql = "SELECT * FROM inma_adv_channel m where m.del_flag='0' ";
        if(null!= chanId&&!chanId.equals("")){
            sql += "  and m.channel_id="+chanId;
        }
        sql +=" order by m.create_by desc";
        return AdvChannel.dao.findFirst(sql);
    }

}
