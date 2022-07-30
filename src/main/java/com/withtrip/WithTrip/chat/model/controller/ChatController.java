package com.withtrip.WithTrip.chat.model.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.withtrip.WithTrip.trip.model.vo.TripBoard;

@Controller
public class ChatController {
	@RequestMapping(value = "chat.ch", method = { RequestMethod.GET })
	public String chat (@ModelAttribute("tboard") TripBoard tboard, Model model ,HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		System.out.println(tboard);
		model.addAttribute("tboard", tboard);
		
		return "chat";
	}
}
