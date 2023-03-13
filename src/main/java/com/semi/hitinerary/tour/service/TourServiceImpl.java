package com.semi.hitinerary.tour.service;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.hitinerary.tour.domain.Tour;
import com.semi.hitinerary.tour.store.TourStore;

@Service
public class TourServiceImpl implements TourService {
	
	@Autowired
	private TourStore tStore;
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertPosting(Tour tour) {
		int result = tStore.insertPosting(session, tour);
		return result;
	}

	
}
