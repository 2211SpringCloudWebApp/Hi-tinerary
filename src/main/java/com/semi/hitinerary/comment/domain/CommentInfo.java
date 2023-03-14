package com.semi.hitinerary.comment.domain;

import java.util.List;
import java.util.Map;

public class CommentInfo {
	private List<Integer> cNumber;
	private Map<Integer, List<Comment>> cMap;
	
	public CommentInfo() {}
	
	public CommentInfo(List<Integer> cNumber, Map<Integer, List<Comment>> cMap) {
		super();
		this.cNumber = cNumber;
		this.cMap = cMap;
	}

	public List<Integer> getcNumber() {
		return cNumber;
	}
	public void setcNumber(List<Integer> cNumber) {
		this.cNumber = cNumber;
	}
	public Map<Integer, List<Comment>> getcMap() {
		return cMap;
	}
	public void setcMap(Map<Integer, List<Comment>> cMap) {
		this.cMap = cMap;
	}
	
	@Override
	public String toString() {
		return "CommentInfo [cNumber=" + cNumber + ", cMap=" + cMap + "]";
	}
	
	
	
}
