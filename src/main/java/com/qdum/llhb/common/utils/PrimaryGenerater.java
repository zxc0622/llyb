package com.qdum.llhb.common.utils;

/**
 * User: gordonyang
 * Date: 13-4-1
 * Time: 上午11:40
 * 生成流水号
 */
import java.text.SimpleDateFormat;
import java.util.Date;

public class PrimaryGenerater {
    private static PrimaryGenerater primaryGenerater = null;

    private PrimaryGenerater() {
    }

    /**
     * 取得PrimaryGenerater的单例实现
     *
     * @return
     */
    public static PrimaryGenerater getInstance() {
        if (primaryGenerater == null) {
            synchronized (PrimaryGenerater.class) {
                if (primaryGenerater == null) {
                    primaryGenerater = new PrimaryGenerater();
                }
            }
        }
        return primaryGenerater;
    }

    /**
     * 生成下一个编号
     */
    public synchronized String generaterNumber(String prefix) {
        String id = null;
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddhhmmssSSS");
        if (prefix == null) {
            id = "QU"+formatter.format(date);
        } else {
        	id = prefix + formatter.format(date);
        }

        return id;
    }
}
