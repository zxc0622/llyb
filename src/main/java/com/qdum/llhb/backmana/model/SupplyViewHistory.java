package com.qdum.llhb.backmana.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

public class SupplyViewHistory extends Model<SupplyViewHistory>{
	private static final long serialVersionUID = 1L;
	public static SupplyViewHistory dao = new SupplyViewHistory();
	
	/**
	 * 查找历史记录是否存在
	 */
	public SupplyViewHistory findBySupplyId(long userId,int supplyId){
		String sql="SELECT sh.* FROM inma_supply_view_history sh WHERE sh.del_flag='0' " +
				"AND sh.supply_id='"+supplyId+"' AND sh.view_user='"+userId+"'";
		return SupplyViewHistory.dao.findFirst(sql);
	}
	/**
	 * 获取历史记录
	 */
	public List<Record> getSupplyViewHistory(long userId,int pageSize){
		String sql="SELECT s.id,s.info_title AS title,IF(s.create_date>IFNULL(s.update_date,'')," +
				"s.create_date,s.update_date) AS time FROM inma_supply_view_history sh "+
				"INNER JOIN inma_supply_info s ON sh.supply_id=s.id AND s.del_flag='0' " +
				"AND s.sta='2' AND s.past_date>=NOW() "+
				"WHERE sh.del_flag='0' AND sh.view_user='"+userId+"' " +
				"ORDER BY time LIMIT 0," + pageSize;
		return Db.find(sql);
	}
}
