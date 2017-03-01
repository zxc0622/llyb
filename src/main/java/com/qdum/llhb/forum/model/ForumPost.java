package com.qdum.llhb.forum.model;

import com.google.common.collect.Lists;
import com.google.common.io.Files;
import com.jfinal.log.Logger;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.DateUtils;
import com.qdum.llhb.common.utils.DbUtil;
import com.qdum.llhb.common.utils.FileUtils;
import com.qdum.llhb.forum.vo.UserInfo;
import com.qdum.llhb.forum.vo.UserPostRanklist;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import java.io.File;
import java.io.InputStream;
import java.net.URL;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2015/12/29.
 */
public class ForumPost extends Model<ForumPost> {
    private static final Logger LOGGER = Logger.getLogger(ForumPost.class);

    private static final long serialVersionUID = 1L;
    public static ForumPost dao = new ForumPost();

    public Map<String, Object> getForumPost() {
        return this.getAttrs();
    }

    /**
     * 查询某帖子所有回复
     */
    public Page<Record> getRecordsBypPost(int pageNumber, int pageSize, long fid, String paramUid) {
        String sql = " FROM forum_post_reply r LEFT JOIN sys_user_qq qq on qq.user_id=r.create_by  JOIN forum_posts f on f.id=r.post_id LEFT JOIN sys_user u on u.id=r.create_by LEFT JOIN sys_person p on p.user_id=u.id LEFT JOIN sys_company c on c.user_id=u.id  WHERE r.del_flag='0' AND f.id =? ";
        if (null != paramUid && !paramUid.equals("")) {
            sql += " and r.create_by='" + paramUid + "'";
        }
        sql += " ORDER BY r.create_date ";
        return Db.paginate(pageNumber, pageSize, "SELECT u.id as uid,u.head_img,qq.headImg as touxiang,f.page_view,f.post_title,f.post_content,f.create_date as fdate,r.*,u.login_name, IF ( c.type IS NULL, '个人', '企业' ) as typee, IF (p.auth_flag = 1, 'ge', 'geno') AS pauth, IF (c.auth_flag = 1, 'qi', 'qino') AS cauth, IF (c.youyi_flag = 1, 'xf', 'xfno') AS xauth ", sql, fid);
    }
    /**
     * 查询某帖子的回复数量
     */
    public Record getNumberByPost(long pid){
        StringBuffer sb = new StringBuffer();
        sb.append("SELECT count(*) as num FROM forum_post_reply f WHERE  f.del_flag='0' AND f.post_id=?");
        return  Db.findFirst(sb.toString(),pid);
    }

    /**
     * 查询帖子数量
     */
    public Record getCountByUserId(long uid) {
        return Db.findFirst("SELECT count(*) as mm FROM forum_posts p WHERE p.create_by=?", uid);
    }

    /**
     * 获取帖子分页
     *
     * @param pageNumber -- 页码
     * @param pageSize   -- 每页条数
     * @return Page<Record>
     * @author zhaoyl
     * @time 2016年1月5日13:05:51
     */
    public Page<Record> getPostPage(int pageNumber, int pageSize, String type, String order, String boardId, String postTitle, String preDate) {
        String select = "select fbl2.board_name type_name, su.login_name master_name, fp.remarks ma_days, " +
                "		fpr.re_count, fpr.re_name, fpr.create_date re_time, fpr.is_anony, if(fp.update_date is null,fp.create_date,fp.update_date)time, fp.* ";
        String sqlExceptSelect = "from forum_posts fp " +
                "left join forum_board_list fbl on fp.board_id = fbl.id " +
                "left join forum_board_list fbl2 on fp.board_type = fbl2.id " +
                "left join sys_user su on fp.create_by = su.id " +
                "left join " +
                "	(SELECT su.login_name re_name, lre.* " +
                "	 from (SELECT nre.re_count, pr.post_id, pr.is_anony, pr.create_by, pr.create_date " +
                "		   from (SELECT count(*) re_count,post_id, max(id) max_id " +
                "				 from forum_post_reply r where r.del_flag=0 group by r.post_id) nre " +
                "		   		 left join forum_post_reply pr on nre.max_id = pr.id) lre " +
                "		   LEFT JOIN sys_user su ON su.id = lre.create_by) fpr on fpr.post_id = fp.id " +
                "where fp.del_flag=0 and fp.sta=1 ";
        if (type != null && !"".equals(type)) {
            sqlExceptSelect += " and fp.board_type = " + type + " ";
        }
        if (boardId != null && !"".equals(boardId)) {
            sqlExceptSelect += " and fp.board_id = " + boardId + " ";
        }
        if (postTitle != null && !"".equals(postTitle)) {
            sqlExceptSelect += " and fp.post_title like '%" + postTitle + "%' ";
        }
        if(preDate!=null && !"".equals(preDate) ){
        	sqlExceptSelect += " and fp.create_date >='"+preDate+"'";
        }
        if (order != null && !"".equals(order)) {
            sqlExceptSelect += "order by fp.is_top desc, fp.top_order, " + order + " desc";
        } else {
            sqlExceptSelect += "order by fp.is_top desc, fp.top_order, time desc";
        }

        return Db.paginate(pageNumber, pageSize, select, sqlExceptSelect);
    }

    /**
     * 获取不同种类帖子的数量
     *
     * @author zhaoyl
     * @time 2016年1月5日13:46:37
     */
    public List<Record> getCount() {
        String sql = "select fp.*, fbl.board_name from (select count(*) type_count, board_type from forum_posts where del_flag = 0 group by board_type) fp left join forum_board_list fbl on fbl.id = fp.board_type";
        return Db.find(sql);
    }

    /**
     * 通过版块id获取今日板块帖子概况  今日添加数量    排名
     *
     * @param boardId
     * @return Record
     * @author zhaoyl
     * @time 2016年1月6日15:13:25
     */
    public Record getStatByBoardId(long boardId) {
        String sql = "SELECT nfp.post_count, nfp.row_num " +
                "FROM (SELECT(@rownum :=@rownum + 1) row_num, lfp.* FROM (SELECT @rownum := 0) r," +
                "(SELECT count(*) post_count, fp.board_id " +
                "	FROM( SELECT p.* FROM forum_posts p WHERE p.del_flag = 0 AND p.create_date >= CURDATE() ) fp " +
                "	WHERE fp.del_flag = 0 GROUP BY fp.board_id )lfp ORDER BY post_count DESC ) nfp " +
                "WHERE nfp.board_id = " + boardId;
        return Db.findFirst(sql);
    }

    /**
     * 通过版块id获取今日板块添加主题数量
     *
     * @param boardId
     * @return Record
     * @author zhaoyl
     * @time 2016年1月6日15:13:25
     */
    public Record getTitleCount(long boardId) {
        String sql = "select count(*) type_count from (select *from forum_posts p where p.del_flag = 0 and p.create_date >= curDate() and p.board_id = " + boardId + ") fp group by fp.board_type";
        return Db.findFirst(sql);
    }

    /**
     * 查询最新主题
     *
     * @return
     */
    public List<ForumPost> queryLastestPosts() {
        String sql = "select id , post_title from forum_posts where del_flag = '0' and sta = '1' order by create_date desc limit 0,10";
        return this.find(sql);
    }

    /**
     * 查询用户发帖排行
     *
     * @return
     */
    public List<ForumPost> queryUserPostRanklist() {
        StringBuffer sb = new StringBuffer();
        sb.append("SELECT * FROM")
                .append(" ((SELECT create_by AS user_id , COUNT(*) AS post_count , create_date")
                .append(" FROM forum_posts")
                .append(" WHERE del_flag = '0'")
                .append(" GROUP BY create_by")
                .append(" ORDER BY post_count DESC) AS user_post")
                .append(" LEFT JOIN")
                .append(" (SELECT * FROM")
                .append(" ((SELECT id , login_name FROM sys_user WHERE del_flag = '0') AS sys_user_temp")
                .append(" LEFT JOIN")
                .append(" (SELECT user_id , headImg FROM sys_user_qq WHERE del_flag = '0') AS user_qq_temp")
                .append(" ON sys_user_temp.id = user_qq_temp.user_id)) AS user")
                .append(" ON user.id = user_post.user_id)");
        return this.find(sb.toString());
    }

    /**
     * 获取用户发帖排行
     *
     * @return
     */
    public UserPostRanklist getUserPostRanklist() {
        List<UserInfo> dayRanklist = Lists.newArrayList();
        List<UserInfo> weekRanklist = Lists.newArrayList();
        List<UserInfo> monthRanklist = Lists.newArrayList();
        String sql = DbUtil.getSql(this.getClass(), "ranklist");
        List<ForumPost> list = this.find(sql);
        UserPostRanklist userPostRanklist = new UserPostRanklist();
        for (ForumPost forumPost : list) {
            if (forumPost.getStr("rankListType").equals("d")) {
                dayRanklist.add(tranResult2UserInfo(forumPost));
            } else if (forumPost.getStr("rankListType").equals("w")) {
                weekRanklist.add(tranResult2UserInfo(forumPost));
            } else if (forumPost.getStr("rankListType").equals("m")) {
                monthRanklist.add(tranResult2UserInfo(forumPost));
            }
        }
        userPostRanklist.setDayRanklist(dayRanklist.toArray(new UserInfo[0]));
        userPostRanklist.setWeekRanklist(weekRanklist.toArray(new UserInfo[0]));
        userPostRanklist.setMonthRanklist(monthRanklist.toArray(new UserInfo[0]));
        return userPostRanklist;
    }

    /**
     * 装填用户信息
     *
     * @param userPost
     * @return
     */
    private UserInfo tranResult2UserInfo(ForumPost userPost) {
        UserInfo userInfo = new UserInfo();
        userInfo.setId(userPost.getLong("user_id"));
        userInfo.setName(userPost.getStr("login_name"));
        userInfo.setPic(userPost.getStr("headImg"));
        return userInfo;
    }

    /**
     * 查询热帖
     *
     * @return
     */
    public List<ForumPost> queryHotPosts() {
        StringBuffer sb = new StringBuffer();
        sb.append("SELECT * FROM")
                .append(" (SELECT reply_count.post_id, reply_count + reply_trace_count AS total_reply_count")
                .append(" FROM (SELECT id , post_id , COUNT(*) AS reply_count FROM forum_post_reply WHERE del_flag = '0' GROUP BY post_id) AS reply_count")
                .append(" LEFT JOIN")
                .append(" (SELECT reply_trace_id , reply_id , post_id , COUNT(post_id) AS reply_trace_count")
                .append(" FROM (SELECT id AS reply_trace_id , reply_id FROM forum_reply_trace WHERE del_flag = '0') AS reply_trace_temp")
                .append(" LEFT JOIN")
                .append(" (SELECT id , post_id FROM forum_post_reply WHERE del_flag = '0') AS post_reply_temp")
                .append(" ON reply_trace_temp.reply_id = post_reply_temp.id")
                .append(" GROUP BY post_id) AS reply_trace_count")
                .append(" ON reply_count.post_id = reply_trace_count.post_id) AS totalcount_temp")
                .append(" LEFT JOIN")
                .append(" (SELECT id , post_title FROM forum_posts WHERE del_flag = '0') AS posts_temp")
                .append(" ON totalcount_temp.post_id = posts_temp.id")
                .append(" LIMIT 0 , 10");
        return this.find(sb.toString());
    }
    /**
     *
     */
    public Record getPost(long fid){
        String sql = "SELECT b.board_name, u.id AS uid, u.head_img, qq.headImg AS touxiang, f.page_view, f.post_title, f.post_content, f.create_date AS fdate, u.login_name, IF ( c.type IS NULL, '个人', '企业' ) AS typee, IF (p.auth_flag = 1, 'ge', 'geno') AS pauth, IF (c.auth_flag = 1, 'qi', 'qino') AS cauth, IF (c.youyi_flag = 1, 'xf', 'xfno') AS xauth, f.is_top, f.good FROM forum_posts f LEFT JOIN forum_board_list b ON b.id = f.board_type LEFT JOIN sys_user_qq qq ON qq.user_id = f.create_by LEFT JOIN sys_user u ON u.id = f.create_by LEFT JOIN sys_person p ON p.user_id = u.id LEFT JOIN sys_company c ON c.user_id = u.id WHERE f.del_flag = '0' AND f.id =?";
        return  Db.findFirst(sql,fid);
    }
    /**
     * 取某条帖子的信息
     */
    public Record getForumPost(String pid){
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("SELECT * FROM forum_posts p WHERE p.id=? and p.del_flag=0");
        return Db.findFirst(stringBuffer.toString(),pid);
    }

}
