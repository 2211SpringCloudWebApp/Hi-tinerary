package com.semi.hitinerary.tour.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semi.hitinerary.tour.domain.Tour;
import com.semi.hitinerary.tour.domain.TourPay;
import com.semi.hitinerary.user.domain.User;

@Repository
public class TourStoreLogic implements TourStore {

	@Override
	public int insertPosting(SqlSession session, Tour tour) {
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
	public User selectUserByNo(SqlSession session, int payUserNo) {
		User user = session.selectOne("UserMapper.selectPayUserbyNo", payUserNo);
		return user;
	}

	@Override
	public int deleteTour(SqlSession session, int tourNo) {
		int result = session.delete("TourMapper.deleteTour", tourNo);
		return result;
	}

	@Override
	public int updateTour(SqlSession session, Tour tour) {
		int result = session.update("TourMapper.updateTour", tour);
		return result;
	}

	@Override
	public int insertPay(SqlSession session, TourPay tPay) {
		int result = session.insert("TourPayMapper.insertPay", tPay);
		return result;
	}

	@Override
	public int selectTotalCount(SqlSession session) {
		int totalCount = session.selectOne("TourMapper.getTotalCount");
		return totalCount;
	}

	@Override
	public List<Tour> selectTourListByUserNo(SqlSession session, int userNo) {
		List<Tour> tList = session.selectList("TourMapper.selectTourListByUserNo", userNo);
		return tList;
	}

}
