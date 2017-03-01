package com.qdum.llhb.common.utils;

import java.util.Date;
import java.util.List;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.ibm.icu.text.DateFormat;
import com.ibm.icu.text.SimpleDateFormat;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.Competition.model.Competition;
import com.qdum.llhb.Competition.model.CompetitionRemind;

/**
 * 类com.qdum.llhb.common.utils.BitTime的功能描述：
 * 定时器
 * @author wcl
 * @date 2016/1/22.
 */
public class BitTime implements Job{
    @Override
    public void execute(JobExecutionContext context) throws JobExecutionException {
        //获取提醒表的数据
        List<Record> list = CompetitionRemind.dao.getBitTime();
        for (int i = 0; i < list.size(); i++) {
        	Date compStartTime =list.get(i).getDate("start_time");  //竞价开始时间
        	Date compStopTime =list.get(i).getDate("end_time");  //竞价结束时间
        	DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        	Date date2=new Date(new Date().getTime()+30 * 60 * 1000);  //当前时间 + 30分钟
        	Date  date1 =new Date(compStartTime.getTime()-30 * 60 * 1000);  // 竞价开始时间 - 30分钟
        	Date  date3 =new Date(compStopTime.getTime() - 30 * 60 * 1000);  // 竞价结束时间 - 30分钟
        	Date date4=new Date(new Date().getTime());  //当前时间
			if(date4.getTime()>date1.getTime()){
			  List<Record> list1 = Competition.dao.getCompetitionId(list.get(i).get("id").toString());
			  List<Record> list2 = Competition.dao.getCompetitionInfoId(list.get(i).get("comp_id").toString());
			  
			  if(list1.get(0).get("remarks")==null||StringUtils.isBlank(list1.get(0).get("remarks").toString())||Integer.valueOf(list1.get(0).get("remarks").toString())<1){
				  Competition.dao.updateCompetition(list.get(i).get("id").toString());
				  String cont="您竞价的 \""+list2.get(0).get("comp_title")+" \"将于"+df.format(compStartTime)+"开始,请及时登录www.yyhb365.com查看";
				  ValiCode.sendCheckCode(list.get(i).get("phone").toString(),cont,null);
			  }
			}
			if(date4.getTime()>date3.getTime()){
				  List<Record> list1 = Competition.dao.getCompetitionId(list.get(i).get("id").toString());
				  List<Record> list2 = Competition.dao.getCompetitionInfoId(list.get(i).get("comp_id").toString());
				  if(list1.get(0).get("remarks")!=null && Integer.valueOf(list1.get(0).get("remarks").toString())<2){
					  Competition.dao.updateCompetition(list.get(i).get("id").toString());
					  String cont="您竞价的 \""+list2.get(0).get("comp_title")+" \"将于"+df.format(compStopTime.getTime()+30 * 60 * 1000)+"结束,请及时登录www.yyhb365.com查看";
					  ValiCode.sendCheckCode(list.get(i).get("phone").toString(),cont,null);
				  }
			}
			
		}

    }
}
