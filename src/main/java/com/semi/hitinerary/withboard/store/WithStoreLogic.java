package com.semi.hitinerary.withboard.store;

import java.util.List;

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

	/**
	 * 동행찾기 게시판 목록 조회 WithStoreLogic
	 */
	@Override
	public List<With> selectWithBoardList(SqlSession session) {
		List<With> wList = session.selectList("WithBoardMapper.selectWithBoardList");
		return wList;
	}

	/**
	 * 동행찾기 게시판 상세조회 WithStoreLogic
	 */
	@Override
	public With selectOneById(SqlSession session, int boardNo) {
		With with = session.selectOne("WithBoardMapper.selectOneById", boardNo);
		return with;
	}

}
