package com.semi.hitinerary.group.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.hitinerary.group.domain.Group;
import com.semi.hitinerary.group.service.GroupService;
import com.semi.hitinerary.group.store.GroupStore;
import com.semi.hitinerary.timecapsule.domain.Timecapsule;
import com.semi.hitinerary.user.domain.User;

@Service
public class GroupServiceImpl implements GroupService{
	
	@Autowired
	GroupStore gStore; 
	@Autowired
	SqlSession session;
	
	@Override
	public int createGroup(Group group) {
		int result = gStore.createGroup(session, group);
		return result;
	}

	@Override
	public List<Group> selectByUserNo(int userNo) {
		List<Group> gList = gStore.selectByUserNo(session, userNo);
		return gList;
	}


	@Override
	public Group SelectOneByUserNoRecent(int userNo) {
		Group group = gStore.SelectOneByUserNoRecent(session, userNo);
		return group;
	}
	

}
