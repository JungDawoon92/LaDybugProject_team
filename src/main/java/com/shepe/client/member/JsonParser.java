package com.shepe.client.member;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class JsonParser {
	JSONParser jsonParser = new JSONParser();

	public MemberVO changeJson(String string) throws Exception {

		HashMap<String, Object> map = new HashMap<>();
		JSONParser jsonParser = new JSONParser();
		MemberVO vo = new MemberVO();

		JSONObject jsonObject = (JSONObject) jsonParser.parse(string);

		jsonObject = (JSONObject) jsonObject.get("response");

//		map.put("userGender", jsonObject.get("gender"));
		map.put("userId", jsonObject.get("id"));
		map.put("userName", jsonObject.get("name"));

		vo.setMember_nm(map.get("userName").toString());
		vo.setMember_email(map.get("userId").toString()); // id -> vo.email 넣기
//		vo.set(map.get("userGender").toString()); // gender -> vo.gender 넣기
		vo.setMember_id(map.get("userId").toString());// id -> vo.naver 넣기

		return vo;
	}
}
