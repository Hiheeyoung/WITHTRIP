package com.withtrip.WithTrip.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.sun.mail.iap.Response;
import com.withtrip.WithTrip.goods.model.vo.Reply;
import com.withtrip.WithTrip.member.model.exception.MemberException;
import com.withtrip.WithTrip.member.model.service.MemberService;
import com.withtrip.WithTrip.member.model.vo.Member;
import com.withtrip.WithTrip.member.model.vo.MemberPagination;
import com.withtrip.WithTrip.member.model.vo.Report;
import com.withtrip.WithTrip.member.model.vo.TripReview;
import com.withtrip.WithTrip.order.model.vo.Order;
import com.withtrip.WithTrip.trip.model.vo.PageInfo;
import com.withtrip.WithTrip.trip.model.vo.TripBoard;


@SessionAttributes("loginUser")
@Controller
public class MemberController{
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private HttpSession session;
	

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	// ????????? ???
	@RequestMapping("loginView.me")
	public String loginView() {
		return "login";
	}
	
	   // ?????? ?????????
//	   @RequestMapping(value="login.me", method=RequestMethod.POST)
//	   public ModelAndView login(Member m, ModelAndView mv, HttpSession session){
//	      Member loginMember = mService.login(m);
//	      boolean match = bcrypt.matches(m.getUserPwd(), loginMember.getUserPwd());
//	      
//	      System.out.println(bcrypt.encode(m.getUserPwd()));
//	            
//	      if(match) {
//	         mv.addObject("loginUser", loginMember);
//	         mv.setViewName("redirect:home.do");
//	      } else {
//	          mv.addObject("msg", "???????????? ?????????????????????");
//	          mv.setViewName("../common/errorPage");
//	      }
//	      return mv;
//	      
//	   }
	
	   // ?????? ????????? ?????????
	   @RequestMapping(value="login.me", method=RequestMethod.POST)
	   public void login(@RequestParam("userPwd") String pwd, @RequestParam("email") String email, 
			   Model model, HttpSession session, HttpServletRequest request ,HttpServletResponse response) throws IOException{
	      
		  Member loginMember = mService.login(email);
	      
		  if(loginMember != null) {
			  boolean match = bcrypt.matches(pwd, loginMember.getUserPwd());
			  if(match) {
				  session.setAttribute("loginUser", loginMember);
				  response.getWriter().print(true);
			  } else {
					response.getWriter().print(false);
			  }
		  } else {
			  
				response.getWriter().print(false);
		  }
	   }
	   
	   
	// ????????? ?????? ???
	@RequestMapping("findId.me")
	public String findId() {
		return "findId";
	}
		
	// ????????? ??????
	@RequestMapping("checkId.me")
	public String checkId(@ModelAttribute("member")Member m, Model model) {
		
		Member member = mService.findId(m);
		
		if(member != null) {
			model.addAttribute("member", member);
			
		}else {
			throw new MemberException("???????????? ??????????????????");
			
		}
		
		return "findId";
	}
	
	// ???????????? ?????? ???
	@RequestMapping("findPwd.me")
	public String findPwd() {
		return "findPwd";
	}
	
	//????????? ??????
    @RequestMapping(value="checkPwd.me", method=RequestMethod.GET)
    public void mailCheckGET(@RequestParam("myEmail") String myEmail, HttpServletResponse response){
       
  
        System.out.println(myEmail);
        /* ????????????(??????) ?????? */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        String newPwd = "";
        
        newPwd = checkNum + "!" + "z" + "D";
        
        System.out.println(newPwd);
        
        /* ????????? ????????? */
        String setFrom = "with__trip@naver.com";
        String toMail = myEmail;
        String title = "???????????? ?????? ????????? ?????????.";
        String content = 
                "??????????????? ?????????????????? ???????????????." +
                "<br><br>" + 
                "????????? ??????????????? " + newPwd + "?????????." + 
                "<br>" + 
                "?????? ??????????????? ?????????????????????.";
        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
       

        
        HashMap<String, String> map = new HashMap<>();
        map.put("myEmail", myEmail);
        map.put("newPwd", newPwd);
        System.out.println(map);
        
        String encPwd = bcrypt.encode(newPwd);
      map.put("encPwd", encPwd);
      
      System.out.println(encPwd);

        
        int result = mService.findPwd(map); 
        
        try {
         PrintWriter pw = response.getWriter();
         pw.print(result);
      } catch (IOException e) {
         e.printStackTrace();
      }
    }		

	//  ????????????
    @RequestMapping("logout.me")
    public String logout(HttpSession session,SessionStatus status) {
        String access_Token = (String)session.getAttribute("access_Token");
        
        if(access_Token != null && !"".equals(access_Token)){
        	mService.unlink(access_Token);
//            mService.kakaoLogout(access_Token);
            
            status.setComplete();
            session.invalidate();
        }else{
            status.setComplete();
            session.invalidate();
            System.out.println("access_Token is null");
            //return "redirect:/";
        }
       
        return "redirect:home.do";
    }
    
  //????????? ?????????
  	@RequestMapping(value="kakao.me", method=RequestMethod.GET)
  	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, Model model, HttpSession session){
  		System.out.println("#########" + code);
  		
  		/*
  		 * ???????????? testPage??? ?????? ???????????? ???????????? ???????????????.
  		 * ?????? ???????????? ????????? ???????????????.
  		 * 404??? ?????? ?????? ???????????? #########???????????? ??? ??? ????????? ???????????? ??????????????? ?????? ?????? ???????????? ?????????.
  		 */
  		
  		String access_Token = mService.getAccessToken(code);
  		
  		HashMap<String, Object> userInfo = mService.getUserInfo(access_Token);
  		System.out.println("###access_Token#### : " + access_Token);
  		System.out.println("###nickname#### : " + userInfo.get("nickname"));
  		System.out.println("###email#### : " + userInfo.get("email"));
  		
  		

      		 int kakaoResult = mService.countKakao(userInfo);
      		 
      		 int memberResult = mService.countMember(userInfo);
      		 
      		 if(memberResult > 0) {
      			 throw new MemberException("?????? ??????????????? ????????? ?????????.");
      			 
    
      		 }else if(kakaoResult > 0) {
      		
      			 session.setAttribute("access_Token", access_Token);
      
      			 Member kakaoMember = mService.selectKakao(userInfo);
      			 
      			 session.setAttribute("access_Token", access_Token);
      			 
      			 model.addAttribute("loginUser", kakaoMember);
      			 
      			 return "redirect:home.do";
      			 
      		 }else {
      			 
      			 model.addAttribute("userInfo", userInfo);
      			 
      			 return "kakaoMemberLogin";
      		 }
      	
      	}

  	
  	
  	// ????????? ????????????
  	@RequestMapping("kakaoUserInfo.me")
  	public String kakaoUserInfo(@ModelAttribute("member") Member m, @RequestParam("address") String address, 
  								@RequestParam("address_detail") String addressDetail, Model model) {
  		
  		m.setAddress(address + " " + addressDetail);
  		m.setUserPwd("kakao123");
  		
  		System.out.println(m);
  		
  		String encPwd = bcrypt.encode(m.getUserPwd());
  		m.setUserPwd(encPwd);
  		
  		int result = mService.insertkakao(m);
  		Member loginUser = mService.kakaoLogin(m);
  		
  		if(result > 0) {
  			model.addAttribute("loginUser", loginUser);
  			System.out.println(loginUser);
  			return "redirect:home.do";
  		}else {
  			model.addAttribute("msg", "??????????????? ?????????????????????.");
  			return "../common/errorPage";
  		}
  		
  	}
  	// ?????? ????????????
  	@RequestMapping(value="minsert.me" ,  method=RequestMethod.POST)
  	public String insertMember(@ModelAttribute Member m, @RequestParam("uploadFile") MultipartFile uploadFile,
  			@RequestParam("address1") String address1, @RequestParam("address_detail") String address_detail
  			, HttpServletRequest request) {
  		
  		
//  		System.out.println(m);
//  		System.out.println(filePath + "/" + address1 + "/" + address_detail);
  		
  		
  		String encPwd = bcrypt.encode(m.getUserPwd());
  		
  		m.setUserPwd(encPwd);
  		m.setAddress(address1 + "/" + address_detail);
  		
  		
  		if(uploadFile != null && !uploadFile.isEmpty()) {
//  			String root = request.getSession().getServletContext().getRealPath("resources");
//  		    String savePath = root + "\\profileUploadFiles";
  		    
  			String changeName = saveFile(uploadFile, request);
  			
  			
  			m.setOriginName(uploadFile.getOriginalFilename());
  			m.setChangeName(changeName);
  			
  		}
  		System.out.println(m);
  		
  		int result = mService.insertMember(m);
  		System.out.println(result);
  		if(result > 0) {
  			return "redirect:home.do";
  		} else {
  			return "../common/errorPage";
  		}
  	}
  	
//  	public String saveFile(MultipartFile file, HttpServletRequest request, String savePath) {
//  	    
//  	    
//  	    File folder = new File(savePath);
//  	    
//  	    if(!folder.exists()) {
//  	       folder.mkdirs();
//  	    }
//  	    
//  	    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
//  	    String originName = file.getOriginalFilename();
//  	    String changeName = sdf.format(new Date(System.currentTimeMillis())) + originName.substring(originName.lastIndexOf("."));
//  	    
//  	    System.out.println(originName);
//  	    System.out.println(changeName);
//  	    
//  	    String filePath = folder + "\\" + changeName;
//  	    System.out.println(filePath);
//  	    
//  	    try {
//  	       file.transferTo(new File(filePath));
//  	    } catch (IllegalStateException e) {
//  	       e.printStackTrace();
//  	    } catch (IOException e) {
//  	       e.printStackTrace();
//  	    }
//  	    
//  	    return changeName;
//  	 }
  		


  	// ID(email)????????????
  	@RequestMapping("dupId.me")
  	public void duplicateId(@RequestParam("id") String id, HttpServletResponse response) {
  		//System.out.println(id);
  		
  		int result = mService.checkId(id);
  		
  		try {
  			response.getWriter().print(result);
  		} catch (IOException e) {
  			e.printStackTrace();
  		}
  	}
  	
  	
  	
  	
  	// ????????? ????????????
  	@RequestMapping("dupNick.me")
  	public void duplicatedNick(@RequestParam("nickName") String nickName, HttpServletResponse response) {
  		
  		int result = mService.checkNick(nickName);
  		
  		try {
  			response.getWriter().print(result);
  		} catch (IOException e) {
  			e.printStackTrace();
  		}
  	}
  	

  	
  			////////////////////////////////////////   ???????????? ??????????????? ??????   ////////////////////////////////////////
	
  	
  	//  ??????????????????
	@RequestMapping("updateMyInfo.me")
	public ModelAndView updateMyInfo(ModelAndView mv, HttpSession session) {
		mv.setViewName("updateMyInfo");
		return mv;
	}
	
	// ?????? ??? ?????? ?????? 
	@RequestMapping("myReview.me")
	public ModelAndView myReview(@RequestParam(value="page", required=false) Integer page, 
								 ModelAndView mv, HttpSession session) {
		
		String email = ((Member)session.getAttribute("loginUser")).getEmail();
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mService.getWrittenReviewListCount(email);
		PageInfo pi = MemberPagination.getPageInfo(currentPage, listCount);
		ArrayList<TripReview> list = mService.getWrittenReviewList(email, pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("myReviewListForm");
		} else {
			mv.addObject("msg", "?????? ??? ?????? ??? ????????? ?????????????????????");
			mv.setViewName("../common/errorPage");
		}
		
		return mv;
	}
	
	// ?????? ??? ?????? ??????
	@RequestMapping("myReply.me")
	public ModelAndView myReply(@RequestParam(value="page", required=false) Integer page,
								ModelAndView mv, HttpSession session) {
		
		String email = ((Member)session.getAttribute("loginUser")).getEmail();
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mService.getWrittenGoodsReviewListCount(email);
		
		PageInfo pi = MemberPagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Reply> list = mService.getWrittenGoodsReviewList(email, pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("myReplyListForm");
		} else {
			mv.addObject("msg", "?????? ??? ?????? ?????? ????????? ?????????????????????");
			mv.setViewName("../common/errorPage");
		}
		
		return mv;
	}
	
	// ?????? ??? ?????? ???
	@RequestMapping("myPost.me")
	public ModelAndView myPost(@RequestParam(value="page", required=false) Integer page,
							   ModelAndView mv, HttpSession session) {
		String email = ((Member)session.getAttribute("loginUser")).getEmail();
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mService.getWrittenTripListCount(email);
		
		PageInfo pi = MemberPagination.getPageInfo(currentPage, listCount);
		
		ArrayList<TripBoard> list = mService.getWrittenTripList(email, pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("myPostListForm");
		} else {
			mv.addObject("msg", "?????? ??? ?????? ??? ????????? ?????????????????????");
			mv.setViewName("../common/errorPage");
		}
		return mv;
	}
	
	// 6/24 ?????? ????????? 6/25 mNo ???????????? ?????????
	@RequestMapping(value="travelReview.me")
	public String travelReview(@RequestParam(value="page", required=false) Integer page, 
							   @RequestParam(value="mNo", required=false) Integer mNo, 
							   @RequestParam(value="nickname", required=false) String nickname, 
							   Model model, HttpSession session) {

		int myMNo = ((Member)session.getAttribute("loginUser")).getMember_no();

		if(mNo == null) {
			mNo = myMNo;
		} 
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mService.getReviewListCount(mNo);
		PageInfo pi = MemberPagination.getPageInfo(currentPage, listCount);
		ArrayList<TripReview> list = mService.getReviewList(mNo, pi);
		Member m = mService.selectMember(mNo);
		
		if(list != null) {
			model.addAttribute("m", m);
			model.addAttribute("nickname", nickname);
			model.addAttribute("mNo", mNo);
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			return "reviewForUserForm";
		} else {
			model.addAttribute("msg", "????????? ?????? ????????? ?????????????????????");
			return "../common/errorPage";
		}
		
	}
	
	// 6/26 ?????? ?????? ?????????
	@RequestMapping("reportTo.me")
	public ModelAndView myReport(HttpSession session, ModelAndView mv) {
		
		String email = ((Member)session.getAttribute("loginUser")).getEmail();
		
		ArrayList<Report> list = mService.selectReportToMe(email);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.setViewName("myReportListForm");
		} else {
			mv.addObject("msg", "?????? ?????? ????????? ?????????????????????");
			mv.setViewName("../common/errorPage");
		}
		
		return mv;
	}
	
	// 6/23 ?????? ????????? ?????? ????????? ?????? ?????????
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		// ?????? ???????????? ?????? ??????? webapp/resources/profileUploadFiles
		// ?????? ????????? ?????? request ????????????
		// \\??? ?????? ?????? \profileUploadFiles??? ????????????. ??????????????? ????????? ??? ??? ??? ???
		// ?????? ?????? without publishing
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\profileUploadFiles";
		System.out.println("root : " + root);
		System.out.println("savePath : " + savePath);

		// ????????? ???????????? ????????? ????????? 
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		// ?????? ?????? ??????
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");

								//   ?????? ????????? ?????? ?????? ?????? ???????????? ?????????
		String originFileName = file.getOriginalFilename();
		// ????????? ?????? ?????? ?????? + ?????? ?????? ?????? ?????? ????????? ??????????????? ????????????
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + originFileName.substring(originFileName.lastIndexOf("."));
		
		// ?????? ?????? ????????? ??????
		String renamePath = folder + "\\" + renameFileName;
//		System.out.println(renamePath);
		
		try {
			// ????????? ?????????, ????????? ?????? ????????? ??????
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return renameFileName;
	}
	
	// 6/23 ?????? ????????? ?????? ?????????
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\profileUploadFiles";
		
		// File???????????? ????????? ????????? ??????????????? ????????? ?????? ????????? ?????? ??????????????? ???????????? ????????? File??? ????????????
		File f = new File(savePath + "\\" + fileName);
		// ????????? ???????????? ??? ???????????? ??????, ????????? ?????????
		if(f.exists()) {
			f.delete();
		}
	}
	
	
	// 6/22 ?????? ??????
	@RequestMapping("deleteUser.me")
	public String deleteUser(Model model) {
		String email = ((Member)model.getAttribute("loginUser")).getEmail();
		
		int result = mService.deleteUser(email);
		
		if(result > 0) {
			return "redirect:logout.me";
		} else {
			model.addAttribute("msg", "?????? ????????? ?????????????????????");
			return "../common/errorPage";
		}
	}
	
	// 6/22 ?????? ??????
	@RequestMapping(value="userUpdate.me")
	public String updateUser(@ModelAttribute Member m, 
							 @RequestParam("reloadFile") MultipartFile reloadFile,
							 HttpServletRequest request, Model model) {
		String pwd = ((Member)model.getAttribute("loginUser")).getUserPwd();
		m.setUserPwd(pwd);
		
		// ?????? ????????? ????????? ?????????
		if(reloadFile != null && !reloadFile.isEmpty()) {
			
			// ?????? ????????? ?????? ?????? ?????? ???????????? ?????? ????????? ??????
			if(m.getChangeName() != null) {
				deleteFile(m.getChangeName(), request);
			}
			
			// ?????? ????????? ????????? ?????? ????????? ?????? ??????
			String changeName = saveFile(reloadFile, request);
			m.setOriginName(reloadFile.getOriginalFilename());
			m.setChangeName(changeName);
			
		}
		
		int result = mService.updateUser(m);
		
		// ?????? ???????????? ?????? ????????? ?????? ????????????
		String enrollType = ((Member)model.getAttribute("loginUser")).getEnrollType();
		Member loginUser;
		if(enrollType.equalsIgnoreCase("w")) {
			loginUser = mService.login(m);
		} else {
			loginUser = mService.kakaoLogin(m);
		}
		
		System.out.println("????????? ?????? : " + loginUser);
		
		if(result > 0) {
			model.addAttribute("loginUser", loginUser);
			return "redirect:updateMyInfo.me";
		} else {
			model.addAttribute("msg", "?????? ?????? ????????? ?????????????????????");
			return "../common/errorPage";
		}
	}
	
	// 6/23 ?????? ?????? ??????
	@RequestMapping(value="pwdCheck.me")
	public void pwdCheck(@RequestParam("currentPwd") String currentPwd, 
							@RequestParam("userEmail") String userEmail,
							HttpServletResponse response) {
		
		Member m = new Member();
		m.setUserPwd(currentPwd);
		m.setEmail(userEmail);
		
		int result = mService.checkUserPwd(m);
		
		try {
			PrintWriter pw = response.getWriter();
			pw.print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 6/25?????? ??????
	@RequestMapping("pwdUpdate.me")
	public String pwdUpdate(@RequestParam("newPwd") String newPwd,
							Model model) {
		
		Member m = (Member)model.getAttribute("loginUser");
		
		m.setUserPwd(newPwd);
		
		int result = mService.pwdUpdate(m);
		
		if(result > 0) {
			m.setUserPwd(newPwd);
			model.addAttribute("loginUser", m);
			return "redirect:updateMyInfo.me";
		} else {
			model.addAttribute("msg", "???????????? ????????? ?????????????????????");
			return "../common/errorPage";
		}
	}
	
	// 6/26 ?????? ?????? ??????
	@RequestMapping(value="insertReview.me")
	public ModelAndView insertReview(@RequestParam(value="mNo", required=false) Integer mNo,
							   @RequestParam("email") String email,
							   @RequestParam("reviewContent") String review_content,
							   HttpSession session , ModelAndView mv) {
		
		if(mNo == null) {
			mNo = ((Member)session.getAttribute("loginUser")).getMember_no();
		}
		
		String review_writer = ((Member)session.getAttribute("loginUser")).getEmail();
		
		TripReview trv = new TripReview();
		trv.setReview_content(review_content);
		trv.setReview_writer(review_writer);
		trv.setEmail(email);
		
		int result = mService.insertReview(trv);
		
		if(result > 0) {
			mv.addObject("mNo", mNo);
			mv.setView(new RedirectView("travelReview.me"));			//????????? ?????? redirect?????? get??????
		} else {
			mv.addObject("msg", "????????? ?????? ????????? ?????????????????????");
			mv.setViewName("../common/errorPage");
		}
		
		return mv;
		
	}
	
	// 6/26 ?????? ?????? ??????
	@RequestMapping(value="insertReport.me")
	public ModelAndView insertReport(@RequestParam("reported") String reported,
							   @RequestParam("reportReason") String reportReason,
							   @RequestParam("reportOption") int reportOption,
							   HttpSession session, @RequestParam("mNo") int mNo,
							   ModelAndView mv) {
		
		String reporter = ((Member)session.getAttribute("loginUser")).getEmail();
		
		Report r = new Report();
		r.setRcate_no(reportOption);
		r.setReport_content(reportReason);
		r.setReport_user(reporter);
		r.setTarget_user(reported);
		
		int result = mService.insertReport(r);
		
		if(result > 0) {
			mv.addObject("mNo", mNo);
			mv.setViewName("redirect:travelReview.me");
		} else {
			mv.addObject("msg", "?????? ????????? ?????????????????????");
			mv.setViewName("../common/errorPage");
		}
		return mv;
	}
	
	// 07-04 ?????? ?????? ??????
	@RequestMapping("myOrder.me")
	public ModelAndView myOrder(ModelAndView mv, HttpSession session, 
								@RequestParam(value="page", required=false) Integer page) {
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		String email = ((Member)session.getAttribute("loginUser")).getEmail();
		
		int listCount = mService.selectMyOrderListCount(email);
		
		PageInfo pi = MemberPagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Order> list = mService.selectMyOrderList(email, pi);
		
		System.out.println(list);
		
		if(list != null) {
			mv.addObject("pi", pi);
			mv.addObject("list", list);
			mv.setViewName("myOrderList");
		} else {
			mv.addObject("msg", "?????? ?????? ????????? ?????????????????????");
			mv.setViewName("../common/errorPage");
		}
		
		return mv;
	}
	
}
