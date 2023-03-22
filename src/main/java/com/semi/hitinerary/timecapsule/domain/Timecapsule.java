package com.semi.hitinerary.timecapsule.domain;

public class Timecapsule {
	private String capsuleIden;
	private int groupNo;
	private int userNo;
	private String capsuleSubject;
	private String capsuleTitle;
	private String capsuleImage;
	private String userEmail;
	private String groupName;
	
	public Timecapsule() {}


	public Timecapsule(int groupNo, int userNo, String userEmail) {
		super();
		this.groupNo = groupNo;
		this.userNo = userNo;
		this.userEmail = userEmail;
	}

	public String getCapsuleIden() {
		return capsuleIden;
	}

	public void setCapsuleIden(String capsuleIden) {
		this.capsuleIden = capsuleIden;
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

	public String getCapsuleSubject() {
		return capsuleSubject;
	}

	public void setCapsuleSubject(String capsuleSubject) {
		this.capsuleSubject = capsuleSubject;
	}

	public String getCapsuleTitle() {
		return capsuleTitle;
	}

	public void setCapsuleTitle(String capsuleTitle) {
		this.capsuleTitle = capsuleTitle;
	}

	public String getCapsuleImage() {
		return capsuleImage;
	}

	public void setCapsuleImage(String capsuleImage) {
		this.capsuleImage = capsuleImage;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getGroupName() {
		return groupName;
	}


	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}


	@Override
	public String toString() {
		return "Timecapsule [capsuleIden=" + capsuleIden + ", groupNo=" + groupNo + ", userNo=" + userNo
				+ ", capsuleSubject=" + capsuleSubject + ", capsuleTitle=" + capsuleTitle + ", capsuleImage="
				+ capsuleImage + ", userEmail=" + userEmail + "]";
	}
	
	public void createIden() {
		this.capsuleIden = this.groupNo +","+ this.userNo;
	}


}
