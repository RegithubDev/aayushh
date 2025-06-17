package com.resustainability.reisp.model;

import java.util.List;

import com.resustainability.reisp.model.User;

public class RMPaginationObject {
	private int iTotalDisplayRecords; 
	private int iTotalRecords;
	private List<RoleMapping> aaData;
	
	public int getiTotalRecords() {
		return iTotalRecords;
	}
	public void setiTotalRecords(int iTotalRecords) {
		this.iTotalRecords = iTotalRecords;
	}
	public List<RoleMapping> getAaData() {
		return aaData;
	}
	public void setAaData(List<RoleMapping> aaData) {
		this.aaData = aaData;
	}
	public int getiTotalDisplayRecords() {
		return iTotalDisplayRecords;
	}
	public void setiTotalDisplayRecords(int iTotalDisplayRecords) {
		this.iTotalDisplayRecords = iTotalDisplayRecords;
	}
}
