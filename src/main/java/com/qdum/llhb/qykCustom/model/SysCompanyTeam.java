package com.qdum.llhb.qykCustom.model;

import net.sf.json.JSONObject;

import com.jfinal.plugin.activerecord.Model;

/**
 * 企业团队实力
 */
public class SysCompanyTeam extends
		Model<SysCompanyTeam> {

	private static final long serialVersionUID = 1L;
	public static SysCompanyTeam dao = new SysCompanyTeam();
	private SysCompanyTeam teamMsg;
	
	//更具企业id获取团队信息
	public SysCompanyTeam getTeamMsgByCompanyId(long companyId){
		teamMsg = dao.findFirst("select * from sys_company_team where company_id=?",companyId);
		return teamMsg;
	}
	
	//更新团队信息
	public int updateMsg(JSONObject teamMsg,long companyId){
		SysCompanyTeam team = dao.findFirst("select * from sys_company_team where company_id=?",companyId);
		int num=0;
		Object temp;
		if(team==null){
			team=new SysCompanyTeam();
			team.set("company_id", companyId);
			setSysCompanyTeam(teamMsg,team);
			num=team.save()?1:0;
		}else{
			setSysCompanyTeam(teamMsg,team);
			num = team.update()?1:0;
		}
		return num;
	}
	
	//设置SysCompanyTeam的值
	private void setSysCompanyTeam(JSONObject teamMsg,SysCompanyTeam team){
		Object temp;
		temp=teamMsg.get("img_url")==null?"":team.set("img_url", teamMsg.get("img_url"));
		temp=teamMsg.get("summary")==null?"":team.set("summary", teamMsg.getString("summary").trim());
		temp=teamMsg.get("employee")==null?"":team.set("employee", teamMsg.get("employee"));
		temp=teamMsg.get("experts")==null?"":team.set("experts", teamMsg.get("experts"));
		temp=teamMsg.get("patent")==null?"":team.set("patent", teamMsg.get("patent"));
		temp=teamMsg.get("artisan_pic")==null?"":team.set("artisan_pic", teamMsg.getString("artisan_pic"));
	}

}
