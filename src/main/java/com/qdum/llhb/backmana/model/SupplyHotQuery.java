package com.qdum.llhb.backmana.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
/**
 * 热搜
 * @author zhangxm
 */
public class SupplyHotQuery extends Model<SupplyHotQuery>{
	private static final long serialVersionUID = 1L;
	public static SupplyHotQuery dao = new SupplyHotQuery();

	public SupplyHotQuery findHot(String type,String typeId){
		String sql="SELECT * FROM idx_supply_hot_query q WHERE q.del_flag='0' AND q.type='"+type+"' AND q.type_id='"+typeId+"'";
		return this.findFirst(sql);
	}
	/**
	 *根据  类型  查询关键字 
	 */
	public SupplyHotQuery findHot(String type,Object typeId,String queryWord){
		String sql="SELECT * FROM idx_supply_hot_query q "
				+ "WHERE q.del_flag='0' AND q.type='"+type+"' AND q.type_id='"+typeId+"'"+" AND q.query_word='"+queryWord+"'";
		return this.findFirst(sql);
	}
	/**
	 *根据  类型  查询关键字 
	 *@author wcl
	 */
	public SupplyHotQuery findWordHot(String type,String queryWord){
		String sql="SELECT * FROM idx_supply_hot_query q "
				+ "WHERE q.del_flag='0' AND q.type='"+type+"' AND q.query_word='"+queryWord+"'";
		return this.findFirst(sql);
	}
	public List<Record> getHotList(String type,int pageSize){
		String sql="SELECT q.type_id as typeId,d.`name` AS dname " +
				"FROM idx_supply_hot_query q INNER JOIN sys_dict_pcr d " +
				"ON q.type_id=d.id AND d.del_flag='0' " +
				"WHERE q.del_flag='0' AND q.type='"+type+"' " +
				"ORDER BY q.query_count DESC LIMIT 0,"+pageSize;
		return Db.find(sql);
	}
	
	/**
	 * 获取不同热搜词的搜索次数
	 * @return  Record
	 * @author zhaoyl
	 * @time 2016年1月18日15:04:48
	 * */
	public List<Record> getCountOfHotWord(){
		String sql = "select sum(query_count) count, query_word, type from idx_supply_hot_query where del_flag = 0 group by query_word, type ORDER BY count DESC";
		return Db.find(sql);
	}
	/**
	 * 某种类的关键词
	 */
	public SupplyHotQuery getRecordByWordAndType(String type,String text){
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT * FROM idx_supply_hot_query q WHERE q.del_flag='0'and q.type=?  and q.query_word=? ");
		return SupplyHotQuery.dao.findFirst(sb.toString(),type,text);
	}
}
