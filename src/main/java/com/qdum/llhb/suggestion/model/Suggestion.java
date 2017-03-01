package com.qdum.llhb.suggestion.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.FillFieldsUtils;

import java.util.Date;

/**
 * 系统反馈意见
 * Created by rongchao on 2015/12/4.
 */
public class Suggestion extends Model<Suggestion> {

    public static Suggestion dao = new Suggestion();

    /**
     * 主键
     */
    public static final String ID = "id";
    /**
     * 留言内容
     */
    public static final String SUG_CONTENT = "sug_content";
    /**
     * 是否需要与您联系，0-不需要，1-需要
     */
    public static final String NEED_RELATION = "need_relation";
    /**
     * 联系人
     */
    public static final String RELA_USER = "rela_user";
    /**
     * 联系电话
     */
    public static final String RELA_PHONE = "rela_phone";
    /**
     * 电子邮件
     */
    public static final String RELA_MAIL = "rela_mail";
    /**
     * 联系QQ
     */
    public static final String RELA_QQ = "rela_qq";
    public static final String CREATE_BY = "create_by";
    public static final String CREATE_DATE = "create_date";
    public static final String UPDATE_BY = "update_by";
    public static final String UPDATE_DATE = "update_date";
    /**
     * 备注
     */
    public static final String REMARKS = "remarks";
    /**
     * 删除标志，默认为0，删除为1
     */
    public static final String DEL_FLAG = "del_flag";

    public Long getId() {
        return getLong(ID);
    }

    public String getSugContent() {
        return getStr(SUG_CONTENT);
    }

    public Integer getNeedRelation() {
        return getInt(NEED_RELATION);
    }

    public String getRelaUser() {
        return getStr(RELA_USER);
    }

    public String getRelaPhone() {
        return getStr(RELA_PHONE);
    }

    public String getRelaMail() {
        return getStr(RELA_MAIL);
    }

    public String getRelaQQ() {
        return getStr(RELA_QQ);
    }

    public Long getCreateBy() {
        return getLong(CREATE_BY);
    }

    public Date getCreateDate() {
        return getDate(CREATE_DATE);
    }

    public Long getUpdateBy() {
        return getLong(UPDATE_BY);
    }

    public Date getUpdateDate() {
        return getDate(UPDATE_DATE);
    }

    public String getRemarks() {
        return getStr(REMARKS);
    }

    public Integer getDelFlag() {
        return getInt(DEL_FLAG);
    }


    public void setId(Long id) {
        set(ID, id);
    }

    public void setSugContent(String sugContent) {
        set(SUG_CONTENT, sugContent);
    }

    public void setNeedRelation(Integer needRelation) {
        set(NEED_RELATION, needRelation);
    }

    public void setRelaUser(String relaUser) {
        set(RELA_USER, relaUser);
    }

    public void setRelaPhone(String relaPhone) {
        set(RELA_PHONE, relaPhone);
    }

    public void setRelaMail(String relaMail) {
        set(RELA_MAIL, relaMail);
    }

    public void setRelaQQ(String relaQQ) {
        set(RELA_QQ, relaQQ);
    }

    public void setCreateBy(Long createBy) {
        set(CREATE_BY, createBy);
    }

    public void setCreateDate(Date createDate) {
        set(CREATE_DATE, createDate);
    }

    public void setUpdateBy(Long updateBy) {
        set(UPDATE_BY, updateBy);
    }

    public void setUpdateDate(Date updateDate) {
        set(UPDATE_DATE, updateDate);
    }

    public void setRemarks(String remarks) {
        set(REMARKS, remarks);
    }

    public void setDelFlag(Integer delFlag) {
        set(DEL_FLAG, delFlag);
    }

    /**
     * 保存意见反馈
     *
     * @param suggestion
     * @return
     */
    public Boolean insertSuggestion(Suggestion suggestion) {
        FillFieldsUtils.fillCommonInfo(suggestion);
        return suggestion.save();
    }

    public Page<Record> getAllSuggestions(Integer paraToInt, int pageSize, String keyWord){
        String sql = " from sys_suggestion s where s.del_flag = 0 " +
                " and (s.sug_content like '%"+keyWord+"%' " +
                " or s.rela_user like '%"+keyWord+"%' "+
                " or s.rela_phone like '%"+keyWord+"%' "+
                " or s.rela_mail like '%"+keyWord+"%' "+
                " or s.rela_qq like '%"+keyWord+"%' "+
                " ) order by s.id desc";
        return Db.paginate(paraToInt,pageSize,"select * ",sql);
    }
}
