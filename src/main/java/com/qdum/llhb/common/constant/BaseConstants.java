package com.qdum.llhb.common.constant;

import com.qdum.llhb.ws.enumvalue.DelFlagEnum;

/**
 * 常量类
 *
 * @author rongchao
 */
public class BaseConstants {

    /**
     * 未删除常量
     */
    public static final int NOT_DELETE = DelFlagEnum.UNDELETE.getValue();

    /**
     * 删除常量
     */
    public static final int DELETE = DelFlagEnum.DELETE.getValue();

    /**
     * 每页的条数(用于分页)
     */
    public static final int PAGESIZE_10 = 10;

    /**
     * 固废竞价竞买记录条数
     */
    public static final int COMPETITION_RECODER_PAGESIZE = 6;
}
