package com.qdum.llhb.memPoint.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

import java.util.List;


/**
 * Created by Administrator on 2016/1/12.
 */
public class MpMememberAddr extends Model<MpMememberAddr> {
    private static  final long serialVersionUID = 1L;
    public static  MpMememberAddr dao = new MpMememberAddr();

    /**
     * 取用户地址
     */

    public List<Record> getAddredds(long uid){
        String sql = "SELECT a.*,u.login_name,a1.`name` as aname,a2.`name` as bname,a3.`name` as cname FROM mp_member_address a LEFT JOIN sys_user u on u.id=a.user_id LEFT JOIN sys_area a1 on a1.id=a.prov_id LEFT JOIN sys_area a2 on a2.id= a.city_id LEFT JOIN sys_area a3 on a3.id= a.town_id WHERE a.del_flag='0' AND a.user_id=? ORDER BY a.is_default DESC";
        return Db.find(sql,uid);
    }
    public Record getAdd(String aid){
        String sql = "SELECT * FROM mp_member_address a WHERE a.id=?";
        return  Db.findFirst(sql,aid);
    }
    public MpMememberAddr getAddr(String aid){
        StringBuffer sb = new StringBuffer();
        sb.append("SELECT * from mp_member_address a WHERE a.id=?");
        return  MpMememberAddr.dao.findFirst(sb.toString(),aid);
    }
    /**
     * 取消所有的默认地址
     */
    public void cancelDefault(){
        StringBuffer sb = new StringBuffer();
        sb.append("update mp_member_address set is_default=0 ");
        Db.update(sb.toString());
    }
}
