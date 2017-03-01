/*
 * @(#)NumberUtils.java.java Mar 1, 2007
 * Copyright 2007 ThinkJ organization, Inc. All rights reserved
 */
package com.qdum.llhb.common.utils;

import java.math.BigDecimal;
import java.text.DecimalFormat;

/**
 * 
 * Author  : 王希涛<br>
 * Company : wxtsoftware<br>
 * Version : 1.0<br>
 * Date    : Mar 1, 2007<br>
 */
public class NumberUtil {

    /**
     * 检测一个字符串是否是数字串
     * @param str 待检测的字符串
     * @return
     */
    public static boolean isDigit(String str){
        if( str == null || str.trim().equals("") ) return false;
        for( int i=0 ; i<str.length() ; i++ ){
            if(!isDigit(str.charAt(i))){
                return false;
            }
        }
        return true;
    }
    
    /**
     * 检测一个字符是否是数字
     * @param ch 待检测的字符
     * @return
     */
    public static boolean isDigit(char ch){
        String num = "0123456789";
        for(int i=0; i<10 ; i++){
            if( ch == num.charAt(i)){
                return true;
            }
        }
        return false;
    }
    
    
    //-----------------------------------------------将Object类型转换为数值
    

    /**
     * 若ob是一个数字串，返回相应的数字值<p>
     * 若ob不是一个数字串，返回defaultValue
     * @param ob            :指定的对象
     * @param defaultValue  :转换出错时默认的返回值
     * @return
     * @throws Exception
     */
    public static Short toShort( Object ob , Short defaultShort){
    
        if( ob==null ){
            return  defaultShort;
        }
        
        if( ob instanceof Integer ){
            return ((Integer)ob).shortValue();
        }else if( ob instanceof Float ){
            return ((Float)ob).shortValue();
        }else if( ob instanceof Double ){
            return ((Double)ob).shortValue();
        }else if( ob instanceof Byte ){
            return ((Byte)ob).shortValue();
        }else{
            try{
                return new Short(ob.toString());
            }catch(Exception e){
                return defaultShort;
            }
        }
    }
    
    /**
     * 若ob是一个数字串，返回相应的数字值<p>
     * 若ob不是一个数字串，返回0
     * @param ob            :指定的对象
     * @return
     */
    public static Short toShort( Object ob ){
        return toShort(ob,Short.valueOf("0"));
    }
    
    /**
     * 若ob是一个数字串，返回相应的数字值<p>
     * 若ob不是一个数字串，返回defaultValue
     * @param ob            :指定的对象
     * @param defaultValue  :转换出错时默认的返回值
     * @return
     * @throws Exception
     */
    public static Integer toInteger( Object ob , Integer defaultInteger){
    
        if( ob==null ){
            return  defaultInteger;
        }
        
        if( ob instanceof Integer ){
            return ((Integer)ob).intValue();
        }else if( ob instanceof Float ){
            return ((Float)ob).intValue();
        }else if( ob instanceof Double ){
            return ((Double)ob).intValue();
        }else if( ob instanceof Byte ){
            return ((Byte)ob).intValue();
        }else{
            try{
                return new Integer(ob.toString());
            }catch(Exception e){
                return defaultInteger;
            }
        }
    }
    
    /**
     * 若ob是一个数字串，返回相应的数字值<p>
     * 若ob不是一个数字串，返回0
     * @param ob            :指定的对象
     * @return
     */
    public static Integer toInteger( Object ob ){
        return toInteger(ob,0);
    }
    
    /**
     * 若ob是一个数字串，返回相应的数字值<p>
     * 若ob不是一个数字串，返回defaultValue
     * @param ob            :指定的字符串
     * @param defaultValue  :转换出错时默认的返回值
     * @return
     * @throws Exception
     */
    public static Long toLong(Object ob,Long defaultLong) {

        if( ob==null ){
            return  defaultLong;
        }
        
        if( ob instanceof Integer ){
            return ((Integer)ob).longValue();
        }else if( ob instanceof Float ){
            return ((Float)ob).longValue();
        }else if( ob instanceof Double ){
            return ((Double)ob).longValue();
        }else if( ob instanceof Byte ){
            return ((Byte)ob).longValue();
        }else{
            try{
                return new Long(ob.toString());
            }catch(Exception e){
                return defaultLong;
            }
        }
    }

    /**
     * 若ob是一个数字串，返回相应的数字值<p>
     * 若ob不是一个数字串，返回0
     * @param ob            :指定的对象
     * @return
     */
    public static Long toLong( Object ob ){
        return toLong(ob,0l);
    }
    
    /**
     * 若ob是一个数字串，返回相应的数字值<p>
     * 若ob不是一个数字串，返回defaultValue
     * @param ob            :指定的对象
     * @param defaultValue  :转换出错时默认的返回值
     * @return
     * @throws Exception
     */
    public static Float toFloat(Object ob,Float defaultFloat) {

        if( ob==null ){
            return  defaultFloat;
        }
        
        if( ob instanceof Integer ){
            return ((Integer)ob).floatValue();
        }else if( ob instanceof Float ){
            return ((Float)ob).floatValue();
        }else if( ob instanceof Double ){
            return ((Double)ob).floatValue();
        }else if( ob instanceof Byte ){
            return ((Byte)ob).floatValue();
        }else{
            try{
                return new Float(ob.toString());
            }catch(Exception e){
                return defaultFloat;
            }
        }
    }

    /**
     * 若ob是一个数字串，返回相应的数字值<p>
     * 若ob不是一个数字串，返回0
     * @param ob            :指定的对象
     * @return
     */
    public static Float toFloat( Object ob ){
        return toFloat(ob,0f);
    }
    
    /**
     * 若ob是一个数字串，返回相应的数字值<p>
     * 若ob不是一个数字串，返回defaultValue
     * @param ob           :指定的对象
     * @param defaultValue  :转换出错时默认的返回值
     * @return
     * @throws Exception
     */
    public static Double toDouble(Object ob,Double defaultDouble) {

        if( ob==null ){
            return  defaultDouble;
        }
        
        if( ob instanceof Integer ){
            return ((Integer)ob).doubleValue();
        }else if( ob instanceof Float ){
            return ((Float)ob).doubleValue();
        }else if( ob instanceof Double ){
            return ((Double)ob).doubleValue();
        }else if( ob instanceof Byte ){
            return ((Byte)ob).doubleValue();
        }else{
            try{
                return new Double(ob.toString());
            }catch(Exception e){
                return defaultDouble;
            }
        }
    }

    /**
     * 若ob是一个数字串，返回相应的数字值<p>
     * 若ob不是一个数字串，返回0
     * @param ob            :指定的对象
     * @return
     */
    public static Double toDouble( Object ob ){
        return toDouble(ob,0d);
    }
    
    /**
     * 若ob是一个数字串，返回相应的数字值<p>
     * 若ob不是一个数字串，返回defaultValue
     * @param ob            :指定的对象
     * @param defaultValue  :转换出错时默认的返回值
     * @return
     * @throws Exception
     */
    public static Byte toByte(Object ob,Byte defaultByte) {

        if( ob==null ){
            return  defaultByte;
        }
        
        if( ob instanceof Integer ){
            return ((Integer)ob).byteValue();
        }else if( ob instanceof Float ){
            return ((Float)ob).byteValue();
        }else if( ob instanceof Double ){
            return ((Double)ob).byteValue();
        }else if( ob instanceof Byte ){
            return ((Byte)ob).byteValue();
        }else{
            try{
                return new Byte(ob.toString());
            }catch(Exception e){
                return defaultByte;
            }
        }
    }

    /**
     * 若ob是一个数字串，返回相应的数字值<p>
     * 若ob不是一个数字串，返回0
     * @param ob            :指定的对象
     * @return
     */
    public static Byte toByte( Object ob ){
        return toByte(ob,(byte)0);
    }
    
    
    //-----------------------------------------------精确计算
    

    /**
     * 精确计算：加法运算
     * @param v1
     * @param v2
     * @return
     */
    public static double add(double v1, double v2) {
        BigDecimal b1 = new BigDecimal(Double.toString(v1));
        BigDecimal b2 = new BigDecimal(Double.toString(v2));
        return b1.add(b2).doubleValue();
    }

    /**
     * 精确计算：加法运算<BR>
     * 若为null，则初始化为0
     * @param v1
     * @param v2
     * @return
     */
    public static double add(Double v1, Double v2) {
        if( v1==null ){
            v1=0d;
        }
        if( v2==null ){
            v2=0d;
        }
        double s1 = v1 , s2 = v2;
        return add(s1,s2);
    }

    /**
     * 精确计算：减法运算<BR>
     * 若值为0，则返回null
     * @param v1
     * @param v2
     * @return
     */
    public static Double add1(Double v1, Double v2) {
        if( v1==null ){
            v1=0d;
        }
        if( v2==null ){
            v2=0d;
        }
        double s1 = v1 , s2 = v2;
        double v = add(s1,s2);
        if( v==0 ){
            return null;
        }
        return Double.valueOf(v);
    }

    /**
     * 精确计算：减法运算
     * @param v1
     * @param v2
     * @return
     */
    public static double sub(double v1, double v2) {
        BigDecimal b1 = new BigDecimal(Double.toString(v1));
        BigDecimal b2 = new BigDecimal(Double.toString(v2));
        return b1.subtract(b2).doubleValue();
    }

    /**
     * 精确计算：减法运算<BR>
     * 若为null，则初始化为0
     * @param v1
     * @param v2
     * @return
     */
    public static double sub(Double v1, Double v2) {
        if( v1==null ){
            v1=0d;
        }
        if( v2==null ){
            v2=0d;
        }
        double s1 = v1 , s2 = v2;
        return sub(s1,s2);
    }

    /**
     * 精确计算：减法运算<BR>
     * 若值为0，则返回null
     * @param v1
     * @param v2
     * @return
     */
    public static Double sub1(Double v1, Double v2) {
        if( v1==null ){
            v1=0d;
        }
        if( v2==null ){
            v2=0d;
        }
        double s1 = v1 , s2 = v2;
        double v = sub(s1,s2);
        if( v==0 ){
            return null;
        }
        return Double.valueOf(v);
    }

    /**
     * 精确计算：乘法运算
     * @param v1
     * @param v2
     * @return
     */
    public static double mul(double v1, double v2) {
        BigDecimal b1 = new BigDecimal(Double.toString(v1));
        BigDecimal b2 = new BigDecimal(Double.toString(v2));
        return b1.multiply(b2).doubleValue();
    }

    /**
     * 精确计算：乘法运算<BR>
     * 若为null，则初始化为0
     * @param v1
     * @param v2
     * @return
     */
    public static double mul(Double v1, Double v2) {
        if( v1==null ){
            v1=0d;
        }
        if( v2==null ){
            v2=0d;
        }
        double s1 = v1 , s2 = v2;
        return mul(s1,s2);
    }

    /**
     * 精确计算：乘法运算<BR>
     * 若值为0，则返回null
     * @param v1
     * @param v2
     * @return
     */
    public static Double mul1(Double v1, Double v2) {
        if( v1==null || v2==null || v1.doubleValue()==0 || v2.doubleValue()==0 ){
            return null;
        }
        double s1 = v1 , s2 = v2;
        double v = mul(s1,s2);
        if( v==0 ){
            return null;
        }
        return Double.valueOf(v);
    }

    /**
     * 精确计算：除法运算
     * @param v1
     * @param v2
     * @param scale 保留小数的位数
     * @return
     */
    public static double div(double v1, double v2, int scale) {
        if (scale < 0)
            throw new IllegalArgumentException
                  ("The scale must be a positive integer or zero");
        BigDecimal b1 = new BigDecimal(Double.toString(v1));
        BigDecimal b2 = new BigDecimal(Double.toString(v2));
        return b1.divide(b2, scale, 4).doubleValue();
    }

    /**
     * 精确计算：除法运算<BR>
     * 若为null，则初始化为0
     * @param v1
     * @param v2
     * @return
     */
    public static double div(Double v1, Double v2) {
        if( v1==null ){
            v1=0d;
        }
        if( v2==null ){
            v2=0d;
        }
        double s1 = v1 , s2 = v2;
        return div(s1,s2,4);
    }

    /**
     * 精确计算：除法运算<BR>
     * 若值为0，则返回null，若分母为0，则返回null
     * @param v1
     * @param v2
     * @return
     */
    public static Double div1(Double v1, Double v2) {
        if( v1==null || v2==null || v1.doubleValue()==0 || v2.doubleValue()==0 ){
            return null;
        }
        double s1 = v1 , s2 = v2;
        double v = div(s1,s2,8);
        if( v==0 ){
            return null;
        }
        return Double.valueOf(v);
    }

    /**
     * 精确计算：除法运算<BR>
     * 若为null，则初始化为0
     * @param v1
     * @param v2
     * @return
     */
    public static double div(Double v1, Double v2, int scale) {
        if( v1==null ){
            v1=0d;
        }
        if( v2==null ){
            v2=0d;
        }
        double s1 = v1 , s2 = v2;
        return div(s1,s2,scale);
    }


    
    //-----------------------------------------------四舍五入格式化
    

    /**
     * 四舍五入：保留n位有效小树
     * @param v1
     * @param scale 保留小数的位数
     * @return
     */
    public static double round(double v, int scale) {
        if (scale < 0)
            throw new IllegalArgumentException
                  ("The scale must be a positive integer or zero");
        BigDecimal b = new BigDecimal(Double.toString(v));
        BigDecimal one = new BigDecimal("1");
        return b.divide(one, scale, 4).doubleValue();
    }

    /**
     * 四舍五入：保留n位有效小树
     * @param v1
     * @param scale 保留小数的位数
     * @return
     */
    public static float roundFloat(double v, int scale) {
        if (scale < 0)
            throw new IllegalArgumentException
                  ("The scale must be a positive integer or zero");
        BigDecimal b = new BigDecimal(Double.toString(v));
        BigDecimal one = new BigDecimal("1");
        return b.divide(one, scale, 6).floatValue();
    }

    /**
     * 四舍五入：保留n位有效小树，当小数位前小于15位时有效
     * @param v1
     * @param scale 保留小数的位数
     * @return
     */
    public static double foramt(double v, String format) {
        DecimalFormat sos = new DecimalFormat(format);
        String s = sos.format(v);
        return Double.parseDouble(s);
    }

    /**
     * 四舍五入：保留n位有效小树，当小数位前小于15位时有效<BR>
     * 默认格式化:###.##<BR>
     * 
     * @param v1
     * @param scale 保留小数的位数
     * @return
     */
    public static Double foramt(Double v) {
        if(v==null){
            return null;
        }
        DecimalFormat sos = new DecimalFormat("###.####");
        String s = sos.format(v);
        s = filterZero(s);
        
        return Double.parseDouble(s);
    }

    /**
     * 四舍五入：保留n位有效小树，当小数位前小于15位时有效<BR>
     * 默认格式化:###.##<BR>
     * 
     * @param v1
     * @param scale 保留小数的位数
     * @return
     */
    public static String foramt4(Object ob) {
        if(ob==null){
            return "";
        }
        
        Double value = toDouble(ob,null);
        if( value==null ){
            return "";
        }
        
        DecimalFormat sos = new DecimalFormat("##,##0.0000");
        String s = sos.format(value);
        
        return s;
    }

    /**
     * 四舍五入：保留n位有效小树，当小数位前小于15位时有效<BR>
     * 默认格式化:###.##<BR>
     * 
     * @param v1
     * @param scale 保留小数的位数
     * @return
     */
    public static Double foramtDouble(Double v) {
        if(v==null){
            return null;
        }
        DecimalFormat sos = new DecimalFormat("##0.0000");
        String s = sos.format(v);
        s = filterZero(s);
        
        return Double.parseDouble(s);
    }

    /**
     * 四舍五入：保留n位有效小树，当小数位前小于15位时有效<BR>
     * 默认格式化:###.##<BR>
     * 
     * @param v1
     * @param scale 保留小数的位数
     * @return
     */
    public static Integer foramtInteger(Double v) {
        return NumberUtil.toInteger(v);
    }

    /**
     * 为报表数据制定的格式化方法，返回值为 ##,##.## 或者为空字符串
     * 保留2位小数，若超过两位小数，则保留原样
     * @param ob
     * @return
     */
    public static String formatI18N( Object ob, String formatType ){
        if( ob==null ){
            return "";
        }
        
        Double value = toDouble(ob,null);
        if( value==null ){
            return "";
        }
        
        //value = round(value,4);
            
        DecimalFormat sos = new DecimalFormat(formatType);
        String s = sos.format(value);
        //s = filterZero(s);

//        String[] ss = s.split("\\.");
//        if( ss.length==1 ){
//            return s+".00";
//        }
//        
//        if( ss[1].length()==1 ){
//            return s+"0";
//        }

        return s;
    }

    /**
     * 为报表数据制定的格式化方法，返回值为 ##,##.## 或者为空字符串
     * 保留2位小数，若超过两位小数，则保留原样
     * @param ob
     * @return
     */
    public static String formatI18N( Object ob ){
        if( ob==null ){
            return "";
        }
        
        Double value = toDouble(ob,null);
        if( value==null ){
            return "";
        }
        
        value = round(value,4);
            
        DecimalFormat sos = new DecimalFormat("##,##0.0000");
        String s = sos.format(value);
        s = filterZero(s);

        String[] ss = s.split("\\.");
        if( ss.length==1 ){
            return s+".00";
        }
        
        if( ss[1].length()==1 ){
            return s+"0";
        }

        return s;
    }

    /**
     * 为报表数据制定的格式化方法，返回值为 ##,##.## 或者为空字符串
     * @param ob
     * @return
     */
    public static String formatI18NOrInteger( Object ob, String formatType ){

        if( ob==null ){
            return "";
        }
        
        Double value = toDouble(ob,null);
        if( value==null ){
            return "";
        }
        
        value = round(value,4);
            
        DecimalFormat sos = new DecimalFormat(formatType);
        String s = sos.format(value);
        s = filterZero(s);

        if( s==null || s.trim().length()==0 || s.indexOf(".")==-1 ){
            return s;
        }
        
        String[] ss = s.split("\\.");
        if( ss.length==1 ){
            s = s+".00";
        }else if( ss[1].length()==1 ){
            s = s+"0";
        }

        String[] strs = s.split("\\.");
        if( strs==null || strs.length<2 ){
            return s;
        }
        
        //若小数点后为0，则直接取整数
        if( "00".equals(strs[1]) ){
            return strs[0];
        }
        return s;
    }

    /**
     * 为报表数据制定的格式化方法，返回值为 ##,##.## 或者为空字符串
     * @param ob
     * @return
     */
    public static String formatI18NOrInteger( Object ob ){
        String s = formatI18N(ob);
        String[] strs = s.split("\\.");
        if( strs==null || strs.length<2 ){
            return s;
        }
        
        //若小数点后为0，则直接取整数
        if( "00".equals(strs[1]) ){
            return strs[0];
        }
        return s;
    }

    /**
     * 为报表数据制定的格式化方法，返回值为 ##,##.## 或者为空字符串
     * @param ob
     * @return
     */
    public static String integerI18N( Object ob ){
        if( ob==null ){
            return "";
        }
        
        Integer value = toInteger(ob,null);
        if( value==null ){
            return "";
        }
        
        DecimalFormat sos = new DecimalFormat("##,###");
        String s = sos.format(value);
        return s;
    }
    
    /**
     * 求此方
     * @param v 底数
     * @param n 次方数
     * @return
     */
    public static Double  powerOfN( Double v, int n ){
        Double value = 1d;
        if( n==0 ){
            return 1d;
        }else if( n>0 ){
            for( int i=0; i<n; i++ ){
                value = value * v;
            }
        }else if( n<0 ){
            for( int i=0; i<(0-n); i++ ){
                value = value / v;
            }
        }
        return value;
    }

    /**
     * 四舍五入：保留n位有效小树，当小数位前小于15位时有效<BR>
     * 默认格式化:###.##<BR>
     * 
     * @param v1
     * @param scale 保留小数的位数
     * @return
     */
    public static String formatToString(Double v) {
        if(v==null){
            return "";
        }
        try{
            DecimalFormat sos = new DecimalFormat("###.####");
            String s = sos.format(v);
            return s;
        }catch(Exception e){
            return v.toString();
        }
    }

    /**
     * 将最后的小数位保留，至少两位小数，若超过2位，则保留
     * @param str
     * @return
     */
    public static String filterZero( String str ){
        if( str==null || str.trim().length()==0 || str.indexOf(".")==-1 ){
            return str;
        }
        
        String[] s = str.split("\\.");
        if( s[1].length()<=2 ){
            return str;
        }
        while( s[1].endsWith("0") ){
            s[1] = s[1].substring(0,s[1].length()-1);
        }
        
        
        if( s[1].length()==0 ){
            return s[0]+".00";
        }else if( s[1].length()==1 ){
            return s[0]+"."+s[1]+"0";
        }else{
            return s[0]+"."+s[1];
        }
    }
    
    
    /**
     * 四舍五入：保留n位有效小树，当小数位前小于15位时有效<BR>
     * 默认格式化:###.##<BR>
     * 
     * @param v1
     * @param scale 保留小数的位数
     * @return
     */
    public static String formatToString(Double v, String format) {
        if(v==null){
            return "";
        }
        try{
            DecimalFormat sos = new DecimalFormat(format);
            String s = sos.format(v);
            return s;
        }catch(Exception e){
            return v.toString();
        }
    }

    public static final String FORMAT_I18N   = "##,###";
    public static final String FORMAT_I18N_1 = "##,##0.0";
    public static final String FORMAT_I18N_2 = "##,##0.00";
    public static final String FORMAT_I18N_3 = "##,##0.000";
    public static final String FORMAT_I18N_4 = "##,##0.0000";
    public static final String FORMAT_I18N_5 = "##,##0.00000";
    public static final String FORMAT_I18N_6 = "##,##0.000000";
    
    public static void main( String[] args ){
        System.out.println( formatI18N(123456789) );
        System.out.println( formatI18N(1234567.0) );
        System.out.println( formatI18N(1234567.00) );
        System.out.println( formatI18N(1234567.000) );
        System.out.println( formatI18N(1234567.1) );
        System.out.println( formatI18N(1234567.12) );
        System.out.println( formatI18N(1234567.123) );
        System.out.println( formatI18N(1234567.1234) );
        System.out.println( formatI18N(12345678.125) );
        System.out.println( formatI18N(12345678.12577) );
        System.out.println( formatI18N(0.12577) );
//        
//        System.out.println( "" );
//        
//        System.out.println( formatI18N(1234567.0d) );
//        System.out.println( formatI18N(1234567.00d) );
//        System.out.println( formatI18N(1234567.000d) );
//        System.out.println( formatI18N(1234567.1d) );
//        System.out.println( formatI18N(1234567.12d) );
//        System.out.println( formatI18N(1234567.123d) );
//        System.out.println( formatI18N(1234567.1234d) );
//        System.out.println( formatI18N(12345678.125d) );
//        System.out.println( formatI18N(12345678.12577d) );
//
//        System.out.println( "" );
//        
//        System.out.println( formatI18N("1234567.0") );
//        System.out.println( formatI18N("1234567.00") );
//        System.out.println( formatI18N("1234567.000") );
//        System.out.println( formatI18N("1234567.1") );
//        System.out.println( formatI18N("1234567.12") );
//        System.out.println( formatI18N("1234567.123") );
//        System.out.println( formatI18N("1234567.1234") );
//        System.out.println( formatI18N("12345678.125") );
//        System.out.println( formatI18N("12345678.12577") );
//
//        System.out.println( "" );
//
//        System.out.println( formatI18N("das.12577") );
    

//    System.out.println( integerI18N(123456789) );
//    System.out.println( integerI18N(1234567.0) );
//    System.out.println( integerI18N(1234567.00) );
//    System.out.println( integerI18N(1234567.000) );
//    System.out.println( integerI18N(1234567.1) );
//    System.out.println( integerI18N(1234567.12) );
//    System.out.println( integerI18N(1234567.123) );
//    System.out.println( integerI18N(1234567.1234) );
//    System.out.println( integerI18N(12345678.125) );
//    System.out.println( integerI18N(12345678.12577) );
//    
//    System.out.println( "" );
//    
//    System.out.println( integerI18N(1234567.0d) );
//    System.out.println( integerI18N(1234567.00d) );
//    System.out.println( integerI18N(1234567.000d) );
//    System.out.println( integerI18N(1234567.1d) );
//    System.out.println( integerI18N(1234567.12d) );
//    System.out.println( integerI18N(1234567.123d) );
//    System.out.println( integerI18N(1234567.1234d) );
//    System.out.println( integerI18N(12345678.125d) );
//    System.out.println( integerI18N(12345678.12577d) );
//
//    System.out.println( "" );
//    
//    System.out.println( integerI18N("1234567.0") );
//    System.out.println( integerI18N("1234567.00") );
//    System.out.println( integerI18N("1234567.000") );
//    System.out.println( integerI18N("1234567.1") );
//    System.out.println( integerI18N("1234567.12") );
//    System.out.println( integerI18N("1234567.123") );
//    System.out.println( integerI18N("1234567.1234") );
//    System.out.println( integerI18N("12345678.125") );
//    System.out.println( integerI18N("12345678.12577") );
//
//    System.out.println( "" );
//
//    System.out.println( integerI18N("das.12577") );
//        System.out.println("das".substring(1,1) );
//        System.out.println(formatToString(12345d) );
//        System.out.println(formatToString(12345.1) );
//        System.out.println(formatToString(12345.12) );
//        System.out.println(formatToString(12345.123) );
//        System.out.println(formatToString(12345.1234) );


//        System.out.println(formatI18N("12.0001") );
//        System.out.println(formatI18NOrInteger("12.0000") );
//        System.out.println(toInteger("12.0000") );
        
    }
}
