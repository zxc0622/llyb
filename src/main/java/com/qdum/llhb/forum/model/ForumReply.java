package com.qdum.llhb.forum.model;

import com.google.common.collect.Lists;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.sys.utils.DictUtils;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2015/12/29.
 */
public class ForumReply extends Model<ForumReply> {
    private static final long serialVersionUID = 1L;
    public static ForumReply dao = new ForumReply();

    public Map<String, Object> getForumReply() {
        return this.getAttrs();
    }

    /**
     * 查询某条帖子的回复
     */
    public List<ForumReply> getReplyByPost(String fid) {
        String sql = "SELECT * FROM forum_post_reply r WHERE r.post_id=?";
        return ForumReply.dao.find(sql, fid);
    }

    /**
     * 删除某条回复
     */
    public ForumReply getByThemeAndReply(String pid, String rid) {
        String sql = "SELECT * FROM forum_post_reply r WHERE r.post_id=? and r.id=?";
        return ForumReply.dao.findFirst(sql, pid, rid);
    }

    public List<ForumReply> queryLastestReplys() {
        String sql = "SELECT * FROM forum_post_reply where del_flag = '0' order by create_date desc limit 0,10 ";
        List<ForumReply> list = this.find(sql);
        List<ForumReply> resultList = Lists.newArrayList();
        for (ForumReply forumReply : list) {
            String content = forumReply.getStr("rp_content");
            int pIndex = content.indexOf("<p>");
            if (pIndex >= 0) {
                String tmpContent = content.substring(content.indexOf("<p>") + 3, content.indexOf("</p>"));
                if (tmpContent.indexOf("<img") >= 0) {
                    tmpContent = "图片";
                }
                forumReply.set("rp_content", DictUtils.delHTMLTag(tmpContent));
            }
            resultList.add(forumReply);
        }
        return resultList;
    }
}
