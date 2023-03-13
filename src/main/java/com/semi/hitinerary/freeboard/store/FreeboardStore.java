package com.semi.hitinerary.freeboard.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.semi.hitinerary.freeboard.domain.Freeboard;
import com.semi.hitinerary.freeboard.domain.PageInfo;
import com.semi.hitinerary.freeboard.domain.Search;

public interface FreeboardStore {

	/**
	 * 게시글 등록 Store
	 * @param session
	 * @param freeboard
	 * @return int
	 */
	public int insertFreeboard(SqlSession session, Freeboard freeboard);

	/**
	 * 게시글 전체수 Store
	 * @param session
	 * @return int
	 */
	public int getListCount(SqlSession session);

	/**
	 * 게시글 수 Store
	 * @param session
	 * @param pi
	 * @return
	 */
	public List<Freeboard> selectFreeboardList(SqlSession session, PageInfo pi, Search search);

	/**
	 * 게시글 상세 조회 Store
	 * @param session
	 * @param boardNo
	 * @return
	 */
	public Freeboard selectOneById(SqlSession session, int boardNo);

	/**
	 * 게시글 삭제 Store
	 * @param session
	 * @param boardNo
	 * @return int
	 */
	public int deleteFreeboard(SqlSession session, int boardNo);

	/**
	 * 게시글 검색 수 Store
	 * @param session
	 * @param search
	 * @return
	 */
	public int getSearchListCount(SqlSession session, Search search);

	/**
	 * 게시글 검색 목록 조회 Store
	 * @param session
	 * @param pi
	 * @param search
	 * @return
	 */
	public List<Freeboard> selectListByKeyword(SqlSession session, PageInfo pi, Search search);

}
