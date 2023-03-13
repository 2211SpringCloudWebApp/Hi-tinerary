package com.semi.hitinerary.user.service;

import java.util.List;

import com.semi.hitinerary.user.domain.User;

public interface UserService {

	public User selectOneByNo(int userNo);

	/**
	 * 유저 로그인 Service
	 * @param user
	 * @return User
	 */
	public User Login(User user);

	public List<User> selectByGroupNo(int groupNo);
	
}
