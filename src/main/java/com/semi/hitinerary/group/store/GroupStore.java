package com.semi.hitinerary.group.store;

import org.apache.ibatis.session.SqlSession;

import com.semi.hitinerary.user.domain.User;

public interface GroupStore {

	public int selectUserById(String leaderUserId, SqlSession session);

	public User selectUser(SqlSession session);

}
