package com.qdum.llhb.sys.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;

import java.util.Date;
import java.util.List;

/**
 * Created by yaoyt on 15/12/22.
 */
public class UserQq extends Model<UserQq> {
    private static final long serialVersionUID = 1L;
    public static final UserQq dao = new UserQq();

    public static final String ID = "id";
    public static final String USER_ID = "user_id";
    public static final String OEPNID = "openid";
    public static final String TOKEN = "token";
    public static final String NICKNAME = "nickname";
    public static final String HEADIMG = "headImg";
    public static final String CREATE_BY = "create_by";
    public static final String CREATE_DATE = "create_date";
    public static final String UPDATE_BY = "create_by";
    public static final String UPDATE_DATE = "create_date";
    public static final String DEL_FLAG = "del_flag";

    public void setId(Long id) {
        set(ID, id);
    }

    public Long getId() {
        return getLong(ID);
    }

    public void setUserId(Long userId){
        set(USER_ID,userId);
    }

    public Long getUserId(){
        return getLong(USER_ID);
    }

    public void setOpenid(String openid){
        set(OEPNID,openid);
    }

    public String getOpenid(){
        return getStr(OEPNID);
    }

    public void setToken(String token){
        set(TOKEN,token);
    }

    public String getToken(){
        return getStr(TOKEN);
    }

    public void setNickname(String nickname){
        set(NICKNAME,nickname);
    }

    public String getNickname(){
        return getStr(NICKNAME);
    }

    public void setHeadImg(String headImg){
        set(HEADIMG,headImg);
    }

    public String getHeadimg(){
        return getStr(HEADIMG);
    }

    public Long getCreateBy() {
        return getLong(CREATE_BY);
    }

    public void setCreateBy(Long createBy ) {
        set(CREATE_BY,createBy);
    }

    public Date getCreateDate() {
        return (Date)get(CREATE_DATE);
    }

    public void setCreateDate(Date createDate ) {
        set(CREATE_DATE,createDate);
    }

    public Long getUpdateBy() {
        return getLong(UPDATE_BY);
    }

    public void setUpdateBy(Long createBy ) {
        set(UPDATE_BY,createBy);
    }

    public Date getUpdateDate(){
        return getDate(UPDATE_DATE);
    }

    public void setUpdateDate(Date createDate ){
        set(UPDATE_DATE,createDate);
    }

    public void setDelFlag(Integer delFlag ){
        set(DEL_FLAG,delFlag);
    }

    public Integer getDelFlag(){
        return getInt(DEL_FLAG);
    }


    public void deleteOtherQQ(Long id) {
        String sql = "update sys_user_qq set del_flag = '1' where user_id = ?";
        Db.update(sql,id);
    }

    public UserQq getUserByOpenid(String openid) {
        String sql = "select * from  sys_user_qq where openid = ? and del_flag = 0";
        return UserQq.dao.findFirst(sql,openid);
    }

    public UserQq getUserByUserId(Long id) {
        String sql = " select * from sys_user_qq where user_id = ? ";
        return this.findFirst(sql,id);
    }
}
