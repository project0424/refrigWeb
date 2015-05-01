package com.refrigerator.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.refrigerator.model.Member;
import com.refrigerator.service.MemberJoinService;

@Controller
@RequestMapping("/login")
public class LoginController {
	static Log log = LogFactory.getLog(LoginController.class);

	@Autowired
	DataSource datasource;
	@Autowired
	MemberJoinService service;
	
	@RequestMapping(value={"","/"}, method=RequestMethod.GET) 
	public String loginPage() {  
		log.info("#################################################");
		log.info("로그인 PAGE");
		log.info("#################################################");
		
		return "home"; 
	}

	@RequestMapping(value={"","/"}, method = RequestMethod.POST)
	public String login(Member member, HttpSession session) { 

		log.info("####################################");
		log.info("join()");
		log.info("email = " + member.getEmail());
		log.info("password = " + member.getPassword());
		log.info("####################################");

		List<Member> members = service.getMembers();
		for (Member m : members) {
			log.info("#####################################");
			log.info(m.getEmail() + " : " + member.getEmail());
			log.info(m.getPassword() + " : " + member.getPassword());
			log.info("#####################################");
			if( m.getEmail().equals(member.getEmail()) && m.getPassword().equals(member.getPassword())){
				session.setAttribute("member", member);
				return "main/main";
			}
		}
		session.setAttribute("msg", "email 또는 password를 잘못 입력하셨습니다");
		return "redirect:login";
		
//		if ("webapp".equals(member.getEmail()) && "1234".equals(member.getPassword())) {
//				// Login success
//				session.setAttribute("member", member);
//				return "main/main";
//			} else {
//				// Login Fail
//				return "redirect:login";
//			}
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "home";
	}

}








