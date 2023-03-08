package com.semi.hitinerary.group.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.hitinerary.group.service.GroupService;
import com.semi.hitinerary.group.store.GroupStore;
import com.semi.hitinerary.user.domain.User;

@Service
public class GroupServiceImpl implements GroupService{
	
	@Autowired
	GroupStore gStore; 
	@Autowired
	SqlSession session;
	
	@Override
	public int selectUserById(String leaderUserId) {
		int userNo = gStore.selectUserById(leaderUserId, session);
		return userNo;
	}

	@Override
	public User selectUser() {
		User user = gStore.selectUser(session);
		return user;
	}

}
