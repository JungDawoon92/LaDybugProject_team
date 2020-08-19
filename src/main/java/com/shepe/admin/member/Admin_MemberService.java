package com.shepe.admin.member;

import java.util.List;

import com.shepe.client.member.MemberVO;
import com.shepe.commons.Criteria;

public interface Admin_MemberService {
		
	// 회원 리스트 조회
	public List<MemberVO> adminMemberList(Criteria cri) throws Exception;
	
	// 리스트 갯수
	public int listCount() throws Exception;
	
	// 회원 조회
	public MemberVO read(int member_sq) throws Exception;
	
	// 회원 정보 수정
	public void update(MemberVO memberVO) throws Exception;

	// 회원 삭제
	public void delete(int member_sq) throws Exception;
	
	// 생년월일별 그래프
	public List<MemberVO> getBirthChart(MemberVO vo) throws Exception;
	
	// 날짜별 가입 된 회원 수 확인(그래프)
	public List<MemberVO> searchMemberBirthCount(MemberVO vo) throws Exception;
	
	// 연령대별 회원수(그래프)
	public List<MemberVO> searchMemberAgeCount(MemberVO vo) throws Exception;

	// 날짜별 로그인 한 회원수(그래프)
	public List<MemberVO> getMemberByLogin(MemberVO vo) throws Exception;
	
}
