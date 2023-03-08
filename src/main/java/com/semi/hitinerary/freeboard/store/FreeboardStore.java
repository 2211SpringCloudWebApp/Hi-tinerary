package com.semi.hitinerary.freeboard.store;

import org.apache.ibatis.session.SqlSession;

import com.semi.hitinerary.freeboard.domain.Freeboard;

public interface FreeboardStore {

	/**
	 * 게시글 등록 Store
	 * @param session
	 * @param freeboard
	 * @return int
	 */
	int insertFreeboard(SqlSession session, Freeboard freeboard);

}
