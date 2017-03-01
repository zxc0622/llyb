package com.qdum.llhb.problem.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public class Problem  extends Model<Problem>{
	/**
	 * 常见问题实体
	 */
	private static final long serialVersionUID = 1L;
	public static Problem dao = new Problem();
	
	/**
	 * 分页查询常见问题
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	public Page<Record> findProblem(int pageNumber,int pageSize,String type){
		String sql="";
		if(type==null||type.equals("0")||type.equals("")){
			sql=" from bm_self_help_detail t LEFT JOIN sys_dict_pcr s ON t.ques_type = s.id  and s.del_flag='0' where t.del_flag='0' order by t.create_date desc";
		}else{
			sql=" from bm_self_help_detail t LEFT JOIN sys_dict_pcr s ON t.ques_type = s.id  and s.del_flag='0' where t.del_flag='0' and t.ques_type='"+type+"'  order by t.create_date desc";
		}
		
		return Db.paginate(pageNumber, pageSize, "select t.id,t.ques_title as quesTitle,DATE_FORMAT(t.create_date, '%Y-%m-%d') as createDate,t.show_order as showOrder,s.name as name,t.ques_type as quesType", sql);
	}
	/**
	 * 查询常见问题
	 */
	public List<Record> findQuesList(String type){
		String sql ="select t.id,t.ques_title as quesTitle,DATE_FORMAT(t.create_date, '%Y-%m-%d') as createDate,t.show_order as showOrder, t.ques_content as quesContent ,s.name as name,t.ques_type as quesType from bm_self_help_detail t LEFT JOIN sys_dict_pcr s ON t.ques_type = s.id  and s.del_flag='0' where t.del_flag='0' and t.ques_type='"+type+"' order by t.show_order";
		return Db.find(sql);
	}
	/**
	 * 查询前5条常见问题
	 */
	public List<Record> findQuesListFive(){
		String sql ="select t.id,t.ques_title as quesTitle,DATE_FORMAT(t.create_date, '%Y-%m-%d') as createDate,t.show_order as showOrder, t.ques_content as quesContent ,s.name as name,t.ques_type as quesType from bm_self_help_detail t LEFT JOIN sys_dict_pcr s ON t.ques_type = s.id  and s.del_flag='0' where t.del_flag='0' and t.ques_type='1125' ORDER BY t.show_order  LIMIT 5 ";
		return Db.find(sql);
	}
	/**
	 * 单挑查询常见问题
	 */
	public List<Record> findProblemId(String id){
		String sql="select id,ques_title as quesTitle,DATE_FORMAT(create_date, '%Y-%m-%d') as createDate,ques_content as quesContent,remarks as remarks,ques_type as quesType,show_order as showOrder from bm_self_help_detail where del_flag='0'  and id='"+id+"' order by create_date desc";
		return Db.find(sql);
	}
}
