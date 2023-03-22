package com.semi.hitinerary.tour.domain;

import java.sql.Timestamp;

public class TourSell {
	private Timestamp payDate;	
	private String userName;
	private String tourTitle;
	private String userPhone;
	private int price;

	public TourSell() {
		super();
	}

	public TourSell(Timestamp payDate, String userName, String tourTitle, String userPhone, int price) {
		super();
		this.payDate = payDate;
		this.userName = userName;
		this.tourTitle = tourTitle;
		this.userPhone = userPhone;
		this.price = price;
	}

	public Timestamp getPayDate() {
		return payDate;
	}

	public void setPayDate(Timestamp payDate) {
		this.payDate = payDate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getTourTitle() {
		return tourTitle;
	}

	public void setTourTitle(String tourTitle) {
		this.tourTitle = tourTitle;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "TourSell [payDate=" + payDate + ", userName=" + userName + ", tourTitle=" + tourTitle + ", userPhone="
				+ userPhone + ", price=" + price + "]";
	}
	
	
	
}