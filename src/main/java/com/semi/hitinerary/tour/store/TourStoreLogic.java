package com.semi.hitinerary.tour.store;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semi.hitinerary.tour.domain.Tour;

@Repository
public class TourStoreLogic implements TourStore {

	@Override
	public int insertPosting(SqlSession session, Tour tour) {
		// TODO Auto-generated method stub
		int result = session.insert("TourMapper.insertTour", tour);
		return result;
	}

}
