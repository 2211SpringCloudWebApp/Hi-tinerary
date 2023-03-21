package com.semi.hitinerary.user.service;

import java.util.List;

import com.semi.hitinerary.user.domain.TourBuyUser;
import com.semi.hitinerary.user.domain.User;

public interface UserService {
	
	/**
	 * 일반회원가입 Service
	 * @param user
	 * @return int
	 */
	public int insertUser(User user);

	/**
	 * 기업회원가입 Service
	 * @param user
	 * @return int
	 */
	public int insertCoUser(User user);

	/**
	 * 유저 로그인 Service
	 * @param user
	 * @return User
	 */
	public User Login(User user);

	public User selectOneByNo(int userNo);

	public List<User> selectByGroupNo(int groupNo);
	
	/**
	 * 패키지 구매 제거
	 * @param tBUser
	 * @return int
	 */
	public int deleteBuyUser(TourBuyUser tBUser);
	
	/**
	 * 유저 정보 수정
	 * @param user
	 * @return 
	 */
	public int updateUserByNo(User user);
	
}
