package com.qdum.llhb.spread.controller;

import java.util.Calendar;
import java.util.Date;

import org.junit.Test;

import com.ibm.icu.text.SimpleDateFormat;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.qdum.llhb.backmana.model.SupplyHotQuery;
import com.qdum.llhb.spread.modle.QueryRankiing;

@ControllerBind(controllerKey="/spread/index")
public class SpreadIndexController extends Controller {
	public void index(){
		setAttr("hotWordList",SupplyHotQuery.dao.getCountOfHotWord());
		setAttr("spreadNowList",QueryRankiing.dao.getSpreadNow());
		render("spreadIndex.jsp");
	}
	public void bidRecord(){
		setAttr("spreadNowList",QueryRankiing.dao.getSpreadNow());
		//获取年份和月份
		Calendar calendar = Calendar.getInstance();
		setAttr("year",calendar.get(Calendar.YEAR));
		setAttr("month",calendar.get(Calendar.MONTH)+1);
		String keyWord = getPara("keyWord");
		if(keyWord == null || keyWord.equals("")){
			redirect("/spread/index");
			return;
		}
		setAttr("keyWord",keyWord);
		setAttr("bidRecordList",QueryRankiing.dao.getBidRecord(keyWord));
		setAttr("bidRecordAllList",QueryRankiing.dao.getBidAllRecord(keyWord));
		render("bidRecord.jsp");
	}
	public void more(){
		setAttr("spreadNowList",QueryRankiing.dao.getSpreadNow());
		String keyWord = getPara("keyWord");
		if(keyWord == null || keyWord.equals("")){
			redirect("/spread/index");
			return;
		}
		setAttr("keyWord",keyWord);
		String[] type= {"供应","求购","公司"};
		String mid = getPara("mid");
		if(!mid.matches("[0-9]+") || Integer.parseInt(mid)>2 ){
			redirect("/spread/index");
			return;
		}
		setAttr("type",type[Integer.parseInt(mid)]);
		setAttr("bidRecordAllList",QueryRankiing.dao.getBidAllRecord(keyWord));
		render("moreRecord.jsp");
	}
}
