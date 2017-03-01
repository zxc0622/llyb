package com.qdum.llhb.Competition.model;

import java.util.Date;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.sys.model.Person;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

/**
 * 竞价记录
 * Created by rongchao on 2015/12/28.
 */
public class CompetitionRemind extends Model<CompetitionRemind> {

    public static CompetitionRemind dao = new CompetitionRemind();

    /**
     * 竞价设置提醒
     *
     * @param compID
     * @return
     */
    public Boolean setRemind(Long compID) {
        CompetitionRemind ctr = new CompetitionRemind();
        Record competition = Competition.dao.getCompByID(compID);
        Date compStartTime = competition.getDate("comp_start_time");
        long compPeriod = competition.getLong("comp_period");
        User user = UserUtils.getUser();
        Person person = user.getPerson();
        ctr.set("comp_id", compID)
                .set("user_id", user.getId())
                .set("phone", person.getPhone())
                .set("email", person.getEmail())
                .set("start_time", compStartTime)
                .set("end_time", new Date(compStartTime.getTime() + (compPeriod * 24 * 60 * 60 * 1000 - 30 * 60 * 1000)))
                .set("create_time", new Date())
                .set("del_flag", false);
        return ctr.save();
    }
   /**
    * 竞价定时器设置
    * @author wcl
    */
    public List<Record> getBitTime(){
    	String sql=" select * from inma_competition_remind where del_flag='0'  and remarks<2 or remarks is NULL";
    	return Db.find(sql);
    }
}
