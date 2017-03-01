package com.qdum.llhb.backmana.model;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

/**
 *类Quirement的功能描述:需求信息
 *@author yaoyt
 *@time 4/8/16 12:00 PM
 */ 
public class Quirement extends Model<Quirement>{
	private static final long serialVersionUID = 1L;
	public static Quirement dao = new Quirement();

    public Page<Record> getHbDemandList(Integer pageNum, int pageSize, String title, String type) {
        StringBuffer sql = new StringBuffer();
        sql.append(" from t_requirement t where ( ");
        sql.append(" t.requirement_describe like '%").append(title).append("%'");
        sql.append(" or t.name like '%").append(title).append("%'");
        sql.append(" or t.phone like '%").append(title).append("%'");
        sql.append(" or t.company_name like '%").append(title).append("%'");
        sql.append(" or t.trade_status like '%").append(title).append("%')");
        sql.append(" and trade_status != '提交' ");
        if(!StringUtils.isBlank(type)){
            sql.append(" and t.remarks = ?");
            return Db.paginate(pageNum,pageSize,"select * ",sql.toString(),type);
        }else{
            return Db.paginate(pageNum,pageSize,"select * ",sql.toString());
        }
    }
    
    public Quirement getQuirementById(String id){
    	String sql = "SELECT *from t_requirement t WHERE t.id = ?";
    	return Quirement.dao.findFirst(sql,id);
    }

    //根据条件查询环保需求
    public Page<Quirement> selectSolidSupply(Map conditions){
    	String type=conditions.get("type").toString();
    	String sqlStr="不限分类".equals(type)?"":"r.remarks='"+type+"' and ";
    	Page<Quirement> qrmList = Quirement.dao.paginate(Integer.parseInt(conditions.get("pageNumber").toString()), 20, 
    			"SELECT id,remarks,name,phone,trade_status,date_format(create_date,'%Y-%m-%d') as create_date ", 
    			"from  t_requirement r WHERE "+sqlStr+" r.create_date>=? and r.create_date <= ? and r.del_flag=0 and r.trade_status" +
    			" like '%"+conditions.get("sta")+"%' ORDER BY r.create_date desc",conditions.get("startDate"),conditions.get("endDate"));
    	return qrmList;
    }
    
    /**
	 * 根据requirementId获取环保业务需求详情.
	 */
	public Quirement getRequirementById(String id) {
		String sql = "SELECT * from t_requirement r WHERE r.id = ?";
		return Quirement.dao.findFirst(sql, id);

	}
    
}