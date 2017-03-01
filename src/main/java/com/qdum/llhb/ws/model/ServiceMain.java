package com.qdum.llhb.ws.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.google.common.collect.Lists;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.constant.BaseConstants;
import com.qdum.llhb.common.utils.FillFieldsUtils;
import com.qdum.llhb.common.utils.NumberUtil;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ws.enumvalue.EpStepStatusEnum;
import com.qdum.llhb.ws.enumvalue.NodeStepStatusEnum;
import com.qdum.llhb.ws.enumvalue.PwStepStatusEnum;
//import com.sun.tools.classfile.Opcode.Set;

/**
 * 危废服务主表
 *
 * @author rongchao
 */
public class ServiceMain extends Model<ServiceMain> {

    /**
     *
     */
    private static final long serialVersionUID = -6491075073233717165L;

    public static final ServiceMain dao = new ServiceMain();

    public static final String ID = "id";
    public static final String COMP_NAME = "comp_name";
    public static final String COMP_ADDR = "comp_addr";
    public static final String CONTACT_PERSON = "contact_person";
    public static final String PHONE = "phone";
    public static final String EMAIL = "email";
    public static final String INVITE_CODE = "invite_code";
    public static final String PW_STEP = "pw_step";
    public static final String EP_STEP = "ep_step";
    public static final String NODE_STA = "node_sta";
    public static final String MP_LOGIN_NAME = "mp_login_name";
    public static final String MP_PASSWD = "mp_passwd";
    public static final String MP_ATTA_NAME = "mp_atta_name";
    public static final String MP_ATTA_ADDR = "mp_atta_addr";
    public static final String PAY_MONEY = "pay_money";
    public static final String TP_DATE = "tp_date";
    public static final String TP_PERSON = "tp_person";
    public static final String TP_PHONE = "tp_phone";
    public static final String APPRAISE = "appraise";
    public static final String CREATE_BY = "create_by";
    public static final String CREATE_DATE = "create_date";
    public static final String UPDATE_BY = "update_by";
    public static final String UPDATE_DATE = "update_date";
    public static final String REMARKS = "remarks";
    public static final String DEL_FLAG = "del_flag";
    public static final String DATE_FROM = "date_from";
    public static final String DATE_TO = "date_to";
    public static final String IS_DATE = "is_date";
    public static final String OPERATOR_CODE = "operator_code"; // 业务员唯一编码
   

    public static final String HB_COMPANY_NAME = "company_name"; // 新增环保处理公司
    public static final String HB_USER ="hb_user"; //新增环保处置企业ID
    
    public static String getHbUser() {
		return HB_USER;
	}
    
    public void setHbUser(String hbUser) {
  		set(HB_USER,hbUser);
  	}

	public String getOperatorCode() {
        return getStr(OPERATOR_CODE);
    }

    public void setOperatorCode(String operatorCode) {
        set(OPERATOR_CODE, operatorCode);
    }

    public Date getDateFrom() {
        return getDate(DATE_FROM);
    }

    public void setDateFrom(Date dateFrom) {
        set(DATE_FROM, dateFrom);
    }

    public Date getDateTo() {
        return getDate(DATE_TO);
    }

    public void setDateTo(Date dateTo) {
        set(DATE_TO, dateTo);
    }

    public Integer getOfferAgree() {
        return getInt(PwOperation.OFFER_AGREE);
    }

    public void setOfferAgree(Integer offerAgree) {
        set(PwOperation.OFFER_AGREE, offerAgree);
    }

    public Long getId() {
        return getLong(ID);
    }

    public String getCompName() {
        return get(COMP_NAME);
    }

    public String getCompAddr() {
        return get(COMP_ADDR);
    }

    public String getContactPerson() {
        return get(CONTACT_PERSON);
    }

    public String getPhone() {
        return get(PHONE);
    }

    public String getEmail() {
        return get(EMAIL);
    }

    public String getInviteCode() {
        return get(INVITE_CODE);
    }

    public String getPwStep() {
        return get(PW_STEP);
    }

    public String getEpStep() {
        return get(EP_STEP);
    }

    public String getNodeSta() {
        return get(NODE_STA);
    }

    public String getMpLoginName() {
        return get(MP_LOGIN_NAME);
    }

    public String getMpPasswd() {
        return get(MP_PASSWD);
    }

    public String getMpAttaName() {
        return get(MP_ATTA_NAME);
    }

    public String getMpAttaAddr() {
        return get(MP_ATTA_ADDR);
    }

    public BigDecimal getPayMoney() {
        return getBigDecimal(PAY_MONEY);
    }

    public String getTpDate() {
        return get(TP_DATE);
    }

    public String getTpPerson() {
        return get(TP_PERSON);
    }

    public String getTpPhone() {
        return get(TP_PHONE);
    }

    public Integer getAppraise() {
        return getInt(APPRAISE);
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
        return get(REMARKS);
    }

    public Integer getDelFlag() {
        return NumberUtil.toInteger(get(DEL_FLAG));
    }

    public void setId(Long id) {
        set(ID, id);
    }

    public void setCompName(String compName) {
        set(COMP_NAME, compName);
    }

    public void setCompAddr(String compAddr) {
        set(COMP_ADDR, compAddr);
    }

    public void setContactPerson(String contactPerson) {
        set(CONTACT_PERSON, contactPerson);
    }

    public void setPhone(String phone) {
        set(PHONE, phone);
    }

    public void setEmail(String email) {
        set(EMAIL, email);
    }

    public void setInviteCode(String inviteCode) {
        set(INVITE_CODE, inviteCode);
    }

    public void setPwStep(String pwStep) {
        set(PW_STEP, pwStep);
    }

    public void setEpStep(String epStep) {
        set(EP_STEP, epStep);
    }

    public void setNodeSta(String nodeSta) {
        set(NODE_STA, nodeSta);
    }

    public void setMpLoginName(String mpLoginName) {
        set(MP_LOGIN_NAME, mpLoginName);
    }

    public void setMpPasswd(String mpPasswd) {
        set(MP_PASSWD, mpPasswd);
    }

    public void setMpAttaName(String mpAttaName) {
        set(MP_ATTA_NAME, mpAttaName);
    }

    public void setMpAttaAddr(String mpAttaAddr) {
        set(MP_ATTA_ADDR, mpAttaAddr);
    }

    public void setPayMoney(BigDecimal payMoney) {
        set(PAY_MONEY, payMoney);
    }

    public void setTpDate(String tpDate) {
        set(TP_DATE, tpDate);
    }

    public void setTpPerson(String tpPerson) {
        set(TP_PERSON, tpPerson);
    }

    public void setTpPhone(String tpPhone) {
        set(TP_PHONE, tpPhone);
    }

    public void setAppraise(Integer appraise) {
        set(APPRAISE, appraise);
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

    public Long getCurrentCount() {
        return getLong("currentCount");
    }

    public Long getAppCount() {
        return getLong("appCount");
    }

    public Long getCtCount() {
        return getLong("ctCount");
    }

    public Long getDelCount() {
        return getLong("delCount");
    }

    public Long getOrderCount() {
        return getLong("orderCount");
    }

    public Integer getOfferUpload() {
        return getInt("offer_upload");
    }

    public Integer getIsDate() {
        return getInt(IS_DATE);
    }

    public void setIsDate(int isDate) {
        set(IS_DATE, isDate);
    }

    public String getName() {
        return getStr("name");
    }

    public String getHbCompanyName(){
        return getStr(HB_COMPANY_NAME);
    }

    public void setHbCompanyName(String hbCompanyName){
        set(HB_COMPANY_NAME,hbCompanyName);
    }

    /**
     * 新建 危废服务——产废方——基本信息
     *
     * @param serviceMain
     * @return
     * @author rongchao
     */
    public Long newServiceMain(ServiceMain serviceMain) {
        FillFieldsUtils.fillCommonInfo(serviceMain);
        serviceMain.setPwStep(PwStepStatusEnum.BASEINFO_STEP.getValue());
        serviceMain.setNodeSta(NodeStepStatusEnum.SAVE_STATUS.getValue());
        String operatorCode = UserUtils.getUser().getOperatorCode();
        serviceMain.setOperatorCode(operatorCode);
        serviceMain.save();
        return serviceMain.getLong("id");
    }

    /**
     * 更新 危废服务——产废方——基本信息
     *
     * @param serviceMain
     * @author rongchao
     */
    public void updateServiceMain(ServiceMain serviceMain) {
        FillFieldsUtils.updateCommonInfo(serviceMain);
        serviceMain.update();
    }

    /**
     * 获取与当前人有关的所有的已经审核通过的危废服务
     *
     * @return
     * @author rongchao
     */
    public List<ServiceMain> getAuditedServiceMainList() {
        Long currentUserID = UserUtils.getUser().getId();
        String pwStep = PwStepStatusEnum.BASEINFO_STEP.getValue();
        String nodeSta = NodeStepStatusEnum.AUDITED_STATUS.getValue();
        String sql = "select id from ws_service where pw_step= ? and node_sta= ? and del_flag = ? and create_by= ? order by create_date desc, id desc";
        return this.find(sql, pwStep, nodeSta, BaseConstants.NOT_DELETE, currentUserID);
    }

    /**
     * 更新环保公司的流程节点及审核状态
     *
     * @param id
     * @param nodeStepStatus
     * @return
     * @author rongchao
     */
    public Boolean updateServiceToEPStatus(Long id, NodeStepStatusEnum nodeStepStatus) {
        String sql = "update ws_service set node_sta = ? where id = ?";
        int rows = Db.update(sql, nodeStepStatus.getValue(), id);
        return rows >= 1;
    }

    /**
     * 产废方——获取自己所有的危废服务
     *
     * @return
     * @author rongchao
     */
    public List<ServiceMain> getUserAllServices() {
        return ServiceMain.dao.find(
                "select * from ws_service where del_flag = ? and create_by = ? order by create_date desc , id desc",
                BaseConstants.NOT_DELETE, UserUtils.getUser().getId());
    }

    /**
     * 获取当前用户的历史办理危废服务
     *
     * @return
     * @author rongchao
     */
    public List<ServiceMain> getUserHistoryServices() {
        return ServiceMain.dao.find(
                "select w.*,c.company_name from ws_service w left join sys_company c on w.hb_user = c.user_id where w.del_flag = ? and w.create_by = ? and w.pw_step = ? order by w.create_date desc , w.id desc",
                BaseConstants.NOT_DELETE, UserUtils.getUser().getId(), PwStepStatusEnum.END.getValue());
    }

    /**
     * 产废方——获取自己办理中的危废服务
     *
     * @return
     * @author rongchao
     */
    public List<ServiceMain> getUserHandlingService() {
        return ServiceMain.dao.find(
                "select w.*,c.company_name from ws_service w left join sys_company c on w.hb_user = c.user_id where w.del_flag = ? and w.create_by = ? and w.pw_step <> ? order by w.create_date desc , w.id desc",
                BaseConstants.NOT_DELETE, UserUtils.getUser().getId(), PwStepStatusEnum.END.getValue());
    }

    /**
     * 环保方——获取所有的危废服务
     *
     * @return
     * @author rongchao
     */
    public List<ServiceMain> getAllServices() {
        String sql = "select * from ws_service as sv".concat(" left join")
                .concat(" (select service_id,offer_upload from ws_ep_operation where del_flag= ? )").concat(" as op")
                .concat(" on sv.id = op.service_id").concat(" where sv.hb_user = ? and ")
                .concat(" (sv.ep_step is not null or sv.ep_step <> '') and").concat(" sv.ep_step <> '70' and")
                .concat(" sv.del_flag = ? and").concat(" sv.node_sta <> ? and")
                .concat(" (sv.node_sta is not null or sv.node_sta <> '')")
                .concat(" and (sv.is_date is null or sv.is_date <> '1')")
                //.concat(" order by sv.create_date , sv.id");
                .concat(" order by sv.create_date desc, sv.id desc");
        return ServiceMain.dao.find(sql, BaseConstants.NOT_DELETE,UserUtils.getUser().getId(), BaseConstants.NOT_DELETE,
                NodeStepStatusEnum.SAVE_STATUS.getValue());
    }

    /**
     * 获取历史危废服务
     *
     * @return
     * @author rongchao
     */
    public List<ServiceMain> getHistoryServices() {
        String sql = "select * from ws_service where ep_step = '70' and del_flag='0' and hb_user = ? order by create_date desc , id desc";
        return this.find(sql,UserUtils.getUser().getId());
    }

    /**
     * 获取被终止删除的危废服务
     *
     * @return
     * @author rongchao
     */
    public List<ServiceMain> getDelServices() {
        String sql = "select * from ws_service where hb_user = ? and del_flag='1' order by create_date desc , id desc";
        return this.find(sql,UserUtils.getUser().getId());
    }

    /**
     * 环保方——获取收运申请节点下的危废服务
     *
     * @return
     * @author rongchao
     */
    public List<ServiceMain> getCTServices() {
        String sql = "select * from ws_service as sv".concat(" left join")
                .concat(" (select service_id , tp_notice from ws_ep_operation where del_flag= ? )").concat(" as op")
                .concat(" on sv.id = op.service_id").concat(" where sv.hb_user = ? and  sv.del_flag = '0' and sv.ep_step = ?")
                //.concat(" order by sv.create_date  , sv.id");
                .concat(" order by sv.create_date desc, sv.id desc");
        return dao.find(sql, BaseConstants.NOT_DELETE, UserUtils.getUser().getId(),EpStepStatusEnum.ARRANGE_COLLECTION_TRANSPORTATION_STEP.getValue());
    }

    /**
     * 环保方——获取申报申请节点下的危废服务
     *
     * @return
     * @author rongchao
     */
    public List<ServiceMain> getAuditingServices() {
        String sql = "select * from ws_service as sv".concat(" left join")
                .concat(" (select service_id , offer_upload from ws_ep_operation where del_flag= ? )").concat(" as op")
                .concat(" on sv.id = op.service_id")
                .concat(" where sv.hb_user = ? and sv.del_flag = ? and sv.ep_step = ? and sv.node_sta <> ? and ISNULL(sv.is_date)")
                //.concat(" order by sv.create_date , sv.id");
                .concat(" order by sv.create_date desc, sv.id desc");
        return dao.find(sql, BaseConstants.NOT_DELETE,UserUtils.getUser().getId(), BaseConstants.NOT_DELETE, EpStepStatusEnum.AUDITANDOFFER_STEP.getValue(),
                NodeStepStatusEnum.SAVE_STATUS.getValue());
    }

    /**
     * 环保方——获取预约申请
     *
     * @return
     */
    public List<ServiceMain> getOrderServices() {
        String sql = "select * from ws_service where hb_user = ? and is_date = '1' and del_flag = ? and ep_step = ? and node_sta = ?";
        return this.find(sql,UserUtils.getUser().getId(), BaseConstants.NOT_DELETE, EpStepStatusEnum.AUDITANDOFFER_STEP.getValue(), NodeStepStatusEnum.AUDITING_STATUS.getValue());
    }

    /**
     * 获取当前用户的所有可用的危废服务申请数
     *
     * @return
     * @author rongchao
     */
    public Long getServiceCount() {
        String sql = "select count(*) from ws_service where del_flag = ? and create_by = ?";
        return Db.queryLong(sql, BaseConstants.NOT_DELETE, UserUtils.getUser().getId());
    }

    /**
     * 更新产废企业的流程节点
     *
     * @param id
     * @param epStepStatus
     * @return
     * @author rongchao
     */
    public Boolean updatePwstep(Long id, EpStepStatusEnum epStepStatus) {
        String sql = "update ws_service set pw_step = ? where id = ?";
        int count = Db.update(sql, epStepStatus.getValue(), id);
        return count >= 1;
    }

    /**
     * 环保方——获取所有需要审核的危废服务的ID
     *
     * @return
     * @author rongchao
     */
    public List<Long> getAuditingServiceIDs() {
        String sql = "select id from ws_service where del_flag = ? and ep_step = ? and node_sta <> ? order by create_date desc , id desc";
        List<ServiceMain> list = dao.find(sql, BaseConstants.NOT_DELETE, EpStepStatusEnum.AUDITANDOFFER_STEP.getValue(),
                NodeStepStatusEnum.SAVE_STATUS.getValue());
        List<Long> idList = Lists.newArrayList();
        for (ServiceMain serviceMain : list) {
            idList.add(serviceMain.getId());
        }
        return idList;
    }

    /**
     * 环保方——获取审核并报价的危废服务（其中包含产废方是否同意了报价和环保方是否上传了报价）
     *
     * @param id
     * @return
     * @author rongchao
     */
    public ServiceMain getAuditingServiceMain(Long id) {
        String sql = "select * from (select * from ws_service as sv left join (select service_id , offer_agree from ws_pw_operation where del_flag= '0' ) as op on sv.id = op.service_id ) as sv_op left join (select service_id , offer_upload from ws_ep_operation where del_flag= '0') as epop on sv_op.id = epop.service_id where sv_op.id = ?";
        // String sql = "select * from ws_service as sv".concat(" left join")
        // .concat(" (select service_id , offer_agree from ws_pw_operation where
        // del_flag= ? )").concat(" as op")
        // .concat(" on sv.id = op.service_id").concat(" where sv.del_flag = ?
        // and sv.id = ?");
        return this.findFirst(sql, id);
    }

    /**
     * 环保方——获取审核通过的危废服务（其中包含环保方是否上传了报价）
     *
     * @param id
     * @return
     * @author rongchao
     */
    public ServiceMain getAuditedServiceMain(Long id) {
        String sql = "select * from ws_service as sv left join (select service_id , offer_upload from ws_ep_operation where del_flag= '0') as epop on sv.id = epop.service_id where sv.id = ?";
        return this.findFirst(sql, id);
    }

    /**
     * 根据id查找 zhangxm 管理计划表
     */
    public Record findPlanById(long id) {
        String sql = "SELECT DISTINCT s.id,s.mp_login_name AS mln,s.mp_passwd AS mp,"
                + "s.mp_atta_addr AS maa,s.mp_atta_name AS man,e.mp_account AS eaccount,e.mp_attachment AS eatta, "
                + "p.mp_account AS paccount,p.mp_attachment AS patta FROM ws_service AS s "
                + "LEFT JOIN  ws_ep_operation AS e ON e.service_id=s.id AND e.del_flag='0' "
                + "LEFT JOIN ws_pw_operation AS p ON p.service_id=s.id AND p.del_flag='0' "
                + "WHERE s.del_flag='0' AND s.id='" + id + "'";
        return Db.findFirst(sql);
    }

    /**
     * 根据id查找 zhangxm 通知收运
     */
    public Record findNoticeById(long id) {
        String sql = "SELECT DISTINCT s.id,s.comp_name as cname,s.tp_date AS date,s.tp_person AS person,s.tp_phone AS phone,"
                + "e.tp_notice AS enotice, p.tp_notice AS pnotice,s.appraise FROM ws_service AS s "
                + "LEFT JOIN  ws_ep_operation AS e ON e.service_id=s.id AND e.del_flag='0' "
                + "LEFT JOIN ws_pw_operation AS p ON p.service_id=s.id AND p.del_flag='0' "
                + "WHERE s.del_flag='0' AND s.id='" + id + "'";
        return Db.findFirst(sql);
    }

    /**
     * 根据 id查找可用的危废服务
     *
     * @param id
     * @return
     * @author rongchao
     */
    public ServiceMain findServiceMainByID(Object id) {
        String sql = "SELECT ws.* ,c.company_name FROM ws_service ws,sys_company c  WHERE ws.hb_user = c.user_id and ws.del_flag= ? AND ws.id= ?";
        return this.findFirst(sql, BaseConstants.NOT_DELETE, id);
    }

    /**
     * 环保企业——获取危废服务列表的数量
     *
     * @return
     * @author rongchao
     */
    public ServiceMain getServicelistCount() {
        Long id = UserUtils.getUser().getId();
        String sql = "select"
                .concat(" (select count(*) from ws_service as sv where sv.hb_user = ? and (sv.ep_step is not null or sv.ep_step <> '') and sv.ep_step <> '70' and sv.del_flag = '0' and sv.node_sta <> '0' and (sv.node_sta is not null or sv.node_sta <> '') and (sv.is_date is null or sv.is_date <> '1')) as currentCount,")
                .concat(" (select count(*) from ws_service as sv where sv.hb_user = ? and del_flag = '0' and ep_step = '00' and node_sta <> '0' and is_date <> '1') as appCount,")
                .concat(" (select count(*) from ws_service as sv where sv.hb_user = ? and sv.del_flag = '0' and sv.ep_step = '60') as ctCount,")
                .concat(" (select count(*) from ws_service as sv where sv.hb_user = ? and sv.del_flag = '1') as delCount,")
                .concat(" (select count(*) from ws_service as sv where sv.hb_user = ? and sv.del_flag = '0' and sv.is_date = '1' and ep_step = '00' and node_sta = '1') as orderCount");
        return this.findFirst(sql,id,id,id,id,id);
    }

    /**
     * 用户是否申请过危废服务
     *
     * @param userID
     * @return
     * @author rongchao
     */
    public Boolean hasServicesByUser(Long userID) {
        List<ServiceMain> list = getAllServicesByUser(userID);
        return !(list == null || list.size() == 0);
    }

    /**
     * 根据用户ID获取所有的危废服务
     *
     * @param userID
     * @return
     * @author rongchao
     */
    public List<ServiceMain> getAllServicesByUser(Long userID) {
        String sql = "select * from ws_service where create_by = ?";
        return this.find(sql, userID);
    }

    /**
     * 通过危废服务ID获取危废服务以及环保方操作状态
     *
     * @param id
     * @return
     * @author rongchao
     */
    public ServiceMain getServiceAndOpByID(Long id) {
        String sql = "select * from ws_service as sv left join (select * from ws_ep_operation where del_flag= ? and service_id = ?) as ep on sv.id = ep.service_id where sv.del_flag= ? and sv.id= ?";
        return this.findFirst(sql, BaseConstants.NOT_DELETE, id, BaseConstants.NOT_DELETE, id);
    }

    public Page<ServiceMain> getAllAvailableServiceByPage(int pageNumber, int pageSize, String step, String condition) {
        StringBuffer sb = new StringBuffer();
        sb.append("FROM (SELECT ws.*, c.company_name from ws_service ws LEFT JOIN sys_company c on ws.hb_user = c.user_id and ws.del_flag = '0') serv LEFT JOIN (SELECT name, code FROM ws_business_href_info WHERE del_flag = '0' ) bus ON serv.operator_code = bus.code WHERE 1=1");
        if (StrKit.notBlank(step)) {
            sb.append(" and serv.pw_step = ");
            sb.append(step);
        }
        if (StrKit.notBlank(condition)) {
            sb.append(" and (serv.comp_name like '%");
            sb.append(condition);
            sb.append("%' or bus.name like '%");
            sb.append(condition);
            sb.append("%')");
        }
        sb.append(" order by serv.create_date desc , serv.id desc");
        System.out.println(sb.toString());
        return this.paginate(pageNumber, pageSize, "SELECT serv.*,bus.name", sb.toString());
    }

    public List<ServiceMain> getHomeServices(){
        StringBuffer sql = new StringBuffer();
        sql.append(" select * from ws_service as sv ");
        sql.append(" left join (select service_id,offer_upload from ws_ep_operation where del_flag= 0 ) as op on sv.id = op.service_id ");
        sql.append(" where sv.del_flag = 0 ");
        sql.append(" and sv.node_sta <> 0 ");
        sql.append(" order by sv.create_date desc, sv.id desc limit 0, 20 ");
        return dao.find(sql.toString());

    }

}
