package com.qdum.llhb.companyScore;

import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.companyScore.model.CompanyScore;
import com.qdum.llhb.qykCustom.model.SysCompanyTeam;
import com.qdum.llhb.ypcd.model.Case;
import com.qdum.llhb.ypcd.model.Honor;

/**
 * 企业评分工具类
 * @author wyp
 *
 */
public class CountScore {
	public static Logger logger = Logger.getLogger(CountScore.class.getName());
	
	public void run(){
		
		//环境评估与认证
		List<Record> comList1 =  Db.find("SELECT id FROM sys_company"
				+ " WHERE type=5 AND hbCompany_type LIKE '%1%' AND del_flag=0");
		int size1 = comList1.size();
		if(size1 > 0){
			for(int i=0;i<size1;i++){
				countScore(comList1.get(i).getInt("id"),1);
			}
		}
		//环境工程与运营
		List<Record> comList2 =  Db.find("SELECT id FROM sys_company"
				+ " WHERE type=5 AND hbCompany_type LIKE '%2%' AND del_flag=0");
		int size2 = comList2.size();
		if(size2 > 0){
			for(int i=0;i<size2;i++){
				countScore(comList2.get(i).getInt("id"),1);
			}
		}
		//环境监测
		List<Record> comList3 =  Db.find("SELECT id FROM sys_company"
				+ " WHERE type=5 AND hbCompany_type LIKE '%3%' AND del_flag=0");
		int size3 = comList3.size();
		if(size3 > 0){
			for(int i=0;i<size3;i++){
				countScore(comList3.get(i).getInt("id"),1);
			}
		}
		//废物处理处置
		List<Record> comList4 =  Db.find("SELECT id FROM sys_company"
				+ " WHERE type=5 AND hbCompany_type LIKE '%4%' AND del_flag=0");
		int size4 = comList4.size();
		if(size4 > 0){
			for(int i=0;i<size4;i++){
				countScore(comList4.get(i).getInt("id"),1);
			}
		}
		
	}
	
	/**
	 * 计算单个企业的得分
	 * @param companyId 企业id
	 */
	private void countScore(int companyId,int companyType){
		PropertyConfigurator.configure("log4j-cs.properties");
		
		//System.out.println("=================开始计算企业【"+companyId+"】的得分===============");
		logger.info("=================开始计算企业【"+companyId+"】的得分===============");
		int certificatScore = 0;//行业资质得分,总分20
		int teamScore = 0;//团队实力得分,总分20
		int creditScore = 0;//信用评级得分,总分20
		int caseScore = 0;//案例得分,总分40
		int totalScore = 0;//总得分
		
		String idInfoSql = "SELECT c.user_id,s.id AS shop_id FROM sys_company c "
				+ " LEFT JOIN cs_settings_basic s ON c.user_id=s.user_id "
				+ " WHERE c.id=? AND c.del_flag=0";
		Record idInfoRec = Db.findFirst(idInfoSql,companyId);
		if(idInfoRec == null){
			return;
		}
		
		BigInteger userId = idInfoRec.get("user_id");
		Long shopId = idInfoRec.get("shop_id");
		
		List<Honor> cerList = Honor.dao.find("SELECT * FROM cs_manage_certificate"
				+ " WHERE shop_id=? AND sta=2 AND del_flag=0",shopId);
		//计算行业荣誉资质得分
		certificatScore = honorScore(0,cerList);
		
		List<SysCompanyTeam> teamList = SysCompanyTeam.dao.find("SELECT *"
				+ " FROM sys_company_team WHERE company_id=? AND del_flag=0",companyId);
		//计算团队实力得分
		teamScore = teamScore(0,teamList);
		
		int caseType = -1;
		switch (companyType) {
		case 1:
			caseType = 1273;
			break;
		case 2:
			caseType = 1274;
			break;
		case 3:
			caseType = 1275;
			break;
		case 4:
			caseType = 1276;
			break;
		default:
			break;
		}
		List<Case> caseList = Case.dao.find("SELECT * FROM inma_case_info"
				+ " WHERE user_id=? AND type_id=? AND sta=2 AND del_flag=0",userId,caseType);
		//计算案例得分
		caseScore = caseScore(0,caseList);
		
		CompanyScore cs = CompanyScore.dao.findFirst("SELECT * FROM sys_company_score"
				+ " WHERE company_id=? AND hbCompany_type=? AND del_flag=0",companyId,companyType);
		totalScore = certificatScore + teamScore + creditScore + caseScore;
//		System.out.println("=================企业【"+companyId+"】总得分为："+totalScore+"===============");
//		System.out.println("=================开始保存企业【"+companyId+"】的得分数据===============");
		logger.info("=================企业【"+companyId+"】总得分为："+totalScore+"===============");
		logger.info("=================开始保存企业【"+companyId+"】的得分数据===============");
		
		if(cs != null){
			cs.set("certificate_score", certificatScore);
			cs.set("team_score", teamScore);
			cs.set("credit_score", creditScore);
			cs.set("case_score", caseScore);
			cs.set("total_score", totalScore);
			cs.set("update_by", "1");
			cs.set("update_date", format(new Date()));
			cs.set("del_flag", 0);
			boolean b = cs.update();
			if(b){
				//System.out.println("=================保存企业【"+companyId+"】的得分保存成功===============");
				logger.info("=================保存企业【"+companyId+"】的得分保存成功===============");
			}else{
				//System.out.println("=================保存企业【"+companyId+"】的得分保存失败===============");
				logger.error("=================保存企业【"+companyId+"】的得分保存失败===============");
			}
		}else{
			cs = new CompanyScore();
			cs.set("company_id", companyId);
			cs.set("hbCompany_type", companyType);
			cs.set("certificate_score", certificatScore);
			cs.set("team_score", teamScore);
			cs.set("credit_score", creditScore);
			cs.set("case_score", caseScore);
			cs.set("total_score", totalScore);
			cs.set("update_by", "1");
			cs.set("update_date", format(new Date()));
			cs.set("del_flag", 0);
			boolean b = cs.save();
			if(b){
//				System.out.println("=================保存企业【"+companyId+"】的得分保存成功===============");
				logger.info("=================保存企业【"+companyId+"】的得分保存成功==============");
			}else{
//				System.out.println("=================保存企业【"+companyId+"】的得分保存失败===============");
				logger.error("=================保存企业【"+companyId+"】的得分保存失败===============");
			}
		}
	
	}
	
	/**
	 * 荣誉资质得分
	 * @param count 初始分数
	 * @param hList
	 * @return
	 */
	private int honorScore(int count,List<Honor> hList){
		//System.out.println("=================计算荣誉资质得分===============");
		int lsize =  hList.size();
		if(lsize >4){
			lsize = 4;
		}
		for(int i=0;i<lsize;i++){
			Honor h = hList.get(i);
			if(StringUtils.isNotEmpty(h.getStr("info_title"))){
				count += 2;
			}
			if(StringUtils.isNotEmpty(h.getStr("cer_pic"))){
				count += 3;
			}
		}
		//System.out.println("=================荣誉资质得分为："+count+"===============");
		return count;
	}
	
	/**
	 * 团队实力得分
	 * @param count 初始分数
	 * @param teamLsit
	 * @return
	 */
	private int teamScore(int count,List<SysCompanyTeam> teamList){
		//System.out.println("=================计算团队实力得分===============");
		if(teamList.size() > 0){
			SysCompanyTeam sct = teamList.get(0);
			if(StringUtils.isNotEmpty(sct.getStr("summary"))){
				count += 10;
			}
			if(StringUtils.isNotEmpty(sct.getStr("artisan_pic"))){
				count += 10;
			}
		}
		//System.out.println("=================团队实力得分为："+count+"===============");
		return count;
	}
	
	/**
	 * 案例得分
	 * @param count 初始分数
	 * @param teamList
	 * @return
	 */
	private int caseScore(int count,List<Case> caseList){
		//System.out.println("=================计算案例得分===============");
		int size =  caseList.size();
		if(size >5){
			size = 5;
		}
		for(int i=0;i<size;i++){
			Case caseInfo = caseList.get(i);
			if(StringUtils.isNotEmpty(caseInfo.getStr("case_name"))){
				count += 1;
			}
			if(StringUtils.isNotEmpty(caseInfo.getStr("case_desc"))){
				count += 1;
			}
			if(StringUtils.isNotEmpty(caseInfo.getStr("pic1"))){
				count += 1;
			}
			if(StringUtils.isNotEmpty(caseInfo.getStr("pic2"))){
				count += 1;
			}
			if(StringUtils.isNotEmpty(caseInfo.getStr("pic3"))){
				count += 1;
			}
		}
		//System.out.println("=================案例得分为："+count+"===============");
		return count;
	}
	
	private String format(Date date){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(date);
	}
}
