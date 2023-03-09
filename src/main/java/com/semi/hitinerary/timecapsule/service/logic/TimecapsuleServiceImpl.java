package com.semi.hitinerary.timecapsule.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.hitinerary.timecapsule.domain.Timecapsule;
import com.semi.hitinerary.timecapsule.service.TimecapsuleService;
import com.semi.hitinerary.timecapsule.store.TimecapsuleStore;

@Service
public class TimecapsuleServiceImpl implements TimecapsuleService {
	
	@Autowired
	SqlSession session;
	
	@Autowired
	TimecapsuleStore tStore;
	
	@Override
	public int registGroup(Timecapsule timecapsule) {
		int result = tStore.registGroup(timecapsule,session);
		return result;
	}

}
