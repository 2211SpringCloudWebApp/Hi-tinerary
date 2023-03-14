package com.semi.hitinerary.tour.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.semi.hitinerary.tour.domain.Tour;

public interface TourStore {

	/**
	 * 패키지게시판 게시글 등록 Store
	 * @param session
	 * @param tour
	 * @return int
	 */
	public int insertPosting(SqlSession session, Tour tour);

	/**
	 * 패키지게시판 투어상품 리스트 불러오기 Store
	 * @param session
	 * @return List<Tour>
	 */
	public List<Tour> selectTourList(SqlSession session);

	/**
	 * 패키지게시판 게시물 상세조회 Store
	 * @param session
	 * @param tourNo
	 * @return Tour
	 */
	public Tour selecOneByNo(SqlSession session, int tourNo);

	/**
	 * 패키지게시판 게시물 삭제 Store
	 * @param session
	 * @param tourNo
	 * @return int
	 */
	public int deleteTour(SqlSession session, int tourNo);

	/**
	 * 패키지게시판 게시물 수정 Store
	 * @param session
	 * @param tour
	 * @return int
	 */
	public int updateTour(SqlSession session, Tour tour);

}
