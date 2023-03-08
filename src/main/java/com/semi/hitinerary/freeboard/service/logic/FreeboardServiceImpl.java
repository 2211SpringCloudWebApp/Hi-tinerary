package com.semi.hitinerary.freeboard.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.hitinerary.freeboard.domain.Freeboard;
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

}
