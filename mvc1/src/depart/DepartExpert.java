package depart;

import java.util.*;

public class DepartExpert {//DAO를 대신하는 클래스
	
	public List<String> getAdvice(String depart){
		
		List<String> list = new ArrayList<>();
		
		switch(depart) {
		case "kor" :
			list.add("국문학을 공부하는 곳입니다.");
			list.add("국어를 아주 잘 해야 합니다.");
			break;
		case "eng" :
			list.add("영문학을 공부하는 곳입니다.");
			list.add("영어를 아주 잘 해야 합니다.");
			break;
		case "com" :
			list.add("컴퓨터 공학을 공부하는 곳입니다.");
			list.add("컴퓨터를 아주 잘 해야 합니다.");
			break;
		case "game" :
			list.add("게임학을 공부하는 곳입니다.");
			list.add("게임을 아주 잘 해야 합니다.");
			break;
		default : 
			list.add("준비된 도움말이 없습니다.");
		}
		
		return list;
	}
}







