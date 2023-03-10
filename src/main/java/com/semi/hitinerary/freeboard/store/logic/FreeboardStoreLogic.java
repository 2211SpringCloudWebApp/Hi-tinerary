package com.semi.hitinerary.freeboard.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semi.hitinerary.freeboard.domain.Freeboard;
import com.semi.hitinerary.freeboard.domain.PageInfo;
import com.semi.hitinerary.freeboard.store.FreeboardStore;
@Repository
public class FreeboardStoreLogic implements FreeboardStore{

	@Override
	public int insertFreeboard(SqlSession session, Freeboard freeboard) {
		return session.insert("freeboardMapper.insertFreeboard", freeboard);
	}

	@Override
	public int getListCount(SqlSession session) {
		return session.selectOne("freeboardMapper.getListCount");
	}

	@Override
	public List<Freeboard> selectFreeboardList(SqlSession session, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Freeboard> fList = session.selectList("freeboardMapper.selectFreeboardList", null, rowBounds);
		return fList;
	}

	@Override
	public Freeboard selectOneById(SqlSession session, int boardNo) {
		return session.selectOne("freeboardMapper.selectOne", boardNo);
	}

	@Override
	public int deleteFreeboard(SqlSession session, int boardNo) {
		return session.delete("freeboardMapper.deleteOne", boardNo);
	}

}
