package com.semi.hitinerary.freeboard.domain;
import java.sql.Timestamp;

public class Freeboard {
	private int boardNo; // 
	private String boardHead;
	private Timestamp writeDate;
	private String boardTitle;
	private String boardSubject;
	private Timestamp updateDate;
	private String boardImage;
	private int boardCheck;
	private int userNo;

	public Freeboard() {}

	public Freeboard(int boardNo, String boardHead, Timestamp writeDate, String boardTitle, String boardSubject,
			Timestamp updateDate, String boardImage, int boardCheck, int userNo) {
		super();
		this.boardNo = boardNo;
		this.boardHead = boardHead;
		this.writeDate = writeDate;
		this.boardTitle = boardTitle;
		this.boardSubject = boardSubject;
		this.updateDate = updateDate;
		this.boardImage = boardImage;
		this.boardCheck = boardCheck;
		this.userNo = userNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardHead() {
		return boardHead;
	}
	public void setBoardHead(String boardHead) {
		this.boardHead = boardHead;
	}
	public Timestamp getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
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
	public Timestamp getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}
	public String getBoardImage() {
		return boardImage;
	}
	public void setBoardImage(String boardImage) {
		this.boardImage = boardImage;
	}
	public int getBoardCheck() {
		return boardCheck;
	}
	public void setBoardCheck(int boardCheck) {
		this.boardCheck = boardCheck;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	@Override
	public String toString() {
		return "Freeboard [boardNo=" + boardNo + ", boardHead=" + boardHead + ", writeDate=" + writeDate
				+ ", boardTitle=" + boardTitle + ", boardSubject=" + boardSubject + ", updateDate=" + updateDate
				+ ", boardImage=" + boardImage + ", boardCheck=" + boardCheck + ", userNo=" + userNo + "]";
	}
}
