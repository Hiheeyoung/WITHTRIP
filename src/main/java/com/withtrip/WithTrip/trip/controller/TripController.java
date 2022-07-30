package com.withtrip.WithTrip.trip.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.withtrip.WithTrip.common.Attachment;
import com.withtrip.WithTrip.common.Pagination;
import com.withtrip.WithTrip.trip.model.service.TripService;
import com.withtrip.WithTrip.trip.model.vo.PageInfo;
import com.withtrip.WithTrip.trip.model.vo.TripBoard;

@Controller
public class TripController {
	
	@Autowired
	private TripService tService;
	
	//동행 리스트 조회
	@RequestMapping("tlist.to")
	public ModelAndView tripList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		//페이징처리
		System.out.println("page:"+page);
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		System.out.println("currentPage:"+currentPage);
		int listCount = tService.getListCount();
		
		//페이지네이션
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<TripBoard> list = tService.getBoardList(pi);
		System.out.println("동행리스트조회:"+list);
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("tripList");
		}
		
		return mv;
	}
	
	//동행 글 상세보기 6/28 경진 수정
	@RequestMapping("tdetail.to")
	public ModelAndView tripDetailView(@RequestParam(value="bId") int bId, @RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
	   TripBoard tboard = tService.selectBoard(bId);
	   Attachment a = tService.selectFile(bId);
	   System.out.println("글상세보기"+tboard);
	   if(tboard != null && a != null && page != null) {
	      mv.addObject("tboard", tboard).addObject("a", a).addObject("page", page).setViewName("tripDetail");
	   } else if(tboard != null && a != null && page == null) {
	      mv.addObject("tboard", tboard).addObject("a", a).setViewName("tripDetail");
	   }
	   System.out.println("글상세보기2"+mv);
	   return mv;
	}
	   
	//동행 글작성 뷰이동
	@RequestMapping("tripWriteView.to")
	public String tripWriteView() {
	    return "tripWriteForm";
	}
	
	//동행 글작성
	@RequestMapping("tinsert.to")
	public String insertTrip(@ModelAttribute TripBoard t, @ModelAttribute Attachment a,
							 @RequestParam("uploadFile") MultipartFile uploadFile, 
							 HttpServletRequest request) {
		System.out.println("t:"+t);
		System.out.println("uploadFile:"+uploadFile);
		System.out.println("a:"+a);
		if(uploadFile != null && !uploadFile.isEmpty()) {
			String renameFileName = saveFile(t, a, uploadFile, request);
			
			a.setOriginName(uploadFile.getOriginalFilename());
			a.setChangeName(renameFileName);
			t.setOriginalFileName(uploadFile.getOriginalFilename());
			t.setRenameFileName(renameFileName);
			
		}
		int result = tService.insertBoard(t);
		int result2 = tService.insertFile(a);
		
		System.out.println("result2:"+result2);
		System.out.println("result:"+result);
		System.out.println("t2:"+t);
		System.out.println("t2:"+a);
		if(result > 0 && result2 > 0) {
			return "redirect:tlist.to";
		} else {
			return "errorPage";
		}
		
	}
	
	//파일 저장
	public String saveFile(@ModelAttribute TripBoard t, @ModelAttribute Attachment a, MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\tuploadFiles";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + originFileName.substring(originFileName.lastIndexOf("."));
		
		String renamePath = folder + "\\" + renameFileName;
		a.setFilePath(renamePath);
		t.setRenameFileName(renamePath);
		a.setChangeName(renameFileName);
		System.out.println("a파일저장"+a);
		try {//저장소에 새로만든 이름으로 저장
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return renameFileName;
		
	}
	
	//수정하기 뷰 이동
	@RequestMapping("tripDetailView.to")
	public String tripDetailView(@ModelAttribute TripBoard t, @ModelAttribute Attachment a, @RequestParam("page") int page, Model model) {
		System.out.println("수정하기이동t:"+t);
		System.out.println("수정하기이동a:"+a);
		model.addAttribute("tboard", t).addAttribute("a", a).addAttribute("page", page);
		
		System.out.println("수정하기뷰t:"+t);
		System.out.println("수정하기뷰a:"+a);
		return "tripUpdateForm";
	}
	
	//수정하기
	@RequestMapping("tupdate.to")
	public String updateBoard(@ModelAttribute TripBoard t, @ModelAttribute Attachment a, @RequestParam("page") int page,
							@RequestParam("reuploadFile") MultipartFile reuploadFile, HttpServletRequest request, Model model) {
		System.out.println("수정하기 t:"+t);
		if(reuploadFile != null && !reuploadFile.isEmpty()) {
			if(t.getRenameFileName() != null) {
				deleteFile(t.getRenameFileName(), request);
			}
			String renameFileName = saveFile(t, a, reuploadFile, request);
			
			a.setOriginName(reuploadFile.getOriginalFilename());
			a.setChangeName(renameFileName);
			t.setOriginalFileName(reuploadFile.getOriginalFilename());
			t.setRenameFileName(renameFileName);
			System.out.println("리네임:"+renameFileName);
			System.out.println("수정하기a:"+a);
		}
		int result = tService.updateBoard(t);
		System.out.println("수정하기 result:"+result);
		int result2 = tService.updateFile(a);
		System.out.println("수정하기 a:"+result2);
		if(result > 0 && result2 > 0) {
			return "redirect:tdetail.to?bId=" + t.getBoardId() + "&page=" + page;
		} else {
			return "errorPage";
		}
		
	}

	//리네임 사진 들어가고 기존파일 삭제
	private void deleteFile(String renameFileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\tuploadFiles";
		
		File f = new File(savePath + "\\" + renameFileName);
		if(f.exists()) {
			f.delete();
		}
	}
	
	//게시글 삭제하기
	@RequestMapping("tdelete.to")
	public String tdelete(@RequestParam("bId") int bId, @RequestParam("changeName") String changeName, HttpServletRequest request) {
		if(!changeName.equals("")) {
			deleteFile(changeName, request);
		}
		
		int result = tService.deleteTripBoard(bId);
		int result2 = tService.deleteFile(bId);
		if(result > 0 && result2 > 0) {
			return "redirect:tlist.to";
		} else {
			return "../common/errorPage";
		}
		
	}
	
	//검색
	@RequestMapping("search.to")
	public ModelAndView search(@RequestParam(value="page", required=false) Integer page,@RequestParam("searchValue") String searchValue, ModelAndView mv) {
		//페이징처리
		System.out.println("page:"+page);
		System.out.println("검색벨류:"+searchValue);
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchValue", searchValue);
		System.out.println("map"+map);
		
		int listCount = tService.getSearchListCount(map);
		System.out.println("검색listCount:"+listCount);
		//페이지네이션
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<TripBoard> list = tService.getsearchBoardList(map, pi);
		System.out.println("검색게시판리스트"+list);
		System.out.println("검색게시판리스트"+list);
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("searchValue", searchValue);
			mv.setViewName("tripList");
			System.out.println("list"+list);
			System.out.println("pi"+pi);
			System.out.println("searchValue"+searchValue);
			
		}
		
		return mv;
	}
	
	   // 내가 작성한 동행 글에서 삭제 하기
	   @RequestMapping("myTdelete.to")
	   public String myTdelete(@RequestParam("bId") int bId, HttpServletRequest request) {
	      String changeName = tService.selectDeleteFileName(bId);
	      
	      if(!changeName.equals("")) {
	         deleteFile(changeName, request);
	      }
	      
	      int result = tService.deleteTripBoard(bId);
	      int result2 = tService.deleteFile(bId);
	      if(result > 0 && result2 > 0) {
	         return "redirect:myPost.me";
	      } else {
	         return "../common/errorPage";
	      }
	   }
	   
//	   //카테고리
	   @RequestMapping("preference.to")
	   public ModelAndView preference(@RequestParam(value="page", required=false) Integer page, @RequestParam("search") String search, ModelAndView mv) {
		   System.out.println("search"+search);
		   System.out.println("mv"+mv);
		  
			int currentPage = 1;
			if(page != null) {
				currentPage = page;
			}
			
			int listCount = tService.getpreferenceListCount(search);
			
			//페이지네이션
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			ArrayList<TripBoard> list = tService.getpreferenceList(search, pi);
			System.out.println("동행리스트조회:"+list);
			if(list != null) {
				mv.addObject("list", list);
				mv.addObject("pi", pi);
				mv.setViewName("tripList");
			}
			return mv;
	   }
	   
	   //모집중인 게시글 분류
	   @RequestMapping("Recruiting.to")
	   public ModelAndView Recruiting(@RequestParam(value="page", required=false) Integer page, @RequestParam("filt") String filt, ModelAndView mv) {
		    int currentPage = 1;
			if(page != null) {
				currentPage = page;
			}
			System.out.println("filt:"+filt);
			//리스트 카운트
			int listCount = tService.getRecruitingListCount(filt);
			
			//페이지네이션
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			ArrayList<TripBoard> list = tService.getRecruitingList(filt, pi);
			System.out.println("모집중:"+list);
			if(list != null) {
				mv.addObject("list", list);
				mv.addObject("pi", pi);
				mv.setViewName("tripList");
			}
			return mv;
	   }
	   
}
