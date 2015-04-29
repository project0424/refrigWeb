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
@RequestMapping("/join")
public class JoinController {
	static Log log = LogFactory.getLog(JoinController.class);

	@Autowired
	DataSource datasource;
	@Autowired
	MemberJoinService service;
	
	@RequestMapping(value={"","/"}, method=RequestMethod.GET)
	public String register() {  
		log.info("#################################################");
		log.info("회원가입 PAGE");
		log.info("#################################################");
		
		return "join/join"; 
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	@ResponseBody
	public MemberResult join(Member member) { 

		log.info("####################################");
		log.info("join()");
		log.info("email = " + member.getEmail());
		log.info("name = " + member.getName());
		log.info("password = " + member.getPassword());
		log.info("####################################");

		boolean check = true;
		
		MemberResult result = new MemberResult();
		
		try {
			List<Member> members = service.getMembers();
			for (Member m : members) {
				log.info("##########################");
				log.info(m.getEmail() + " ? " + member.getEmail());
				log.info("##########################");
				if(m.getEmail().equals(member.getEmail())) {
					check = false;
				}
			}
			log.info("##########################");
			log.info(check);
			log.info("##########################");
			if(check){
				service.joinMember(member);
				result.setMember(member);
				result.setStatus(true);
				result.setStatusText("회원가입 성공");
			} else {
				result.setStatus(false);
				result.setStatusText("이미 가입된  email주소입니다.");
			}
		} catch (DataAccessException e) {
			result.setStatus(false);
			result.setStatusText("실패" + e.getMessage());
		}
		
//		List<Member> members = new ArrayList<Member>();
//		Member m1 = new Member("1234@asdf.com", "12345", "asdf");
//		members.add(m1);
//		
//		for (Member m : members) {
//			if(m.getEmail() == member.getEmail())
//				check = false;
//		}
//		if (check) {
//			members.add(member);
//			result.setStatus(true);
//			result.setStatusText("성공");
//		} else {
//			result.setStatus(false);
//			result.setStatusText("실패");
//		}
			
		
//		JdbcTemplate template = new JdbcTemplate(dataSource);

//		String sql = "insert into emp (empno, ename) values (?,?)";

//		try {
//			template.update(sql, emp.getEmpno(), emp.getEname());
//			result.setStatus(true);
//			result.setStatusText("OK");
//		} catch (DataAccessException e) {
//			result.setStatus(false);
//			result.setStatusText(e.getMessage());
//		}
		return result;
	}

}
