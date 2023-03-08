package com.semi.hitinerary.user.domain;

public class User {
	private int userNo;
	private String userId;
	private String userPw;
	private String userName;
	private String userNickname;
	private String userEmail;
	private String userPhone;
	private String userBirthDate;
	private String userGender;
	private String companyRegiNo;
	private int userGrade;
	
	public User() {}
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserBirthDate() {
		return userBirthDate;
	}
	public void setUserBirthDate(String userBirthDate) {
		this.userBirthDate = userBirthDate;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getCompanyRegiNo() {
		return companyRegiNo;
	}
	public void setCompanyRegiNo(String companyRegiNo) {
		this.companyRegiNo = companyRegiNo;
	}
	public int getUserGrade() {
		return userGrade;
	}
	public void setUserGrade(int userGrade) {
		this.userGrade = userGrade;
	}
	
	
	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", userId=" + userId + ", userPw=" + userPw + ", userName=" + userName
				+ ", userNickname=" + userNickname + ", userEmail=" + userEmail + ", userPhone=" + userPhone
				+ ", userBirthDate=" + userBirthDate + ", userGender=" + userGender + ", companyRegiNo=" + companyRegiNo
				+ ", userGrade=" + userGrade + "]";
	}
	
	
}
