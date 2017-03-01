package com.qdum.llhb.spread.modle;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public class QueryRankiing extends Model<QueryRankiing> {

	/**
	 * 排名推广实体
	 * @author zhaoyl
	 * @time 2016年1月18日10:56:43
	 */
	private static final long serialVersionUID = 1L;
	public static QueryRankiing dao = new QueryRankiing();
	
	/**
	 *首页- 根据所传ID 查询新闻信息
	 */
	public Page<Record> findSpreadList(int pageNumber,int pageSize,String leibie,String spreadName){
		String sql=" FROM"+
				   " inma_query_ranking"+
				   " WHERE"+
				   " del_flag = '0'";
			if(leibie!=null&&!(leibie.equals("a"))){
				   
						  sql+= " and rank_type='"+leibie+"'";
			}
			if(spreadName!=null&&!(spreadName.equals(""))){
				   sql+=" and name like '%"+spreadName+"%'";
			}
			sql+=" order by create_date desc";
		return Db.paginate(pageNumber, pageSize, "SELECT id,name,rank_type as rankType,comp_name as compName,	DATE_FORMAT(start_time, '%Y-%m-%d') AS startTime,	DATE_FORMAT(end_time, '%Y-%m-%d') AS endTime ", sql);
	}
	
	public List<Record> findSpreadId(String id,String lb){
		String sql="select * from inma_query_ranking where del_flag='0' and id='"+id+"'  ";
		if(lb!=null&&!(lb.equals(""))){
			sql+=" and rank_type='"+lb+"'";
		}
		return Db.find(sql);
	}
	
	/**
	 * 获取最新推广排名列表
	 * */
	public List<Record> getSpreadNow(){
		String sql = " select if(r.update_date is null, r.create_date, r.update_date)time, r.*" +
					"from inma_query_ranking r where r.del_flag = 0 order by time desc";
		return Db.find(sql);
	}
	/**
	 * 通过关键词获取本月排名推广记录
	 * */
	public List<Record> getBidRecord(String keyWord){
		String sql = "select r.*from (SELECT DATE_ADD(curdate(),interval -day(curdate())+1 day) first_day) as fd, inma_query_ranking r where r.del_flag = 0 and r.create_date >= fd.first_day and r.name='"+keyWord+"'";
		return Db.find(sql);
	}
	/**
	 * 获取排名推广历史纪录
	 * */
	public List<Record> getBidAllRecord(String keyWord){
		String sql = "select if(now()>=r.start_time and now()<=r.end_time,'1','0') is_spread, r.*from inma_query_ranking r where r.del_flag = 0 and r.name='"+keyWord+"'";
		return Db.find(sql);
	}
}
