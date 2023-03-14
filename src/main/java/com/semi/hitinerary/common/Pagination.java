package com.semi.hitinerary.common;

public class Pagination {
	private int currentPage; // 현재페이지
	private int boardLimit; // 페이지당 보여줄 수
	private int naviLimit; // 네비게이션 수
	private int startNavi; // 네비게이션 시작 수
	private int endNavi; // 네비게이션 끝 수
	private int totalCount; // 게시글 수
	private int maxNavi; // 마지막 네비게이션
	
	public Pagination() {}
	
	/**
	 * currentPage = 현재페이지 boardLimit totalCount = 게시글의 총 갯수
	 * @param currentPage
	 * @param totalCount
	 */
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
	/**
	 * currentPage = 현재페이지 boardLimit = 페이지당 보여줄 게시글 수 naviLimit = 네비게이션바 수
	 * totalCount = 게시글의 총 갯수	
	 * @param currentPage
	 * @param boardLimit
	 * @param naviLimit
	 * @param totalCount
	 */
	public Pagination(int currentPage, int boardLimit, int naviLimit, int totalCount) {
		this.currentPage = currentPage;
		this.boardLimit = boardLimit;
		this.naviLimit = naviLimit;
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
