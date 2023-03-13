package com.semi.hitinerary.groupboard.domain;

import com.semi.hitinerary.common.Pagination;

public class PagiInfoGroupBoard {
	private Pagination pi;
	private int groupNo;
	
	public PagiInfoGroupBoard(){}
	
	public PagiInfoGroupBoard(Pagination pi, int groupNo) {
		super();
		this.pi = pi;
		this.groupNo = groupNo;
	}
	
	public Pagination getPi() {
		return pi;
	}
	public void setPi(Pagination pi) {
		this.pi = pi;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	
	@Override
	public String toString() {
		return "PagiInfoGroupBoard [pi=" + pi + ", groupNo=" + groupNo + "]";
	}
	
	
	
}
