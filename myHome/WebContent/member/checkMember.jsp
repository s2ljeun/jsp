<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="my.member.*" %>
<!-- checkMember.jsp -->
<%
	request.setCharacterEncoding("EUC-KR");
	String name = request.getParameter("name");
	String ssn1 = request.getParameter("ssn1");
	String ssn2 = request.getParameter("ssn2");
	
	if(name==null||ssn1==null||ssn2==null
		||name.trim().equals("")||ssn1.trim().equals("")||ssn2.trim().equals("")){%>
		<script type="text/javascript">
			alert("�̸��� �ֹι�ȣ�� ��� �Է����ּ���!");
			history.back();
		</script>
<%		return;
		}%>
		
	<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
	
<%
	boolean isMember = mbdao.checkMember(name, ssn1, ssn2);
	if(isMember){%>
		<script type="javascript">
			alert("�̹� ȸ���̽ʴϴ�. �α����� �� �ּ���.")
			self.close()
		</script>
	<%}else{%>
		<form name="f" action="member.jsp" method="post">
			<input type="hidden" name="name" value="<%=name%>"/>
			<input type="hidden" name="ssn1" value="<%=ssn1%>"/>
			<input type="hidden" name="ssn2" value="<%=ssn2%>"/>
		</form>
		<script type="text/javascript">
			alert("ȸ�������������� �̵��մϴ�.")
			document.f.submit()
		</script>
<%	} %>