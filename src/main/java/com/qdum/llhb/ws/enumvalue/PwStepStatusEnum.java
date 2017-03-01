package com.qdum.llhb.ws.enumvalue;

/**
 * 产废企业的流程节点
 * 
 * @author rongchao
 *
 */
public enum PwStepStatusEnum {

	// 通过括号赋值,而且必须带有一个参构造器和一个属性跟方法，否则编译出错
	// 赋值必须都赋值或都不赋值，不能一部分赋值一部分不赋值；如果不赋值则不能写构造器，赋值编译也出错
	/**
	 * 填写基本资料
	 */
	BASEINFO_STEP("00"),

	/**
	 * 查阅合同
	 */
	CONTRACT_STEP("10"),

	/**
	 * 管理计划
	 */
	PLAN_STEP("20"),

	/**
	 * 邮寄资料
	 */
	POST_DATA_STEP("30"),

	/**
	 * 支付并备案
	 */
	PAY_AND_RECORD_STEP("40"),

	/**
	 * 审批办理中
	 */
	AUDITING_STEP("50"),

	/**
	 * 通知收运
	 */
	NOTICE_COLLECTION_TRANSPORTATION_STEP("60"),
	
	/**
	 * 结束
	 */
	END("70");

	private final String value;

	// 构造器默认也只能是private, 从而保证构造函数只能在内部使用
	PwStepStatusEnum(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}
}
