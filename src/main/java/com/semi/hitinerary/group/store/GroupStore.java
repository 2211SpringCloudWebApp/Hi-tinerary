package com.semi.hitinerary.group.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.semi.hitinerary.group.domain.Group;
import com.semi.hitinerary.timecapsule.domain.Timecapsule;

public interface GroupStore {

	public int createGroup(SqlSession session, Group group);

	public List<Group> selectByUserNo(SqlSession session, int userNo);

	public Group SelectOneByGroupNo(SqlSession session, int groupNo);

	public int minusCurrentPeople(SqlSession session, String groupNo);
	

}
