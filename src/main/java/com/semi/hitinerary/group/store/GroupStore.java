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

	/**
	 * 동행게시판 초대 버튼 눌렀을 때 그룹 리스트 GroupStore
	 * @param session
	 * @param userNo
	 * @return List<Group>
	 */
	public List<Group> selectlistGroup(SqlSession session, int userNo);

	/**
	 * 동행게시판 그룹 인원 추가 GroupStore
	 * @param groupNo
	 * @return int
	 */
	public int plusCommentPeople(SqlSession session, int groupNo);

	public int deleteGroup(SqlSession session, int groupNo);
	

}
