package com.qdum.llhb.forum.model;

import java.util.List;
import java.util.Map;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

public class ForumBoardMaster extends Model<ForumBoardMaster> {

    /**
     * 论坛版主信息表
     *
     * @author zhaoyl
     * @time 2015年12月31日15:19:24
     */
    private static final long serialVersionUID = 1L;
    public static ForumBoardMaster dao = new ForumBoardMaster();

    public Map<String, Object> getForumBoardMaster() {
        return this.getAttrs();
    }

    /**
     * 获取版主列表
     *
     * @return List<Record>
     * @time 2015年12月31日15:21:13
     */
    public List<Record> getList() {
        String sql = "select su.login_name, fbm.* from forum_board_master fbm " +
                "left join sys_user su on su.id = fbm.user_id " +
                "where fbm.del_flag=0 ";
        return Db.find(sql);
    }

    /**
     * 通过版块id获取版主列表
     *
     * @param boardId 版块id
     * @return List<Record>
     * @time 2015年12月31日15:21:13
     */
    public List<Record> getList(long boardId) {
        String sql = "select su.login_name, fbm.*from forum_board_master fbm " +
                "left join sys_user su on su.id = fbm.user_id " +
                "where fbm.del_flag=0 and fbm.board_id=" + boardId;
        return Db.find(sql);
    }

    /**
     * 通过版块id和用户id获取model
     *
     * @param boardId,userId
     * @return Record
     */
    public Record getBoardMaster(long boardId, long userId) {
        String sql = "select *from forum_board_master " +
                "where del_flag=0 and board_id =" + boardId + " and user_id=" + userId;
        return Db.findFirst(sql);
    }

    /**
     * 通过id逻辑删除
     *
     * @param id 版主id
     * @return boolean
     */
    public boolean isDeleted(long id) {
        String sql = "update forum_board_master set del_flag = 1 where id = " + id;
        int delCount = Db.update(sql);
        if (delCount > 0) {
            return true;
        } else {
            return false;
        }
    }

    public List<Record> getAdministra(long boardid,long lid,long bid) {
        String sql = "SELECT m.user_id FROM forum_board_master m WHERE m.del_flag=0 and (m.board_id=? or m.board_id=? or m.board_id=?) GROUP BY m.user_id";
        return Db.find(sql, boardid,lid,bid);
    }

}
