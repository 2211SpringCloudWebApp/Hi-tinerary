package com.semi.hitinerary.common;

public class Pagination {
	private int currentPage;
	private int boardLimit;
	private int naviLimit;
	private int startNavi;
	private int endNavi;
	private int totalCount;
	private int maxNavi;
	
	public Pagination() {}
	
	public Pagination(int currentPage, int totalCount) {
		this.currentPage = currentPage;
		this.boardLimit = 10;
		this.naviLimit = 5;
		this.startNavi = (currentPage -1) / naviLimit * naviLimit + 1;
		this.endNavi = startNavi + naviLimit - 1;
		this.maxNavi = (int)(Math.ceil(totalCount / (double)boardLimit));
		if(maxNavi < endNavi) {
			endNavi = maxNavi;
		}
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getBoardLimit() {
		return boardLimit;
	}
	public void setBoardLimit(int boardLimit) {
		this.boardLimit = boardLimit;
	}
	public int getNaviLimit() {
		return naviLimit;
	}
	public void setNaviLimit(int naviLimit) {
		this.naviLimit = naviLimit;
	}
	public int getStartNavi() {
		return startNavi;
	}
	public void setStartNavi(int startNavi) {
		this.startNavi = startNavi;
	}
	public int getEndNavi() {
		return endNavi;
	}
	public void setEndNavi(int endNavi) {
		this.endNavi = endNavi;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getMaxNavi() {
		return maxNavi;
	}
	public void setMaxNavi(int maxNavi) {
		this.maxNavi = maxNavi;
	}

	@Override
	public String toString() {
		return "Pagination [currentPage=" + currentPage + ", boardLimit=" + boardLimit + ", naviLimit=" + naviLimit
				+ ", StartNavi=" + startNavi + ", endNavi=" + endNavi + ", totalCount=" + totalCount + ", maxNavi="
				+ maxNavi + "]";
	}
	
	
}
