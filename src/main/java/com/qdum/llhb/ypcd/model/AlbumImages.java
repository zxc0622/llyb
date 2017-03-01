package com.qdum.llhb.ypcd.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

public class AlbumImages extends Model<AlbumImages>{

	/**
	 * 图片实体
	 */
	private static final long serialVersionUID = 1L;
	public static AlbumImages dao = new AlbumImages();

	public List<Record> searchImages(String id){
		String sql="select  *  from cs_manage_image_detail"+
					" WHERE host_id='"+id+"'"+
					" AND del_flag='0'";
		return Db.find(sql);
	}
	

}
