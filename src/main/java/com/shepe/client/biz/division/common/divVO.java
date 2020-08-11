package com.shepe.client.biz.division.common;

import org.springframework.stereotype.Service;

@Service
public class divVO {
	
	public String divmatter(String a) {
		
		int choice = Integer.parseInt(a); 
		
		switch (choice) {
		case 0:
			return "";
		case 1:
			return "밥/죽/떡";
		case 2:
			return "면/만두";
		case 3:
			return "국/탕";
		case 4:
			return "찌개";
		case 5:
			return "메인반찬";
		case 6:
			return "김치/젓갈/장류";
		case 7:
			return "양념/소스/잼";
		case 8:
			return "차/음료/술";
		case 9:
			return "디저트";
		case 10:
			return "퓨전";
		case 11:
			return "샐러드";
		case 12:
			return "밑반찬";
		case 13:
			return "기타";
		case 14:
			return "육류";
		case 15:
			return "해물류";
		case 16:
			return "건어물류";
		case 17:
			return "곡류";
		case 18:
			return "콩/견과류";
		case 19:
			return "채소류";
		case 20:
			return "버섯류";
		case 21:
			return "밀가루";
		case 22:
			return "가공식품류";
		case 23:
			return "과일류";
		case 24:
			return "쌀";
		case 25:
			return "댤걀/유제품";
		case 26:
			return "돼지고기";
		case 27:
			return "소고기";
		case 28:
			return "닭고기";
		case 29:
			return "기타";
		case 30:
			return "끓이기";
		case 31:
			return "절임";
		case 32:
			return "조림";
		case 33:
			return "회";
		case 34:
			return "삶기";
		case 35:
			return "데치기";
		case 36:
			return "무침";
		case 37:
			return "비빔";
		case 38:
			return "볶음";
		case 39:
			return "굽기";
		case 40:
			return "부침";
		case 41:
			return "찜";
		case 42:
			return "튀김";
		case 43:
			return "기타";
		
		default:
			return "";
		}		
	}
}
