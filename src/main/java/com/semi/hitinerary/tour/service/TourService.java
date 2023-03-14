package com.semi.hitinerary.tour.service;

import java.util.List;

import com.semi.hitinerary.tour.domain.Tour;

public interface TourService {

	/**
	 *  투어게시판 게시물 등록 Service
	 * @param tour
	 * @return int
	 */
	public int insertPosting(Tour tour);

	/**
	 * 투어게시판 게시물 리스트 보이기 Service
	 * @return List<Tour>
	 */
	public List<Tour> selectTourList();

	/**
	 * 투어게시판 게시물 상세 조회 Service
	 * @param tourNo
	 * @return Tour
	 */
	public Tour selectOneByNo(int tourNo);

	/**
	 * 투어게시판 게시물 삭제 Service
	 * @param tourNo
	 * @return int
	 */
	public int deleteTour(int tourNo);

	/**
	 * 투어게시판 게시물 수정 Service
	 * @param tour
	 * @return int
	 */
	public int updatePosting(Tour tour);

}
