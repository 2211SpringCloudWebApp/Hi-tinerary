package com.semi.hitinerary.withboard.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.semi.hitinerary.withboard.domain.With;

public interface WithStore {

	/**
	 * 동행찾기 게시판 등록 Store
	 * @param session
	 * @param with
	 * @return int
	 */
	int insertWithBoard(SqlSession session, With with);

	/**
	 * 동행찾기 게시판 목록 조회 Store
	 * @param session
	 * @return List<With>
	 */
	List<With> selectWithBoardList(SqlSession session);

}
