package com.semi.hitinerary.timecapsule.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.semi.hitinerary.timecapsule.domain.Timecapsule;
import com.semi.hitinerary.user.domain.User;

public interface TimecapsuleStore {

	public int registGroup(Timecapsule timecapsule, SqlSession session);

	public int deleteGroupUser(SqlSession session, String groupNoUserNo);



}
