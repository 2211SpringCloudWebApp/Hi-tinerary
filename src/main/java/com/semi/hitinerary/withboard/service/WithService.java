package com.semi.hitinerary.withboard.service;

import java.util.List;

import com.semi.hitinerary.common.Pagination;
import com.semi.hitinerary.withboard.domain.With;

public interface WithService {

	/**
	 * 동행찾기 글쓰기 등록 Service
	 * @param with
	 * @return int
	 */
	public int insertWithBoard(With with);

	/**
	 * 동행찾기 목록 조회 Service
	 * @param pi 
	 * @return List<With>
	 */
	public List<With> selectWithBoardList(Pagination pi);

	/**
	 * 동행찾기 상세 조회 Service
	 * @param boardNo
	 * @return With
	 */
	public With selectOneByNo(int boardNo);

	/**
	 * 동행찾기 수정 Service
	 * @param with
	 * @return int
	 */
	public int updateWithBoard(With with);

	/**
	 * 동행찾기 게시물 삭제 Service
	 * @param boardNo
	 * @return int
	 */
	public int deleteWithBoard(int boardNo);

	/**
	 * 시퀀스 넘버 조회 Service
	 * @return int
	 */
	public int getSequence();

	/**
	 * 동행찾기 게시물 개수 조회 Service
	 * @return
	 */
	public int selectWithBoardCount();

	
	/**
	 * 특정유저가 쓴 동행찾기 게시물 개수 조회
	 * @param userNo
	 * @return
	 */
	public int selectCountByUserNo(int userNo);
	
	/**
	 * 특정유저가 쓴 동행찾기 게시물 조회
	 * @param userNo
	 * @param pi
	 * @return
	 */
	public List<With> selectByUserNo(int userNo, Pagination pi);


	/**
	 * 동행찾기 현재 인원수 플러스 
	 * @param userNo
	 * @return int
	 */
	public int plusCommentPeople(int userNo);

}
