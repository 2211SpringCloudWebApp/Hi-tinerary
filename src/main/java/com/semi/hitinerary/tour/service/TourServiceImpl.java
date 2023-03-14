package com.semi.hitinerary.tour.service;


import java.util.List;

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
	public List<Tour> selectTourList() {
		List<Tour> tList = tStore.selectTourList(session);
		return tList;
	}

	@Override
	public Tour selectOneByNo(int tourNo) {
		Tour tour = tStore.selecOneByNo(session, tourNo);
		return tour;
	}

	@Override
	public int insertPosting(Tour tour) {
		int result = tStore.insertPosting(session, tour);
		return result;
	}

	@Override
	public int deleteTour(int tourNo) {
		int result = tStore.deleteTour(session, tourNo);
		return result;
	}

	@Override
	public int updatePosting(Tour tour) {
		int result = tStore.updateTour(session, tour);
		return result;
	}

	
}
