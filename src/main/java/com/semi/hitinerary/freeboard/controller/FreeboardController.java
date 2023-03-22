package com.semi.hitinerary.freeboard.controller;

import java.io.File;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

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

import com.semi.hitinerary.comment.controller.CommentController;
import com.semi.hitinerary.comment.domain.Comment;
import com.semi.hitinerary.comment.service.CommentService;
import com.semi.hitinerary.freeboard.domain.Freeboard;
import com.semi.hitinerary.freeboard.domain.PageInfo;
import com.semi.hitinerary.freeboard.domain.Search;
import com.semi.hitinerary.freeboard.service.FreeboardService;

@Controller
public class FreeboardController {

	@Autowired
	private FreeboardService fService;
	
	@Autowired
	private CommentService cService;

	//날짜 바꾸기
	public String timeFormatted(Timestamp timestamp) {
	    // Timestamp 객체를 LocalDateTime 객체로 변환
	    LocalDateTime dateTime = timestamp.toLocalDateTime();
	    // 출력 포맷 지정
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd a hh시");
	    // 포맷에 맞게 변환
	    String formattedDateString = dateTime.format(formatter);
	    return formattedDateString;
	}
	
	//게시글 목록 조회 (페이징 처리)
	@RequestMapping(value="/freeboard/list", method=RequestMethod.GET)
	public String freeboardList(@ModelAttribute Search search
			, @RequestParam(value="page", required = false, defaultValue = "1") Integer currentPage 
			, @RequestParam(value="searchCondition", required = false, defaultValue = "all") String searchCondition 
			,Model model) {
		search.setSearchCondition(searchCondition);
		try {
			int totalCount = fService.getSearchListCount(search);
			PageInfo pi = this.getPageInfo(currentPage, totalCount);
			
			List<Freeboard> searchList = fService.selectFreeboardList(pi, search);
			
			if(!searchList.isEmpty()) {
				model.addAttribute("search", search);
				model.addAttribute("pi", pi);
				model.addAttribute("fList", searchList);
				return "freeboard/list";
			} else {
				model.addAttribute("msg", "조회에 실패하였습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	//게시글 상세 조회
	@RequestMapping(value = "/freeboard/detail", method=RequestMethod.GET)
	public String freeboardDetail(@RequestParam("boardNo") int boardNo
			, Model model) {
		
		try {
			Freeboard freeboard = fService.selectOneById(boardNo);
			freeboard.setUserNickname(fService.selectNickname(boardNo));
			//댓글 리스트 가져오기
			List<Comment> cList = cService.ListFreeboardComment(boardNo);
			model.addAttribute("freeboard",freeboard);
			model.addAttribute("cList",cList);
			return "freeboard/detail";
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	// 자유게시판 글등록 화면
	@RequestMapping(value = "/freeboard/write", method=RequestMethod.GET)
	public String preeboardWrite() {
		return "freeboard/write";
	}
	
	// 자유게시판 글 등록하기
	@RequestMapping(value = "/freeboard/write", method=RequestMethod.POST)
	public String freeboardRegister(
			@ModelAttribute Freeboard freeboard
			, @RequestParam(value="uploadFile", required = false) MultipartFile uploadFile
			, HttpServletRequest request
			, Model model) {
		try {
			freeboard.setBoardNo(fService.getSequence());
			// 파일이 있을 경우
			if(!uploadFile.getOriginalFilename().equals("")) {
				// 파일 복사(지정한 경로 업로드)
				String filePath = saveFile(uploadFile, request, freeboard.getBoardNo(), freeboard.getUserNo());
				if(filePath != null) { // 파일복사가 성공했으면, null이 아니면
					freeboard.setBoardImage(uploadFile.getOriginalFilename());
					freeboard.setBoardImage(filePath);
				}
			}
			//System.out.println(freeboard);
			int result = fService.insertFreeboard(freeboard);
			
			if(result > 0) {
				return "redirect:/freeboard/list";
			}else {
				model.addAttribute("msg", "게시글이 등록되지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	//게시글 수정화면
	@RequestMapping(value="/freeboard/modify", method=RequestMethod.GET)
	public String freeboardModifyView(@RequestParam("boardNo") Integer boardNo, Model model) {
		try {
			Freeboard freeboard = fService.selectOneById(boardNo);
			if(freeboard != null) {
				model.addAttribute("freeboard", freeboard);
				return "freeboard/modify";
			}else {
				model.addAttribute("msg", "데이터 조회에 실패하였습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	// 게시글 수정
	@RequestMapping(value="/freeboard/modify", method=RequestMethod.POST)
	public String freeboardModify(
		@ModelAttribute Freeboard freeboard
		, @RequestParam(value="reloadFile", required=false) MultipartFile reloadFile
		, Model model
		, HttpServletRequest request) {
		try {
			// 수정할 때, 새로 업로드된 파일이 있는 경우)
			if(!reloadFile.isEmpty()) {
				// 기존 업로드 된 파일 체크 후
				if(freeboard.getBoardImage() != null) {
					// 기존 파일 삭제
					this.deleteFile(freeboard.getBoardImage(), request);
				}
				// 새로 업로드된 파일 복사(지정된 경로 업로드)
				String modifyPath = this.saveFile(reloadFile, request, freeboard.getBoardNo(), freeboard.getUserNo());
				if(modifyPath != null) {
					// notice에 새로운 파일 이름, 파일 경로 set
					freeboard.setBoardImage(reloadFile.getOriginalFilename());
					freeboard.setBoardImage(modifyPath);
				}
			}
			
			//DB에서 게시글 수정
			int result = fService.modifyFreeboard(freeboard);
			if(result > 0) {
				return "redirect:/freeboard/detail?boardNo="+freeboard.getBoardNo();
			}else {
				model.addAttribute("msg", "수정이 완료되지 않았습니다.");
				return "common/error";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	// 게시글 삭제
	@RequestMapping(value="/freeboard/remove", method = RequestMethod.GET)
	public String freeboardRemove(@RequestParam("boardNo") int boardNo
			, Model model) {
		try {
			int result = fService.deleteFreeboard(boardNo);
			if(result > 0) {
				return "redirect:/freeboard/list";
			}else {
				model.addAttribute("msg", "삭제가 완료되지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}

	// 아래부분 다시 봐야함.
	// 지정 경로로 파일 복사(파일 업로드)
	private String saveFile(MultipartFile uploadFile, HttpServletRequest request, int boardNo, int userNo) {
		try {
			//내가 원하는 경로 : 프로젝트 경로
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\fuploadFiles\\" + userNo + "freeBoard";
			//폴더가 없을 경우 자동으로 만들어주기 위한 코드(폴더가 있는 경우 동작 안함)
			File folder = new File(savePath);
			
			if(!folder.exists()) {
				folder.mkdirs();
			}
			
			//실제 파일 저장
			String filePath = savePath + "\\" + boardNo + uploadFile.getOriginalFilename();
			File file = new File(filePath);
			uploadFile.transferTo(file);
			filePath = "resources\\fuploadFiles\\" + userNo + "freeBoard\\" + boardNo + uploadFile.getOriginalFilename();
			return filePath;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// navigator start, end값 설정 method()
	private PageInfo getPageInfo(int currentPage, int totalCount) {
		PageInfo pi = null;
		int boardLimit = 10; // recordCountPerPage 한페이지에 보여줄 게시물 수
		int naviLimit = 5; // naviCountPerPage 한 네비에 보여줄 네비 수
		int maxPage; // 최대 페이지 수
		int startNavi; // 시작 네비값
		int endNavi; // 긑 네비값
		
		//ex) 게시글수 170
		//최대 페이지 구하기 = 17
		maxPage = (int)((double)totalCount/boardLimit+0.9);
		//System.out.println("최대페이지 값은 : "+ maxPage);
		// 시작 네비값 세팅.
		startNavi = (((int)((double)currentPage/naviLimit+0.9))-1) * naviLimit + 1;
		// 끝 네비값 세팅.
		endNavi = startNavi + naviLimit - 1;
		
		if(endNavi > maxPage) {
			endNavi = maxPage;
		}
		
		//System.out.println("끝 네비값은 : "+endNavi);
		
		pi = new PageInfo(currentPage, boardLimit, naviLimit, startNavi, endNavi, totalCount, maxPage);
		return pi;
	}

	//파일삭제
	private void deleteFile(String filename, HttpServletRequest request) throws Exception{
		String root = request.getSession().getServletContext().getRealPath("resources");
		String delPath = root + "\\nuploadFiles";
		String delFilepath = delPath + "\\" + filename;
		File delFile = new File(delFilepath);
		if(delFile.exists()) {
			delFile.delete();
		}
	}
}
