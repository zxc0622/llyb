package com.qdum.llhb.Competition.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;
import com.qdum.llhb.common.ResultObj;
import com.qdum.llhb.common.utils.RandomNumUtils;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import org.apache.log4j.Logger;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * Created by rongchao on 2015/12/28.
 */
public class CompetitionRecord extends Model<CompetitionRecord> {

    public static final Logger LOGGER = Logger.getLogger(CompetitionRecord.class);

    public static CompetitionRecord dao = new CompetitionRecord();

    /**
     * 竞价
     *
     * @param compID
     * @param bidPrice
     * @return
     */
    public ResultObj bidding(long compID, float bidPrice) {
        Record competition = Competition.dao.getCompByID(compID);
        if (competition == null) {
            LOGGER.error("根据参数compID<" + compID + ">没有查询到相应的数据，请检查参数compID是否正确或数据库中是否有相应的数据!");
            ResultObj errorResultObj = new ResultObj(Boolean.FALSE);
            errorResultObj.setMsg("对不起，没有找到相应的竞品!");
            return errorResultObj;
        }
        ResultObj ro = iswithinTime(competition.getDate("comp_start_time"), competition.getLong("comp_period"));
        if (!ro.getIsSuccess()) {
            return ro;
        }
        CompetitionRecord ctr = new CompetitionRecord();
        User user = UserUtils.getUser();
        ctr.set("comp_id", compID)
                .set("user_id", user.getId())
                .set("bid_price", bidPrice)
                .set("sta", 0)
                .set("nick_name", createNickName())
                .set("create_date", new Date())
                .set("del_flag", false);
        boolean isSuccess = Boolean.FALSE;
        try {
            isSuccess = ctr.save();
        } catch (Exception e) {
            ResultObj errorResultObj = new ResultObj(Boolean.FALSE);
            errorResultObj.setMsg("对不起，已经有人出价比您高，请再加价");
            return errorResultObj;
        }
        if (isSuccess) {
            return ResultObj.successResultObj;
        } else {
            LOGGER.error("保存竞价记录时失败~！");
            ResultObj errorResultObj = new ResultObj(Boolean.FALSE);
            errorResultObj.setMsg("对不起，操作失败~请尝试刷新页面重新操作一次~");
            return errorResultObj;
        }
    }

    /**
     * 判断是否能够竞价
     *
     * @param startDate
     * @return
     */
    private ResultObj iswithinTime(Date startDate, long compPeriod) {
        Date currentDate = new Date();
        long startDifftime = currentDate.getTime() - startDate.getTime();
        long endDifftime = startDate.getTime() + compPeriod * 24 * 60 * 60 * 1000 - currentDate.getTime();
        if (startDifftime >= 0 && endDifftime >= 0) {
            return ResultObj.successResultObj;
        } else if (startDifftime < 0) {
            ResultObj resultObj = new ResultObj(Boolean.FALSE);
            resultObj.setMsg("还未到竞价时间，请耐心等待~！");
            return resultObj;
        } else if (endDifftime < 0) {
            ResultObj resultObj = new ResultObj(Boolean.FALSE);
            resultObj.setMsg("对不起，竞价已结束");
            return resultObj;
        }
        return new ResultObj(Boolean.FALSE);
    }

    /**
     * 竞品是否在竞价时间内
     *
     * @param id
     * @return
     */
    public boolean canBind(long id) {
        Record competition = Competition.dao.getCompByID(id);
        return iswithinTime(competition.getDate("comp_start_time"), competition.getLong("comp_period")).getIsSuccess();
    }

    /**
     * 创建竞拍人
     *
     * @return
     */
    public String createNickName() {
        Random random = new Random();
        int a = random.nextInt(25) + 65;
        char c = (char) (a);
        StringBuffer sb = new StringBuffer();
        sb.append(c)
                .append(RandomNumUtils.getRandomNum(4));
        return sb.toString();
    }

    /**
     * 查询最高出价人
     */

    /*public List<Record> getMaxPrice(){
        StringBuffer sb = new StringBuffer();
        sb.append("SELECT MAX(r.bid_price) AS mprice,ici.id  as icid, ici.comp_sta,r.* FROM inma_competition_record r LEFT JOIN inma_competition_info ici ON ici.id = r.comp_id LEFT JOIN sys_dict d ON ici.comp_period = d.`value` WHERE r.del_flag = '0' AND r.sta = '0' AND DATE_ADD( ici.comp_start_time, INTERVAL d.`value` DAY ) < NOW() AND ici.comp_sta = '0' GROUP BY r.comp_id");
        return Db.find(sb.toString());
    }*/
    public List<Record> getMaxRecord(){
        StringBuffer sb = new StringBuffer();
        sb.append("SELECT r.comp_id,MAX(r.bid_price) as mprice  FROM inma_competition_record r WHERE r.del_flag = '0' AND r.sta = '0' GROUP BY r.comp_id");
        return Db.find(sb.toString());
    }

    /**
     * 查询user参与的所有竞价
     */
    public List<Record> getOrdersByUser(long uid, String text) {
        StringBuffer sb = new StringBuffer();
        sb.append("SELECT c.*,i.comp_title FROM inma_competition_record c LEFT JOIN inma_competition_info i on c.comp_id=i.id WHERE c.del_flag='0' and  c.user_id=? ");
        if (null != text && !text.equals("")) {
            sb.append(" and i.comp_title LIKE '%").append(text).append("%'");
        }
        sb.append(" ORDER BY c.create_date desc");
        return Db.find(sb.toString(), uid);
    }

    public List<Record> getByUser(long compid, BigDecimal price){
        StringBuffer sb = new StringBuffer();
        sb.append("SELECT r.*, ici.id AS icid, ici.comp_sta FROM inma_competition_record r LEFT JOIN inma_competition_info ici ON ici.id = r.comp_id LEFT JOIN sys_dict d ON ici.comp_period = d.`value` WHERE DATE_ADD( ici.comp_start_time, INTERVAL d.`value` DAY ) < NOW() AND ici.comp_sta = '0' AND r.del_flag = '0' AND r.sta = '0' AND r.comp_id = ? AND r.bid_price = ?");
        return  Db.find(sb.toString(),compid,price);
    }



    /**
     * 查询没有中标的用户
     */
    public List<Record> getNotBidding(long cid, long uid) {
        StringBuffer sb = new StringBuffer();
        sb.append("SELECT * FROM inma_competition_record r WHERE r.comp_id=? and r.user_id !=?");
        return Db.find(sb.toString(), cid, uid);
    }
}
