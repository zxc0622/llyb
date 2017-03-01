package com.qdum.llhb.memPoint.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

import java.util.List;

/**
 * Created by Administrator on 2016/1/12.
 */
public class MpProductInfo extends Model<MpProductInfo>{
    private  static  final  long serialVersionUID = 1L;
    public static  MpProductInfo dao = new MpProductInfo();
    /**
     * 取所有记录
     */
    public List<Record> getRecord(String pid){
        StringBuffer sb = new StringBuffer();
        sb.append("SELECT * from mp_product_info p where p.del_flag='0'");
        if(null==pid||pid.equals("")){
            sb.append(" ORDER BY IF ( p.create_date > p.update_date, p.create_date, p.update_date ) DESC");
            sb.append(" limit 0,8");
        }else {
            sb.append(" and p.id= '").append(pid).append("'");
        }

        return Db.find(sb.toString());
    }
    public MpProductInfo getProduct(String pid){
        StringBuffer sb = new StringBuffer();
        sb.append("SELECT * from mp_product_info p where p.del_flag='0'");
        if(null==pid||pid.equals("")){
            sb.append(" limit 0,8");
        }else {
            sb.append(" and p.id= '").append(pid).append("'");
        }

        return MpProductInfo.dao.findFirst(sb.toString());
    }
}
