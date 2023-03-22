package com.semi.hitinerary.group.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.semi.hitinerary.group.domain.Group;
import com.semi.hitinerary.group.store.GroupStore;
import com.semi.hitinerary.timecapsule.domain.Timecapsule;
import com.semi.hitinerary.user.domain.User;

@Repository
public class GroupStoreLogic implements GroupStore {

	@Override
	public int createGroup(SqlSession session, Group group) {
		int result = session.insert("groupMapper.createGroup", group);
		if(result > 0) {
			return group.getGroupNo();
		}
		return 0;
	}

	@Override
	public List<Group> selectByUserNo(SqlSession session, int userNo) {
		List<Group> gList = session.selectList("groupMapper.selectByUserNo", userNo);
		return gList;
	}

	@Override
	public Group SelectOneByGroupNo(SqlSession session, int groupNo) {
		Group group = session.selectOne("groupMapper.SelectOneByGroupNo", groupNo);
		return group;
	}

	@Override
	public int minusCurrentPeople(SqlSession session, String groupNo) {
		int result = session.update("groupMapper.minusCurrentPeople", groupNo);
		return result;
	}

	/**
	 * 동행게시판 초대 버튼 눌렀을 때 그룹 리스트 GroupStoreLogic
	 */
	@Override
	public List<Group> selectlistGroup(SqlSession session, int userNo) {
		List<Group> gList = session.selectList("groupMapper.selectlistGroup",userNo);
		return gList;
	}

	/**
	 * 동행게시판 그룹 인원 추가 GroupStoreLogic
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int plusCommentPeople(SqlSession session, int groupNo) {
		int result = session.update("groupMapper.plusCommentPeople", groupNo);
		return result;
	}


}
