package com.refrigerator.controller;

import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.refrigerator.model.Member;
import com.refrigerator.model.MemberResult;
import com.refrigerator.service.MemberJoinService;

@Controller
@RequestMapping("/home")
public class HomeController {
	static Log log = LogFactory.getLog(HomeController.class);

	@RequestMapping(value={"","/"}, method=RequestMethod.GET)
	public String register() {  
		log.info("#################################################");
		log.info("HOME PAGE");
		log.info("#################################################");
		
		return "home"; 
	}

}
