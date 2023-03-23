package com.semi.hitinerary.group.service;

import java.util.List;

import com.semi.hitinerary.group.domain.Group;
import com.semi.hitinerary.timecapsule.domain.Timecapsule;

public interface GroupService {

	public int createGroup(Group group);


	public Group SelectOneByGroupNo(int groupNo);


	public List<Group> selectByUserNo(int userNo);


	public int minusCurrentPeople(String groupNo);

	/**
	 * 동행게시판 초대 버튼 눌렀을 때 그룹 리스트 Service
	 * @param userNo
	 * @return List<Group>
	 */
	public List<Group> listGroup(int userNo);

	/**
	 * 동행게시판 그룹 인원 추가 Service
	 * @param groupNo
	 */
	public int plusCommentPeople(int groupNo);


	public int deleteGroup(int groupNo);



}
