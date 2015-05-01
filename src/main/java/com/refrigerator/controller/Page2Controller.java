package com.refrigerator.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/page2")
public class Page2Controller {
	static Log log = LogFactory.getLog(Page2Controller.class);

	@RequestMapping(value={"","/"}, method=RequestMethod.GET)
	public String register() {  
		log.info("#################################################");
		log.info("PAGE2");
		log.info("#################################################");
		
		return "main/page2"; 
	}

}
