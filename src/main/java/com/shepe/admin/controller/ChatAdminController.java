package com.shepe.admin.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shepe.admin.biz.chat.BootService;
import com.shepe.admin.biz.chat.CounselingService;
import com.shepe.admin.biz.chat.CounselingVO;
import com.shepe.client.biz.chat.ChatEncoding;
import com.shepe.client.biz.chat.ChatRoomVO;
import com.shepe.client.biz.chat.ChatService;

@Controller
public class ChatAdminController {
	
	@Autowired
	private BootService bootservice;
	
	@Autowired
	private ChatEncoding chatencoding;
	
	@Autowired
	private CounselingService counselingservice;
	
	@Autowired
	private ChatService chatService;
	
	
	@ResponseBody
	@RequestMapping(value="/admin/chatSubmit",produces = "application/text; charset=utf8", method=RequestMethod.POST)
	public void chatSubmit(@RequestParam String fromID, @RequestParam String toID, @RequestParam String chatContent, @RequestParam int chatRoomNum, @RequestParam(value="chatread", required=false) String chatread) throws IOException {
		
		int chatreaddata = 0 ;
		
		if(chatread != null) { // 맨처음
			chatreaddata = Integer.parseInt(chatread);
		} 
		
		fromID = URLDecoder.decode(fromID, "UTF-8");
		toID = URLDecoder.decode(toID, "UTF-8");
		chatContent = URLDecoder.decode(chatContent, "UTF-8");
		chatService.submit(fromID, toID, chatContent,chatRoomNum, chatreaddata);	

	}
	
////////////////////////////////////////메세지봇 컨트롤러//////////////////////////////////////////////////////////////
	
	@RequestMapping("/admin/messageBoot")
	public String messageBoot() {
		return "/admin/adminchat/messageBoot";
	}
		
	@RequestMapping("/admin/startBoot")
	public void startBoot(@RequestParam String startBootContent) throws IOException {
		startBootContent = URLDecoder.decode(startBootContent, "UTF-8");
		bootservice.startBoot(startBootContent);
	}
	
	@RequestMapping("/admin/selectCountBoot")
	public void selectCountBoot(@RequestParam String selectNum) throws IOException {
		selectNum = URLDecoder.decode(selectNum, "UTF-8");
		bootservice.selectCountBoot(selectNum);
	}
		
	
	@RequestMapping(value="/admin/qaBoot",produces = "application/text; charset=utf8", method=RequestMethod.POST)
	public void qaBoot(@RequestParam String boot_question, @RequestParam String boot_answer, @RequestParam String boot_choice) throws IOException {
		
		boot_question = chatencoding.encoding(boot_question);
		boot_answer = chatencoding.encoding(boot_answer);
		boot_choice = chatencoding.encoding(boot_choice);

		bootservice.qaBoot(boot_question, boot_answer, boot_choice);
	}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	@RequestMapping("/admin/messageBox")
	public String messageBox() {
		return "/admin/adminchat/admin_chat_box";
	}
	

	@ResponseBody 
	@RequestMapping("/admin/counseling_history")
	public void counseling(CounselingVO vo) {

		if(vo.getH_ok().equals("1")) {
			chatService.updateOk(vo.getConsultsq());
		}
		
		counselingservice.counselingAddAction(vo);
	}
	
	@RequestMapping("/admin/admin_getChatroom")
	public String admin_testtest(@RequestParam String fromId, @RequestParam String toId, @RequestParam String chatroomnum, Model model) {
		
		int chatnum = Integer.parseInt(chatroomnum);
		ChatRoomVO vo = chatService.admin_chatroomone(fromId);
		int consultsq = vo.getConsultsq();
		
		model.addAttribute("getChatroomList", chatService.getChatListByRecent(toId, fromId, 100, chatnum));
		model.addAttribute("chatroomVO", vo);
		model.addAttribute("counselingList", counselingservice.getCounselingList(consultsq));
		chatService.readChat(toId, fromId); 
		return "/admin/adminchat/admin_chatroom";
	}
	
	
	@ResponseBody
	@RequestMapping("/admin/admin_counselingone")
	public CounselingVO admin_counselingone(@RequestParam int consultnum) {

		return counselingservice.admin_counselingone(consultnum);	
	}
	
	@ResponseBody
	@RequestMapping("/admin/admin_chatroomone")
	public ChatRoomVO admin_chatroomone(@RequestParam String userID) {
		
		return chatService.admin_chatroomone(userID);
	}
	
	@ResponseBody
	@RequestMapping("/admin/admin_chatroomList")
	public List<ChatRoomVO> admin_chatroomList() {
		return chatService.admin_chatroomList();
	}
	
	
}
