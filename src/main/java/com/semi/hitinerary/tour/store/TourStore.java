package com.semi.hitinerary.tour.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.semi.hitinerary.comment.domain.Comment;
import com.semi.hitinerary.common.Pagination;
import com.semi.hitinerary.tour.domain.PageInfo;
import com.semi.hitinerary.tour.domain.Tour;
import com.semi.hitinerary.tour.domain.TourPay;
import com.semi.hitinerary.user.domain.User;

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
	 * @param pi 
	 * @return List<Tour>
	 */
	public List<Tour> selectTourList(SqlSession session, Pagination pi);

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

	/**
	 * 패키지 게시물 예약자 정보 불러오기 Store
	 * @param session
	 * @param payUserNo
	 * @return User
	 */
	public User selectUserByNo(SqlSession session, int payUserNo);

	/**
	 * 투어 상품 구매 정보 저장(입력하기) Store
	 * @param session
	 * @param tPay
	 * @return int 
	 */
	public int insertPay(SqlSession session, TourPay tPay);

	/**
	 * 패키지 게시판 게시물 전체 개수 가져오기 Store
	 * @param session
	 * @return int
	 */
	public int selectTotalCount(SqlSession session);
	
	/**
	 * 유저정보로 구매내역 불러오기 Store
	 * @param session
	 * @param userNo
	 * @param pi 
	 * @return
	 */
	public List<Tour> selectTourListByUserNo(SqlSession session, int userNo, Pagination pi);

	/**
	 * 시퀀스 넘버 조회 Store
	 * @param session
	 * @return int
	 */
	public int getSequence(SqlSession session);

	/**
	 * 댓글 쓰기 Store
	 * @param session
	 * @param comment
	 * @return int
	 */
	public int insertComment(SqlSession session, Comment comment);

	/**
	 * 댓글 리스트 불러오기 Store
	 * @param session
	 * @param tourNo
	 * @return List<Comment>
	 */
	public List<Comment> selectAllComments(SqlSession session, int tourNo);

	/**
	 * 대댓글 쓰기 Store
	 * @param session
	 * @param reReply
	 * @return int 
	 */
	public int insertRereply(SqlSession session, Comment reReply);
	
	/**
	 * 결제한 패키지 개수 Store
	 * @param session
	 * @param userNo
	 * @return
	 */
	public int selectGetTotalCountByUserNo(SqlSession session, int userNo);

	/**
	 * currentPeople 수 가져오기 Store
	 * @param session
	 * @param tourNo
	 * @return int 
	 */
	public int selectCurrCount(SqlSession session, int tourNo);

	/**
	 * 투어게시물 댓글 삭제  Store
	 * @param session
	 * @param commentNo
	 * @return int
	 */
	public int deleteComment(SqlSession session, int commentNo);

	/**
	 * 유저번호로 투어상품 게시글 찾기
	 * @param session
	 * @param userNo
	 * @param pi
	 * @return
	 */
	public List<Tour> selectListByuserNo(SqlSession session, int userNo, Pagination pi);

}
