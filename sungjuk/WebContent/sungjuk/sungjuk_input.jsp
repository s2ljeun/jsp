<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="my.sungjuk.*" %>
<!-- sungjuk_input -->
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="sjdto" class="my.sungjuk.SungjukDTO"/>
<jsp:setProperty name="sjdto" property="*"/>

<%
	if (sjdto.getName() == null || sjdto.getCname() == null ||
		sjdto.getName().trim().equals("") || sjdto.getCname().trim().equals("")){
		response.sendRedirect("sungjukSsn.jsp");
		return;
	}
%>
<jsp:useBean id="sjdao" class="my.sungjuk.SungjukDAO" />
<%
		int res = sjdao.insertMember(sjdto);
		if (res>0){%>
			<script type="text/javascript">
				alert("�����Է� �Ϸ�!")
				self.close()
			</script>	
<%	}else { %>		
			<script type="text/javascript">
				alert("�����Է� ����! �ٽ� �Է��� �ּ���")
				location.href="sungjukSsn.jsp"
			</script>	
<%	} %>