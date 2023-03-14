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

import com.semi.hitinerary.tour.domain.Tour;
import com.semi.hitinerary.tour.service.TourService;

@Controller
public class TourController {
	@Autowired
	private TourService tService;

	// 패키지게시판 리스트 보기
	@RequestMapping(value = "/tour/tourBoardList", method = RequestMethod.GET)
	public String TourBoardListView(Model model) {
		List<Tour> tList = tService.selectTourList();
		model.addAttribute("tList", tList);
		return "tour/tourBoardList";
	}

	// 패키지게시판 글쓰기페이지 보기
	@RequestMapping(value = "/tour/tourBoardWrite", method = RequestMethod.GET)
	public String TourBoardWriteView() {
		return "tour/tourBoardWrite";
	}

	// 패키지게시판 글 상세 보기
	@RequestMapping(value = "/tour/tourBoardDetail", method = RequestMethod.GET)
	public String TourBoardDetailView(@RequestParam("tourNo") int tourNo, Model model) {

		Tour tour = tService.selectOneByNo(tourNo);

		model.addAttribute("tour", tour);
		return "tour/tourBoardDetail";
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

		tour = new Tour(tourTitle, tourContent, startDate, endDate, price, deadline, maxPeople, minPeople);
		if (thumbnail != null && !thumbnail.isEmpty() && !thumbnail.getOriginalFilename().equals("")) {
			String tourImagePath = savetourImage(tourImage, request);
			tour.setTourImage(tourImagePath);

		}
		if (tourImage != null && !tourImage.isEmpty() && !tourImage.getOriginalFilename().equals("")) {
			String thumbnailPath = saveThumbnail(thumbnail, request);
			tour.setThumbnail(thumbnailPath);

		}

		int result = tService.insertPosting(tour);
		if (result > 0) {
			return "redirect:/tour/tourBoardList"; //고치기: 글번호detail로 
		} else {
			// model.addAttribute("msg", "등록 안됐음");
			return "common/error";
		}

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
			String tourImagePath = savetourImage(tourImage, request);
			tour.setTourImage(tourImagePath);
		}
		if (tourImage != null && !tourImage.isEmpty() && !tourImage.getOriginalFilename().equals("")) {
			String thumbnailPath = saveThumbnail(thumbnail, request);
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
	private String savetourImage(MultipartFile tourImage, HttpServletRequest request) {
		try {
			String root = request.getSession().getServletContext().getRealPath("resources");
			int userNo = 1;
			String savePath = root + "\\tuploadImgs\\" + userNo + "tourBoard";
			File folder = new File(savePath);
			if (!folder.exists()) {
				folder.mkdirs();
			}
			String filePath = savePath + "\\" + tourImage.getOriginalFilename();
			File file = new File(filePath);
			tourImage.transferTo(file);
			return filePath;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 지정 경로로 썸넹리 복사(업로드)
	private String saveThumbnail(MultipartFile thumbnail, HttpServletRequest request) {
		try {
			String root = request.getSession().getServletContext().getRealPath("resources");
			int userNo = 1;
			String savePath = root + "\\tuploadImgs\\" + userNo + "tourBoard";
			File folder = new File(savePath);
			if (!folder.exists()) {
				folder.mkdirs();
			}
			String filePath = savePath + "\\" + thumbnail.getOriginalFilename();
			File file = new File(filePath);
			thumbnail.transferTo(file);
			return filePath;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
