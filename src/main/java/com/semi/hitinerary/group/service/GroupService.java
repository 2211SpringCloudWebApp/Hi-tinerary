package com.semi.hitinerary.group.service;

import com.semi.hitinerary.user.domain.User;

public interface GroupService {

	public int selectUserById(String leaderUserId);

	public User selectUser();

}
