package com.qdum.llhb.backmana.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

public class BusinessCollect extends Model<BusinessCollect>{
	private static final long serialVersionUID = 1L;
	public static BusinessCollect dao = new BusinessCollect();
	/**
	 * 查看是否收藏过
	 */
	public BusinessCollect findCollet(String type,String collectId,long userId){
		String sql = "SELECT * FROM ms_business_collect c WHERE c.del_flag=0 and c.type='"+type+"' " +
				"AND c.collect_id='"+collectId+"' AND c.create_by='"+userId+"'";
		return this.findFirst(sql);
	}
	/**
	 * 商机收藏列表
	 */
	public List<Record> getList(String type,long userId ,String title,int pageNumber,int pageSize){
		String sql="SELECT b.id as bid,cs.type,cs.id,cs.title,cs.create_date AS cdate,cs.create_by as userId," +
				"cs.pic1,cs.pic2,cs.pic3 FROM ms_business_collect b INNER JOIN " +
				"(SELECT '1' as type,s.id,s.info_title as title,s.create_date,s.create_by,s.pic1," +
				"s.pic2,s.pic3 FROM inma_supply_info s WHERE s.sta='2' AND s.del_flag='0' " +
				"AND s.past_date >= NOW() UNION ALL SELECT '2' as type,d.id,d.info_title as title," +
				"d.create_date,d.create_by,d.pic1,d.pic2,d.pic3 FROM inma_demand_info d " +
				"WHERE d.sta='2' AND d.del_flag='0' AND d.past_date >= NOW() " +
				"UNION ALL SELECT '4' as type,p.id,p.pro_name as title,p.create_date," +
				"p.create_by,p.pic1,p.pic2,p.pic3 FROM inma_product_info p WHERE p.sta='2' " +
				"AND p.del_flag='0' AND p.past_date >= NOW() "+
                "UNION ALL SELECT '5' as type,p.id,p.case_name as title,p.create_date,p.create_by,p.pic1,p.pic2,p.pic3 "+
                "FROM inma_case_info p WHERE  p.del_flag='0' " +
                " ) cs ON b.collect_id=cs.id " +
				"AND cs.type=b.type WHERE b.del_flag='0'  AND b.create_by='"+userId+"' ";
		if(!"0".equals(type)){
			sql+="AND b.type='"+type+"' ";
		}
		if(!"".equals(title) && !"undefined".equals(title) && title != null){
			sql+="AND cs.title like '%"+title+"%' ";
		}
		sql+="ORDER BY cs.create_date desc LIMIT "+(pageNumber-1)*pageSize+","+pageSize;
		return Db.find(sql);
	}
	/**
	 * 获取条数
	 */
	public BusinessCollect getBusCount(String type,long userId,String title){
		String sql="SELECT COUNT(cs.id) AS count FROM ms_business_collect b INNER JOIN " +
				"(SELECT '1' as type,s.id,s.info_title as title,s.create_date,s.create_by,s.pic1," +
				"s.pic2,s.pic3 FROM inma_supply_info s WHERE s.sta='2' AND s.del_flag='0' " +
				"AND s.past_date >= NOW() UNION ALL SELECT '2' as type,d.id,d.info_title as title," +
				"d.create_date,d.create_by,d.pic1,d.pic2,d.pic3 FROM inma_demand_info d " +
				"WHERE d.sta='2' AND d.del_flag='0' AND d.past_date >= NOW() " +
				"UNION ALL SELECT '4' as type,p.id,p.pro_name as title,p.create_date," +
				"p.create_by,p.pic1,p.pic2,p.pic3 FROM inma_product_info p WHERE p.sta='2' " +
				"AND p.del_flag='0' AND p.past_date >= NOW() ) cs ON b.collect_id=cs.id " +
				"AND cs.type=b.type WHERE b.del_flag='0' " +
				"AND b.create_by='"+userId+"' ";
		if(!"0".equals(type)){
			sql+="AND b.type='"+type+"' ";
		}
		if(!"".equals(title) && !"undefined".equals(title) && title != null){
			sql+="AND cs.title like '%"+title+"%' ";
		}
		return this.findFirst(sql);
	}
	
	/**
	 *根据收藏商机的类型，和collectId查找 zhaoyl
	 */
	public List<BusinessCollect> findBusiByTypeAndCollectId(String type, long collectId){
		String sql ="SELECT *FROM ms_business_collect "
				+ "where del_flag = 0 AND type = '"+type+"' AND collect_id = "+collectId;
		return BusinessCollect.dao.find(sql);
	}
}
