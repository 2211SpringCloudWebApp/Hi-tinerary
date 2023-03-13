package com.semi.hitinerary.tour.store;

import java.util.List;

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

	@Override
	public List<Tour> selectTourList(SqlSession session) {
		List<Tour> tList = session.selectList("TourMapper.selectTourList");
		return tList;
	}

	@Override
	public Tour selecOneByNo(SqlSession session, int tourNo) {
		Tour tour = session.selectOne("TourMapper.selectOne", tourNo);
		return tour;
	}

	@Override
	public int deleteTour(SqlSession session, int tourNo) {
		int result = session.delete("TourMapper.deleteTour", tourNo);
		return result;
	}

}
