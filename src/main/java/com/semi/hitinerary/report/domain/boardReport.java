package com.semi.hitinerary.report.domain;

import java.sql.Timestamp;

public class boardReport {
	private int whthBoardNo;			// 동행게시판 번호
	private int freeBoardNo;			// 자유게시판 번호
	private int tourNo;					// 투어게시판 번호
	
	private String boardTitle;			// 제목 or 내용
	private Timestamp reportDate;		// 신고날짜
	private String reporterNickname;	// 신고자 닉네임
	private String reportReason;		// 신고사유
	private String boardWriterNo;		// 글쓴이 유저번호
	private String boardWriterNickname;	// 글쓴이 닉네임
	private int reportUserNo;			// 신고자 유저번호
	private String reportedUserNickname;// 글쓴이 닉네임.
	
	public boardReport() {}
	
	public boardReport(int whthBoardNo, int freeBoardNo, int tourNo, String boardTitle, Timestamp reportDate,
			String reporterNickname, String reportReason, String boardWriterNo, String boardWriterNickname,
			int reportUserNo, String reportedUserNickname) {
		super();
		this.whthBoardNo = whthBoardNo;
		this.freeBoardNo = freeBoardNo;
		this.tourNo = tourNo;
		this.boardTitle = boardTitle;
		this.reportDate = reportDate;
		this.reporterNickname = reporterNickname;
		this.reportReason = reportReason;
		this.boardWriterNo = boardWriterNo;
		this.boardWriterNickname = boardWriterNickname;
		this.reportUserNo = reportUserNo;
		this.reportedUserNickname = reportedUserNickname;
	}

	public int getWhthBoardNo() {
		return whthBoardNo;
	}

	public void setWhthBoardNo(int whthBoardNo) {
		this.whthBoardNo = whthBoardNo;
	}

	public int getFreeBoardNo() {
		return freeBoardNo;
	}

	public void setFreeBoardNo(int freeBoardNo) {
		this.freeBoardNo = freeBoardNo;
	}

	public int getTourNo() {
		return tourNo;
	}

	public void setTourNo(int tourNo) {
		this.tourNo = tourNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public Timestamp getReportDate() {
		return reportDate;
	}

	public void setReportDate(Timestamp reportDate) {
		this.reportDate = reportDate;
	}

	public String getReporterNickname() {
		return reporterNickname;
	}

	public void setReporterNickname(String reporterNickname) {
		this.reporterNickname = reporterNickname;
	}

	public String getReportReason() {
		return reportReason;
	}

	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}

	public String getBoardWriterNo() {
		return boardWriterNo;
	}

	public void setBoardWriterNo(String boardWriterNo) {
		this.boardWriterNo = boardWriterNo;
	}

	public String getBoardWriterNickname() {
		return boardWriterNickname;
	}

	public void setBoardWriterNickname(String boardWriterNickname) {
		this.boardWriterNickname = boardWriterNickname;
	}

	public int getReportUserNo() {
		return reportUserNo;
	}

	public void setReportUserNo(int reportUserNo) {
		this.reportUserNo = reportUserNo;
	}

	public String getReportedUserNickname() {
		return reportedUserNickname;
	}

	public void setReportedUserNickname(String reportedUserNickname) {
		this.reportedUserNickname = reportedUserNickname;
	}

	@Override
	public String toString() {
		return "boardReport [whthBoardNo=" + whthBoardNo + ", freeBoardNo=" + freeBoardNo + ", tourNo=" + tourNo
				+ ", boardTitle=" + boardTitle + ", reportDate=" + reportDate + ", reporterNickname=" + reporterNickname
				+ ", reportReason=" + reportReason + ", boardWriterNo=" + boardWriterNo + ", boardWriterNickname="
				+ boardWriterNickname + ", reportUserNo=" + reportUserNo + ", reportedUserNickname="
				+ reportedUserNickname + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	
	
}
