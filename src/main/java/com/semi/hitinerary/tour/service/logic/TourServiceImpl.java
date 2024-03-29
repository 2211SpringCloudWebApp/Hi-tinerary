package com.semi.hitinerary.tour.service.logic;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.hitinerary.comment.domain.Comment;
import com.semi.hitinerary.common.Pagination;
import com.semi.hitinerary.freeboard.domain.Freeboard;

import com.semi.hitinerary.tour.domain.Tour;
import com.semi.hitinerary.tour.domain.TourPay;
import com.semi.hitinerary.tour.domain.TourSell;
import com.semi.hitinerary.tour.service.TourService;
import com.semi.hitinerary.tour.store.TourStore;
import com.semi.hitinerary.user.domain.User;

@Service
public class TourServiceImpl implements TourService {
	
	@Autowired
	private TourStore tStore;
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Tour> selectTourList(Pagination pi) {
		List<Tour> tList = tStore.selectTourList(session, pi);
		return tList;
	}

	@Override
	public List<Tour> selectListByuserNo(int userNo, Pagination pi) {
		List<Tour> tList = tStore.selectListByuserNo(session, userNo, pi);
		return tList;
	}

	@Override
	public Tour selectOneByNo(int tourNo) {
		Tour tour = tStore.selecOneByNo(session, tourNo);
		return tour;
	}

	@Override
	public User selectUserByNo(int payUserNo) {
		User user = tStore.selectUserByNo(session, payUserNo);
		return user;
	}

	@Override
	public int selectGetTotalCountByUserNo(int userNo) {
		int totalCount = tStore.selectGetTotalCountByUserNo(session, userNo);
		return totalCount;
	}

	@Override
	public List<Tour> selectTourListByUserNo(int userNo, Pagination pi) {
		List<Tour> tList = tStore.selectTourListByUserNo(session, userNo, pi);
		return tList;
	}

	@Override
	public List<Comment> selectAllComments(int tourNo) {
		List<Comment> comments = tStore.selectAllComments(session, tourNo);
		return comments;
	}

	public int selectCurrCount(int tourNo) {	
		return tStore.selectCurrCount(session, tourNo);
	}

	@Override
	public int getListCount() {
		int totalCount = tStore.selectTotalCount(session);
		return totalCount;
	}

	public int getSequence() {
		
		return tStore.getSequence(session);
	}

	@Override
	public int insertPosting(Tour tour) {
		int result = tStore.insertPosting(session, tour);
		return result;
	}

	@Override
	public int commentUp(Comment comment) {
		int result = tStore.insertComment(session, comment);
		return result;
	}

	@Override
	public int payTour(TourPay tPay) {
		int result = tStore.insertPay(session, tPay);
		return result;
	}

	@Override
	public int reReplyUp(Comment reReply) {
		int result = tStore.insertRereply(session, reReply);
		return result;
	}

	@Override
	public int updatePosting(Tour tour) {
		int result = tStore.updateTour(session, tour);
		return result;
	}

	@Override
	public int deleteTour(int tourNo) {
		int result = tStore.deleteTour(session, tourNo);
		return result;
	}

	@Override
	public int deleteComment(int commentNo) {
		int result = tStore.deleteComment(session, commentNo);
		return result;
	}

	@Override
	public int selectCountByUserNo(int userNo) {
		int totalCount = tStore.selectCountByUserNo(session, userNo);
		return totalCount;
	}

	@Override
	public List<TourSell> selectTourSellList(int userNo) {
		List<TourSell> tsList = tStore.selectTourSellList(session, userNo);
		return tsList;
	}

	

	
}
