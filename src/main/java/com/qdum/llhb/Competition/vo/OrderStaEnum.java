package com.qdum.llhb.Competition.vo;

/**
 * 竞价订单状态
 * @author zhaoyl
 * @time 2016年1月21日17:01:48
 * */
public enum OrderStaEnum {
	
	/**
	 * 0--待付款
	 * 
	 * */
	WAIT_PAY(0),
	
	/**
	 * 1--待发货 
	 * 
	 * */
	WAIT_SEND(1),
	
	/**
	 * 2--待收货
	 * 
	 * */
	WAIT_RECEIVE(2),
	
	/**
	 * 3--交易结束
	 * 
	 * */
	TRADE_END(3);
	
	private final int value;
	OrderStaEnum(int value){
		this.value = value;
	}
	public int getValue(){
		return value;
	}
}
