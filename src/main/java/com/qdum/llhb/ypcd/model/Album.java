package com.qdum.llhb.ypcd.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public class Album extends Model<Album>{

	/**
	 * 相册实体
	 */
	private static final long serialVersionUID = 1L;
	public static Album dao = new Album();

	public List<Record> searchAlbum(String id ,String shopId){
		String sql="";
		sql="SELECT"+
				" id,"+
				" category_id as categoryId,"+
				"  name,"+
				"  cover_img as coverImg,"+
				"  host_desc as hostDesc,"+
				"  pub_lev as pubLev"+
				" FROM"+
				" cs_manage_image_host"+
				" where shop_id='"+shopId+"'";
				if(id!=""&&id!=null){
					sql+=" and id='"+id+"'";
				}
				sql+=" and del_flag='0'";
		return Db.find(sql);
	}
	/**
	 * 首页相册初始化页面
	 */
	public List<Record> enterpriseAlbum(String shopId){
	String	sql=" select "+
				" s.name, DATE_FORMAT(t.create_date, '%Y-%m-%d') as createDate, t.image"+
				" FROM cs_manage_image_detail t"+
				" LEFT JOIN cs_manage_image_host s"+
				" on t.host_id=s.id"+
				" AND s.del_flag='0'"+
				" WHERE s.shop_id='"+shopId+"'"+
				" and t.del_flag='0'"+
				" ORDER BY t.create_date DESC";
		return Db.find(sql);
	}
	/**
	 * 查询前10条相册
	 */
	public List<Record> enterpriseAlbumTen(String shopId){
	String	sql=" select "+
				" s.name, DATE_FORMAT(t.create_date, '%Y-%m-%d') as createDate, t.image"+
				" FROM cs_manage_image_detail t"+
				" LEFT JOIN cs_manage_image_host s"+
				" on t.host_id=s.id"+
				" AND s.del_flag='0'"+
				" WHERE s.shop_id='"+shopId+"'"+
				" and t.del_flag='0'"+
				" ORDER BY t.create_date DESC"+
				" LIMIT 10";
		return Db.find(sql);
	}
	public Page<Record> searchAlbumReview(int pageNumber,int pageSize,String name,String sta,String cateId,Long shopId){
		String sql="";
		sql=" FROM"+
				" cs_manage_image_host t"+
				" LEFT JOIN sys_dict_pcr s ON t.category_id = s.id"+
				" LEFT JOIN cs_manage_image_detail a ON t.id = a.host_id"+
				" AND a.del_flag='0'"+
				" WHERE"+
				" t.shop_id = '"+shopId+"'"+
				" AND t.sta='"+sta+"'";
				if(name!=""&&name!=null){
				sql+=" and t.name like '%"+name+"%'";
				}
				if(!"0".equals(cateId)&&cateId!=null){
				sql+=" and t.category_id='"+cateId+"'";
				}
				sql+=" AND s.del_flag = '0'"+
					 " AND t.del_flag = '0'"+
					 " group by t.id,s.name,t.NAME,t.cover_img,t.create_date"+
					 " order by  t.create_date desc";
		return  Db.paginate(pageNumber, pageSize,"select t.id,s. NAME AS cateName,t. NAME,t.cover_img AS coverImg, DATE_FORMAT(t.create_date, '%Y-%m-%d') AS createDate,count(a.id) as imgs",sql);
	}
	/**
	 * 查询当前相册名称以及图片总数量
	 */
	public List<Record> searchImageName(String id){
		String sql="select s.name,COUNT(s.id) as he from cs_manage_image_host s"+
					" LEFT JOIN cs_manage_image_detail t"+
					" on s.id=t.host_id"+
					" and t.del_flag='0'"+
					" WHERE s.id='"+id+"'"+
					" and s.del_flag='0'";
		return Db.find(sql);
	}
}
