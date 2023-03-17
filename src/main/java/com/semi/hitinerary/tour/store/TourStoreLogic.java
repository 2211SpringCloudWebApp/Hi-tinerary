package com.semi.hitinerary.tour.store;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semi.hitinerary.comment.domain.Comment;
import com.semi.hitinerary.tour.domain.PageInfo;
import com.semi.hitinerary.tour.domain.Tour;
import com.semi.hitinerary.tour.domain.TourPay;
import com.semi.hitinerary.user.domain.User;

@Repository
public class TourStoreLogic implements TourStore {

	@Override
	public List<Tour> selectTourList(SqlSession session, PageInfo pi) {
		
		int limit = pi.getPostingLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage -1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Tour> tList = session.selectList("TourMapper.selectTourList", null, rowBounds);
		return tList;
	}

	@Override
	public int selectTotalCount(SqlSession session) {
		int totalCount = session.selectOne("TourMapper.getTotalCount");
		return totalCount;
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
	public int insertPosting(SqlSession session, Tour tour) {
		int result = session.insert("TourMapper.insertTour", tour);
		return result;
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
	public int getSequence(SqlSession session) {
		
		return session.selectOne("TourMapper.getSequence");
	}

	@Override
	public int insertComment(SqlSession session, Comment comment) {
		int result = session.insert("commentMapper.insertTour", comment);
		return result;
	}

	@Override
	public List<Comment> selectAllComments(SqlSession session, int tourNo) {
		List<Comment> comments = session.selectList("commentMapper.selectAllTour", tourNo); 
		return comments;
	}

	@Override
	public int insertRereply(SqlSession session, Comment reReply) {
		int result = session.insert("commentMapper.insertReReply", reReply);
		return result;
	}

	@Override
	public List<Tour> selectTourListByUserNo(SqlSession session, int userNo) {
		List<Tour> tList = session.selectList("TourMapper.selectTourListByUserNo", userNo);
		return tList;
	}

}
