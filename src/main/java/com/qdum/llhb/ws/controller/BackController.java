package com.qdum.llhb.ws.controller;

import java.io.File;

import org.apache.commons.io.FilenameUtils;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.ext.weixin.kit.PropKit;
import com.jfinal.kit.FileKit;
import com.jfinal.plugin.activerecord.Model;
import com.qdum.llhb.ws.enumvalue.EpStepStatusEnum;
import com.qdum.llhb.ws.enumvalue.PwStepStatusEnum;
import com.qdum.llhb.ws.model.EpOperation;
import com.qdum.llhb.ws.model.PwOperation;
import com.qdum.llhb.ws.model.ServiceMain;

/**
 * Created by Administrator on 2015/12/8.
 */
public class BackController extends Controller{

    private ServiceMain serviceMainDao = ServiceMain.dao;//service主表dao
    private EpOperation epDao = EpOperation.dao;//环保表dao
    private PwOperation pwDao = PwOperation.dao;//危废表dao

    /**
     * 返回基本资料
     */
    @ActionKey("/backBaseInfo")
    public void backBaseInfo(){
        String serId  = getPara("serId");
        String msg = "";
        if(serId != null&&!"".equals(serId)) {
            try {
                EpOperation ep = EpOperation.dao.findByServiceIdString(serId);
                PwOperation pw = PwOperation.dao.findByServiceIdString(serId);
                if(ep.getInt("approve_file")<4){
                    //删除ep表和pw表
                    deleteTable(ep.getLong("id"), getModel(EpOperation.class));
                    deleteTable(pw.getLong("id"), getModel(PwOperation.class));
                    if (serId != null || !"".equals(serId)) {
                        ServiceMain s = serviceMainDao.findById(serId);
                        s.setPwStep(PwStepStatusEnum.BASEINFO_STEP.getValue());//主表pw字段置为00
                        s.setEpStep(EpStepStatusEnum.AUDITANDOFFER_STEP.getValue());//主表ep字段置为00
                        s.setNodeSta("0");
                        s.setMpLoginName("");
                        s.setMpPasswd("");
                        s.setMpAttaAddr("");
                        s.setMpAttaName("");
                        s.update();
                        msg = "ok";
                        //redirect("/ws/productwaste/pwbaseinfo/notfilledPage");//跳转页面
                    }
                }else{
                    msg="支付备案已成功，不能后退修改";
                }

            } catch (Exception e) {
                msg = "发生错误";
            }
        }
        renderText(msg);

    }
    /**
     * 删除表通用
     */
    public boolean deleteTable(long para, Model<?> m){
        boolean b = false;
        //看该表是否存在
        if(m.findById(para)!=null){
            b = m.deleteById(para);//删除表
        }
        return b;
    }
    /**
     * 返回查阅合同
     */
    @ActionKey("/backContract")
    public void backContract(){
        String serId  = getPara("serId");
        String msg = "";
        if(serId != null&&!"".equals(serId)){
            try {
                EpOperation ep = EpOperation.dao.findByServiceIdString(serId);
                PwOperation pw = PwOperation.dao.findByServiceIdString(serId);
                if(ep.getInt("approve_file")<4){
                    ep.set("mp_account","0").set("mp_attachment","0").set("approve_file","0").update();
                    pw.set("mp_account","0").set("mp_attachment","0").set("view_contract","0").update();
                    ServiceMain  s = serviceMainDao.findById(serId);
                    s.setPwStep(PwStepStatusEnum.CONTRACT_STEP.getValue());
                    s.setEpStep(EpStepStatusEnum.CONTRACT_STEP.getValue());
                    s.setMpLoginName("");
                    s.setMpPasswd("");
                    s.setMpAttaAddr("");
                    s.setMpAttaName("");
                    s.update();
                    msg="ok";
                }else{
                    msg="支付备案已成功，不能后退修改";
                }

            } catch (Exception e) {
                msg="发生错误";
            }

        }
        renderText(msg);

    }
    /**
     * 返回上传管理计划
     */
    @ActionKey("/backManPlan")
    public void backManPlan(){
        String serId  = getPara("serId");
        String msg = "";
        if(serId != null&&!"".equals(serId)){

            try {
                EpOperation ep = EpOperation.dao.findByServiceIdString(serId);
                PwOperation pw = PwOperation.dao.findByServiceIdString(serId);
                if(ep.getInt("approve_file")<4){
                    ep.set("mp_account","0").set("mp_attachment","0").set("approve_file","0").update();
                    pw.set("mp_account","0").set("mp_attachment","0").update();
                    ServiceMain  s = serviceMainDao.findById(serId);
                    s.setPwStep(PwStepStatusEnum.PLAN_STEP.getValue());
                    s.setEpStep(EpStepStatusEnum.CONTRACT_STEP.getValue());
                    s.setMpLoginName("");
                    s.setMpPasswd("");
                    s.setMpAttaAddr("");
                    s.setMpAttaName("");
                    s.update();
                    msg="ok";
                }else{
                    msg="支付备案已成功，不能后退修改";
                }

                //redirect("/ws/productwaste/pwbaseinfo/notfilledPage");//跳转页面
            } catch (Exception e) {
                msg="发生错误";
            }

        }
        renderText(msg);
    }
    /**
     * 返回邮寄资料
     */
    @ActionKey("/backPost")
    public void backPost(){
        String msg = "";
        String serId  = getPara("serId");
        if(serId != null&&!"".equals(serId)){

            try {
                EpOperation ep = EpOperation.dao.findByServiceIdString(serId);
                PwOperation pw = PwOperation.dao.findByServiceIdString(serId);
                if(ep.getInt("approve_file")<4){
                    ep.set("approve_file","0").update();
                    ServiceMain  s = serviceMainDao.findById(serId);
                    s.setPwStep(PwStepStatusEnum.POST_DATA_STEP.getValue());
                    s.setEpStep(EpStepStatusEnum.AUDITING_INFO_STEP.getValue());
                    s.update();
                    msg = "ok";
                }else{
                    msg="支付备案已成功，不能后退修改";
                }

            } catch (Exception e) {
                msg = "发生错误";
            }
        }
        renderText(msg);
    }
    
}
