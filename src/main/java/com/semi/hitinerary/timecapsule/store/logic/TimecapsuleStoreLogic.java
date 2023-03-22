package com.semi.hitinerary.timecapsule.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.semi.hitinerary.timecapsule.domain.Timecapsule;
import com.semi.hitinerary.timecapsule.store.TimecapsuleStore;
import com.semi.hitinerary.user.domain.User;

@Repository
public class TimecapsuleStoreLogic implements TimecapsuleStore{

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int registGroup(Timecapsule timecapsule, SqlSession session) {
		int result = session.insert("capsuleMapper.registGroup", timecapsule);
		return result;
	}

	@Override
	public int deleteGroupUser(SqlSession session, String groupNoUserNo) {
		int result = session.delete("capsuleMapper.deleteGroupUser", groupNoUserNo);
		return result;
	}


}
