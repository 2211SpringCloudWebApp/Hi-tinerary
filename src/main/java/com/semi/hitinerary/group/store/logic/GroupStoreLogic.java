package com.semi.hitinerary.group.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semi.hitinerary.group.store.GroupStore;
import com.semi.hitinerary.user.domain.User;

@Repository
public class GroupStoreLogic implements GroupStore {

	@Override
	public int selectUserById(String leaderUserId, SqlSession session) {
		int userNo = session.selectOne("UserMapper.selectUserById", leaderUserId);
		System.out.println(userNo);
		return userNo;
	}

	@Override
	public User selectUser(SqlSession session) {
		User user = session.selectOne("UserMapper.selectUser");
		return user;
	}

}
