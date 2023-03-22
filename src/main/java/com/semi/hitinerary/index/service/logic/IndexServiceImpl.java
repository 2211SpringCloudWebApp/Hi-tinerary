package com.semi.hitinerary.index.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.hitinerary.freeboard.domain.Freeboard;
import com.semi.hitinerary.index.service.IndexService;
import com.semi.hitinerary.index.store.IndexStore;
import com.semi.hitinerary.tour.domain.Tour;
import com.semi.hitinerary.withboard.domain.With;

@Service
public class IndexServiceImpl implements IndexService{
	
	@Autowired
	private IndexStore iStore;
	@Autowired
	private SqlSession session;

	@Override
	public List<Tour> selectTourList() {
		List<Tour> tList = iStore.selectTourList(session);
		return tList;
	}

	@Override
	public List<Freeboard> selectFreeList() {
		List<Freeboard> fList = iStore.selectFreeList(session);
		return fList;
	}

	@Override
	public List<With> selectWithList() {
		List<With> wList = iStore.selectWithList(session);
		return wList;
	}

}
