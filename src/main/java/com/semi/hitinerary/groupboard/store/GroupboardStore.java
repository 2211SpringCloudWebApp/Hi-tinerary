package com.semi.hitinerary.groupboard.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.semi.hitinerary.groupboard.domain.Groupboard;
import com.semi.hitinerary.groupboard.domain.PagiInfoGroupBoard;

public interface GroupboardStore {

	public int insertBoard(SqlSession session, Groupboard gBoard);

	public List<Groupboard> selectListBoardByGroupNo(SqlSession session, PagiInfoGroupBoard piInfo);

	public int selectTotalCount(SqlSession session, int groupNo);


}
