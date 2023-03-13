package com.semi.hitinerary.groupboard.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.hitinerary.groupboard.domain.Groupboard;
import com.semi.hitinerary.groupboard.domain.PagiInfoGroupBoard;
import com.semi.hitinerary.groupboard.store.GroupboardStore;

@Service
public class GroupboardServiceImpl implements GroupboardService{
	
	@Autowired
	GroupboardStore gBStore;
	
	@Autowired
	SqlSession session;

	@Override
	public int insertBoard(Groupboard gBoard) {
		int result = gBStore.insertBoard(session, gBoard);
		return result;
	}

	@Override
	public List<Groupboard> selectListBoardByGroupNo(PagiInfoGroupBoard piInfo) {
		List<Groupboard> gBList = gBStore.selectListBoardByGroupNo(session, piInfo);
		return gBList;
	}

	@Override
	public int selectTotalCount(int groupNo) {
		int result = gBStore.selectTotalCount(session, groupNo);
		return result;
	}
	

}
