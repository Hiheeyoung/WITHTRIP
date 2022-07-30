package com.withtrip.WithTrip.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.withtrip.WithTrip.common.PaginationNotice;
import com.withtrip.WithTrip.notice.model.exception.NoticeException;
import com.withtrip.WithTrip.notice.model.service.NoticeService;
import com.withtrip.WithTrip.notice.model.vo.Notice;
import com.withtrip.WithTrip.notice.model.vo.PageInfo;

@Controller
public class NoticeController {

   @Autowired
   private NoticeService nService;
   
   
   // 리스트
   @RequestMapping("nlist.no")
   public ModelAndView noticeList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
	   
	   int currentPage = 1;
	   
	   if(page != null) {
		   currentPage = page;
	   }
	   
	   ArrayList<Notice> fixList = nService.getFixNoticeList(); // 고정리스트
	   
	   int listCount = nService.getListCount();
	   PageInfo pi = PaginationNotice.getPageInfo(currentPage, listCount);
	   ArrayList<Notice> list = nService.getNoticeList(pi);
	   
	   if(list != null) {
		   mv.addObject("list", list);
		   mv.addObject("fixList", fixList);
		   mv.addObject("pi", pi);
		   mv.setViewName("noticeList");
		   
	   } else {
		   throw  new NoticeException("게시글 전체 조회에 실패했습니다.");
	   }
	   
	   return mv;
	   
	   
   }
   
   
   //글쓰기 
   @RequestMapping("noticeWrite.no")
   public String noticeWrite() {
	   return "noticeWriteForm";
   }
   
   @RequestMapping("nInsert.no")
   public String insertNotice(@ModelAttribute Notice n, @RequestParam(value= "fix", required = false) String fix) {
	   
	   System.out.println(fix);
	   if(fix == null) {
		   n.setFix("0");
	   }else {
		   n.setFix("1");
	   }
	   System.out.println(n);
	   int result = nService.insertNotice(n);
	   System.out.println(result);
	   
	   return "redirect:nlist.no";
   }
   
   
   // 상세보기
   @RequestMapping("ndetail.no")
   public ModelAndView noticeDetail(@RequestParam("nId") int nId, @RequestParam("page") int page, ModelAndView mv) {
	   Notice notice = nService.selectNotice(nId);
	  
	   if(notice != null) {
		   mv.addObject("notice", notice).addObject("page", page).setViewName("noticeDetail");
		   return mv;
	   
	   } else {
		   throw new NoticeException("게시글 상세보기에 실패하였습니다.");
	   }
   }   
	 
   // 수정하기
   @RequestMapping("notceUpDetail.no")
	 	public String noticeUpdateForm(@ModelAttribute Notice notice, @RequestParam("page") int page, Model model) {
	   		model.addAttribute("notice", notice).addAttribute("page", page);
		   return "noticeUpdateForm";
	   
   }   
	 
   @RequestMapping("nUpdate.no")
   public String updateNotice(@ModelAttribute Notice n, @RequestParam("page") int page, 
		   @RequestParam(value= "fix", required = false) String fix, Model model) {
	   
	   if(fix == null) {
		   n.setFix("0");
	   }else {
		   n.setFix("1");
	   }
	   System.out.println(fix);
	   int result = nService.updateNotice(n);
	   
	   if(result > 0) {
		   return "redirect:ndetail.no?nId=" + n.getNoticeId() + "&page=" + page;
//		   model.addAttribute("nId", n.getNoticeId());
//		   model.addAttribute("page", page);
//		   return "redirect:ndetail.no";
	   } else {
		   throw new NoticeException("게시글 수정에 실패하였습니다");
	   }
   }

   @RequestMapping("ndelete.no")
   public String deleteNotice(@RequestParam("nId") int nId) {
	   
	   	int result = nService.deleteNotice(nId);
	   	System.out.println(nId);
	   	if(result > 0) {
	   		return "redirect:nlist.no";
	   	} else {
	   		throw new NoticeException("게시글 삭제에 실패하였습니다.");
	   	}
   } 
   

}