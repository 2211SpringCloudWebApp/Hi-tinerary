package com.semi.hitinerary.report.domain;
import java.sql.Timestamp;

public class Report {
	private int reportNo;			// 신고 고유값
	private Timestamp reportDate;	// 신고날짜
	private String reportReason;	// 신고사유
	private int userNo;				// 유저번호
	private int withBoardNo;		// 동행게시판 고유값
	private int freeBoardNo;		// 자유게시판 고유값
	private int TourNo;				// 투어게시판 고유값
	private int commentNo;			// 댓글 고유값
	
	public Report() {}

	public Report(int reportNo, Timestamp reportDate, String reportReason, int userNo, int withBoardNo, int freeBoardNo,
			int tourNo, int commentNo) {
		super();
		this.reportNo = reportNo;
		this.reportDate = reportDate;
		this.reportReason = reportReason;
		this.userNo = userNo;
		this.withBoardNo = withBoardNo;
		this.freeBoardNo = freeBoardNo;
		TourNo = tourNo;
		this.commentNo = commentNo;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public Timestamp getReportDate() {
		return reportDate;
	}

	public void setReportDate(Timestamp reportDate) {
		this.reportDate = reportDate;
	}

	public String getReportReason() {
		return reportReason;
	}

	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getWithBoardNo() {
		return withBoardNo;
	}

	public void setWithBoardNo(int withBoardNo) {
		this.withBoardNo = withBoardNo;
	}

	public int getFreeBoardNo() {
		return freeBoardNo;
	}

	public void setFreeBoardNo(int freeBoardNo) {
		this.freeBoardNo = freeBoardNo;
	}

	public int getTourNo() {
		return TourNo;
	}

	public void setTourNo(int tourNo) {
		TourNo = tourNo;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportDate=" + reportDate + ", reportReason=" + reportReason
				+ ", userNo=" + userNo + ", withBoardNo=" + withBoardNo + ", freeBoardNo=" + freeBoardNo + ", TourNo="
				+ TourNo + ", commentNo=" + commentNo + "]";
	}
	
}
