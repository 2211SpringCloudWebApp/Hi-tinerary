package com.semi.hitinerary.user.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.hitinerary.user.domain.User;
import com.semi.hitinerary.user.store.UserStore;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserStore uStore;
	
	@Autowired
	SqlSession session;

	@Override
	public User selectOneByNo(int userNo) {
		User user = uStore.selectOneByNo(session, userNo);
		return user;
	}

	@Override
	public User Login(User user) {
		User result = uStore.Login(session, user);
		return result;
	}
	
	
}
