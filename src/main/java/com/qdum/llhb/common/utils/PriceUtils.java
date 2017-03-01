package com.qdum.llhb.common.utils;

import org.junit.Test;

import com.ibm.icu.math.BigDecimal;
import com.ibm.icu.text.DecimalFormat;
import com.jfinal.log.Logger;

/**
 * 处理价格工具类
 * @author zhaoyl
 * @time 2015年12月24日13:25:32
 * 
 * */
public class PriceUtils {
	/**
	 * 价格格式处理
	 * @author zhaoyl
	 * @param price--需要处理的价格
	 * @return String--eg. 9999.00元 , 1.00万 ， 9999.00万  , 1.00亿
	 * */
	public String priceFormat(Object price){
		Logger log = Logger.getLogger(this.getClass());
		try {
			if(price==null || price.equals("")){
				return "";
			}
			StringBuffer priceStr = new StringBuffer(new BigDecimal(String.valueOf(price)).toString());
			DecimalFormat df = new DecimalFormat("#.00");
			StringBuffer priceInt =new StringBuffer(priceStr.substring(0, priceStr.indexOf(".")));
			int priceLen = priceInt.length();
			if(priceLen<5){//万元以下
				double priceD = Double.parseDouble(priceStr.toString());
				if(priceD == 0) return "0元";
				if(priceD < 1) return priceD+"元";
				return df.format(priceD)+"元"; 
			}else if(priceLen>=5 && priceLen<9){
				priceStr = priceInt.insert(priceInt.length()-4, ".");
				double priceD = Double.parseDouble(priceInt.toString());
				return df.format(priceD)+"万"; 
			}else{
				priceStr = priceInt.insert(priceInt.length()-8, ".");
				double priceD = Double.parseDouble(priceInt.toString());
				return df.format(priceD)+"亿"; 
			}
		} catch (NumberFormatException e) {
			log.error("this price not number fomater");
			return "";
		}catch(Exception e){
			log.error(this.getClass().getName()+" have a error");
			return "";
		}
	}
}
