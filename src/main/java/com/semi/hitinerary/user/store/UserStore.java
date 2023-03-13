package com.semi.hitinerary.user.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.semi.hitinerary.user.domain.User;

public interface UserStore {

	public User selectOneByNo(SqlSession session, int userNo);
	
	/**
	 * 유저 로그인 Store
	 * @param session
	 * @param user
	 * @return User
	 */
	public User Login(SqlSession session, User user);

	public List<User> selectByGroupNo(SqlSession session, int groupNo);

}
