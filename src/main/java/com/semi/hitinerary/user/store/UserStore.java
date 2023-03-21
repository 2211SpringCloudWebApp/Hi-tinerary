package com.semi.hitinerary.user.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.semi.hitinerary.report.domain.boardReport;
import com.semi.hitinerary.user.domain.TourBuyUser;
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
	
	/**
	 * 구매취소 Store
	 * @param tBUser
	 * @return int
	 */
	public int deleteBuyUser(SqlSession session, TourBuyUser tBUser);
	
	/**
	 * 유저 정보 변경
	 * @param session
	 * @param user
	 * @return
	 */
	public int updateUserByNo(SqlSession session, User user);

	/**
	 * 일반회원 목록 조회 Store
	 * @param session
	 * @return
	 */
	public List<User> selectAllUser(SqlSession session);
	
	/**
	 * 기업회원 목록 조회 Store
	 * @param session
	 * @return
	 */
	public List<User> selectSellerUser(SqlSession session);

	/**
	 * 유저 탈퇴 Store
	 * @param session
	 * @param userNo
	 * @return int
	 */
	public int deleteUser(SqlSession session, int userNo);

	/**
	 * 기업회원 권한부여 Store
	 * @param session
	 * @param userNo
	 * @return ints
	 */
	public int updateSellerGarde(SqlSession session, User user);

	


}
