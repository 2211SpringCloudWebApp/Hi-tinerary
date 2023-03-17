package com.semi.hitinerary.user.domain;

import java.sql.Timestamp;

public class TourBuyUser {
	private Timestamp payDate;
	private int userNo;
	private int tourNo;
	
	public TourBuyUser() {}
	
	public Timestamp getPayDate() {
		return payDate;
	}
	public void setPayDate(Timestamp payDate) {
		this.payDate = payDate;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getTourNo() {
		return tourNo;
	}
	public void setTourNo(int tourNo) {
		this.tourNo = tourNo;
	}

	@Override
	public String toString() {
		return "TourBuyUser [payDate=" + payDate + ", userNo=" + userNo + ", tourNo=" + tourNo + "]";
	}
	
	
	
}
