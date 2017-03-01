package com.qdum.llhb.ws.enumvalue;

/**
 * 节点状态，在此处表示节点00的状态
 * 
 * @author rongchao
 *
 */
public enum NodeStepStatusEnum {

	// 通过括号赋值,而且必须带有一个参构造器和一个属性跟方法，否则编译出错
	// 赋值必须都赋值或都不赋值，不能一部分赋值一部分不赋值；如果不赋值则不能写构造器，赋值编译也出错
	/**
	 * 保存状态
	 */
	SAVE_STATUS("0"), 
	/**
	 * 审核中状态
	 */
	AUDITING_STATUS("1"),
	/**
	 * 审核通过状态
	 */
	AUDITED_STATUS("2");

	private final String value;

	// 构造器默认也只能是private, 从而保证构造函数只能在内部使用
	NodeStepStatusEnum(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}
}
