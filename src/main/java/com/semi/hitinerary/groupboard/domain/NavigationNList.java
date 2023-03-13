package com.semi.hitinerary.groupboard.domain;

import java.util.List;

import com.semi.hitinerary.common.Pagination;

public class NavigationNList {
	private Pagination pi;
	private List<Groupboard> gBList;
	
	
	public NavigationNList() {}
	
	public NavigationNList(Pagination pi, List<Groupboard> gBList) {
		super();
		this.pi = pi;
		this.gBList = gBList;
	}
	
	public Pagination getPi() {
		return pi;
	}
	public void setPi(Pagination pi) {
		this.pi = pi;
	}
	public List<Groupboard> getgBList() {
		return gBList;
	}
	public void setgBList(List<Groupboard> gBList) {
		this.gBList = gBList;
	}
	
	
	@Override
	public String toString() {
		return "NavigationNList [pi=" + pi + ", gBList=" + gBList + "]";
	}
}
