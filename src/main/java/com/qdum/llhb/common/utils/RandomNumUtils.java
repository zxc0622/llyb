package com.qdum.llhb.common.utils;

import java.util.Random;

/**
 * Created by rongchao on 2015/12/25.
 */
public class RandomNumUtils {

    /**
     * 获取4位随机数
     *
     * @param count
     * @return
     */
    public static String getRandomNum(int count) {
        StringBuffer sb = new StringBuffer();
        String str = "0123456789";
        Random r = new Random();
        for (int i = 0; i < count; i++) {
            int num = r.nextInt(str.length());
            sb.append(str.charAt(num));
            str = str.replace((str.charAt(num) + ""), "");
        }
        return sb.toString();
    }

    public static void main(String[] args) {
//        RandomNumUtils randomNumUtils = new RandomNumUtils();
//        System.out.println(randomNumUtils.getRandomNum(4));
        Random random = new Random();
        int a = random.nextInt(25) + 97;
        System.out.println(a);
        char c = (char) (a);
        System.out.println(c);
    }
}
