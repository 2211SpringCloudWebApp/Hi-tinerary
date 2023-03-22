package com.semi.hitinerary.withboard.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.semi.hitinerary.common.Pagination;
import com.semi.hitinerary.freeboard.domain.PageInfo;
import com.semi.hitinerary.freeboard.domain.Search;
import com.semi.hitinerary.withboard.domain.With;

public interface WithStore {

	/**
	 * 동행찾기 게시판 등록 Store
	 * @param session
	 * @param with
	 * @return int
	 */
	public int insertWithBoard(SqlSession session, With with);

	/**
	 * 동행찾기 게시판 목록 조회 Store
	 * @param session
	 * @param pi 
	 * @return List<With>
	 */
	public List<With> selectWithBoardList(SqlSession session, Pagination pi);

	/**
	 * 동행찾기 게시판 상세조회 Store
	 * @param session
	 * @param boardNo
	 * @return With
	 */
	public With selectOneByNo(SqlSession session, int boardNo);

	/**
	 * 동행찾기 게시판 수정하기 Store
	 * @param session
	 * @param with
	 * @return int
	 */
	public int updateWithBoard(SqlSession session, With with);

	/**
	 * 동행찾기 게시판 삭제하기 Store
	 * @param session
	 * @param boardNo
	 * @return int
	 */
	public int deleteWithBoard(SqlSession session, int boardNo);

	/**
	 * 시퀀스 넘버 조회 Store
	 * @param session
	 * @return int
	 */
	public int getSequence(SqlSession session);

	/**
	 * 동행찾기 게시물 개수 조회 Store
	 * @return
	 */
	public int selectWithBoardCount(SqlSession session);
	
	/**
	 * 특정유저가 쓴 동행찾기 게시물 개수 조회
	 * @param session
	 * @param userNo
	 * @return
	 */
	public int selectCountByUserNo(SqlSession session, int userNo);
	
	/**
	 * 특정유저가 쓴 동행찾기 게시물 개수 조회
	 * @param session
	 * @param userNo
	 * @param pi
	 * @return
	 */
	public List<With> selectByUserNo(SqlSession session, int userNo, Pagination pi);

	/**
	 * 동행찾기 게시판 현재 인원수 플러스 Store
	 * @param session
	 * @param userNo
	 * @return int
	 */
	public int plusCommentPeople(SqlSession session, int userNo);

}
