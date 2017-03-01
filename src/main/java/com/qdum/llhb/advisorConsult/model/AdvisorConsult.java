package com.qdum.llhb.advisorConsult.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

public class AdvisorConsult extends Model<AdvisorConsult> {
	private static final long serialVersionUID = 1L;
	public static final AdvisorConsult dao = new AdvisorConsult();
	
	//后台管理-分页获取明星案例
		public Page<AdvisorConsult> getCaseByPage(int pageNumber, int pageSize){
			return dao.paginate(pageNumber, pageSize, "select * ", "FROM advisor_consult where del_flag=0 order by create_date DESC");
		}
	
}
