package com.qdum.llhb.forum.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

import java.util.List;

/**
 * Created by Administrator on 2015/12/29.
 */
public class ForumMessage extends Model<ForumMessage> {
    private static final long serialVersionUID = 1L;
    public  static ForumMessage dao = new ForumMessage();
    public Page<Record> getRecord(int pageNumber,int pageSize,String type){
        String sql = " FROM forum_message m LEFT JOIN sys_user u on u.id=m.create_by LEFT JOIN sys_user_qq qq on qq.user_id= u.id WHERE m.type=? ORDER BY m.create_date DESC";
        return  Db.paginate(pageNumber,pageSize,"SELECT m.*,qq.headImg,u.login_name",sql,type);
    }
    /**
     * 分类别查询数量
     */
    public List<Record> getCountByType(){
        return  Db.find("SELECT count(m.type) as mount FROM forum_message m GROUP BY m.type");
    }



}
