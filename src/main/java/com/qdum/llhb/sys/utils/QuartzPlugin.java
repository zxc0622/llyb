package com.qdum.llhb.sys.utils;

import com.jfinal.ext.weixin.kit.PropKit;
import com.jfinal.kit.StrKit;
import com.jfinal.log.Logger;
import com.jfinal.plugin.IPlugin;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;

/**
 * 类com.qdum.llhb.sys.utils的功能描述：
 *
 * @author wangfeng
 * @date 2016/1/18.
 */
public class QuartzPlugin  implements IPlugin{
    private static final Logger logger = Logger.getLogger(QuartzPlugin.class);

    private Scheduler sched;

    public QuartzPlugin() {}

    public boolean start() {

        try {
            // 创建一个调度器
            sched = StdSchedulerFactory.getDefaultScheduler();
        } catch (SchedulerException e) {
            logger.error(e.getMessage());
        }
        String sJson = PropKit.get("timer");
       JSONArray jsonArray = JSONArray.fromObject(sJson);
        for (int i = 0; i < jsonArray.size(); i++) {
            JSONObject j = jsonArray.getJSONObject(i);
            String className = j.getString("className");
            String cron = j.getString("cron");
            boolean enable = j.getBoolean("enable");
            if (enable == false || StrKit.isBlank(className)||StrKit.isBlank(cron)) {
                return false;
            }
            Class<? extends Job> jobClass = this.getJobClass(className);
            // 配置调度、触发器
            JobDetail jobDetail = JobBuilder.newJob(jobClass).build();
            CronScheduleBuilder builder = CronScheduleBuilder.cronSchedule(cron);
            Trigger trigger = TriggerBuilder.newTrigger().startNow().withSchedule(builder).build();
            try {
                sched.scheduleJob(jobDetail, trigger);
            } catch (SchedulerException e) {
                logger.error(e.getMessage());
            }

        }
        try {
            sched.start();
            //System.out.println("quartz starting");
        } catch (SchedulerException e) {
            logger.error(e.getMessage());
        }
        return true;
    }
    private Class<? extends Job> getJobClass(String className) {
        try {
            Class<? extends Job> jobClass = (Class<? extends Job>) Class.forName(className);
            if (Job.class.isAssignableFrom(jobClass) == false) { throw new IllegalArgumentException("Job class must implement the Job interface."); }
            return jobClass;
        } catch (ClassNotFoundException e) {
            logger.error(e.getMessage());
            throw new IllegalArgumentException(className + " ClassNotFoundException!");
        }
    }

    @Override
    public boolean stop() {
        try {
            sched.shutdown();
        } catch (SchedulerException e) {
            logger.error(e.getMessage());
        }
        return true;
    }
}
