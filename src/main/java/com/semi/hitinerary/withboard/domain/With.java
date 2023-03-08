package com.semi.hitinerary.withboard.domain;

public class With {
	private int boardNo;
	private int userNo;
	private String boardTitle;
	private String boardContent;
	private String boardImage;
	private String startDate;
	private String endDate;
	private int maxPeople;
	private int currentPeople;
	private String writeDate;
	private String updateDate;
	
	public With() {}

	public With(int boardNo, int userNo, String boardTitle, String boardContent, String boardImage, String startDate,
			String endDate, int maxPeople, int currentPeople, String writeDate, String updateDate) {
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

	// getter,setter
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

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
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

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}


	// toString()
	@Override
	public String toString() {
		return "With [boardNo=" + boardNo + ", userNo=" + userNo + ", boardTitle=" + boardTitle + ", boardContent="
				+ boardContent + ", boardImage=" + boardImage + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", maxPeople=" + maxPeople + ", currentPeople=" + currentPeople + ", writeDate=" + writeDate
				+ ", updateDate=" + updateDate + "]";
	}
}
