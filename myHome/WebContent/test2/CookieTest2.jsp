<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
// request - ����� ���� ����Ǵ� ��, ������� ��û.. Ŭ���̾�Ʈ�κ��� ���� ��.. <=>response
%>
<!-- cookieTest2.jsp -->
<%
		Cookie ck[] = request.getCookies();
		String value = null;
		if (ck != null && ck.length != 0){
			for(int i=0; i<ck.length; ++i){
				String name = ck[i].getName();
				if (name.equals("insa")){
					value = ck[i].getValue();
					out.println("<h2>��Ű�� : " + name + ", ��Ű�� : " + value + "</h2>");
					break;
				}
			}
		}
		//value���� null�̸� insa��� ��Ű�� ����
		
		
			//���尴ü out : ��ȭ�鿡 ����� �ϱ� ���� ���� ��ü
%>