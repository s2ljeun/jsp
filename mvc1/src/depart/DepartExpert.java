package depart;

import java.util.*;

public class DepartExpert {//DAO�� ����ϴ� Ŭ����
	
	public List<String> getAdvice(String depart){
		
		List<String> list = new ArrayList<>();
		
		switch(depart) {
		case "kor" :
			list.add("�������� �����ϴ� ���Դϴ�.");
			list.add("��� ���� �� �ؾ� �մϴ�.");
			break;
		case "eng" :
			list.add("�������� �����ϴ� ���Դϴ�.");
			list.add("��� ���� �� �ؾ� �մϴ�.");
			break;
		case "com" :
			list.add("��ǻ�� ������ �����ϴ� ���Դϴ�.");
			list.add("��ǻ�͸� ���� �� �ؾ� �մϴ�.");
			break;
		case "game" :
			list.add("�������� �����ϴ� ���Դϴ�.");
			list.add("������ ���� �� �ؾ� �մϴ�.");
			break;
		default : 
			list.add("�غ�� ������ �����ϴ�.");
		}
		
		return list;
	}
}







