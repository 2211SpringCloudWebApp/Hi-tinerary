package com.semi.hitinerary.user.service;

import java.util.List;

import com.semi.hitinerary.report.domain.boardReport;
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
	 * 일반회원 목록 조회
	 * @return
	 */
	public List<User> selectAllUser();
	
	/**
	 * 기업회원 목록 조회
	 * @return
	 */
	public List<User> selectSellerUser();

	/**
	 * 회원탈퇴 Service
	 * @param userNo
	 * @return int
	 */
	public int deleteUser(int userNo);

	/**
	 * 기업회원 권한부여 Service
	 * @param userNo
	 * @return
	 */
	public int updateSellerGarde(User user);

	
}
