package com.qdum.llhb.Competition.enumvalue;

/**
 * Created by rongchao on 2015/12/25.
 */
public enum SolidWasteEnum {

    /**
     * 未删除
     */
    GENERAL(347),

    /**
     * 删除
     */
    DANGER(348);

    private final Integer value;

    // 构造器默认也只能是private, 从而保证构造函数只能在内部使用
    SolidWasteEnum(Integer value) {
        this.value = value;
    }

    public Integer getValue() {
        return value;
    }
}
