package com.withtrip.WithTrip;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.withtrip.WithTrip.trip.model.service.TripService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private TripService tService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public ModelAndView home(Model model, ModelAndView mv, @ModelAttribute com.withtrip.WithTrip.trip.model.vo.TripBoard t, Locale locale) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		System.out.println("formattedDate"+formattedDate);
		int trip = 1;
		ArrayList<com.withtrip.WithTrip.trip.model.vo.TripBoard> tlist = tService.mainSelectList(trip);
		System.out.println(tlist);
		if(tlist != null) {
			model.addAttribute("serverTime", formattedDate );
			mv.addObject("tlist", tlist);
			mv.setViewName("home");
		}
		
		return mv;
	}
	   // 개인정보처리방침
	   @RequestMapping("privacy.do")
	   public String privacy() {
	      return "privacy";
	   }
	   
	   // 이용약관
	   @RequestMapping("service.do")
	   public String service() {
	      return "service";
	   }
	   
	   // 취소 및 환불 정책
	   @RequestMapping("refund.do")
	   public String refund() {
	      return "refund";
	   }
}
