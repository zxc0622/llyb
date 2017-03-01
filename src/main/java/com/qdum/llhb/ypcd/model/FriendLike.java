package com.qdum.llhb.ypcd.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public class FriendLike extends Model<FriendLike>{

	/**
	 * 友情链接实体
	 */
	private static final long serialVersionUID = 1L;
	public static FriendLike dao = new FriendLike();
	/**
	 * 根据ID查询数据
	 * @param id
	 * @param shopId
	 * @return
	 */
	public List<Record> searchFriend(String id ,String shopId){
		String sql="";
		sql="SELECT"+
				" id,"+
				"  name,"+
				"  url,"+
				"  pic,"+
				"  show_order as showOrder"+
				" FROM"+
				" cs_manage_href"+
				" where shop_id='"+shopId+"'";
				if(id!=""&&id!=null){
					sql+=" and id='"+id+"'";
				}
				sql+=" and del_flag='0'";
		return Db.find(sql);
	}
	/**
	 * 分页查询数据
	 * @param pageNumber
	 * @param pageSize
	 * @param name
	 * @param sta
	 * @param shopId
	 * @return
	 */
	public Page<Record> searchFriendLike(int pageNumber,int pageSize,String name,String sta,Long shopId){
		String sql="";
		sql=" FROM"+
				" cs_manage_href t"+
				" WHERE"+
				" t.shop_id = '"+shopId+"'"+
				" AND t.sta='"+sta+"'";
				if(name!=""&&name!=null){
				sql+=" and t.name like '%"+name+"%'";
				}
				sql+=" and t.del_flag ='0' order by t.create_date desc";
		return  Db.paginate(pageNumber, pageSize,"select t.id,t.name,t.url,DATE_FORMAT(t.create_date, '%Y-%m-%d') as createDate",sql);
	}
}
