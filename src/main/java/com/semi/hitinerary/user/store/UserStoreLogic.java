package com.semi.hitinerary.user.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semi.hitinerary.report.domain.boardReport;
import com.semi.hitinerary.user.domain.TourBuyUser;
import com.semi.hitinerary.user.domain.User;

@Repository
public class UserStoreLogic implements UserStore{

	@Override
	public int insertUser(SqlSession session, User user) {
		int result = session.insert("UserMapper.insertUser", user);
		return result;
	}

	@Override
	public int insertCoUser(SqlSession session, User user) {
		int result = session.insert("UserMapper.insertCoUser", user);
		return result;
	}

	@Override
	public User Login(SqlSession session, User user) {
		User result = session.selectOne("UserMapper.Login", user);
		return result;
	}

	@Override
	public User selectOneByNo(SqlSession session, int userNo) {
		User user = session.selectOne("UserMapper.selectUserById", userNo);
		return user;
	}

	@Override
	public List<User> selectByGroupNo(SqlSession session, int groupNo) {
		List<User> uList = session.selectList("UserMapper.selectByGroupNo", groupNo);
		return uList;
	}

	@Override
	public int deleteBuyUser(SqlSession session, TourBuyUser tBUser) {
		int result = session.delete("UserMapper.deleteBuyUser", tBUser);
		return result;
	}

	// 전체회원 목록 조회
	@Override
	public List<User> selectAllUser(SqlSession session) {
		return session.selectList("UserMapper.selectAllUser");
	}

	// 기업회원 목록 조회
	@Override
	public List<User> selectSellerUser(SqlSession session) {
		return session.selectList("UserMapper.selectSellerUser");
	}

	@Override
	public int deleteUser(SqlSession session, int userNo) {
		return session.delete("UserMapper.deleteUser", userNo);
	}

	@Override
	public int updateSellerGarde(SqlSession session, User user) {
		return session.delete("UserMapper.updateSellerGarde", user);
	}

}
