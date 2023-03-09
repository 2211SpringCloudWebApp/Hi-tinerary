package com.semi.hitinerary.group.controller;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.semi.hitinerary.group.domain.Group;
import com.semi.hitinerary.group.service.GroupService;
import com.semi.hitinerary.timecapsule.domain.Timecapsule;
import com.semi.hitinerary.timecapsule.service.TimecapsuleService;
import com.semi.hitinerary.user.domain.User;
import com.semi.hitinerary.user.service.UserService;

@Controller
public class GroupController {
	
	@Autowired
	GroupService gService;
	
	@Autowired
	UserService uService;
	
	@Autowired
	TimecapsuleService tService;
	
	@RequestMapping(value="/group/groupinfopage", method = RequestMethod.GET)
	public String viewGroupPage(
			Model model
			,@RequestParam(value="groupIndex", required=false, defaultValue="0") String groupIndex
			,@RequestParam(value="groupUserView", required=false, defaultValue="F") String groupUserView
			,HttpSession session
			) {
		int userNo = 3;
		session.setAttribute("loginUser", userNo);
		List<Group> gList = gService.selectByUserNo(userNo);
		Group group = null;
		if(gList.isEmpty()) {
			groupIndex = "-1";
		}else {
			model.addAttribute("gList", gList);
			if(Integer.parseInt(groupIndex) > -1 ) {
				group = gList.get(Integer.parseInt(groupIndex));				
			}
			model.addAttribute("group", group);	
		}
		LocalDate now = LocalDate.now();
		model.addAttribute("groupIndex", groupIndex);
		model.addAttribute("groupUserView", groupUserView);
		model.addAttribute("now", now);
		return "group/groupinfopage";
	}
	
	@RequestMapping(value="/group/register", method = RequestMethod.GET )
	public String viewRegsiterGroup() {
		return "group/create";
	}
	
	public String dateToTimestamp(String date) {
		if(date.length() == 10) {
			date += " 00:00:00";
		}
		return date;
	}
	
	@RequestMapping(value="/group/register.do", method = RequestMethod.POST)
	public String createGroup(
			HttpSession session
			,String groupName
			,String startDate
			,String endDate
			,String maxPeople
			){
//		int userNo = (Integer)session.getAttribute("userNo");	
		int userNo = 3;
		startDate = this.dateToTimestamp(startDate);
		endDate = this.dateToTimestamp(endDate);
		Group group = new Group(Timestamp.valueOf(startDate), Timestamp.valueOf(endDate), Integer.parseInt(maxPeople), groupName, userNo);
		int result = gService.createGroup(group);
		if(result > 0) {
			group = gService.SelectOneByUserNoRecent(userNo);
			User user = uService.selectOneByNo(userNo);
			Timecapsule timecapsule = new Timecapsule(group.getGroupNo(), user.getUserNo(), user.getUserEmail());
			timecapsule.createIden();
			tService.registGroup(timecapsule);
		}
		return "redirect:/group/groupinfopage";
	}
}
