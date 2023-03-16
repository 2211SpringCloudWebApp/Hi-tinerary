package com.semi.hitinerary.withboard.domain;

import java.sql.Timestamp;

public class With {
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String boardImage;
	private Timestamp startDate;
	private Timestamp endDate;
	private int maxPeople;
	private int currentPeople;
	private Timestamp writeDate;
	private Timestamp updateDate;
	
	//USER_TBL에서 가지고오기
	private int userNo;
	private String userNickname;
	private String userGender;
	private String userBirthDate;
	
	public With() {}

	public With(int boardNo, int userNo, String boardTitle, String boardContent, String boardImage, Timestamp startDate,
			Timestamp endDate, int maxPeople, int currentPeople, Timestamp writeDate, Timestamp updateDate) {
		super();
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardImage = boardImage;
		this.startDate = startDate;
		this.endDate = endDate;
		this.maxPeople = maxPeople;
		this.currentPeople = currentPeople;
		this.writeDate = writeDate;
		this.updateDate = updateDate;
	}

	public With(int boardNo, String boardTitle, String boardContent, String boardImage, Timestamp startDate,
			Timestamp endDate, int maxPeople, int currentPeople, Timestamp writeDate, Timestamp updateDate, int userNo,
			String userGender, String userBirthDate) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardImage = boardImage;
		this.startDate = startDate;
		this.endDate = endDate;
		this.maxPeople = maxPeople;
		this.currentPeople = currentPeople;
		this.writeDate = writeDate;
		this.updateDate = updateDate;
		this.userNo = userNo;
		this.userGender = userGender;
		this.userBirthDate = userBirthDate;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardImage() {
		return boardImage;
	}

	public void setBoardImage(String boardImage) {
		this.boardImage = boardImage;
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

	public int getMaxPeople() {
		return maxPeople;
	}

	public void setMaxPeople(int maxPeople) {
		this.maxPeople = maxPeople;
	}

	public int getCurrentPeople() {
		return currentPeople;
	}

	public void setCurrentPeople(int currentPeople) {
		this.currentPeople = currentPeople;
	}

	public Timestamp getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}

	public Timestamp getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getUserBirthDate() {
		return userBirthDate;
	}

	public void setUserBirthDate(String userBirthDate) {
		this.userBirthDate = userBirthDate;
	}
	
	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	@Override
	public String toString() {
		return "With [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardImage=" + boardImage + ", startDate=" + startDate + ", endDate=" + endDate + ", maxPeople="
				+ maxPeople + ", currentPeople=" + currentPeople + ", writeDate=" + writeDate + ", updateDate="
				+ updateDate + ", userNo=" + userNo + ", userNickname=" + userNickname + ", userGender=" + userGender
				+ ", userBirthDate=" + userBirthDate + "]";
	}
}