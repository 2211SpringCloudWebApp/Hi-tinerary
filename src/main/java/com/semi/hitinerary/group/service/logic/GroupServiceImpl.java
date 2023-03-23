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
	public Group SelectOneByGroupNo(int groupNo) {
		Group group = gStore.SelectOneByGroupNo(session, groupNo);
		return group;
	}

	@Override
	public int minusCurrentPeople(String groupNo) {
		int result = gStore.minusCurrentPeople(session, groupNo);
		return result;
	}

	/**
	 * 동행게시판 초대 버튼 눌렀을 때 그룹 리스트 GroupServiceImpl
	 */
	@Override
	public List<Group> listGroup(int userNo) {
		List<Group> gList = gStore.selectlistGroup(session, userNo);
		return gList;
	}

	/**
	 * 동행게시판 그룹 인원 추가 GroupServiceImpl
	 */
	@Override
	public int plusCommentPeople(int groupNo) {
		int result = gStore.plusCommentPeople(session, groupNo);
		return result;
	}

	@Override
	public int deleteGroup(int groupNo) {
		int result = gStore.deleteGroup(session, groupNo);
		return result;
	}
	

}
