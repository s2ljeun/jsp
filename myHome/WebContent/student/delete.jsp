<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!-- delete.jsp -->
<%--
	1. 넘어온 데이터 받기
	2. 넘어온 데이터 유효성 검사하기
	3. 드라이버 연결하기
	4. 오라클에 접속하여 쿼리문 전송하기
	5. 결과를 받아 처리하기
	6. db연결 닫기
--%>

<%
	String id = request.getParameter("id");
	
	if(id==null||id.trim().equals("")){
		response.sendRedirect("student.jsp"); //서버에서  response를 통해 클라이언트에게 명령
		return;
	}%>

	<jsp:useBean id="stdao" class="my.student.StudentDAO" />

<%
	int res = stdao.deleteStudent(id);
	String msg = null, url = null;
	if (res>0){
		msg = "학생삭제 성공!! 학생목록페이지로 이동합니다.";
		url = "list.jsp";
	}else {
		msg = "학생삭제 실패!! 학생관리페이지로 이동합니다.";
		url = "student.jsp";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>



%>