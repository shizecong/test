package com.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@RequestMapping("/login")
	public String Login(HttpServletRequest request, HttpServletResponse response) {
		String userName = request.getParameter("userName");
		request.getSession().setAttribute("userName", userName);
		return "index";
	}
}
