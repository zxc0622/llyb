package com.qdum.llhb.infomaintain.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

public class InfoMaintAttachment extends Model<InfoMaintAttachment> {
	/**
	 * 资讯附件模型
	 * @author zhaoyl
	 * @time 2015年12月9日16:52:21
	 */
	private static final long serialVersionUID = 1L;
	public static final InfoMaintAttachment dao = new InfoMaintAttachment();
	
	/**
	 * 通过资讯id查询附件列表
	 * @param infoId  资讯id
	 * @return List<Record>
	 * */
	public List<Record> getAttachmentById(String infoId){
		String sql = "select *from nm_news_attachment where del_flag=0 and new_id="+infoId;
		return Db.find(sql);
	}
	
	/**
	 * 通过资讯id逻辑删除资讯
	 * @param infoId  资讯id
	 * @return List<Record>
	 * */
	public void delAttch(String infoId){
		String sql = "update nm_news_attachment set del_flag=1 where new_id="+infoId;
		Db.update(sql);
	}
}
