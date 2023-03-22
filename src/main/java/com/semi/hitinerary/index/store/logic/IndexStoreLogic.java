package com.semi.hitinerary.index.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.semi.hitinerary.freeboard.domain.Freeboard;
import com.semi.hitinerary.index.store.IndexStore;
import com.semi.hitinerary.tour.domain.Tour;
import com.semi.hitinerary.withboard.domain.With;
@Repository
public class IndexStoreLogic implements IndexStore{

	@Override
	public List<Tour> selectTourList(SqlSession session) {
		List<Tour> iTourList = session.selectList("TourMapper.selectTourList");
		return iTourList;
	}

	@Override
	public List<Freeboard> selectFreeList(SqlSession session) {
		List<Freeboard> fList = session.selectList("freeboardMapper.selectFreeboardList");
		return fList;
	}

	@Override
	public List<With> selectWithList(SqlSession session) {
		List<With> wList = session.selectList("WithBoardMapper.selectWithBoardList");
		return wList;
	}
	
	

}
