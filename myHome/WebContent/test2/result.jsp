<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- result.jsp -->
<%
		//아이디가 admin이고 비밀번호가 1234일때만 로그인이 되도록 만든다
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		String msg = null, url = null;
		if (id.equals("admin")){
			if (pwd.equals("1234")){
				msg = id +"님이 로그인 하셨습니다. 회원전용 페이지로 이동합니다.";
				url = "sessionTest2.jsp";
				session.setAttribute("id", id);
			}else {
				msg = "비밀번호가 틀렸습니다. 다시 로그인 해 주세요!!";
				url = "sessionTest1.jsp";
			}
		}else {
			msg = "없는 아이디 입니다. 다시 로그인 해 주세요!!";
			url = "sessionTest1.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>

