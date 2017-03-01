package com.qdum.llhb.ws.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.qdum.llhb.common.utils.FillFieldsUtils;
import com.qdum.llhb.common.utils.NumberUtil;
import com.qdum.llhb.sys.utils.UserUtils;

/**
 * 危废服务废物明细表
 *
 * @author rongchao
 */
public class ServiceDetails extends Model<ServiceDetails> {

    /**
     *
     */
    private static final long serialVersionUID = 3039406119381215367L;

    public static final ServiceDetails dao = new ServiceDetails();

    public static final String ID = "id";// 主键
    public static final String SERVICE_ID = "service_id";// 服务ID
    public static final String NAME = "name";// 名称
    public static final String WEIGHT = "weight";// 重量
    public static final String UNIT = "unit";// 单位
    public static final String QUOTE = "quote";// 单位
    public static final String CREATE_BY = "create_by";
	public static final String CREATE_DATE = "create_date";
    public static final String UPDATE_BY = "update_by";
    public static final String UPDATE_DATE = "update_date";
    public static final String REMARKS = "remarks";// 备注
    public static final String DEL_FLAG = "del_flag"; // 删除标识，默认为0，删除为1

    public Long getId() {
        return getLong(ID);
    }

    public void setId(Long id) {
        set(ID, id);
    }

    public Long getServiceId() {
        return getLong(SERVICE_ID);
    }

    public void setServiceId(Long serviceId) {
        set(SERVICE_ID, serviceId);
    }

    public String getName() {
        return get(NAME);
    }

    public void setName(String name) {
        set(NAME, name);
    }

    public BigDecimal getWeight() {
        return getBigDecimal(WEIGHT);
    }

    public void setWeight(BigDecimal weight) {
        set(WEIGHT, weight);
    }

    public String getUnit() {
        return get(UNIT);
    }

    public void setUnit(String unit) {
        set(UNIT, unit);
    }

    public BigDecimal getQuote() {
		return getBigDecimal(QUOTE);
	}

    public void setQuote(BigDecimal quote) {
		set(QUOTE, quote);
	}

    public Long getCreateBy() {
        return getLong(CREATE_BY);
    }

    public void setCreateBy(Long createBy) {
        set(CREATE_BY, createBy);
    }

    public Date getCreateDate() {
        return getDate(CREATE_DATE);
    }

    public void setCreateDate(Date createDate) {
        set(CREATE_DATE, createDate);
    }

    public Long getUpdateBy() {
        return getLong(UPDATE_BY);
    }

    public void setUpdateBy(Long updateBy) {
        set(UPDATE_BY, updateBy);
    }

    public Date getUpdateDate() {
        return getDate(UPDATE_DATE);
    }

    public void setUpdateDate(Date updateDate) {
        set(UPDATE_DATE, updateDate);
    }

    public String getRemarks() {
        return get(REMARKS);
    }

    public void setRemarks(String remarks) {
        set(REMARKS, remarks);
    }

    public Integer getDelFlag() {
        return NumberUtil.toInteger(get(DEL_FLAG));
    }

    public void setDelFlag(Integer delFlag) {
        set(DEL_FLAG, delFlag);
    }

    /**
     * 新建或更新危废服务废物明细
     *
     * @param list   废物明细List
     * @param mainID 主表ID
     * @author rongchao
     */
    public void newServiceDetails(List<ServiceDetails> list, Long mainID) {
        for (ServiceDetails serviceDetail : list) {
            FillFieldsUtils.fillCommonInfo(serviceDetail);
            serviceDetail.set("service_id", mainID);
            serviceDetail.save();
        }
    }

    /**
     * 根据service_id删除所有的明细
     *
     * @param serviceID
     * @return
     * @author rongchao
     */
    public boolean deleteByServiceID(Long serviceID) {
        Db.update("delete from ws_service_details where service_id = ?", serviceID);
        return true;
    }

    /**
     * 根据主表ID获取相应的危废服务明细
     *
     * @param mainID 主表ID
     * @return
     * @author rongchao
     */
    public List<ServiceDetails> getServiceDetails(Long mainID) {
        String sql = "select * from ws_service_details where service_id = ? order by create_date desc ,id desc";
        List<ServiceDetails> list = this.find(sql, mainID);
        return list;
    }
}
