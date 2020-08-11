package com.shepe.admin.member.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.client.member.MemberVO;
import com.shepe.commons.Criteria;

@Repository
public class Admin_MemberDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 회원 목록 조회
	public List<MemberVO> memberList(Criteria cri) {
		return mybatis.selectList("MemberDAO.listPage", cri);
	}
	
	// 게시물 갯수
	public int listCount() throws Exception {
		return mybatis.selectOne("MemberDAO.listCount");
	}
	
	// 게시물 조회
	public MemberVO read(int member_sq) throws Exception {
		return mybatis.selectOne("MemberDAO.read", member_sq);
	}
	
	// 회원 정보 수정
	public void update(MemberVO memberVO) throws Exception {
		mybatis.update("MemberDAO.update", memberVO);
	}

	// 회원 삭제
	public void delete(int member_sq) throws Exception {
		mybatis.delete("MemberDAO.delete", member_sq);
	}
	
	// 생년월일별 그래프
	public List<MemberVO> getBirthChart(MemberVO vo) {		
		return mybatis.selectList("MemberDAO.getBirthChart", vo);
	}
	
	// 날짜별 가입 된 회원 수 확인(그래프)
	public List<MemberVO> searchMemberBirthCount(MemberVO vo) {		
		return mybatis.selectList("MemberDAO.searchMemberBirthCount", vo);
	}
	
	// 연령대별 회원수(그래프)
	public List<MemberVO> searchMemberAgeCount(MemberVO vo) {		
		return mybatis.selectList("MemberDAO.searchMemberAgeCount", vo);
	}
	
	// 날짜별 로그인 한 회원수(그래프)
	public List<MemberVO> getMemberByLogin(MemberVO vo) {
		return mybatis.selectList("MemberDAO.getMemberByLogin", vo);
	}
	
	
}
