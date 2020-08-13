package com.shepe.client.member.impl;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.shepe.client.member.MailHandler;
import com.shepe.client.member.MemberAddressVO;
import com.shepe.client.member.MemberService;
import com.shepe.client.member.MemberVO;
import com.shepe.client.member.TempKey;
import com.shepe.client.order.OrderMemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAOMybatis memberDAO;
	@Inject
	JavaMailSender mailSender;
	@Inject
	TempKey tempkey;
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	// 멤버 정보 가져오기
	@Override
	public MemberVO getMember(MemberVO vo) {
		return memberDAO.getMember(vo);
	}
	
	// 멤버 정보 가져오기
	@Override
	public MemberVO getMember(String member_id) {		
		return memberDAO.getMember(member_id);
	}

	// 메일 인증 여부 체크 후 업데이트
	@Override
	public void verifyMember(MemberVO vo) {
		memberDAO.verifyMember(vo);		
	}
	
	// 회원가입 기능
	@Override
	public void insertMember(MemberVO vo) throws MessagingException, UnsupportedEncodingException {
		// 비번 암호화
		String pwd = vo.getMember_password();
		String secretPwd = pwdEncoder.encode(pwd);
		vo.setMember_password(secretPwd);
		memberDAO.insertMember(vo);
		// 이메일 전송
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[이메일 인증]");
		sendMail.setText(new StringBuffer().append("<h1>메일인증</h1>")
				.append("SHEPE에 가입해주셔서 감사합니다.<br><a href='http://localhost:8090/shepe/verify.do?member_email="	+ vo.getMember_email() + "&member_email_domain=" + vo.getMember_email_domain())
				.append("' target='_blank'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("tjrgus0320@gmail.com", "YPnalaly");
		sendMail.setTo(vo.getMember_email() + "@" + vo.getMember_email_domain());
		sendMail.send();
	}
	
	// 아이디 중복 체크
	@Override
	public int memberIdCheck(String member_id) {
		return memberDAO.checkOverId(member_id);		 
	}
	
	// 닉네임 중복 체크
	@Override
	public int NickCheck(String member_nickname) {
		return memberDAO.nickCheck(member_nickname);
	}

	// 로그인
	@Override
	public MemberVO login(MemberVO vo) {
		return memberDAO.memberLogin(vo);	
	}
	
	// 회원 정보 수정
	@Override
	public void memberUpdate(MemberVO vo) {
		memberDAO.memberUpdate(vo);
		
	}
	// 회원 탈퇴
	@Override
	@Scheduled(cron = "0 0/10 * * * *")
	public void memberDelete() throws Exception {		
		memberDAO.memberDelete();
		System.out.println("스케줄러 확인");
	}
	
	// 비밀번호 체크
	@Override
	public int passChk(MemberVO vo) throws Exception {
		int result = memberDAO.passChk(vo);
		return result;
	}
	
	// 이메일 중복 확인
	@Override
	public boolean email_check(String member_email) throws Exception {
		boolean result = memberDAO.email_check(member_email);
		return result;
	}	
	
	// 아이디 찾기
	@Override
	public MemberVO searchID(MemberVO vo) {
		return memberDAO.searchID(vo);
	}
	
	// 비밀번호 찾기
	@Override
	public void searchPW(MemberVO vo) throws MessagingException, UnsupportedEncodingException {
		// 임의의 비밀번호 생성
		String temporaryPWD = tempkey.getKey(10, false);
		String secretPWD = pwdEncoder.encode(temporaryPWD);
		// 임시 비밀번호 생성
		vo.setMember_password(secretPWD);
		memberDAO.updatePW(vo);
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[비밀번호 찾기]");
		sendMail.setText(
				new StringBuffer().append("<h1>임시 비밀번호 발급</h1><br><h3>로그인 후 비밀번호 변경 부탁드립니다.</h3>").append("<b>임시 비밀번호 발급 : " + temporaryPWD + "</b><br>")
						.append("<a href='http://localhost:8090/shepe/index.jsp")
						.append("' target='_blenk'>SHEPE에서 로그인 하기</a>").toString());
		sendMail.setFrom("tjrgus0320@gmail.com", "YPnalaly");
		sendMail.setTo(vo.getMember_email() + "@" + vo.getMember_email_domain());
		sendMail.send();
	}
	
	// 비밀번호 변경
	@Override
	public void updatePW(MemberVO vo, HttpServletRequest request) throws MessagingException, UnsupportedEncodingException {
		// 비번 암호화
		String pwd = request.getParameter("confirm_password");
		String secretPwd = pwdEncoder.encode(pwd);
		vo.setMember_password(secretPwd);
		memberDAO.updatePW(vo);		
	}

	// 회원 탈퇴 시 컬럼 업뎃
	@Override
	public void delUpdate(MemberVO vo) {
		memberDAO.delUpdate(vo);
		
	}
	
	// 회원 탈퇴 날짜 기입
	@Override
	public void delDate(MemberVO vo) {
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm");
		Date time = new Date();
		String delTime = format.format(time);
		vo.setMember_delDate(delTime);
		System.out.println("회원 탈퇴 날짜: " + " " + delTime);
		memberDAO.delDate(vo);
		
	}
	
	// 로그인 실패 시 카운트 +1
	@Override
	public void countFailure(String member_id) {
		memberDAO.updateFailureCount(member_id);
		
	}
	
	// 로그인 실패 횟수 체크
	@Override
	public int checkFailureCount(String member_id) {
		 return memberDAO.checkFailureCount(member_id);
		
	}
	
	// 5회 이상 로그인 실패 시 계정 잠금(로그인 접근 제한)
	@Override
	public void isAccountLock(String member_id) {
		memberDAO.updateDisabled(member_id);
	}
	
	// 로그인 실패 횟수 초기화(로그인 성공 시)
	@Override
	public void countFailureInitialize(String member_id) {
		memberDAO.initializeFailCount(member_id);
		
	}
	
	// 계정 잠금 초기화(비밀번호 찾기 서비스 이용시)
	@Override
	public void accountLockInitialize(String member_id) {
		memberDAO.accountLockInitialize(member_id);
		
	}
	
	// 비밀번호 변경 날짜 90일 지났는지 체크
	@Override
	public int check90overPW(MemberVO vo) {
		return memberDAO.check90overPW(vo);		
	}
	
	// 비밀번호 변경 날짜 최신화 업데이트
	@Override
	public void changePWDateInitialize(MemberVO vo) {
		memberDAO.changePWDateInitialize(vo);
	}
	
	// 로그인 시 로그인 날짜 컬럼에 insert
	@Override
	public void insertMemberLoginDay(MemberVO vo) {
		memberDAO.insertMemberLoginDay(vo);
		
	}
	
	// 회원 주소 찾기
	@Override
	public List<MemberAddressVO> getAddress(MemberAddressVO addrVO) {
		return memberDAO.getAddress(addrVO);
	}
}
