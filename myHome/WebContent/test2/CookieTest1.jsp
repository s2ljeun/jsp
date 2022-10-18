<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- CookieTest1.jsp -->
<%
	//쿠키를 생성해서 저장한 후, 클라이언트에 내려보내기 까지...
	//1. 쿠키생성
	Cookie ck = new Cookie("insa", "HelloJSP");//값에 공백, 세미콜론, 콤마, 이콜 사용불가
	//2. 쿠키에 생명주기
	ck.setMaxAge(24*60*60); //초단위로 적어준다
	//참고: 쿠키 삭제: 생명주기값을 0으로 해서 해당 쿠키를 지워준다. 직접 들어가서 삭제 X 해킹

	//3. 클라이언트에 내려보내기
	response.addCookie(ck);
	
%>
<h2>쿠키 전송 끝!!</h2>