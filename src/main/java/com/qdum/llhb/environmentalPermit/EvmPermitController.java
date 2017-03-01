package com.qdum.llhb.environmentalPermit;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

public class EvmPermitController extends Controller {
	@ActionKey("/saveEvmPermit")
	public void saveEvmPermit(){
		Record record= Db.findFirst("select phone from evmPermit where phone=?",getPara("phone"));
		if(record!=null){
			renderJson(1);
			return ;
		}
		int sta=Db.update("insert into evmPermit (name,phone,company)values(?,?,?)",
				getPara("name"),getPara("phone"),getPara("company"));
		if(sta>0){
			renderJson(0);
		}else{
			renderJson(-1);
		}
	}
}
