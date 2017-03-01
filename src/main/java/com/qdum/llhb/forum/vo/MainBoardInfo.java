package com.qdum.llhb.forum.vo;

import java.util.List;

import com.jfinal.plugin.activerecord.Record;

public class MainBoardInfo {
	private long id; //主版块 id
	private String name ; //主版块 名称
	private List<Record> masterList; //主版块版主列表
	private List<SubBoardInfo> subBoardList; //子版块列表
	private String mstNames;
	
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
	public List<SubBoardInfo> getSubBoardList() {
		return subBoardList;
	}
	public void setSubBoardList(List<SubBoardInfo> subBoardList) {
		this.subBoardList = subBoardList;
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
