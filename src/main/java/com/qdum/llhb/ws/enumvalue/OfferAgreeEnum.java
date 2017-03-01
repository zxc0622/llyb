package com.qdum.llhb.ws.enumvalue;

/**
 * 报价是否同意枚举
 * 
 * @author rongchao
 *
 */
public enum OfferAgreeEnum {

	/**
	 * 同意
	 */
	AGREE(1),

	/**
	 * 不同意
	 */
	DISAGREE(0);

	private final Integer value;

	// 构造器默认也只能是private, 从而保证构造函数只能在内部使用
	OfferAgreeEnum(Integer value) {
		this.value = value;
	}

	public Integer getValue() {
		return value;
	}
}
