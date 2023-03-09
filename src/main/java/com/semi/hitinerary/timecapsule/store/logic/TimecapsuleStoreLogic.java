package com.semi.hitinerary.timecapsule.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semi.hitinerary.timecapsule.domain.Timecapsule;
import com.semi.hitinerary.timecapsule.store.TimecapsuleStore;

@Repository
public class TimecapsuleStoreLogic implements TimecapsuleStore{

	@Override
	public int registGroup(Timecapsule timecapsule, SqlSession session) {
		int result = session.insert("capsuleMapper.registGroup", timecapsule);
		return result;
	}

}
