package com.semi.hitinerary.user.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.hitinerary.user.domain.TourBuyUser;
import com.semi.hitinerary.user.domain.User;
import com.semi.hitinerary.user.store.UserStore;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserStore uStore;
	
	@Autowired
	SqlSession session;

	@Override
	public int insertUser(User user) {
		int result = uStore.insertUser(session, user);
		return result;
	}

	@Override
	public int insertCoUser(User user) {
		int result = uStore.insertCoUser(session, user);
		return result;
	}

	@Override
	public User Login(User user) {
		User result = uStore.Login(session, user);
		return result;
	}

	@Override
	public User selectOneByNo(int userNo) {
		User user = uStore.selectOneByNo(session, userNo);
		return user;
	}

	@Override
	public List<User> selectByGroupNo(int groupNo) {
		List<User> uList = uStore.selectByGroupNo(session, groupNo);
		return uList;
	}

	@Override
	public int deleteBuyUser(TourBuyUser tBUser) {
		int result = uStore.deleteBuyUser(session, tBUser);
		return result;
	}
	
	
}
