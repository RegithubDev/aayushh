package com.resustainability.reisp.model;

import java.util.List;

public class IRMPaginationObject {
	private int iTotalDisplayRecords; 
	private int iTotalRecords;
	private List<IRM> aaData;
	
	public int getiTotalRecords() {
		return iTotalRecords;
	}
	public void setiTotalRecords(int iTotalRecords) {
		this.iTotalRecords = iTotalRecords;
	}
	public List<IRM> getAaData() {
		return aaData;
	}
	public void setAaData(List<IRM> aaData) {
		this.aaData = aaData;
	}
	public int getiTotalDisplayRecords() {
		return iTotalDisplayRecords;
	}
	public void setiTotalDisplayRecords(int iTotalDisplayRecords) {
		this.iTotalDisplayRecords = iTotalDisplayRecords;
	}
}
