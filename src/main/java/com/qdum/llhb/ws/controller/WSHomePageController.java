package com.qdum.llhb.ws.controller;

import com.google.common.collect.Lists;
import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.qdum.llhb.admana.model.AdImages;
import com.qdum.llhb.common.controller.CommonController;
import com.qdum.llhb.common.utils.FillFieldsUtils;
import com.qdum.llhb.common.utils.ValiCode;
import com.qdum.llhb.common.validator.ServiceDetailNumValidator;
import com.qdum.llhb.reg.model.Company;
import com.qdum.llhb.sys.model.DictPcr;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ws.Constants;
import com.qdum.llhb.ws.enumvalue.EpStepStatusEnum;
import com.qdum.llhb.ws.enumvalue.NodeStepStatusEnum;
import com.qdum.llhb.ws.enumvalue.PwStepStatusEnum;
import com.qdum.llhb.ws.model.ServiceDetails;
import com.qdum.llhb.ws.model.ServiceMain;
import com.qdum.llhb.ws.vo.AjaxBean;
import org.apache.log4j.Logger;

import java.text.MessageFormat;
import java.util.List;

/**
 * 危废服务首页
 *
 * @author rongchao
 */
@ControllerBind(controllerKey = "/ws/productwaste/homepage")
public class WSHomePageController extends CommonController {

    private static final Logger LOGGER = Logger.getLogger(WSHomePageController.class);

    private Boolean isSuccess;

    private String msg;

    /**
     * 将用户是否申请过危废服务的布尔值放入Request中
     *
     * @author rongchao
     */
    private void sethasServicesToReq() {
        boolean hasServices = ServiceMain.dao.hasServicesByUser(UserUtils.getUser().getId());
        setAttr("hasServices", hasServices);
    }


    public void index_v1() {
        List<AdImages> list = AdImages.dao.getWSHomeImages();
        List<Record> companyList = Company.dao.getAuthCompany();
        List<AdImages> right = Lists.newArrayList();
        List<AdImages> middle = Lists.newArrayList();
        for (AdImages adImages : list) {
            if (adImages.getLabelId() == 7L) {
                right.add(adImages);
            } else {
                middle.add(adImages);
            }
        }
        setAttr("companyList", companyList);
        setAttr("rightImgs", right);
        setAttr("adImages", middle);
        sethasServicesToReq();
     /*   List<ServiceMain> crs = ServiceMain.dao.getHomeServices();
        for(ServiceMain m : crs){
            List<ServiceDetails>  details = ServiceDetails.dao.getServiceDetails(m.getId());
            StringBuffer sb = new StringBuffer("废物明细:&nbsp;");
            for(ServiceDetails d : details){
                sb.append("名称:").append(d.getName()).append(",数量:").append(d.getWeight()).append(d.getUnit()).append(";&nbsp;");
            }
            if(sb.length() > 5){
                sb.deleteCharAt(sb.length() - 1);
            }
            m.setRemarks(sb.toString());
        }
        setAttr("sss", crs);*/
        render("wshome.jsp");
    }

    /**
     * 危废办理页面
     *
     * @author rongchao
     */
    @ActionKey("/hazardous-wastes/dispose")
    public void wsHandel() {
        sethasServicesToReq();
        render("wshandel.jsp");
    }

    /**
     * 预约危废办理页面
     *
     * @author rongchao
     */
    @ActionKey("/hazardous-wastes/reservation")
    public void wsOrderHandle() {
        sethasServicesToReq();
        render("wsorderhandle.jsp");
    }

    /**
     * 关于危废页面
     *
     * @author rongchao
     */
    @ActionKey("/hazardous-wastes/introduction")
    public void about() {
        sethasServicesToReq();
        render("about.jsp");
    }

    /**
     * 提交危废服务申请信息
     *
     * @author rongchao
     */
    @Before({ServiceDetailNumValidator.class, Tx.class})
    public void submitWSInfo() {
        Long mainID = null;
        // 保存产废方主表信息
        ServiceMain serviceMain = this.getModel(ServiceMain.class);
        FillFieldsUtils.fillCommonInfo(serviceMain);
        serviceMain.setPwStep(PwStepStatusEnum.BASEINFO_STEP.getValue());
        serviceMain.setNodeSta(NodeStepStatusEnum.AUDITING_STATUS.getValue());
        serviceMain.setEpStep(EpStepStatusEnum.AUDITANDOFFER_STEP.getValue());
        serviceMain.setIsDate(1);
        String operatorCode = UserUtils.getUser().getOperatorCode();
        serviceMain.setOperatorCode(operatorCode);
        serviceMain.save();
        mainID = serviceMain.getId();
        // 保存产废方从表信息
        List<ServiceDetails> serviceDetailList = this.getModels(ServiceDetails.class, "serviceDetails");
        ServiceDetails.dao.newServiceDetails(serviceDetailList, mainID);
        isSuccess = true;
        sendMsg(serviceMain.getCompName());
        msg = "危废服务申请成功！";
        AjaxBean ajaxBean = new AjaxBean();
        ajaxBean.setIsSuccess(isSuccess);
        ajaxBean.setMsg(msg);
        ajaxBean.setObj(mainID);
        renderJson(ajaxBean);
    }

    private void sendMsg(String compName) {
        if (StrKit.isBlank(compName)) {
            compName = UserUtils.getUser().getLoginName();
        }
        String msg = MessageFormat.format(Constants.ORDER_SMS_TEMP, compName);
        List<DictPcr> list = DictPcr.dao.findByType("ep_phone");
        for (DictPcr dictPcr : list) {
            if (StrKit.notBlank(dictPcr.getCode())) {
                ValiCode.sendCheckCode(dictPcr.getCode(), msg,dictPcr.getCode());
            }
        }
    }
    
    
    //============================================================================
    @ActionKey("/hazardous-wastes")
    public void index_v2(){
    	setAttr("isWS","1");
    	render("../../../v2/ws/wshome.jsp");
    }
    
}
