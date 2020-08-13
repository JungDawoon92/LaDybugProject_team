package com.shepe.client.member.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.client.member.MemberAddressVO;
import com.shepe.client.member.MemberVO;

@Repository
public class MemberDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 회원 정보 가져오기
	public MemberVO getMember(MemberVO vo) {
		return (MemberVO) mybatis.selectOne("MemberDAO.getMember", vo);
	}
	
	// 회원 정보 가져오기
	public MemberVO getMember(String member_id) {
		return mybatis.selectOne("MemberDAO.getMember", member_id);
	}
	
	// 이메일 인증 여부
	public void verifyMember(MemberVO vo) {
		mybatis.update("MemberDAO.verifyMember",vo);		
	}
	
	// 회원가입
	public void insertMember(MemberVO vo) {
		mybatis.insert("MemberDAO.insertMember", vo);
	}
	
	// 아이디 중복체크
	public int checkOverId(String member_id) {
		return mybatis.selectOne("MemberDAO.checkOverId", member_id);
	}
	
	// 닉네임 중복체크
	public int nickCheck(String member_nickname) {
		return mybatis.selectOne("MemberDAO.nickCheck", member_nickname);
	}
	
	// 로그인
	public MemberVO memberLogin(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.memberLogin", vo);
	}
	
	// 회원정보 수정
	public void memberUpdate(MemberVO vo) {
		mybatis.update("MemberDAO.memberUpdate", vo);
	}
	
	// 회원 정보 삭제
	public void memberDelete() {
		mybatis.delete("MemberDAO.memberDelete");		
	}
	
	// 비밀번호 체크
	public int passChk(MemberVO vo) throws Exception {	
		int result = mybatis.selectOne("MemberDAO.passChk", vo);
		return result;
	}
    
    //email 중복 확인
	public boolean email_check(String member_email) throws Exception {
		String email = mybatis.selectOne("MemberDAO.email_check", member_email);

		// 조건식 ? true일때의 값 : false일때의 값
		return (email == null) ? true : false;

	}
	// 아이디 찾기
	public MemberVO searchID(MemberVO vo){
		return (MemberVO) mybatis.selectOne("MemberDAO.searchID",vo);
	}
	
	// 비밀번호 변경
	public void updatePW(MemberVO vo){
		HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("member_id", vo.getMember_id());
	      map.put("member_password", vo.getMember_password());
	      map.put("member_email", vo.getMember_email());
	      map.put("member_email_domain", vo.getMember_email_domain());
	      
	      System.out.println(vo.getMember_id() + "," + vo.getMember_password() + "," + vo.getMember_email() + "," + vo.getMember_email_domain());
		mybatis.update("MemberDAO.updatePW", map);
	}
	
	// 회원 탈퇴 시 컬럼 업뎃
	public void delUpdate(MemberVO vo) {
		mybatis.update("MemberDAO.delUpdate",vo);
		
	}
	
	// 회원 탈퇴 날짜 기입
	public void delDate(MemberVO vo) {
		mybatis.insert("MemberDAO.delDate", vo);
		
	}
	
	// 로그인 실패 시 카운트 +1
	public void updateFailureCount(String member_id) {
		mybatis.update("MemberDAO.updateFailureCount", member_id);
		
	}
	
	// 로그인 실패 횟수 체크
	public int checkFailureCount(String member_id) {		
		return mybatis.selectOne("MemberDAO.checkFailureCount", member_id);		
	}
	
	// 5회 이상 로그인 실패 시 계정 잠금(로그인 접근 제한)
	public void updateDisabled(String member_id) {
		mybatis.update("MemberDAO.updateDisabled", member_id);		
	}
	
	// 로그인 실패 횟수 초기화(로그인 성공 시)
	public void initializeFailCount(String member_id) {
		mybatis.update("MemberDAO.initializeFailCount", member_id);
		
	}
	
	// 계정 잠금 초기화(비밀번호 찾기 서비스 이용시)
	public void accountLockInitialize(String member_id) {
		mybatis.update("MemberDAO.accountLockInitialize", member_id);
		
	}
	
	// 비밀번호 변경 날짜 90일 지났는지 체크
	public int check90overPW(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.check90overPW", vo);
		
	}
	
	// 비밀번호 변경 날짜 최신화 업데이트
	public void changePWDateInitialize(MemberVO vo) {
		mybatis.update("MemberDAO.changePWDateInitialize", vo);
		
	}
	
	// 로그인 시 로그인 날짜 컬럼에 insert
	public void insertMemberLoginDay(MemberVO vo) {
		mybatis.update("MemberDAO.insertMemberLoginDay", vo);		
	}
	
	// 회원 주소 찾기
	public List<MemberAddressVO> getAddress(MemberAddressVO addrVO) {
		return mybatis.selectList("MemberDAO.getAddress",addrVO);
	}
	
}
