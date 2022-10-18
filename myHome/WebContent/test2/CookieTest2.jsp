<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
// request - 사용자 정보 저장되는 곳, 사용자의 요청.. 클라이언트로부터 보낸 것.. <=>response
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
					out.println("<h2>쿠키명 : " + name + ", 쿠키값 : " + value + "</h2>");
					break;
				}
			}
		}
		//value값이 null이면 insa라는 쿠키는 없다
		
		
			//내장객체 out : 웹화면에 출력을 하기 위해 만든 객체
%>