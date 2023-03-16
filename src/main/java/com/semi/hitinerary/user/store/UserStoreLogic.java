package com.semi.hitinerary.user.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semi.hitinerary.user.domain.User;

@Repository
public class UserStoreLogic implements UserStore{

	@Override
	public int insertUser(SqlSession session, User user) {
		int result = session.insert("UserMapper.insertUser", user);
		return result;
	}

	@Override
	public int insertCoUser(SqlSession session, User user) {
		int result = session.insert("UserMapper.insertCoUser", user);
		return result;
	}

	@Override
	public User Login(SqlSession session, User user) {
		User result = session.selectOne("UserMapper.Login", user);
		return result;
	}

	@Override
	public User selectOneByNo(SqlSession session, int userNo) {
		User user = session.selectOne("UserMapper.selectUserById", userNo);
		return user;
	}

	@Override
	public List<User> selectByGroupNo(SqlSession session, int groupNo) {
		List<User> uList = session.selectList("UserMapper.selectByGroupNo", groupNo);
		return uList;
	}

}
