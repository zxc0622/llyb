package com.qdum.llhb.forum.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

import java.util.List;

/**
 * Created by Administrator on 2015/12/29.
 */
public class ForumPostAttachment extends Model<ForumPostAttachment> {
    private static final long serialVersionUID = 1L;
    public  static ForumPostAttachment dao = new ForumPostAttachment();
    /**
     * 取某个帖子的附件
     */
    public List<Record> getAttachmentByPost(String pid){
        StringBuffer sb = new StringBuffer();
        sb.append("SELECT * FROM forum_posts_attachments a WHERE a.post_id=? and a.del_flag=0");
        return Db.find(sb.toString(),pid);
    }
}
