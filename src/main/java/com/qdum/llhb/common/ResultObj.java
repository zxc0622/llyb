package com.qdum.llhb.common;

/**
 * 结果返回封装类
 * Created by rongchao on 2015/12/28.
 */
public class ResultObj {

    public ResultObj(boolean isSuccess) {
        this.isSuccess = isSuccess;
    }

    public static final ResultObj successResultObj = new ResultObj(Boolean.TRUE);

    private Boolean isSuccess;

    private String msg;

    public Boolean getIsSuccess() {
        return isSuccess;
    }

    public void setIsSuccess(Boolean success) {
        isSuccess = success;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
