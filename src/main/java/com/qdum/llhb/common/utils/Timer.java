package com.qdum.llhb.common.utils;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.qdum.llhb.Competition.model.Competition;
import com.qdum.llhb.Competition.model.CompetitionMargin;
import com.qdum.llhb.Competition.model.CompetitionRecord;
import com.qdum.llhb.Competition.model.TmCompOrder;
import com.qdum.llhb.fund.model.Fund;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 类com.qdum.llhb.common.utils.Timer的功能描述：
 *定时器
 * @author wangfeng
 * @date 2016/1/18.
 */
public class Timer implements Job{

    @Override
    @Before(Tx.class)
    public void execute(JobExecutionContext context) throws JobExecutionException {
        //System.out.println("coming too");
        List<Record> Maxs = CompetitionRecord.dao.getMaxRecord();   //获取最高的竞价记录
        long compId = 0;
        long uid = 0;
        for(Record r:Maxs){
            compId = r.getLong("comp_id");
            List<Record> compes = CompetitionRecord.dao.getByUser(compId,r.getBigDecimal("mprice"));  //获取竞价信息与最高竞价记录表信息
            if(compes.size() != 0){
                Record compe = compes.get(0);
                Competition com = Competition.dao.findById(compId);  //获取竞价记录,并将竞价状态改为竞价结束
                //Competition com = Competition.dao.findById(r.getLong("icid"));
                com.set("comp_sta","1").update();

                uid = compe.getLong("user_id");
                TmCompOrder c = TmCompOrder.dao.findById(compId);   // 查看订单表中是否有了订单记录
                boolean flag  = false;
                if(null == c){
                    c = new TmCompOrder();
                    flag = true;
                }
                c.set("user_id",uid).set("comp_id",compId).set("amount",r.get("mprice"));
                c.set("pay_sta","0").set("order_sta","0");
                if(flag == true){
                    c.set("create_by",uid).set("create_date",new Date());
                    c.save();
                }else{
                    c.set("update_by",uid).set("update_date",new Date());
                    c.update();
                }
                //退回保证金

                List<Record> noBid = CompetitionMargin.dao.getNotBidding(compId,uid);
                for(Record b:noBid){
                    Record fund = Fund.dao.getFundUser(b.getLong("user_id"));
                    //Record margin = CompetitionMargin.dao.getMargin(compId,uid);
                    fund.set("fund",((BigDecimal)fund.get("fund")).add((BigDecimal)b.get("margin_money")));
                    Db.update("tm_fund",fund);//将tm_fund表的fund增加
                    //设置为已退回
                    b.set("sta","1");
                    Db.update("inma_competition_margin_pay",b);

                }
            }


        }


    }
}
