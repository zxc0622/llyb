package com.qdum.llhb.integration.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public class Exchange extends Model<Exchange>{

	/**
	 * 积分兑换实体
	 */
	private static final long serialVersionUID = 1L;
	public static Exchange dao = new Exchange();

	/**
	 * 分页查询积分兑换
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	public Page<Record> findExchangeList(int pageNumber,int pageSize,long userId){
		String sql="from mp_exchange_record t LEFT JOIN mp_product_info s on t.pro_id=s.id and s.del_flag='0' where t.del_flag='0' AND t.user_id='"+userId+"' ";
		return Db.paginate(pageNumber, pageSize, "select t.point,t.remain_point as remainPoint,t.create_date as createDate,s.pro_name as proName", sql);
	}

}
