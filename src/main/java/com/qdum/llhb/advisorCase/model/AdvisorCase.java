package com.qdum.llhb.advisorCase.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

public class AdvisorCase extends Model<AdvisorCase> {
	private static final long serialVersionUID = 1L;
	public static final AdvisorCase dao = new AdvisorCase();
	
	//分页获取明星案例
	public Page<AdvisorCase> getCaseByPage(int pageNumber){
		return dao.paginate(pageNumber, 15, "select * ", "from advisor_case where del_flag=0 order by seq");
	}
	
	//平台首页明星案例
	public List<AdvisorCase> getCaseOnIndex(){
		return dao.find("select * from advisor_case where del_flag=0 order by seq limit 0,9");
	}
	
	//根据id获取案例
	public AdvisorCase getCaseDetailById(Object id){
		return dao.findById(id);
	}
	
	//案例详情页面推荐其他案例
	public List<AdvisorCase> getOtherCase(Object id){
		return dao.find("select * from advisor_case where id<>? limit 4",id);
	}
}
