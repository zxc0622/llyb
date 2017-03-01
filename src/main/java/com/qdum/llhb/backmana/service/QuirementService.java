package com.qdum.llhb.backmana.service;

import java.util.List;

import com.qdum.llhb.backmana.model.Quirement;

public class QuirementService {

	public static List<Quirement> qrmListFilter(List<Quirement> qrmList){
		for (Quirement qrm : qrmList) {
			qrmFilter(qrm);
		}
		return qrmList;
	}
	
	public static Quirement qrmFilter(Quirement qrm){
		String name=qrm.get("name");
		String phone=qrm.get("phone");
		String com=qrm.get("company_name");
		name=name==null?"":name;
		phone=phone==null?"":phone;
		com=com==null?"":com;
		name=(name.length()>1?name.substring(0, 1):name)+"**";
		phone=(phone.length()>3?phone.substring(0, 3):phone)+"********";
		com=(com.length()>2?com.substring(0, 2):com)+"********";
		qrm.set("name", name);
		qrm.set("phone",phone);
		qrm.set("company_name",com);
		return qrm;
	}
	
}
