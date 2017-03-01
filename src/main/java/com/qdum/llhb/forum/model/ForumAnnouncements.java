package com.qdum.llhb.forum.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.google.common.collect.Lists;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public class ForumAnnouncements extends Model<ForumAnnouncements> {

    /**
     * 论坛公告实体
     *
     * @author zhaoyl
     * @time 2015年12月30日16:46:19
     */
    private static final long serialVersionUID = 1L;

    public static ForumAnnouncements dao = new ForumAnnouncements();

    public Map<String, Object> getForumAnnouncements() {
        return this.getAttrs();
    }

    /**
     * 通过id获取论坛公告实体
     *
     * @param id
     * @return Record
     */
    public Record getForumAnnById(Object id) {
        String sql = "select * from forum_announcements where del_flag=0 and id='" + id + "'";
        return Db.findFirst(sql);
    }

    /**
     * 获取论坛公告列表
     * return List<Record>
     */
    public Page<Record> getForumAnnPage(int pageNumber, int pageSize) {
        String select = "select (@rownum:=@rownum+1)rownum, IFNULL(update_time,create_time)time, if(show_order IS NULL,0,1)ord_num, fa.*";
        String sqlExceptSelect = "from (select @rownum:=0)r, forum_announcements fa where fa.del_flag=0 order by ord_num desc, show_order, time desc";
        return Db.paginate(pageNumber, pageSize, select, sqlExceptSelect);
    }

    /**
     * 删除选中的元素
     *
     * @param ids 要删除的id数组
     */
    public boolean isDelete(String[] ids, long userId) {
        String sql = "update forum_announcements set del_flag=1,update_by=" + userId + ",update_time='" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) + "' where ";
        for (String s : ids) {
            sql += " id=" + s + " or";
        }
        sql = sql.substring(0, sql.lastIndexOf("or"));//删除多余的or
        int result = Db.update(sql);
        if (result > 0) {//更新成功返回更新条数
            return true;
        } else {
            return false;
        }
    }

    /**
     * 获取论坛首页的论坛公告
     *
     * @return
     */
    public List<ForumAnnouncements> queryIndexFA() {
        String sql = "select id , ann_title ,ann_href from forum_announcements order by show_order desc limit 0 , 10";
        return this.find(sql);
    }
}
