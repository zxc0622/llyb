package com.qdum.llhb.protection.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.qiugou.model.Qiugou;

public class SurveyLine extends Model<SurveyLine> {
	private static final long serialVersionUID = 1L;
	public static SurveyLine dao = new SurveyLine();
	/**
	 * 取行信息
	 */
	public List<Record> getByHeadId(String headid){
		String sql = "SELECT l.Survey_lines_id as lid,l.Survey_lines_type_name as lname FROM t_survey_lines l WHERE l.Survey_header_id='"+headid+"'";
		return Db.find(sql);
	}
}
