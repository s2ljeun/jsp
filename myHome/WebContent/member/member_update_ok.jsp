<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- member_input_ok.jsp -->
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mbdto" class="my.member.MemberDTO"/>
<jsp:setProperty name="mbdto" property="*"/>
<%
	if (mbdto.getPasswd() == null || mbdto.getPasswd().trim().equals("")){
		response.sendRedirect("memberAll.jsp");
		return;
	}
%>

<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
<%
	int res = mbdao.updateMember(mbdto);
	String msg = null, url="memberAll.jsp";
	if (res>0){
			msg = "회원수정 성공!!";
	}else {
			msg = "회원수정 실패!!"	;
} %>

<script type="text/javascript">
	alert("<%=msg%>")
	location.href= "<%=url%>"
</script>