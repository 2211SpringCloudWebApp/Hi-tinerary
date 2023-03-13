package com.semi.hitinerary.group.service;

import java.util.List;

import com.semi.hitinerary.group.domain.Group;
import com.semi.hitinerary.timecapsule.domain.Timecapsule;

public interface GroupService {

	public int createGroup(Group group);


	public Group SelectOneByUserNoRecent(int userNo);


	public List<Group> selectByUserNo(int userNo);


	public int minusCurrentPeople(String groupNo);



}
