package com.semi.hitinerary.withboard.store;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semi.hitinerary.common.Pagination;
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
	public List<With> selectWithBoardList(SqlSession session, Pagination pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<With> wList = session.selectList("WithBoardMapper.selectWithBoardList", null, rowBounds );
		return wList;
	}

	/**
	 * 동행찾기 게시판 상세조회 WithStoreLogic
	 */
	@Override
	public With selectOneByNo(SqlSession session, int boardNo) {
		With with = session.selectOne("WithBoardMapper.selectOneByNo", boardNo);
		return with;
	}

	/**
	 * 동행찾기 게시판 수정하기 WithStoreLogic
	 */
	@Override
	public int updateWithBoard(SqlSession session, With with) {
		int result = session.update("WithBoardMapper.updateWithBoard", with);
		return result;
	}

	/**
	 * 동행찾기 게시판 삭제하기 WithStoreLogic
	 */
	@Override
	public int deleteWithBoard(SqlSession session, int boardNo) {
		int result = session.delete("WithBoardMapper.deleteWithBoard", boardNo);
		return result;
	}

	/**
	 * 시퀀스 넘버 조회 WithStoreLogic
	 */
	@Override
	public int getSequence(SqlSession session) {
		return session.selectOne("WithBoardMapper.getSequence");
	}

	@Override
	public int selectWithBoardCount(SqlSession session) {
		int totalCount = session.selectOne("WithBoardMapper.selectWithBoardCount");
		return totalCount;
	}

}
