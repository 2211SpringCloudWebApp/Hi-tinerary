package com.semi.hitinerary.tour.domain;

import java.sql.Timestamp;

public class TourPay {
	private int userNo; 
	private int tourNo; 
	private Timestamp payDate;
	
	public TourPay() {
		super();
	}

	public TourPay(int userNo, int tourNo, Timestamp payDate) {
		super();
		this.userNo = userNo;
		this.tourNo = tourNo;
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

	public Timestamp getPayDate() {
		return payDate;
	}

	public void setPayDate(Timestamp payDate) {
		this.payDate = payDate;
	}

	@Override
	public String toString() {
		return "TourPay [userNo=" + userNo + ", tourNo=" + tourNo + ", payDate=" + payDate + "]";
	}
	
	
}
