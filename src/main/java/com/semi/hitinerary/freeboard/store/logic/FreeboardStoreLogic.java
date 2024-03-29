package com.semi.hitinerary.freeboard.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semi.hitinerary.common.Pagination;
import com.semi.hitinerary.freeboard.domain.Freeboard;
import com.semi.hitinerary.freeboard.domain.PageInfo;
import com.semi.hitinerary.freeboard.domain.Search;
import com.semi.hitinerary.freeboard.store.FreeboardStore;
@Repository
public class FreeboardStoreLogic implements FreeboardStore{

	@Override
	public int insertFreeboard(SqlSession session, Freeboard freeboard) {
		return session.insert("freeboardMapper.insertFreeboard", freeboard);
	}
	
	@Override
	public int modifyFreeboard(SqlSession session, Freeboard freeboard) {
		return session.update("freeboardMapper.modifyFreeboard", freeboard);
	}
	
	// 게시글 수 확인하기
	@Override
	public int getListCount(SqlSession session, Search search) {
		return session.selectOne("freeboardMapper.getListCount", search);
	}

	@Override
	public Freeboard selectOneById(SqlSession session, int boardNo) {
		return session.selectOne("freeboardMapper.selectOne", boardNo);
	}

	@Override
	public int deleteFreeboard(SqlSession session, int boardNo) {
		return session.delete("freeboardMapper.deleteOne", boardNo);
	}
	
	@Override
	public String selectNickname(SqlSession session, int boardNo) {
		return session.selectOne("freeboardMapper.selectNickname", boardNo);
	}

	@Override
	public int getSearchListCount(SqlSession session, Search search) {
		return session.selectOne("freeboardMapper.getSearchListCount", search);
	}

	@Override
	public List<Freeboard> selectFreeboardList(SqlSession session, PageInfo pi, Search search) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Freeboard> searchList = session.selectList("freeboardMapper.selectFreeboardList", search, rowBounds);
		return searchList;
	}

	@Override
	public int getSequence(SqlSession session) {
		return session.selectOne("freeboardMapper.getSequence");
	}

	@Override
	public int updateFreeBoardCheck(SqlSession session, int freeBoardNo) {
		return session.update("freeboardMapper.updateFreeBoardCheck", freeBoardNo);
	}

	@Override
	public int selectCountByUserNo(SqlSession session, int userNo) {
		int totalCount = session.selectOne("freeboardMapper.selectCountByUserNo", userNo);
		return totalCount;
	}

	@Override
	public List<Freeboard> selectListByuserNo(SqlSession session, int userNo, Pagination pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowbounds = new RowBounds(offset, limit);
		List<Freeboard> fList = session.selectList("freeboardMapper.selectListByuserNo", userNo, rowbounds);
		return fList;
	}


}
