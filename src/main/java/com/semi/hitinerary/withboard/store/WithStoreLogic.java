package com.semi.hitinerary.withboard.store;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semi.hitinerary.withboard.domain.With;

@Repository
public class WithStoreLogic implements WithStore{

	/**
	 * 동행찾기 게시판 글쓰기 WithStoreLogic
	 */
	@Override
	public int insertWithBoard(SqlSession session, With with) {
		int result = session.insert("WithBoardMapper.insertWithBoard", with);
		return result;
	}

}
