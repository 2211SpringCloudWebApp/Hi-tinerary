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

	@Override
	public int insertTimeCapsule(SqlSession session, Timecapsule timecapsule) {
		int result = session.update("capsuleMapper.insertTimeCapsule", timecapsule);
		return result;
	}

	@Override
	public Timecapsule SelectOneByIden(SqlSession session, Timecapsule timecapsule) {
		timecapsule = session.selectOne("capsuleMapper.SelectOneByIden", timecapsule);
		return timecapsule;
	}

	@Override
	public int selectGetCountCapsule(SqlSession session, int groupNo) {
		int capsuleAmount = session.selectOne("capsuleMapper.selectGetCountCapsule", groupNo);
		return capsuleAmount;
	}

	@Override
	public List<Timecapsule> selectListByGroupNo(SqlSession session, int groupNo) {
		List<Timecapsule> tList = session.selectList("capsuleMapper.selectListByGroupNo", groupNo);
		return tList;
	}


}
