package com.semi.hitinerary.tour.domain;


import java.sql.Timestamp;
import java.util.Date;

public class Tour {

	private int tourNo; //default
	private String tourTitle; //입력
	private String tourContent; //입력(+이미지)
	private Timestamp startDate; //입력
	private Timestamp endDate; //입력
	private int price; //입력
	private Date deadline; //입력
	private int currentPeople; // 일단 0
	private int maxPeople; //입력
	private int minPeople; //입력
	private String tourImage; //입력
	private String thumbnail; //입력
	private Timestamp writeDate; //default 
	private int userNo; //세션에서 갖고오기
	
	public Tour() {
		super();
	}

	public Tour(String tourTitle, String tourContent, Timestamp startDate, Timestamp endDate, int price,
			Date deadline, int maxPeople, int minPeople) {
		
		super();
		
		this.tourTitle = tourTitle;
		this.tourContent = tourContent;
		this.startDate = startDate;
		this.endDate = endDate;
		this.price = price;
		this.deadline = deadline;
	
		this.maxPeople = maxPeople;
		this.minPeople = minPeople;
		
		
		
	}

	public int getTourNo() {
		return tourNo;
	}

	public void setTourNo(int tourNo) {
		this.tourNo = tourNo;
	}

	public String getTourTitle() {
		return tourTitle;
	}

	public void setTourTitle(String tourTitle) {
		this.tourTitle = tourTitle;
	}

	public String getTourContent() {
		return tourContent;
	}

	public void setTourContent(String tourContent) {
		this.tourContent = tourContent;
	}

	public Timestamp getStartDate() {
		return startDate;
	}

	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}

	public Timestamp getEndDate() {
		return endDate;
	}

	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getDeadline() {
		return deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

	public int getCurrentPeople() {
		return currentPeople;
	}

	public void setCurrentPeople(int currentPeople) {
		this.currentPeople = currentPeople;
	}

	public int getMaxPeople() {
		return maxPeople;
	}

	public void setMaxPeople(int maxPeople) {
		this.maxPeople = maxPeople;
	}

	public int getMinPeople() {
		return minPeople;
	}

	public void setMinPeople(int minPeople) {
		this.minPeople = minPeople;
	}

	public String getTourImage() {
		return tourImage;
	}

	public void setTourImage(String tourImage) {
		this.tourImage = tourImage;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public Timestamp getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Tour [tourNo=" + tourNo + ", tourTitle=" + tourTitle + ", tourContent=" + tourContent + ", startDate="
				+ startDate + ", endDate=" + endDate + ", price=" + price + ", deadline=" + deadline
				+ ", currentPeople=" + currentPeople + ", maxPeople=" + maxPeople + ", minPeople=" + minPeople
				+ ", tourImage=" + tourImage + ", thumbnail=" + thumbnail + ", writeDate=" + writeDate + ", userNo="
				+ userNo + "]";
	}
	
	
}
