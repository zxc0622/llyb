package com.qdum.llhb.Competition.vo;

import java.util.List;

public class CompSecondInfo {

	private long id ;
	private String name;
	private List<CompThirdInfo> subList;
	
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
	public List<CompThirdInfo> getSubList() {
		return subList;
	}
	public void setSubList(List<CompThirdInfo> subList) {
		this.subList = subList;
	}
	
}
