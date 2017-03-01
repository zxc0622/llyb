package com.qdum.llhb.common.utils;

import com.ibm.icu.text.DateFormat;
import com.ibm.icu.text.SimpleDateFormat;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.Competition.model.Competition;
import com.qdum.llhb.Competition.model.CompetitionRemind;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *类ShopSettings的功能描述:定时校验 cs_settings_basic 中没有的数据,并插入
 *@author yaoyt
 *@time 5/5/16 3:36 PM
 */ 
public class ShopSettings implements Job{
    @Override
    public void execute(JobExecutionContext context) throws JobExecutionException {
        String personSql = "select u.id as uid,p.id from sys_user u left join sys_person p on u.id = p.user_id where p.id is null";
        String companySql = "select u.id as uid,p.id from sys_user u left join sys_company p on u.id = p.user_id where p.id is null";
        String shopSql = "select u.id as uid,p.id from sys_user u left join cs_settings_basic p on u.id = p.user_id where p.id is null";
        List<Record> personList = Db.find(personSql);
        List<Record> companyList = Db.find(companySql);
        List<Record> shopList = Db.find(shopSql);
        List<String> sqlList = new ArrayList<String>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String ds = sdf.format(date);
        for (Record r : personList){
            sqlList.add( " INSERT INTO sys_person (user_id,create_by,create_date,del_flag) VALUES ("+r.getLong("uid").toString()+",1,'"+ds+"',0)");
        }
        for (Record r : companyList){
            sqlList.add( " INSERT INTO sys_company (user_id,create_by,create_date,del_flag) VALUES ("+r.getLong("uid").toString()+",1,'"+ds+"',0)");
        }
        for (Record r : shopList){
            sqlList.add( " INSERT INTO cs_settings_basic (user_id,create_by,create_date,del_flag) VALUES ("+r.getLong("uid").toString()+",1,'"+ds+"',0)");
        }
        try {
            Thread.sleep(5000);
            for(String s : sqlList){
                Db.update(s);
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

    }
}
