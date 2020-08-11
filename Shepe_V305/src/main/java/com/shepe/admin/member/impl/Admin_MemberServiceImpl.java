package com.shepe.admin.member.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shepe.admin.member.Admin_MemberService;
import com.shepe.client.member.MemberVO;
import com.shepe.commons.Criteria;

@Service
public class Admin_MemberServiceImpl implements Admin_MemberService {
	
	@Autowired
	private Admin_MemberDAOMybatis adminDAO;
	
	// 회원 리스트 조회
	@Override
	public List<MemberVO> adminMemberList(Criteria cri) throws Exception {
		return adminDAO.memberList(cri);
	}
	
	// 리스트 갯수
	@Override
	public int listCount() throws Exception {
		return adminDAO.listCount();
	}

	// 회원 목록 조회
	@Override
	public MemberVO read(int member_sq) throws Exception {
		return adminDAO.read(member_sq);
	}
	
	// 회원 정보 수정
	@Override
	public void update(MemberVO memberVO) throws Exception {
		adminDAO.update(memberVO);
		
	}
	
	// 회원 삭제
	@Override
	public void delete(int member_sq) throws Exception {
		adminDAO.delete(member_sq);
		
	}
	
	// 생년월일별 그래프
	@Override
	public List<MemberVO> getBirthChart(MemberVO vo) throws Exception {
		return adminDAO.getBirthChart(vo);
	}

	// 날짜별 가입 된 회원 수 확인(그래프)
	@Override
	public List<MemberVO> searchMemberBirthCount(MemberVO vo) throws Exception {		
		return adminDAO.searchMemberBirthCount(vo);
	}
	
	// 연령대별 회원수(그래프)
	@Override
	public List<MemberVO> searchMemberAgeCount(MemberVO vo) throws Exception {		
		return adminDAO.searchMemberAgeCount(vo);
	}
	
	// 날짜별 로그인 한 회원수(그래프)
	@Override
	public List<MemberVO> getMemberByLogin(MemberVO vo) throws Exception {
		return adminDAO.getMemberByLogin(vo);
	}
	
	
	
}
