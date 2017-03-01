package com.qdum.llhb.qiugou.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.regexp.recompile;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.backmana.model.SupplyInfo;
import com.qdum.llhb.common.utils.NumberUtil;
import com.qdum.llhb.sys.model.DictPcr;
/**
 * 固废供应信息表
 * @author wf
 */
public class CostRecord extends Model<CostRecord>{
	private static final long serialVersionUID = 1L;
	public static CostRecord dao = new CostRecord();
	
	/**
	 * 查新jil
	 */
	public Record getByDemand(String did,long uid){
		String sql = "SELECT * FROM sys_youyi_cost_record r WHERE r.demand_id=? AND r.user_id="+uid;
		return Db.findFirst(sql,did);
	}
	 /**
     * 根据user_id和hb_id查询用户.
     */
	
	public Record getByRequire(String userId,long hbId){
		String sql = "SELECT * FROM sys_youyi_cost_record r WHERE r.hb_id=? AND r.user_id="+hbId;
		return Db.findFirst(sql,userId);
	}
}
