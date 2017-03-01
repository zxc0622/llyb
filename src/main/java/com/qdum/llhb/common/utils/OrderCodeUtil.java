package com.qdum.llhb.common.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 订单编号生成工具类
 * Created by chao on 2016/1/15.
 */
public class OrderCodeUtil {

    private static long orderNum = 0l;
    private static String date;
    private static long orderNum2 = 0l;
    private static String date2;
    private static long orderNum3 = 0l;
    private static String date3;
    private static long orderNum4 = 0l;
    private static String date4;

    /**
     * 生成订单编号
     *
     * @return
     */
    public static synchronized String getOrderNo() {
        String str = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
        if (date == null || !date.equals(str)) {
            date = str;
            orderNum = 0l;
        }
        orderNum++;
        long orderNo = Long.parseLong((date)) * 1000;
        orderNo += orderNum;
        return orderNo + "";
    }

    /**
     * 生成批次编号
     *
     * @return
     */
    public static synchronized String getBacthNo() {
        String str = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
        if (date2 == null || !date2.equals(str)) {
            date2 = str;
            orderNum2 = 0l;
        }
        orderNum2++;
        long orderNo = Long.parseLong((date2)) * 1000;
        orderNo += orderNum2;
        return orderNo + "";
    }

    /**
     * 生成批次编号
     *
     * @return
     */
    public static synchronized String getRepositOrderNo() {
        String str = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
        if (date3 == null || !date3.equals(str)) {
            date3 = str;
            orderNum3 = 0l;
        }
        orderNum3++;
        long orderNo = Long.parseLong((date3)) * 1000;
        orderNo += orderNum3;
        return orderNo + "";
    }

    /**
     * 生成付款详细中的流水号
     *
     * @return
     */
    public static synchronized String getDetailDataNo() {
        String str = new SimpleDateFormat("yyMMddHHmm").format(new Date());
        if (date4 == null || !date4.equals(str)) {
            date4 = str;
            orderNum4 = 0l;
        }
        orderNum4++;
        long orderNo = Long.parseLong((date4)) * 1000;
        orderNo += orderNum4;
        return orderNo + "";
    }

    public static void main(String[] args) throws InterruptedException {
        for (int i = 0; i < 10000; i++) {
            System.out.println(OrderCodeUtil.getOrderNo());
            Thread.sleep(1000);
        }
    }
}
