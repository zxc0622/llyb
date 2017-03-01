package com.qdum.llhb.notice.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;


public class Notic extends Model<Notic>{

	/**
	 * 公告实体
	 */
	private static final long serialVersionUID = 1L;
	public static Notic dao = new Notic();
	/**
	 * 查询公告
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	public Page<Record> findNotic(int pageNumber,int pageSize){
		String sql=" from nm_notice_detail where del_flag='0' order by create_date desc";
		return Db.paginate(pageNumber, pageSize, "select id,nt_titile as ntTitile,sta,DATE_FORMAT(create_date, '%Y-%m-%d') as createDate", sql);
	}
	/**
	 * 查询最新的前五条公告
	 */
	public List<Record> findNoticW(){
		String sql="select id,nt_titile as ntTitile,sta,DATE_FORMAT(create_date, '%Y-%m-%d') as createDate,nt_content as ntContent,remarks as remarks from nm_notice_detail where del_flag='0' and sta='0' order by create_date desc  LIMIT 0,10";
		return Db.find(sql);
	}
	/**
	 * 单挑查询公告
	 */
	public List<Record> findNoticId(String id){
		String sql="select id,nt_titile as ntTitile,sta,DATE_FORMAT(create_date, '%Y-%m-%d') as createDate,nt_content as ntContent,remarks as remarks from nm_notice_detail where del_flag='0' and sta='0' and id='"+id+"' order by create_date desc";
		return Db.find(sql);
	}
}
