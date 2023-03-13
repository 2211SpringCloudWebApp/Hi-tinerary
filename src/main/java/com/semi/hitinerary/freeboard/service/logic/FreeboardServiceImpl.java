package com.semi.hitinerary.freeboard.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.hitinerary.freeboard.domain.Freeboard;
import com.semi.hitinerary.freeboard.domain.PageInfo;
import com.semi.hitinerary.freeboard.domain.Search;
import com.semi.hitinerary.freeboard.service.FreeboardService;
import com.semi.hitinerary.freeboard.store.FreeboardStore;
@Service
public class FreeboardServiceImpl implements FreeboardService{
	
	@Autowired
	private FreeboardStore fStore;
	@Autowired
	private SqlSession session;
	
	
	@Override
	public int insertFreeboard(Freeboard freeboard) {
		return fStore.insertFreeboard(session, freeboard);
	}


	@Override
	public int getListCount() {
		return fStore.getListCount(session);
	}


	@Override
	public List<Freeboard> selectFreeboardList(PageInfo pi, Search search) {
		return fStore.selectFreeboardList(session, pi, search);
	}


	@Override
	public Freeboard selectOneById(int boardNo) {
		return fStore.selectOneById(session, boardNo);
	}


	@Override
	public int deleteFreeboard(int boardNo) {
		return fStore.deleteFreeboard(session, boardNo);
	}


	@Override
	public int getSearchListCount(Search search) {
		return fStore.getSearchListCount(session, search);
	}


	@Override
	public List<Freeboard> selectListByKeyword(PageInfo pi, Search search) {
		return fStore.selectListByKeyword(session, pi, search);
	}

}
