package com.qdum.llhb.ypcd.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public class Template extends Model<Template>{

	/**
	 * 模版实体
	 */
	private static final long serialVersionUID = 1L;
	public static Template dao = new Template();
	
	/**
	 * 查询颜色分类
	 */
	public List<Record> TemplateFindColor(){
		String sql="SELECT"+
	" t.label,"+
	" t.VALUE"+
	" FROM"+
	" sys_dict t"+
	" WHERE"+
	" t.type = 'color_type'";
		return Db.find(sql);
	}
	/**
	 * 查询模版
	 */
	public Page<Record> templateFind(int pageNumber,int pageSize,String color,String price,String price1,String sort,String userId){
		String sql="";
			sql=" FROM"+
			" cs_settings_template t"+
			" LEFT JOIN cs_settings_basic s ON t.id = s.template_id"+
			" AND t.del_flag='0'"+
			" and s.del_flag='0'"+
			" and s.user_id='"+userId+"'"+
			" where 1=1";
			if(color!=null&&!color.equals("0")){
				sql+=" and t.color_type='"+color+"'";
			}
			if(price!=""&&price!=null&&price1!=""&&price1!=null){
				sql+=" and t.price between "+price+" and "+price1+"";
			}
			
			if(sort=="0"||sort==null){
			sql+=" order by t.id";
			}else if(sort=="1"){
			sql+=" order by t.create_by DESC";	
			}else if(sort=="2"){
			sql+=" order by t.create_by ";	
			}else if(sort=="3"){
			sql+=" order by t.use_num DESC";		
			}else{
				sql+=" order by t.use_num";	
			}
			
		return  Db.paginate(pageNumber, pageSize, "SELECT	t.id,t.NAME,t.pic,t.use_num AS useNum,t.price,s.template_id AS templateId", sql);
	}
}
