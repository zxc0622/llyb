package com.qdum.llhb.forum.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

import java.util.List;

/**
 * Created by Administrator on 2015/12/29.
 */
public class ForumReplyTrace extends Model<ForumReplyTrace> {
    private static final long serialVersionUID = 1L;
    public  static ForumReplyTrace dao = new ForumReplyTrace();
    /**
     * 查询所有记录
     */

    public List<Record> getRecordsAll(){
        String sql = "SELECT uu.login_name as uuname,t.*,u.id as uid,u.login_name,qq.headImg as touxiang FROM forum_reply_trace t LEFT JOIN sys_user_qq qq on qq.user_id=t.create_by LEFT JOIN sys_user u on u.id = t.create_by LEFT JOIN forum_reply_trace tt on tt.id= t.par_id LEFT JOIN\n" +
                "sys_user uu ON uu.id=tt.create_by WHERE t.del_flag='0' ORDER BY t.create_date ";
        return Db.find(sql);
    }
    /**
     * 取最新一条回复
     */
    public List<Record> getRecordsNew(){
        String sql = "SELECT uu.login_name as uuname, t.*,t.create_date as tdate,u.id as uid,u.login_name,u.head_img,qq.headImg as touxiang FROM forum_reply_trace t LEFT JOIN sys_user_qq qq on qq.user_id=t.create_by LEFT JOIN sys_user u on u.id = t.create_by LEFT JOIN forum_reply_trace tt on tt.id= t.par_id LEFT JOIN sys_user uu ON uu.id=tt.create_by WHERE t.del_flag='0'and t.id=(SELECT MAX(id) FROM forum_reply_trace)";
        return Db.find(sql);
    }


}
