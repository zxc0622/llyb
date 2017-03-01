package com.qdum.llhb.adsReser.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

/**
 * Created by Administrator on 2015/12/17.
 */
public class AdvBook extends Model<AdvBook> {
    private static final long serialVersionUID = -2604323717097925180L;

    public static final AdvBook dao = new AdvBook();

    public Record getRecord(String chanId,String areaId){
        String sql = "SELECT * FROM inma_adv_book a WHERE a.channel_id=? and a.area_id=?";
        return Db.findFirst(sql,chanId,areaId);
    }

}
