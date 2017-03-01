package com.qdum.llhb.ws.enumvalue;

/**
 * 环保方资料审批状态枚举
 * 
 * @author rongchao
 *
 */
public enum EPAuditStatusEnum {
	/**
	 * 审批通过
	 */
	APPROVE_STATUS("0"),

	/**
	 * 审批不通过(资料未完善)
	 */
	UNAPPROVE_STATUS("1");

	private final String value;

	// 构造器默认也只能是private, 从而保证构造函数只能在内部使用
	EPAuditStatusEnum(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}
}
