/**
 * Copyright &copy; 2012-2013 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 * <p/>
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.qdum.llhb.common.utils;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.time.DateFormatUtils;
import com.jfinal.plugin.activerecord.Record;

/**
 * 日期工具类, 继承org.apache.commons.lang.time.DateUtils类
 *
 * @author ThinkGem
 * @version 2013-3-15
 */
public class DateUtils extends org.apache.commons.lang.time.DateUtils {

    private static String[] parsePatterns = {"yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm",
            "yyyy/MM/dd", "yyyy/MM/dd HH:mm:ss", "yyyy/MM/dd HH:mm"};

    /**
     * 得到当前日期字符串 格式（yyyy-MM-dd）
     */
    public static String getDate() {
        return getDate("yyyy-MM-dd");
    }

    /**
     * 得到当前日期字符串 格式（yyyy-MM-dd） pattern可以为："yyyy-MM-dd" "HH:mm:ss" "E"
     */
    public static String getDate(String pattern) {
        return DateFormatUtils.format(new Date(), pattern);
    }

    /**
     * 得到日期字符串 默认格式（yyyy-MM-dd） pattern可以为："yyyy-MM-dd" "HH:mm:ss" "E"
     */
    public static String formatDate(Date date, Object... pattern) {
        String formatDate = null;
        if (pattern != null && pattern.length > 0) {
            formatDate = DateFormatUtils.format(date, pattern[0].toString());
        } else {
            formatDate = DateFormatUtils.format(date, "yyyy-MM-dd");
        }
        return formatDate;
    }

    /**
     * 得到当前时间字符串 格式（HH:mm:ss）
     */
    public static String getTime() {
        return formatDate(new Date(), "HH:mm:ss");
    }

    /**
     * 得到当前日期和时间字符串 格式（yyyy-MM-dd HH:mm:ss）
     */
    public static String getDateTime() {
        return formatDate(new Date(), "yyyy-MM-dd HH:mm:ss");
    }

    /**
     * 得到当前年份字符串 格式（yyyy）
     */
    public static String getYear() {
        return formatDate(new Date(), "yyyy");
    }

    /**
     * 得到当前月份字符串 格式（MM）
     */
    public static String getMonth() {
        return formatDate(new Date(), "MM");
    }

    /**
     * 得到当天字符串 格式（dd）
     */
    public static String getDay() {
        return formatDate(new Date(), "dd");
    }

    /**
     * 得到当前星期字符串 格式（E）星期几
     */
    public static String getWeek() {
        return formatDate(new Date(), "E");
    }

    /**
     * 日期型字符串转化为日期 格式
     * { "yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm",
     * "yyyy/MM/dd", "yyyy/MM/dd HH:mm:ss", "yyyy/MM/dd HH:mm" }
     */
    public static Date parseDate(Object str) {
        if (str == null) {
            return null;
        }
        try {
            return parseDate(str.toString(), parsePatterns);
        } catch (ParseException e) {
            return null;
        }
    }

    /**
     * 获取过去的天数
     *
     * @param date
     * @return
     */
    public static long pastDays(Date date) {
        long t = new Date().getTime() - date.getTime();
        return t / (24 * 60 * 60 * 1000);
    }

    /**
     * 过去的分钟
     *
     * @param date1
     * @param date2
     * @return
     */
    public static long pastMinutes(Date date1, Date date2) {
        long t = date1.getTime() - date2.getTime();
        return t / (60 * 1000);
    }

    /**
     * @param args
     * @throws ParseException
     */
    public static void main(String[] args) throws ParseException {
//		System.out.println(formatDate(parseDate("2010/3/6")));
//		System.out.println(getDate("yyyy年MM月dd日 E"));
//		long time = new Date().getTime()-parseDate("2012-11-19").getTime();
//		System.out.println(time/(24*60*60*1000));
    }

    /**
     * 得到几天前的日期
     *
     * @param d
     * @param day
     * @return
     */
    public static Date getDateBefore(Date d, int day) {
        Calendar now = Calendar.getInstance();
        now.setTime(d);
        now.set(Calendar.DATE, now.get(Calendar.DATE) - day);
        return now.getTime();
    }

    /**
     * 方法getMonthFirstDay的功能描述:获取当前月的第一天
     *
     * @author yaoyt
     * @time 15/12/29 下午1:19
     */
    public static Date getMonthFirstDay() {
        Calendar c = Calendar.getInstance();
        c.add(Calendar.MONTH, 0);
        c.set(Calendar.DAY_OF_MONTH, 1);//设置为1号,当前日期既为本月第一天
        return c.getTime();
    }

    /**
     * 方法getMonthLastDay的功能描述:获取当前月的最后一天
     *
     * @author yaoyt
     * @time 15/12/29 下午1:21
     */
    public static Date getMonthLastDay() {
        Calendar c = Calendar.getInstance();
        c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
        return c.getTime();
    }

    /**
     * 是否是同一周
     *
     * @param date1
     * @param date2
     * @return
     */
    public static Boolean isSameWeek(Date date1, Date date2) {
        Calendar c = Calendar.getInstance();
        c.setTime(date1);
        Calendar c2 = Calendar.getInstance();
        c2.setTime(date2);
        int week1 = c.get(Calendar.WEEK_OF_YEAR);
        int week2 = c2.get(Calendar.WEEK_OF_YEAR);
        if (week1 == week2) {
            return Boolean.TRUE;
        } else {
            return Boolean.FALSE;
        }
    }

    /**
     * 是否是同一月
     *
     * @return
     */
    public static Boolean isSameMonth(Date date1, Date date2) {
        Calendar c = Calendar.getInstance();
        c.setTime(date1);
        Calendar c2 = Calendar.getInstance();
        c2.setTime(date2);
        int month = c.get(Calendar.MONTH);
        int month2 = c2.get(Calendar.MONTH);
        if (month == month2) {
            return Boolean.TRUE;
        } else {
            return Boolean.FALSE;
        }
    }
	/**
	 * 设置多少时间前
	 * @author zhaoyl
	 * @param Datedate-- 需要设置时间
	 * @time 2016年1月6日10:05:06
	 * */
	public String setPastTime(Date date){
		long pastTime = new Date().getTime() - date.getTime();//超过时间
		if(pastTime < 24*3600*1000){//小于一天
			if(pastTime < 3600*1000){
				if(pastTime < 60*1000){
					return "刚刚";
				}else{
					return (pastTime/(60*1000)) + "分钟前";
				}
			}else{
				return (pastTime/(3600*1000)) + "小时前";
			}
		}else{
			return (pastTime/(24*3600*1000)) + "天前";
		}
	}
	
	/**
     * 得到几天后的日期
     *
     * @param d
     * @param day
     * @return
     */
    public static String getDateAfter(int day) {
    	Calendar now = Calendar.getInstance();
    	now.set(Calendar.DATE, now.get(Calendar.DATE) + day);
    	return formatDate(now.getTime(), "yyyy-MM-dd HH:mm:ss");
    }
}
