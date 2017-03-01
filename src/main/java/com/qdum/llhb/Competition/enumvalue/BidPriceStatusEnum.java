package com.qdum.llhb.Competition.enumvalue;

/**
 * 竞价状态
 * Created by rongchao on 2015/12/30.
 */
public enum BidPriceStatusEnum {
    /**
     * 未到竞价时间
     */
    NOT_COME("notCome"),

    /**
     * 在竞价时间内
     */
    WITHIN("within"),

    /**
     * 竞价结束
     */
    END("end");

    private final String value;

    // 构造器默认也只能是private, 从而保证构造函数只能在内部使用
    BidPriceStatusEnum(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
