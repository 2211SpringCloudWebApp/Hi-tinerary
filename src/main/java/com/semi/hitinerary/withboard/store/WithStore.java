package com.semi.hitinerary.withboard.store;

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

}
