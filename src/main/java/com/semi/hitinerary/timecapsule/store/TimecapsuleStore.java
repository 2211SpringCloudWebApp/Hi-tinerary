package com.semi.hitinerary.timecapsule.store;

import org.apache.ibatis.session.SqlSession;

import com.semi.hitinerary.timecapsule.domain.Timecapsule;

public interface TimecapsuleStore {

	public int registGroup(Timecapsule timecapsule, SqlSession session);

}
