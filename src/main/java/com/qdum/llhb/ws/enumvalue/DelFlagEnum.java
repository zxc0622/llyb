package com.qdum.llhb.ws.enumvalue;

/**
 * 删除标记枚举
 * 
 * @author rongchao
 *
 */
public enum DelFlagEnum {
	/**
	 * 未删除
	 */
	UNDELETE(0),

	/**
	 * 删除
	 */
	DELETE(1);

	private final Integer value;

	// 构造器默认也只能是private, 从而保证构造函数只能在内部使用
	DelFlagEnum(Integer value) {
		this.value = value;
	}

	public Integer getValue() {
		return value;
	}
}
