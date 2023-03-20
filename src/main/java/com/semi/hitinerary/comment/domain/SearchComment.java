package com.semi.hitinerary.comment.domain;

public class SearchComment {
	private String category;
	private int userNo;
	
	
	public SearchComment() {
		super();
	}
	public SearchComment(String category, int userNo) {
		super();
		this.category = category;
		this.userNo = userNo;
	}
	
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	@Override
	public String toString() {
		return "SerachComment [category=" + category + ", userNo=" + userNo + "]";
	}
}
