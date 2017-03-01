package com.qdum.llhb.ws.enumvalue;

/**
 * 环保企业的流程节点
 * 
 * @author rongchao
 *
 */
public enum EpStepStatusEnum {

	// 通过括号赋值,而且必须带有一个参构造器和一个属性跟方法，否则编译出错
	// 赋值必须都赋值或都不赋值，不能一部分赋值一部分不赋值；如果不赋值则不能写构造器，赋值编译也出错
	/**
	 * 审核资料并报价
	 */
	AUDITANDOFFER_STEP("00"),

	/**
	 * 上传合同及资料
	 */
	CONTRACT_STEP("10"),

	/**
	 * 确认管理计划
	 */
	ENSURE_PLAN_STEP("20"),

	/**
	 * 审批材料
	 */
	AUDITING_INFO_STEP("50"),

	/**
	 * 安排收运
	 */
	ARRANGE_COLLECTION_TRANSPORTATION_STEP("60"),

	/**
	 * 结束
	 */
	END("70");

	private final String value;

	// 构造器默认也只能是private, 从而保证构造函数只能在内部使用
	EpStepStatusEnum(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}
}
