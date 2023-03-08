package com.semi.hitinerary.group.domain;

import java.sql.Timestamp;

public class Group {
	private int groupNo;
	private Timestamp startDate;
	private Timestamp endDate;
	private int maxPeople;
	private int currentPeople;
	private Timestamp writeDate;
	private String groupName;
	private int leaderUserNo;
	
	public Group() {}
	
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public Timestamp getStartDate() {
		return startDate;
	}
	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}
	public Timestamp getEndDate() {
		return endDate;
	}
	public void setEndDate(Timestamp endDate) {
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
	public Timestamp getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public int getLeaderUserNo() {
		return leaderUserNo;
	}
	public void setLeaderUserNo(int leaderUserNo) {
		this.leaderUserNo = leaderUserNo;
	}
	
	
}
