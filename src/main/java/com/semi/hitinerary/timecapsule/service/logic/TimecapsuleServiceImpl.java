package com.semi.hitinerary.timecapsule.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.semi.hitinerary.group.service.GroupService;
import com.semi.hitinerary.timecapsule.domain.Timecapsule;
import com.semi.hitinerary.timecapsule.service.TimecapsuleService;
import com.semi.hitinerary.timecapsule.store.TimecapsuleStore;
import com.semi.hitinerary.user.domain.User;
import com.semi.hitinerary.withboard.service.WithService;

@Service
public class TimecapsuleServiceImpl implements TimecapsuleService {
	
	@Autowired
	SqlSession session;
	
	@Autowired
	TimecapsuleStore tStore;
	
	@Autowired
	private GroupService gService;
	
	@Autowired
	private WithService wService;
	
	@Override
	public int registGroup(Timecapsule timecapsule, int boardNo){
		int result = tStore.registGroup(timecapsule,session);
		int result1 = gService.plusCommentPeople(timecapsule.getGroupNo());
		int result2 = wService.plusCommentPeople(boardNo);
		return result;
	}

	@Override
	public int deleteGroupUser(String groupNoUserNo) {
		int result = tStore.deleteGroupUser(session, groupNoUserNo);
		return result;
	}

	@Override
	public int registGroup(Timecapsule timecapsule) {
		int result = tStore.registGroup(timecapsule,session);
		return result;
	}

	@Override
	public int insertTimeCapsule(Timecapsule timecapsule) {
		int result = tStore.insertTimeCapsule(session, timecapsule);
		return result;
	}

	@Override
	public Timecapsule SelectOneByIden(Timecapsule timecapsule) {
		timecapsule = tStore.SelectOneByIden(session, timecapsule);
		return timecapsule;
	}

	@Override
	public int selectGetCountCapsule(int groupNo) {
		int capsuleCount = tStore.selectGetCountCapsule(session, groupNo);
		return capsuleCount;
	}

	@Override
	public List<Timecapsule> selectListByGroupNo(int groupNo) {
		List<Timecapsule> tList = tStore.selectListByGroupNo(session, groupNo);
		return tList;
	}
	


}
