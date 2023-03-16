package com.semi.hitinerary.user.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.semi.hitinerary.user.domain.User;

public interface UserStore {
	
	/**
	 * 일반회원가입 Store
	 * @param session
	 * @param user
	 * @return int
	 */
	public int insertUser(SqlSession session, User user);

	/**
	 * 기업회원가입 Store
	 * @param session
	 * @param user
	 * @return int
	 */
	public int insertCoUser(SqlSession session, User user);

	/**
	 * 유저 로그인 Store
	 * @param session
	 * @param user
	 * @return User
	 */
	public User Login(SqlSession session, User user);

	public User selectOneByNo(SqlSession session, int userNo);

	public List<User> selectByGroupNo(SqlSession session, int groupNo);

}
