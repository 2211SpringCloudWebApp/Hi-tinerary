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

import com.semi.hitinerary.common.Pagination;
import com.semi.hitinerary.group.domain.Group;
import com.semi.hitinerary.group.service.GroupService;
import com.semi.hitinerary.groupboard.controller.GroupboardController;
import com.semi.hitinerary.groupboard.domain.Groupboard;
import com.semi.hitinerary.groupboard.domain.NavigationNList;
import com.semi.hitinerary.timecapsule.domain.Timecapsule;
import com.semi.hitinerary.timecapsule.service.TimecapsuleService;
import com.semi.hitinerary.user.domain.User;
import com.semi.hitinerary.user.service.UserService;

@Controller
public class GroupController {
	
	@Autowired
	GroupboardController gBController;
	
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
			,@RequestParam(value="currentPage", required=false, defaultValue = "1")String currentPage
			,HttpSession session
			) {
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/user/login";
		}
		User user = (User)session.getAttribute("loginUser");
		int userNo = user.getUserNo();
		List<Group> gList = gService.selectByUserNo(userNo);
		Group group = null;
		try {
			Integer.parseInt(groupIndex);
		} catch (Exception e) {
			groupIndex = "-1";
			return "redirect:/group/groupinfopage?groupIndex=" + groupIndex;
		}
		if(gList.isEmpty()) {
			groupIndex = "-1";
		}else {
			if(gList.size() <  Integer.parseInt(groupIndex)) {
				groupIndex = "-1";
				return "redirect:/group/groupinfopage?groupIndex=" + groupIndex;
			}
			model.addAttribute("gList", gList);
			if(Integer.parseInt(groupIndex) > -1 ) {
				group = gList.get(Integer.parseInt(groupIndex));
				if(!(group.getDateGap() >= 3)) {
					model.addAttribute("group", group);
					int capsuleAmount = tService.selectGetCountCapsule(group.getGroupNo());
					model.addAttribute("capsuleCount", capsuleAmount);
					NavigationNList naviNList = gBController.groupBoardList(group.getGroupNo(), Integer.parseInt(currentPage));
					List<Groupboard> gBList = naviNList.getgBList();
					Pagination pi = naviNList.getPi();
					if(!gBList.isEmpty()) {
						model.addAttribute("gBList", gBList);
						model.addAttribute("pi", pi);
					}					
				}else {
					groupIndex = "-1";
				}
			}
		}
		if(groupUserView.equals("T")) {
				List<User> uList = uService.selectByGroupNo(group.getGroupNo());
				model.addAttribute("uList", uList);
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
	
	@RequestMapping(value="/group/register.do", method = RequestMethod.POST)
	public String createGroup(
			HttpSession session
			,String groupName
			,String startDate
			,String endDate
			,String maxPeople
			,@RequestParam(value="startTime", required = false, defaultValue= "00:00") String startTime
			,@RequestParam(value="endTime", required = false, defaultValue = "00:00") String endTime
			){
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/user/login";
		}
		User user = (User)session.getAttribute("loginUser");
		int userNo = user.getUserNo();	
		startDate = startDate + " " + startTime + ":00";
		endDate =  endDate + " " + endTime + ":00";
		Group group = new Group(Timestamp.valueOf(startDate), Timestamp.valueOf(endDate), Integer.parseInt(maxPeople), groupName, userNo);
		int result = gService.createGroup(group);
		if(result > 0) {
			group = gService.SelectOneByGroupNo(result);
			user = uService.selectOneByNo(userNo);
			Timecapsule timecapsule = new Timecapsule(group.getGroupNo(), user.getUserNo(), user.getUserEmail());
			timecapsule.createIden();
			tService.registGroup(timecapsule);
		}
		return "redirect:/group/groupinfopage";
	}
	
	@RequestMapping(value="/group/dropUser" , method = RequestMethod.POST)
	public String deleteGroupUser(
			@RequestParam("userNo") String userNo,
			@RequestParam("groupNo") String groupNo
			) {
		int result = tService.deleteGroupUser(groupNo + "," + userNo);
		if(result > 0) {
			result = gService.minusCurrentPeople(groupNo);
		}
		return "redirect:/group/groupinfopage";
	}
}
