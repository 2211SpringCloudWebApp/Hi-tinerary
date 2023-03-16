package com.semi.hitinerary.groupboard.store;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semi.hitinerary.common.Pagination;
import com.semi.hitinerary.groupboard.domain.Groupboard;
import com.semi.hitinerary.groupboard.domain.PagiInfoGroupBoard;

@Repository
public class GroupboardStoreLogic implements GroupboardStore {

	@Override
	public int insertBoard(SqlSession session, Groupboard gBoard) {
		int result = session.insert("groupBoardMapper.insertBoard", gBoard);
		return result;
	}

	@Override
	public List<Groupboard> selectListBoardByGroupNo(SqlSession session, PagiInfoGroupBoard piInfo) {
		Pagination pi = piInfo.getPi();
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getBoardLimit());
		int groupNo = piInfo.getGroupNo();
		List<Groupboard> gBList = session.selectList("groupBoardMapper.selectListBoardByGroupNo", groupNo, rowbounds);
		return gBList;
	}

	@Override
	public int selectTotalCount(SqlSession session, int groupNo) {
		int result = session.selectOne("groupBoardMapper.selectTotalCount", groupNo);
		return result;
	}

	@Override
	public int deleteBoard(SqlSession session, String boardNo) {
		int result = session.delete("groupBoardMapper.deleteBoard", boardNo);
		return result;
	}

	@Override
	public Groupboard selectOneGroupBoard(SqlSession session, int groupBoardNo) {
		Groupboard gBoard = session.selectOne("groupBoardMapper.selectOneGroupBoard", groupBoardNo);
		return gBoard;
	}


	@Override
	public int updateGroupBoard(SqlSession session, Groupboard board) {
		int result = session.update("groupBoardMapper.updateGroupBoard", board);
		return result;
	}



}
