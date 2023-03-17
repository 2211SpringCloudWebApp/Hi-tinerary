package com.semi.hitinerary.tour.controller;

import java.util.Date;
import java.util.List;
import java.io.File;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.semi.hitinerary.comment.domain.Comment;
import com.semi.hitinerary.tour.domain.PageInfo;
import com.semi.hitinerary.tour.domain.Tour;
import com.semi.hitinerary.tour.domain.TourPay;
import com.semi.hitinerary.tour.service.TourService;
import com.semi.hitinerary.user.domain.User;

@Controller
public class TourController {
	@Autowired
	private TourService tService;

	
	// 패키지게시판 리스트 보기
	@RequestMapping(value = "/tour/tourBoardList", method = RequestMethod.GET)
	public ModelAndView TourBoardListView(ModelAndView mv
			, @RequestParam(defaultValue="1") int page) {
			
		
		int totalCount = tService.getListCount(); //게시물 개수 받아옴!
		//int currentPage = 받아올 것?
		PageInfo pi = this.getPageInfo(page, totalCount);
		
		List<Tour> tList = tService.selectTourList(pi);
		mv.addObject("pi", pi).addObject("tList", tList).setViewName("tour/tourBoardList");
		//model.addAttribute("tList", tList);
		return mv; 
	}

	// 패키지게시판 글쓰기페이지 보기
	@RequestMapping(value = "/tour/tourBoardWrite", method = RequestMethod.GET)
	public String TourBoardWriteView() {
		return "tour/tourBoardWrite";
	}

	// 패키지게시판 글 상세 보기 + 댓글보기
	@RequestMapping(value = "/tour/tourBoardDetail", method = RequestMethod.GET)
	public String TourBoardDetailView(@RequestParam("tourNo") int tourNo, Model model) {

		Tour tour = tService.selectOneByNo(tourNo);
		List<Comment> comments = tService.selectAllComments(tourNo);
		
		
		
		model.addAttribute("tour", tour);
		model.addAttribute("comments", comments);
		
		return "tour/tourBoardDetail";
	}
	

	// 패키지게시물 결제페이지 보기
		@RequestMapping(value = "/tour/tourBoardPayView", method = RequestMethod.GET)
		public String TourBoardPayView(@RequestParam("tourNo") int tourNo, Model model, HttpServletRequest request) {
			
			try {
				String payUserNoString = request.getParameter("payUserNo");
				if (payUserNoString == null) {
					model.addAttribute("msg", "데이터 조회 실패");
					return "common/error";
				}
				
				int payUserNo = Integer.parseInt(payUserNoString);
				//int payUserNo = 0;
				Tour tour = tService.selectOneByNo(tourNo);
				User user = tService.selectUserByNo(payUserNo);
				model.addAttribute("tour", tour);
				model.addAttribute("user", user);
				return "tour/tourBoardPayView";
			
				
			} catch (Exception e) {
				e.getMessage();
				return "common/error";
			}
		}

	// 패키지게시판 수정 페이지 보기
	@RequestMapping(value = "/tour/tourBoardModifyView", method = RequestMethod.GET)
	public String modifyTourBoardView(@RequestParam("tourNo") int tourNo, Model model) {
		try {
			Tour tour = tService.selectOneByNo(tourNo);
			if (tour != null) {
				model.addAttribute("tour", tour);
				return "tour/tourBoardModifyView";
			} else {
				model.addAttribute("msg", "데이터 조회 실패");
				return "common/error";

			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";

		}
	}

	// 패키지 게시판 글올리기
	@RequestMapping(value = "/tour/tourBoardWriteUp", method = RequestMethod.POST)
	public String TourBoardWriteUp(Model model, HttpServletRequest request,
			@RequestParam(value = "thumbnail", required = false) MultipartFile thumbnail,
			@RequestParam(value = "tourImage", required = false) MultipartFile tourImage) throws ParseException {

		Tour tour = null;
		String startDateStr = request.getParameter("startDate");
		String endDateStr = request.getParameter("endDate");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHH");
		Date startDateD = sdf.parse(startDateStr);
		Date endDateD = sdf.parse(endDateStr);

		String deadlineStr = request.getParameter("deadline");
		SimpleDateFormat sdfDeadline = new SimpleDateFormat("yyyyMMdd");
		sdfDeadline.setLenient(false);

		String tourTitle = request.getParameter("tourTitle");
		String tourContent = request.getParameter("tourContent");

		Timestamp startDate = new Timestamp(startDateD.getTime());
		Timestamp endDate = new Timestamp(endDateD.getTime());

		Date deadline = sdfDeadline.parse(deadlineStr);

		int price = Integer.parseInt(request.getParameter("price"));
		int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
		int minPeople = Integer.parseInt(request.getParameter("minPeople"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int userGrade = Integer.parseInt(request.getParameter("userGrade"));
		String userNickname = request.getParameter("userNickname");

		tour = new Tour(tourTitle, tourContent, startDate, endDate, price, deadline, maxPeople, minPeople, userNo, userGrade, userNickname);
		tour.setTourNo(tService.getSequence());
		if (thumbnail != null && !thumbnail.isEmpty() && !thumbnail.getOriginalFilename().equals("")) {
			String tourImagePath = savetourImage(tourImage, request, tour.getTourNo(), tour.getUserNo());
			tour.setTourImage(tourImagePath);

		}
		if (tourImage != null && !tourImage.isEmpty() && !tourImage.getOriginalFilename().equals("")) {
			String thumbnailPath = saveThumbnail(thumbnail, request, tour.getTourNo(), tour.getUserNo());
			tour.setThumbnail(thumbnailPath);

		}

		int result = tService.insertPosting(tour);
		if (result > 0) {
			return "redirect:/tour/tourBoardDetail?tourNo="+tour.getTourNo();  
		} else {
			// model.addAttribute("msg", "등록 안됐음");
			return "common/error";
		}

	}
	
	//디테일페이지에서 댓글 쓰기
	@RequestMapping(value = "tour/replyUp", method = RequestMethod.POST)
	public String TourReplyUp(HttpServletRequest request, Model model) {
		String userNickname = request.getParameter("userNickname");
		int tourNo = Integer.parseInt(request.getParameter("tourNo"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String content = request.getParameter("content");
		
		Comment comment = new Comment(content, tourNo, userNo, userNickname);
		int result = tService.commentUp(comment);
		
		return "redirect:/tour/tourBoardDetail?tourNo="+tourNo; 
	}
	//디테일페이지에서 대댓글 쓰기
	@RequestMapping(value = "tour/reReplyUp", method = RequestMethod.POST)
	public String TourReReplyUp(HttpServletRequest request, Model model) {
		String userNickname = request.getParameter("userNickname");
		int tourNo = Integer.parseInt(request.getParameter("tourNo"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int refCommentNo = Integer.parseInt(request.getParameter("refCommentNo"));
		String content = request.getParameter("content");
		
		Comment reReply = new Comment(content, tourNo, userNo, userNickname);
		reReply.setRefCommentNo(refCommentNo);
		
		int reslut = tService.reReplyUp(reReply);
		
		return "redirect:/tour/tourBoardDetail?tourNo="+tourNo; 
	}
	
	
	
	//패키지 상품 결제하기(tour-pay테이블 insert)
	@RequestMapping(value="/tour/paid", method=RequestMethod.POST)
	public String payTour(@ModelAttribute TourPay tPay		
			, Model model) {
		int result =tService.payTour(tPay);
		
		return "redirect:/tour/tourBoardList";//마이페이지로 이동하는걸로 고치기!
	}
	
	
	//게시물 수정
	@RequestMapping(value="/tour/modify", method=RequestMethod.POST)
	public String modifyTour(
			 @RequestParam(value="tourNo") int tourNo
			, @RequestParam(value="thumbnail", required=false) MultipartFile thumbnail
			, @RequestParam(value="tourImage", required=false) MultipartFile tourImage
			, Model model
			, HttpServletRequest request) throws ParseException {
		
		Tour tour = tService.selectOneByNo(tourNo);

		String startDateStr = request.getParameter("startDate");
		String endDateStr = request.getParameter("endDate");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHH");
		Date startDateD = sdf.parse(startDateStr);
		Date endDateD = sdf.parse(endDateStr);

		String deadlineStr = request.getParameter("deadline");
		SimpleDateFormat sdfDeadline = new SimpleDateFormat("yyyyMMdd");
		sdfDeadline.setLenient(false);

		String tourTitle = request.getParameter("tourTitle");
		String tourContent = request.getParameter("tourContent");

		Timestamp startDate = new Timestamp(startDateD.getTime());
		Timestamp endDate = new Timestamp(endDateD.getTime());

		Date deadline = sdfDeadline.parse(deadlineStr);

		int price = Integer.parseInt(request.getParameter("price"));
		int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
		int minPeople = Integer.parseInt(request.getParameter("minPeople"));

		if (thumbnail != null && !thumbnail.isEmpty() && !thumbnail.getOriginalFilename().equals("")) {
			String tourImagePath = savetourImage(tourImage, request, tour.getUserNo(), tour.getTourNo());
			tour.setTourImage(tourImagePath);
		}
		if (tourImage != null && !tourImage.isEmpty() && !tourImage.getOriginalFilename().equals("")) {
			String thumbnailPath = saveThumbnail(thumbnail, request, tour.getTourNo(), tour.getUserNo());
			tour.setThumbnail(thumbnailPath);
		}
		
		tour.setWriteDate(tour.getWriteDate());
		tour.setTourTitle(request.getParameter("tourTitle"));
		tour.setTourContent(request.getParameter("tourContent"));
		tour.setStartDate(new Timestamp(sdf.parse(request.getParameter("startDate")).getTime()));
		tour.setEndDate(new Timestamp(sdf.parse(request.getParameter("endDate")).getTime()));
		tour.setDeadline(sdfDeadline.parse(request.getParameter("deadline")));
		tour.setPrice(Integer.parseInt(request.getParameter("price")));
		tour.setMaxPeople(Integer.parseInt(request.getParameter("maxPeople")));
		tour.setMinPeople(Integer.parseInt(request.getParameter("minPeople")));
		
		int result = tService.updatePosting(tour);
		if (result > 0) {
			return "redirect:/tour/tourBoardDetail?tourNo="+tour.getTourNo();  
		} else {
			 model.addAttribute("msg", "수정 실패!");
			return "common/error";
		}
		
	}
	
	

	// 패키지게시판 게시물 지우기
	@RequestMapping(value = "/tour/deletePosting", method = RequestMethod.GET)
	public String deletePosting(@RequestParam("tourNo") int tourNo, Model model) {
		try {
			int result = tService.deleteTour(tourNo);
			if (result > 0) {
				return "redirect: /tour/tourBoardList";
			} else {
				model.addAttribute("msg", "투어 게시물 삭제 실패");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	
	
	
	
	// 지정 경로로 본문이미지 복사(업로드)
	private String savetourImage(MultipartFile tourImage, HttpServletRequest request, int userNo, int tourNo) {
		try {
			String root = request.getSession().getServletContext().getRealPath("resources");
			//int userNo = 1;
			String savePath = root + "\\tuploadImgs\\" + userNo + "tourBoard";
			File folder = new File(savePath);
			if (!folder.exists()) {
				folder.mkdirs();
			}
			String filePath = savePath + "\\" + tourNo+ tourImage.getOriginalFilename();
			File file = new File(filePath);
			tourImage.transferTo(file);
			return filePath;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 지정 경로로 썸넹리 복사(업로드)
	private String saveThumbnail(MultipartFile thumbnail, HttpServletRequest request, int userNo, int tourNo) {
		try {
			String root = request.getSession().getServletContext().getRealPath("resources");
			//int userNo = 1;
			String savePath = root + "\\tuploadImgs\\" + userNo + "tourBoard";
			File folder = new File(savePath);
			if (!folder.exists()) {
				folder.mkdirs();
			}
			String filePath = savePath + "\\" +tourNo+ thumbnail.getOriginalFilename();
			File file = new File(filePath);
			thumbnail.transferTo(file);
			return filePath;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	
	//paging
	private PageInfo getPageInfo(int currentPage, int totalCount) {
		int postingLimit = 12;
		int naviLimit =5;
		int maxPage;
		int startNavi;
		int endNavi;
		
		maxPage = (int)((double)totalCount / postingLimit + 0.9);
		startNavi =((int) ((double) currentPage / naviLimit + 0.9) - 1) * naviLimit + 1;
		endNavi = startNavi + naviLimit -1;
		if(endNavi > maxPage) {
			endNavi = maxPage;
		}
		PageInfo pi = new PageInfo(currentPage, postingLimit, totalCount, currentPage, startNavi, naviLimit, endNavi);
		return pi;
	}
}



