package com.shepe.client.member;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;


public interface MemberService {
		// 회원 정보 가져오기 
		public MemberVO getMember(MemberVO vo);
		
		// 회원 정보 가져오기
		public MemberVO getMember(String member_id);
		
		// 회원 가입
		public void insertMember(MemberVO vo) throws MessagingException, UnsupportedEncodingException;		
		
		// 아이디 중복체크(회원가입 페이지)
		int memberIdCheck(String member_id);
		
		// 닉네임 중복체크(회원가입 페이지)
		int NickCheck(String member_nickname);
		
		// 로그인
		MemberVO login(MemberVO vo);
		
		// 회원정보 수정
		public void memberUpdate(MemberVO vo);
		
		// 회원 탈퇴
		void memberDelete() throws Exception;
		
		// 패스워드 체크
		int passChk(MemberVO vo) throws Exception;
		
		// 인증 메일 발송
		public boolean email_check(String member_email) throws Exception;
		
		// 메일 인증 확인
		public void verifyMember(MemberVO vo);
		
		// 아이디 찾기
		public MemberVO searchID(MemberVO vo);
		
		// 비밀번호 찾기
		public void searchPW(MemberVO vo) throws MessagingException, UnsupportedEncodingException;
		
		// 비밀번호 변경
		public void updatePW(MemberVO vo, HttpServletRequest request) throws MessagingException, UnsupportedEncodingException;
		
		// 회원 탈퇴 시 컬럼 업뎃
		public void delUpdate(MemberVO vo);
		
		// 회원 탈퇴 날짜 기입
		public void delDate(MemberVO vo);
		
		// 로그인 실패 시 카운트 +1
		void countFailure(String member_id);
		
		// 로그인 실패 횟수 체크
	    int checkFailureCount(String member_id);
	    
	    // 5회 이상 로그인 실패 시 계정 잠금(로그인 접근 제한)
	    void isAccountLock(String member_id);
		
	    // 로그인 실패 횟수 초기화(로그인 성공 시)
	 	void countFailureInitialize(String member_id);
	 	
	 	// 계정 잠금 초기화(비밀번호 찾기 서비스 이용시)
	 	void accountLockInitialize(String member_id);
	 	
	 	// 비밀번호 변경 날짜 90일 지났는지 체크  
	 	int check90overPW(MemberVO vo);
	 	
	 	// 비밀번호 변경 날짜 최신화 업데이트
	 	void changePWDateInitialize(MemberVO vo);
	 	
	 	// 로그인 시 로그인 날짜 컬럼에 insert
	 	void insertMemberLoginDay(MemberVO vo);

		List<MemberAddressVO> getAddress(MemberAddressVO addrVO);
}
