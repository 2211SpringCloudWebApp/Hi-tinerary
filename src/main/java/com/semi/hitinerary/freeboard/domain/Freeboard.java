package com.semi.hitinerary.freeboard.domain;
import java.sql.Timestamp;

public class Freeboard {
	private int boardNo;			// 게시글 번호
	private String boardHead;		// 말머리
	private Timestamp writeDate;	// 작성날짜
	private String boardTitle;		// 제목
	private String boardSubject;	// 내용
	private Timestamp updateDate;	// 최종 수정날짜
	private String boardImage;		// (NULL)이미지파일 이름
	private int boardCheck;			// (NULL)답변 여부(DEFAULT = 0/ 0:답변전 / 1:답변후)
	private int userNo;				// 유저번호(작성자 구분을 위해.. 이용해서 유저 정보 불러옴..)
	private String userNickname;	// 유저닉네임
	
	public Freeboard() {}

	public Freeboard(int boardNo, String boardHead, Timestamp writeDate, String boardTitle, String boardSubject,
			Timestamp updateDate, String boardImage, int boardCheck, int userNo, String userNickname) {
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
		this.userNickname = userNickname;
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
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	@Override
	public String toString() {
		return "Freeboard [boardNo=" + boardNo + ", boardHead=" + boardHead + ", writeDate=" + writeDate
				+ ", boardTitle=" + boardTitle + ", boardSubject=" + boardSubject + ", updateDate=" + updateDate
				+ ", boardImage=" + boardImage + ", boardCheck=" + boardCheck + ", userNo=" + userNo + ", userNickname="
				+ userNickname + "]";
	}
}
