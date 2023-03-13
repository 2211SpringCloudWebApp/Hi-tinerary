package com.semi.hitinerary.groupboard.domain;

import java.sql.Timestamp;

public class Groupboard {
	private int boardNo;
	private String boardTitle;
	private String boardSubject;
	private Timestamp writeDate;
	private int groupNo;
	private int userNo;
	
	public Groupboard() {}
	
	public Groupboard(String boardTitle, String boardSubject, int groupNo, int userNo) {
		super();
		this.boardTitle = boardTitle;
		this.boardSubject = boardSubject;
		this.groupNo = groupNo;
		this.userNo = userNo;
	}



	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardSubject() {
		return boardSubject;
	}

	public void setBoardSubject(String boardSubject) {
		this.boardSubject = boardSubject;
	}

	public Timestamp getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Groupboard [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardSubject=" + boardSubject
				+ ", writeDate=" + writeDate + ", groupNo=" + groupNo + ", userNo=" + userNo + "]";
	}
	
}
