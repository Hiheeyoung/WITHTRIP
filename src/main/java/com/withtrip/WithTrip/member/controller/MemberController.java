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
	
	// 로그인 뷰
	@RequestMapping("loginView.me")
	public String loginView() {
		return "login";
	}
	
	   // 일반 로그인
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
//	          mv.addObject("msg", "로그인에 실패하였습니다");
//	          mv.setViewName("../common/errorPage");
//	      }
//	      return mv;
//	      
//	   }
	
	   // 일반 로그인 알림창
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
	   
	   
	// 아이디 찾기 뷰
	@RequestMapping("findId.me")
	public String findId() {
		return "findId";
	}
		
	// 아이디 찾기
	@RequestMapping("checkId.me")
	public String checkId(@ModelAttribute("member")Member m, Model model) {
		
		Member member = mService.findId(m);
		
		if(member != null) {
			model.addAttribute("member", member);
			
		}else {
			throw new MemberException("이메일을 확인해주세요");
			
		}
		
		return "findId";
	}
	
	// 비밀번호 찾기 뷰
	@RequestMapping("findPwd.me")
	public String findPwd() {
		return "findPwd";
	}
	
	//이메일 인증
    @RequestMapping(value="checkPwd.me", method=RequestMethod.GET)
    public void mailCheckGET(@RequestParam("myEmail") String myEmail, HttpServletResponse response){
       
  
        System.out.println(myEmail);
        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        String newPwd = "";
        
        newPwd = checkNum + "!" + "z" + "D";
        
        System.out.println(newPwd);
        
        /* 이메일 보내기 */
        String setFrom = "with__trip@naver.com";
        String toMail = myEmail;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "새로운 비밀번호는 " + newPwd + "입니다." + 
                "<br>" + 
                "해당 비밀번호로 로그인해주세요.";
        
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

	//  로그아웃
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
    
  //카카오 로그인
  	@RequestMapping(value="kakao.me", method=RequestMethod.GET)
  	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, Model model, HttpSession session){
  		System.out.println("#########" + code);
  		
  		/*
  		 * 리턴값의 testPage는 아무 페이지로 대체해도 괜찮습니다.
  		 * 없는 페이지를 넣어도 무방합니다.
  		 * 404가 떠도 제일 중요한건 #########인증코드 가 잘 출력이 되는지가 중요하므로 너무 신경 안쓰셔도 됩니다.
  		 */
  		
  		String access_Token = mService.getAccessToken(code);
  		
  		HashMap<String, Object> userInfo = mService.getUserInfo(access_Token);
  		System.out.println("###access_Token#### : " + access_Token);
  		System.out.println("###nickname#### : " + userInfo.get("nickname"));
  		System.out.println("###email#### : " + userInfo.get("email"));
  		
  		

      		 int kakaoResult = mService.countKakao(userInfo);
      		 
      		 int memberResult = mService.countMember(userInfo);
      		 
      		 if(memberResult > 0) {
      			 throw new MemberException("일반 회원가입된 이메일 입니다.");
      			 
    
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

  	
  	
  	// 카카오 회원가입
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
  			model.addAttribute("msg", "회원가입에 실패하였습니다.");
  			return "../common/errorPage";
  		}
  		
  	}
  	// 일반 회원가입
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
  		


  	// ID(email)중복확인
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
  	
  	
  	
  	
  	// 닉네임 중복확인
  	@RequestMapping("dupNick.me")
  	public void duplicatedNick(@RequestParam("nickName") String nickName, HttpServletResponse response) {
  		
  		int result = mService.checkNick(nickName);
  		
  		try {
  			response.getWriter().print(result);
  		} catch (IOException e) {
  			e.printStackTrace();
  		}
  	}
  	

  	
  			////////////////////////////////////////   여기부터 마이페이지 관련   ////////////////////////////////////////
	
  	
  	//  개인정보수정
	@RequestMapping("updateMyInfo.me")
	public ModelAndView updateMyInfo(ModelAndView mv, HttpSession session) {
		mv.setViewName("updateMyInfo");
		return mv;
	}
	
	// 내가 쓴 동행 후기 
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
			mv.addObject("msg", "내가 쓴 동행 글 조회에 실패하였습니다");
			mv.setViewName("../common/errorPage");
		}
		
		return mv;
	}
	
	// 내가 쓴 용품 후기
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
			mv.addObject("msg", "내가 쓴 용품 후기 조회에 실패하였습니다");
			mv.setViewName("../common/errorPage");
		}
		
		return mv;
	}
	
	// 내가 쓴 동행 글
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
			mv.addObject("msg", "내가 쓴 동행 글 조회에 실패하였습니다");
			mv.setViewName("../common/errorPage");
		}
		return mv;
	}
	
	// 6/24 후기 뿌리기 6/25 mNo 추가하여 수정함
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
			model.addAttribute("msg", "동행자 후기 조회에 실패하였습니다");
			return "../common/errorPage";
		}
		
	}
	
	// 6/26 신고 내역 뿌리기
	@RequestMapping("reportTo.me")
	public ModelAndView myReport(HttpSession session, ModelAndView mv) {
		
		String email = ((Member)session.getAttribute("loginUser")).getEmail();
		
		ArrayList<Report> list = mService.selectReportToMe(email);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.setViewName("myReportListForm");
		} else {
			mv.addObject("msg", "신고 내역 조회에 실패하였습니다");
			mv.setViewName("../common/errorPage");
		}
		
		return mv;
	}
	
	// 6/23 파일 저장을 위한 사용자 정의 메소드
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		// 파일 저장소로 쓰일 곳은? webapp/resources/profileUploadFiles
		// 경로 접근을 위해 request 받아오기
		// \\두 개를 써야 \profileUploadFiles로 인식된다. 이스케이프 문자로 두 개 쓴 것
		// 서버 설정 without publishing
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\profileUploadFiles";
		System.out.println("root : " + root);
		System.out.println("savePath : " + savePath);

		// 폴더가 존재하지 않으면 만들기 
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		// 파일 이름 형식
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");

								//   원래 가지고 있던 파일 이름 가져오는 메소드
		String originFileName = file.getOriginalFilename();
		// 새로운 파일 이름 형식 + 원래 갖고 있던 파일 이름의 확장자까지 붙여주기
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + originFileName.substring(originFileName.lastIndexOf("."));
		
		// 이름 바뀐 파일의 경로
		String renamePath = folder + "\\" + renameFileName;
//		System.out.println(renamePath);
		
		try {
			// 수신된 파일을, 지정된 대상 파일로 전송
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return renameFileName;
	}
	
	// 6/23 파일 삭제를 위한 메소드
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\profileUploadFiles";
		
		// File클래스가 파일에 관련된 메소드들을 가지고 있기 때문에 해당 메소드들을 활용하기 위해서 File에 담아준다
		File f = new File(savePath + "\\" + fileName);
		// 파일이 존재하는 지 확인부터 하고, 있으면 지우기
		if(f.exists()) {
			f.delete();
		}
	}
	
	
	// 6/22 회원 탈퇴
	@RequestMapping("deleteUser.me")
	public String deleteUser(Model model) {
		String email = ((Member)model.getAttribute("loginUser")).getEmail();
		
		int result = mService.deleteUser(email);
		
		if(result > 0) {
			return "redirect:logout.me";
		} else {
			model.addAttribute("msg", "회원 탈퇴에 실패하였습니다");
			return "../common/errorPage";
		}
	}
	
	// 6/22 회원 수정
	@RequestMapping(value="userUpdate.me")
	public String updateUser(@ModelAttribute Member m, 
							 @RequestParam("reloadFile") MultipartFile reloadFile,
							 HttpServletRequest request, Model model) {
		String pwd = ((Member)model.getAttribute("loginUser")).getUserPwd();
		m.setUserPwd(pwd);
		
		// 새로 등록한 파일이 있으면
		if(reloadFile != null && !reloadFile.isEmpty()) {
			
			// 기존 파일이 있을 때는 파일 저장소에 있는 파일을 삭제
			if(m.getChangeName() != null) {
				deleteFile(m.getChangeName(), request);
			}
			
			// 기존 파일이 없으면 새로 등록한 파일 저장
			String changeName = saveFile(reloadFile, request);
			m.setOriginName(reloadFile.getOriginalFilename());
			m.setChangeName(changeName);
			
		}
		
		int result = mService.updateUser(m);
		
		// 현재 로그인한 회원 정보도 함께 업데이트
		String enrollType = ((Member)model.getAttribute("loginUser")).getEnrollType();
		Member loginUser;
		if(enrollType.equalsIgnoreCase("w")) {
			loginUser = mService.login(m);
		} else {
			loginUser = mService.kakaoLogin(m);
		}
		
		System.out.println("수정된 멤버 : " + loginUser);
		
		if(result > 0) {
			model.addAttribute("loginUser", loginUser);
			return "redirect:updateMyInfo.me";
		} else {
			model.addAttribute("msg", "회원 정보 수정에 실패하였습니다");
			return "../common/errorPage";
		}
	}
	
	// 6/23 현재 비번 확인
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
	
	// 6/25비번 변경
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
			model.addAttribute("msg", "비밀번호 변경에 실패하였습니다");
			return "../common/errorPage";
		}
	}
	
	// 6/26 회원 후기 등록
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
			mv.setView(new RedirectView("travelReview.me"));			//이것도 결국 redirect라서 get방식
		} else {
			mv.addObject("msg", "동행자 후기 등록에 실패하였습니다");
			mv.setViewName("../common/errorPage");
		}
		
		return mv;
		
	}
	
	// 6/26 회원 신고 등록
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
			mv.addObject("msg", "회원 신고에 실패하였습니다");
			mv.setViewName("../common/errorPage");
		}
		return mv;
	}
	
	// 07-04 주문 내역 확인
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
			mv.addObject("msg", "주문 내역 조회에 실패하였습니다");
			mv.setViewName("../common/errorPage");
		}
		
		return mv;
	}
	
}
