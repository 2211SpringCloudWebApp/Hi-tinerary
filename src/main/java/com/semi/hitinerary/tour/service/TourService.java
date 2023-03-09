package com.semi.hitinerary.tour.service;

import com.semi.hitinerary.tour.domain.Tour;

public interface TourService {

	/**
	 *  투어게시판 게시물 등록 Service
	 * @param tour
	 * @return
	 */
	public int insertPosting(Tour tour);

}
