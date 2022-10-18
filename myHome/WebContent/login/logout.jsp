<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- logout.jsp -->
<%
	//session.removeAttribute("id"); //key값 id만 삭제
	session.invalidate();//전체삭제 -> 더 자주 사용
%>
<script type="text/javascript">
	alert("로그아웃 되었습니다. 로그인 페이지로 이동합니다.")
	location.href= "<%=request.getContextPath()%>/index.jsp"
</script>