package com.semi.hitinerary.tour.domain;

public class PageInfo {

	private int currentPage; // 현재 페이지 (1 2 3). default=1
	private int postingLimit; // 한페이지당 게시글 개수(1~9 10~18 19~27)
	private int totalCount; //전체 게시물 개수
	private int lastPage; //마지막은 몇번째 페이지?!
	
	private int startNavi;
	private int naviLimit;
	private int endNavi;
	
	public PageInfo() {
		super();
	}

	public PageInfo(int currentPage, int postingLimit, int totalCount, int lastPage, int startNavi, int naviLimit,
			int endNavi) {
		super();
		this.currentPage = currentPage;
		this.postingLimit = postingLimit;
		this.totalCount = totalCount;
		this.lastPage = lastPage;
		this.startNavi = startNavi;
		this.naviLimit = naviLimit;
		this.endNavi = endNavi;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPostingLimit() {
		return postingLimit;
	}

	public void setPostingLimit(int postingLimit) {
		this.postingLimit = postingLimit;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getStartNavi() {
		return startNavi;
	}

	public void setStartNavi(int startNavi) {
		this.startNavi = startNavi;
	}

	public int getNaviLimit() {
		return naviLimit;
	}

	public void setNaviLimit(int naviLimit) {
		this.naviLimit = naviLimit;
	}

	public int getEndNavi() {
		return endNavi;
	}

	public void setEndNavi(int endNavi) {
		this.endNavi = endNavi;
	}

	@Override
	public String toString() {
		return "PageInfo [currentPage=" + currentPage + ", postingLimit=" + postingLimit + ", totalCount=" + totalCount
				+ ", lastPage=" + lastPage + ", startNavi=" + startNavi + ", naviLimit=" + naviLimit + ", endNavi="
				+ endNavi + "]";
	}
	
	
}
