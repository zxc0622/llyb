package com.qdum.llhb.memService.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

/**
 * 聊天记录
 *
 * @author zhangxm
 */
public class ChatRecord extends Model<ChatRecord> {

    private static final long serialVersionUID = 1L;
    public static ChatRecord dao = new ChatRecord();

    /**
     * 查找是否有未读消息
     *
     * @param s
     * @param r
     * @return
     */
    public List<Record> findNotRead(long s, long r) {
        String sql = "select * FROM ms_chat_record r WHERE r.sta='0' ";
        if (s != -1) {
            sql += "AND r.send_id='" + s + "' ";
        }
        if (r != -1) {
            sql += "AND r.rec_id='" + r + "' ";
        }
        return Db.find(sql);
    }

    /**
     * 设为已读
     */
    public int setRead(long s, long r) {
        String sql = "UPDATE ms_chat_record r SET r.sta='1' WHERE r.sta='0' " +
                "AND r.send_id='" + s + "' AND r.rec_id='" + r + "'";
        return Db.update(sql);
    }

    /**
     * 获取未读数量
     */
    public long getNotReadCount(long s, long r) {
        String sql = "select count(r.id) as n FROM ms_chat_record r WHERE r.sta='0' ";
        if (s != -1) {
            sql += "AND r.send_id='" + s + "' ";
        }
        if (r != -1) {
            sql += "AND r.rec_id='" + r + "' ";
        }
        return Db.find(sql).get(0).getLong("n");
    }

    /**
     * 获取两个人的聊天记录
     *
     * @param send_id 发送id
     * @param rec_id  接收id
     */
    public List<Record> getChatRecords(String send_id, String rec_id) {
        String params = "('" + send_id + "','" + rec_id + "')";
        String sql = "select * from ms_chat_record mcr" +
                " where mcr.send_id in " + params + " and mcr.rec_id in " + params + " and mcr.del_flag='0'" +
                " order by mcr.create_date";
        return Db.find(sql);
    }
}

