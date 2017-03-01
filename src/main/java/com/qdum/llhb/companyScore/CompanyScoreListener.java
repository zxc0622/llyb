package com.qdum.llhb.companyScore;

import java.util.Calendar;
import java.util.Date;
import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


public class CompanyScoreListener implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		Calendar c = Calendar.getInstance();
		try {
			c.setTime(new Date());
			c.add(c.DAY_OF_MONTH, 1);
			c.set(c.HOUR_OF_DAY, 3);
			Timer timer = new Timer();
			timer.scheduleAtFixedRate(new CompanyScoreTimerTask(), c.getTime(), 1000*60*60*24);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
