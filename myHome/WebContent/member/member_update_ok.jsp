<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- member_update_ok.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mbdto" class="my.member.MemberDTO" />
<jsp:setProperty property="*" name="mbdto"/>
<%
		if (mbdto.getName() == null || mbdto.getName().trim().equals("")){
			response.sendRedirect("memberAll.jsp");
			return;
		}
%>
<jsp:useBean id="mbdao" class="my.member.MemberDAO"/>
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="mbdao" value="<%=pool%>"/>

<%
		int res = mbdao.updateMember(mbdto);
		String msg = null, url = "memberAll.jsp";
		if (res>0){
			msg = "ȸ����������!! ȸ������������� �̵��մϴ�.";
		}else {
			msg = "ȸ����������!! ȸ������������� �̵��մϴ�.";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>














