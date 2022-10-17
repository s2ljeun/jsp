<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- member_delete.jsp -->
<%
		String no = request.getParameter("no");
		if (no == null || no.trim().equals("")){
			response.sendRedirect("memberAll.jsp");
			return;
		}
%>
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="mbdao" value="<%=pool%>"/>
<%
		int res = mbdao.deleteMember(Integer.parseInt(no));
		String msg = null, url = "memberAll.jsp";
		if (res>0){
			msg = "회원삭제성공!! 회원목록페이지로 이동합니다.";
		}else {
			msg = "회원삭제실패!! 회원목록페이지로 이동합니다.";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>
















