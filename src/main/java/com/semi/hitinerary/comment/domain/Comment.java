package com.semi.hitinerary.comment.domain;

import java.sql.Timestamp;

public class Comment {
	private int commentNo;
	private String content;
	private Timestamp writeDate;
	private Timestamp updateDate;
	private int depth;
	private int packageNo;
	private int withBoardNo;
	private int freeBoardNo;
	private int groupBoardNo;
	private int status;
	private int refCommentNo;
	private int userNo;
	private String userNickname;
	
	public Comment() {}
	
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getPackageNo() {
		return packageNo;
	}
	public void setPackageNo(int packageNo) {
		this.packageNo = packageNo;
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
	public int getGroupBoardNo() {
		return groupBoardNo;
	}
	public void setGroupBoardNo(int groupBoardNo) {
		this.groupBoardNo = groupBoardNo;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getRefCommentNo() {
		return refCommentNo;
	}
	public void setRefCommentNo(int refCommentNo) {
		this.refCommentNo = refCommentNo;
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
		return "Comment [commentNo=" + commentNo + ", content=" + content + ", writeDate=" + writeDate + ", updateDate="
				+ updateDate + ", depth=" + depth + ", packageNo=" + packageNo + ", withBoardNo=" + withBoardNo
				+ ", freeBoardNo=" + freeBoardNo + ", groupBoardNo=" + groupBoardNo + ", status=" + status
				+ ", refCommentNo=" + refCommentNo + ", userNo=" + userNo + ", userNickname=" + userNickname + "]";
	}


	
}