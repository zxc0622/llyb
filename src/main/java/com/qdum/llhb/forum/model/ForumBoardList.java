package com.qdum.llhb.forum.model;

import com.google.common.collect.Lists;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.DateUtils;
import com.qdum.llhb.common.utils.DbUtil;
import com.qdum.llhb.forum.vo.ChildBoard;
import com.qdum.llhb.forum.vo.MainBoard;
import com.qdum.llhb.sys.model.DictPcr;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2015/12/29.
 */
public class ForumBoardList extends Model<ForumBoardList> {
    private static final long serialVersionUID = 1L;
    public static ForumBoardList dao = new ForumBoardList();

    public Map<String, Object> getForumBoardList() {
        return this.getAttrs();
    }

    /**
     * 查询某帖子所有回复
     */
    public Page<Record> getRecordsBypPost(int pageNumber, int pageSize, long fid, String paramUid) {
        String sql = " FROM forum_post_reply r LEFT JOIN forum_posts f on f.id=r.post_id LEFT JOIN sys_user u on u.id=r.create_by LEFT JOIN sys_person p on p.user_id=u.id LEFT JOIN sys_company c on c.user_id=u.id  WHERE r.del_flag='0' AND f.id =? ORDER BY r.create_date DESC";
        if (null != paramUid && !paramUid.equals("")) {
            sql += " and r.create_by='" + paramUid + "'";
        }
        return Db.paginate(pageNumber, pageSize, "SELECT u.id as uid,u.head_img,f.page_view,f.post_title,f.post_content,f.create_date as fdate,r.*,u.login_name, IF ( c.type IS NULL, '个人', '企业' ), IF (p.auth_flag = 1, 'ge', 'geno') AS pauth, IF (c.auth_flag = 1, 'qi', 'qino') AS cauth, IF (c.x_flag = 1, 'xf', 'xfno') AS xauth ", sql, fid);
    }

    public List<Record> getRecord(String id) {
        String sql = "SELECT * FROM forum_board_list l WHERE l.par_id='" + id + "' and del_flag='0'";
        return Db.find(sql);
    }

    /**
     * 获取所有
     *
     * @author zhaoyl
     * @time 2015年12月31日14:19:35
     */
    public List<Record> getAll() {
        String sql = "select *from forum_board_list where del_flag=0";
        return Db.find(sql);
    }

    /**
     * 通过id获取model
     *
     * @param id
     * @return Record
     * @author zhaoyl
     */
    public Record getById(long id) {
        String sql = "select *from forum_board_list where del_flag=0 and id=" + id;
        return Db.findFirst(sql);
    }
    /***
     * 通过父id 获取name
     * */
    public Record getNameByParId(long parId){
    	String sql = "select *from forum_board_list where del_flag = 0 and par_id=?";
    	return Db.findFirst(sql,parId);
    }
    /**
     * 通过boardId获取父级名称和本身名称
     *
     * @param id
     * @return Record
     * @author zhaoyl
     */
    public Record getName(long id) {
        String sql = "select f.board_name name, b.board_name par_name from forum_board_list f " +
                "left join forum_board_list b on f.par_id = b.id where f.del_flag=0 and f.id=" + id;
        return Db.findFirst(sql);
    }

    /**
     * 获取所有分区
     *
     * @return
     */
    public List<ForumBoardList> getAllForumBoardList() {
        String sql = "select * from forum_board_list where del_flag = '0' order by show_order";
        return this.find(sql);
    }

    public List<MainBoard> queryIndexForumBoardList() {
        String sql = DbUtil.getSql(this.getClass(), "queryIndexForumBoardList");
        List<ForumBoardList> list = this.find(sql);
        List<MainBoard> resultList = Lists.newArrayList();
        Long mainID = null;
        MainBoard mainBoard = null;
        for (ForumBoardList forumBoard : list) {
            if (forumBoard.getLong("main_id") != mainID) {
                mainBoard = forumBoardList2MainBoard(forumBoard);
                mainID = forumBoard.getLong("main_id");
                resultList.add(mainBoard);
            }
            ChildBoard childBoard = forumBoardList2ChildBoard(forumBoard);
            MainBoard lastMainBoard = resultList.get(resultList.size() - 1);
            resultList.remove(resultList.size() - 1);
            lastMainBoard.putChildBoard(childBoard);
            resultList.add(lastMainBoard);
        }
        return resultList;
    }

//    if (mainID != forumBoard.getLong("main_id")) {
//        if (mainID != null) {
//            resultList.add(mainBoard);
//        }
//        mainBoard = forumBoardList2MainBoard(forumBoard);
//        mainID = forumBoard.getLong("main_id");
//    }
//    ChildBoard childBoard = forumBoardList2ChildBoard(forumBoard);
//    mainBoard.getChildBoard().add(childBoard);

    private MainBoard forumBoardList2MainBoard(ForumBoardList forumBoard) {
        MainBoard mainBoard = new MainBoard();
        mainBoard.setMainID(forumBoard.getLong("main_id"));
        mainBoard.setMainName(forumBoard.getStr("main_name"));
        mainBoard.setMasterName(forumBoard.getStr("master_name"));
        mainBoard.setChildBoard(Lists.<ChildBoard>newArrayList());
        return mainBoard;
    }

    private ChildBoard forumBoardList2ChildBoard(ForumBoardList forumBoard) {
        ChildBoard childBoard = new ChildBoard();
        childBoard.setBoardID(forumBoard.getLong("id"));
        childBoard.setParID(forumBoard.getLong("par_id"));
        childBoard.setBoardName(forumBoard.getStr("board_name"));
        childBoard.setTodayCount(forumBoard.getLong("today_count"));
        childBoard.setPostID(forumBoard.getLong("post_id"));
        childBoard.setTotalReplyCount(forumBoard.getBigDecimal("total_reply_count"));
        childBoard.setPostCount(forumBoard.getLong("post_count"));
        childBoard.setPostTitle(forumBoard.getStr("post_title"));
        childBoard.setContent(forumBoard.getStr("content"));
        Date createDate = forumBoard.getDate("create_date");
        if (createDate != null) {
            DateUtils dateUtils = new DateUtils();
            String dateStr = dateUtils.setPastTime(createDate);
            childBoard.setCreateDate(dateStr);
        }
        childBoard.setLoginName(forumBoard.getStr("login_name"));
        return childBoard;
    }
    /**
     *
     */
    public Record getRecordParent(String pid){
        StringBuffer sb = new StringBuffer();
        sb.append("SELECT b.board_name as bname,b.par_id,b.id as bid,l.id as lid,l.board_name as lname FROM forum_board_list b LEFT JOIN forum_board_list l on b.par_id=l.id WHERE b.id=?");
        return Db.findFirst(sb.toString(),pid);
    }
}


