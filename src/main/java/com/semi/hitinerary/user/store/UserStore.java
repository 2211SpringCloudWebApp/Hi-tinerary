package com.semi.hitinerary.user.store;

import org.apache.ibatis.session.SqlSession;

import com.semi.hitinerary.user.domain.User;

public interface UserStore {

	public User selectOneByNo(SqlSession session, int userNo);

}
