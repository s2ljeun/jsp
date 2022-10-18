<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- searchMember_ok.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");
		String name = request.getParameter("name");
		String ssn1 = request.getParameter("ssn1");
		String ssn2 = request.getParameter("ssn2");
		String id = request.getParameter("id");
		
		if (name==null || name.trim().equals("")){%>
			<script type="text/javascript">
				alert("정상적인 경로로 오셔야 합니다.")
				self.close()
			</script>	
<%		return;
		}%>
<jsp:useBean id="mbdao" class="my.member.MemberDAO"/>
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="mbdao" value="<%=pool%>"/>
<%
		String msg = mbdao.searchMember(name, ssn1, ssn2, id);
%>		 
<script type="text/javascript">
	alert("<%=msg%>")
	self.close()
</script>	









