package com.semi.hitinerary.tour.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semi.hitinerary.comment.domain.Comment;
import com.semi.hitinerary.common.Pagination;
import com.semi.hitinerary.freeboard.domain.Freeboard;

import com.semi.hitinerary.tour.domain.Tour;
import com.semi.hitinerary.tour.domain.TourPay;
import com.semi.hitinerary.tour.domain.TourSell;
import com.semi.hitinerary.tour.store.TourStore;
import com.semi.hitinerary.user.domain.User;

@Repository
public class TourStoreLogic implements TourStore {

	@Override
	public List<Tour> selectTourList(SqlSession session, Pagination pi) {
		
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage -1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Tour> tList = session.selectList("TourMapper.selectTourList", null, rowBounds);
		return tList;
	}

	@Override
	public List<Tour> selectTourListByUserNo(SqlSession session, int userNo, Pagination pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowbounds = new RowBounds(offset, limit);
		List<Tour> tList = session.selectList("TourMapper.selectTourListByUserNo", userNo, rowbounds);
		return tList;
	}

	@Override
	public Tour selecOneByNo(SqlSession session, int tourNo) {
		Tour tour = session.selectOne("TourMapper.selectOne", tourNo);
		return tour;
	}

	@Override
	public int selectGetTotalCountByUserNo(SqlSession session, int userNo) {
		int totalCount = session.selectOne("TourMapper.selectGetTotalCountByUserNo", userNo);
		return totalCount;
	}

	@Override
	public List<Tour> selectListByuserNo(SqlSession session, int userNo, Pagination pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowbounds = new RowBounds(offset, limit);
		List<Tour> tList = session.selectList("TourMapper.selectListByuserNo", userNo, rowbounds);
		return tList;
	}

	@Override
	public List<Comment> selectAllComments(SqlSession session, int tourNo) {
		List<Comment> comments = session.selectList("commentMapper.selectAllTour", tourNo); 
		return comments;
	}

	@Override
	public User selectUserByNo(SqlSession session, int payUserNo) {
		User user = session.selectOne("UserMapper.selectPayUserbyNo", payUserNo);
		return user;
	}

	public int selectCurrCount(SqlSession session, int tourNo) {
		return session.selectOne("TourMapper.selectCurrentCount", tourNo);
	}

	@Override
	public int selectTotalCount(SqlSession session) {
		int totalCount = session.selectOne("TourMapper.getTotalCount");
		return totalCount;
	}

	@Override
	public int getSequence(SqlSession session) {
		
		return session.selectOne("TourMapper.getSequence");
	}

	@Override
	public int insertPosting(SqlSession session, Tour tour) {
		int result = session.insert("TourMapper.insertTour", tour);
		return result;
	}

	@Override
	public int insertComment(SqlSession session, Comment comment) {
		int result = session.insert("commentMapper.insertTour", comment);
		return result;
	}

	@Override
	public int insertPay(SqlSession session, TourPay tPay) {
		int result = session.insert("TourPayMapper.insertPay", tPay);
		return result;
	}

	@Override
	public int insertRereply(SqlSession session, Comment reReply) {
		int result = session.insert("commentMapper.insertReReply", reReply);
		return result;
	}

	@Override
	public int updateTour(SqlSession session, Tour tour) {
		int result = session.update("TourMapper.updateTour", tour);
		return result;
	}

	@Override
	public int deleteTour(SqlSession session, int tourNo) {
		int result = session.delete("TourMapper.deleteTour", tourNo);
		return result;
	}

	@Override
	public int deleteComment(SqlSession session, int commentNo) {
		int result = session.delete("commentMapper.deleteTourComment", commentNo);
		return result;
	}

	@Override
	public int selectCountByUserNo(SqlSession session, int userNo) {
		int totalCount = session.selectOne("TourMapper.selectCountByUserNo", userNo);
		return totalCount;
	}

	@Override
	public List<TourSell> selectTourSellList(SqlSession session, int userNo) {
		List<TourSell> tsList = session.selectList("TourSellMapper.selectTourSellList", userNo);
		return tsList;
	}

}
