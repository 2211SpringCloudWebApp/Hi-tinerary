package com.semi.hitinerary.tour.store;

import org.apache.ibatis.session.SqlSession;

import com.semi.hitinerary.tour.domain.Tour;

public interface TourStore {

	/**
	 * 패키지게시판 게시글 등록 Store
	 * @param session
	 * @param tour
	 * @return
	 */
	int insertPosting(SqlSession session, Tour tour);

}
