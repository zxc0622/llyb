package com.qdum.llhb.quotation.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;


public class Quotation extends Model<Quotation> {

	/**
	 * 行情中心模型
	 * @author zhaoyl
	 * 2015年12月14日15:30:52
	 */
	private static final long serialVersionUID = 1L;
	public static final Quotation dao = new Quotation();
	/**
	 * 获取行情列表并分页
	 **/
	public Page<Record> getQuoPage(int pageNum, int pageSize){
		String select = "SELECT sd.label sd_label, nq.* ";
		String sqlExceptSelect = "from (SELECT @rownum:=@rownum+1 AS rownum, d.* from (SELECT @rownum:=0) r,(select *, IFNULL(update_date,create_date)time from nm_quotations_detail WHERE del_flag=0 ) AS d ORDER BY time DESC) nq "
							+ " LEFT JOIN (SELECT dict.* from sys_dict dict where dict.del_flag=0 and type='quotations_type') sd on sd.value = nq.quo_type "
							+ "ORDER BY time DESC";
		return Db.paginate(pageNum, pageSize, select, sqlExceptSelect);
	}
	/**
	 * 通过ID获取model
	 */
	public Record getById(Object id){
		String sql = "select *from nm_quotations_detail where del_flag=0 and id="+id;
		return Db.findFirst(sql);
	}
	/**
	 * 删除选中的元素
	 * @param ids[] 要删除的id数组
	 */
	public boolean isDelete(String[] ids,long userId){
		String sql = "update nm_quotations_detail set del_flag=1,update_by="+userId+",update_date='"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())+"' where ";
		for (String s : ids) {
			sql +=" id="+s+" or";
		}
		sql = sql.substring(0, sql.lastIndexOf("or"));//删除多余的or
		int result = Db.update(sql);
		if(result>0){//更新成功返回更新条数
			return true;
		}else{
			return false;
		}
	}
	/**
	 * 通过类别获取行情列表分页
	 * @param type：行情类别
	 * @param name：标题名称
	 * */
	public Page<Record> getPageByType(int pageNumber,int pageSize, String type, String title){
		String select = "select nq.* ";
		String sqlExceptSelect = "from (SELECT @rownum:=@rownum+1 AS rownum, d.* "
									+ "from (SELECT @rownum:=0) r,(select *, IFNULL(update_date,create_date)time from nm_quotations_detail WHERE del_flag=0 ) AS d ORDER BY time DESC) nq "
									+ "where del_flag = 0 ";
		if(type != null && !"".equals(type)){
			sqlExceptSelect += " and nq.quo_type='"+type+"' ";
		}
		if(title != null && !"".equals(title)){
			sqlExceptSelect += " and nq.quo_title like '%"+title+"%' ";
		}
		return Db.paginate(pageNumber, pageSize, select, sqlExceptSelect);
	}
	/**
	 * 通过类别获取行情列表
	 * @param type：行情类别
	 * */
	public List<Record> getListByType(String type){
		String sql = "select * from (SELECT @rownum:=@rownum+1 AS rownum, d.* "
									+ "from (SELECT @rownum:=0) r,(select *, IFNULL(update_date,create_date)time from nm_quotations_detail WHERE del_flag=0 ) AS d ORDER BY time DESC) nq "
									+ "where del_flag = 0  and quo_type ='"+type+"'";
		return Db.find(sql);
	}
}
