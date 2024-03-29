package com.semi.hitinerary.tour.service;

import java.util.List;

import com.semi.hitinerary.comment.domain.Comment;
import com.semi.hitinerary.common.Pagination;

import com.semi.hitinerary.tour.domain.Tour;
import com.semi.hitinerary.tour.domain.TourPay;
import com.semi.hitinerary.tour.domain.TourSell;
import com.semi.hitinerary.user.domain.User;

public interface TourService {

	/**
	 * 투어게시판 게시물 리스트 보이기 Service
	 * @param pi 
	 * @return List<Tour>
	 */
	public List<Tour> selectTourList(Pagination pi);

	/**
	 * 유저 번호로 투어상품 게시글 찾기
	 * @param userNo
	 * @param pi
	 * @return
	 */
	public List<Tour> selectListByuserNo(int userNo, Pagination pi);

	/**
	 * 투어게시판 게시물 상세 조회 Service
	 * @param tourNo
	 * @return Tour
	 */
	public Tour selectOneByNo(int tourNo);

	/**
	 * 투어 게시물 예약자 정보 불러오기 Service
	 * @param payUserNo
	 * @return User
	 */
	public User selectUserByNo(int payUserNo);

	/**
	 * 구매한 패키지 개수 불러오기
	 * @param userNo
	 * @return int
	 */
	public int selectGetTotalCountByUserNo(int userNo);

	/**
	 * 유저정보로 구매내역 불러오기 Service
	 * @param userNo
	 * @param pi 
	 * @return List
	 */
	public List<Tour> selectTourListByUserNo(int userNo, Pagination pi);

	/**
	 * 댓글들 불러오기 service
	 * @param tourNo
	 * @return List<Comment>
	 */
	public List<Comment> selectAllComments(int tourNo);

	/**
	 * currentPeople 수 가져오기
	 * @param tourNo
	 * @return int
	 */
	public int selectCurrCount(int tourNo);

	/**
	 * 투어상품리스트 전체페이지개수 가져오기 Service
	 * @return int
	 */
	public int getListCount();
	
	/**
	 * 시퀀스 넘버 조회 service
	 * @return int
	 */
	public int getSequence();

	/**
	 *  투어게시판 게시물 등록 Service
	 * @param tour
	 * @return int
	 */
	public int insertPosting(Tour tour);

	/**
	 * 댓글 쓰기 service
	 * @param comment
	 * @return int
	 */
	public int commentUp(Comment comment);

	/**
	 * 투어상품 구매 정보 저장(입력하기) Service
	 * @param tPay
	 * @return int
	 */
	public int payTour(TourPay tPay);

	/**
	 * 대댓글 쓰기 service
	 * @param reReply
	 * @return int
	 */
	public int reReplyUp(Comment reReply);
	
	/**
	 * 투어게시판 게시물 수정 Service
	 * @param tour
	 * @return int
	 */
	public int updatePosting(Tour tour);

	/**
	 * 투어게시판 게시물 삭제 Service
	 * @param tourNo
	 * @return int
	 */
	public int deleteTour(int tourNo);

	/**
	 * 코멘트 삭제
	 * @param commentNo
	 * @return int
	 */
	public int deleteComment(int commentNo);
	
	/**
	 * 유저 번호로 투어상품 게시글 개수 찾기 
	 * @param userNo
	 * @return
	 */
	public int selectCountByUserNo(int userNo);
	

	/**
	 * 판매내역 리스트 불러오기 Service
	 * @return List<TourSell>
	 */
	public List<TourSell> selectTourSellList(int userNo);
}
