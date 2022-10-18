<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- sessionTest2.jsp -->
<%
	String id = (String)session.getAttribute("id");
	if(id==null){%>
		<script type="text/javascript">
			alert("로그인을 해 주세요!!")
			location.href="sessionTest1.jsp"
		</script>
<%		return;

	}
%>

<h2>회 원 전 용 페 이 지</h2>
<h3><%=id%>님이 로그인 되었습니다.</h3>
<h3>로그인이 안되어 있다면 로그인 페이지로 보내줘야 합니다.</h3>
<a href="sessionTest3.jsp">로그아웃</a>