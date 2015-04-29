package com.refrigerator.dao;

import java.util.List;

import javax.sql.DataSource;

import com.refrigerator.model.Member;

public interface MemberDao {

	public void setDataSource(DataSource ds);

	public void joinMember(Member member);
	
//	public Member selectByDeptnoWithEmps(Integer deptno);
//	
//	/*
//	 * Multiple row
//	 */
	public List<Member> selectAll();
//	public List<Member> selectAllWithEmps();

}
