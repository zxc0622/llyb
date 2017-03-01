package com.qdum.llhb.forum.vo;

import java.util.List;

import com.jfinal.plugin.activerecord.Record;

public class SubBoardInfo {
	private long id;		//子版块id
	private String name;	//子版块名称
	private List<Record> masterList; //子版块版主列表
	private String mstNames ;
	
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public List<Record> getMasterList() {
		return masterList;
	}
	public void setMasterList(List<Record> masterList) {
		this.masterList = masterList;
		String names = "";
		if(masterList!=null){
			for (Record master : masterList) {
				names += master.getStr("login_name")+" ";
			}
			this.mstNames = names;
		}
	}
	public String getMstNames(){
		return this.mstNames;
	}
}
