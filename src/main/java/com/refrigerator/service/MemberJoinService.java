package com.refrigerator.service;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.stereotype.Service;

import com.refrigerator.dao.MemberDao;
import com.refrigerator.model.Member;

@Service
public class MemberJoinService {
	MemberDao memberDao;
	DataSource dataSource;

	public void setMemberDao(MemberDao dao) {
		memberDao = dao;
	}
	public void setDataSource(DataSource ds) {
		dataSource = ds;
	}
	public void joinMember(Member member) {
		memberDao.joinMember(member);
	}
	public List<Member> getMembers() {
		
		List<Member> members = memberDao.selectAll(); 
		return members;
	}
}
