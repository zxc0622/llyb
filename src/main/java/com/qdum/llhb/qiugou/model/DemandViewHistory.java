package com.qdum.llhb.qiugou.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
/**
 * 固废供应信息表
 * @author wf
 */
public class DemandViewHistory extends Model<DemandViewHistory>{
	private static final long serialVersionUID = 1L;
	public static DemandViewHistory dao = new DemandViewHistory();
	
	/**
	 *记录是否存在
	 */
	public DemandViewHistory findByIdAndUser(long demandid,long userid){
		String sql = "SELECT * FROM inma_demand_view_history WHERE del_flag='0' and demand_id=? and view_user="+userid;
		return DemandViewHistory.dao.findFirst(sql,demandid);
	}
	/**
	 * 获取历史记录
	 */
	public List<Record> getDemandViewHistory(long userId,int pageSize){
		String sql="SELECT d.id,d.info_title AS title,IF(d.create_date>IFNULL(d.update_date,'')," +
				"d.create_date,d.update_date) AS time FROM inma_demand_view_history dh "+
				"INNER JOIN inma_demand_info d ON dh.demand_id=d.id AND d.del_flag='0' " +
				"AND d.sta='2' AND d.past_date>=NOW() "+
				"WHERE dh.del_flag='0' AND dh.view_user='"+userId+"' " +
				"ORDER BY time LIMIT 0," + pageSize;
		return Db.find(sql);
	}
}
