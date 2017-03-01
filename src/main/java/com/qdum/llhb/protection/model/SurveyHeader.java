package com.qdum.llhb.protection.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.qiugou.model.Qiugou;

public class SurveyHeader extends Model<SurveyHeader> {
	private static final long serialVersionUID = 1L;
	public static SurveyHeader dao = new SurveyHeader();
	/**
	 * 取所有
	 */
	public List<Record> getAll(){
		String sql = "SELECT h.Survey_header_id as hid,h.Survey_header_type_name as hname,h.remark,h.create_by as hcb,h.create_time as hct FROM t_survey_header h ";
		return Db.find(sql);
	}
}
