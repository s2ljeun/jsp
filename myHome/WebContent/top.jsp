<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.member.*"%>
<!-- top.jsp -->
<html>
<head>
	<title>Ȩ������</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<script type="text/javascript">
		function checkMember(){
			window.open("<%=request.getContextPath()%>/member/memberSsn.jsp", "check", "width=600, height=400")
		}
	</script>
</head>
<%
		MemberDTO mdto = (MemberDTO)session.getAttribute("mdto");
		boolean isLogin = false;
		if (mdto != null) isLogin = true;
%>
<body>
	<div align="center">
		<table border="1" width="800" height="600">
			<tr height="10%">
				<td align="center" colspan="2">
					<a href="<%=request.getContextPath()%>/index.jsp">HOME</a> | 
<%			if (isLogin){ %>
					<a href="<%=request.getContextPath()%>/login/logout.jsp">�α׾ƿ�</a> |
<%			}else { %>					
					<a href="<%=request.getContextPath()%>/login/login.jsp">�α���</a> |
<%			} %>					 
					<a href="javascript:checkMember()">ȸ������</a> | 
					<a href="<%=request.getContextPath()%>/member/memberAll.jsp">ȸ������</a> |
					<a href="<%=request.getContextPath()%>/member/memberAll.jsp?mode=find">ȸ��ã��</a> |
					�Խ��� | 
					<a href="<%=request.getContextPath()%>/company.jsp">ȸ��Ұ�</a>
				</td>
			</tr>
			<tr>
				<td width="20%" valign="top">
<%		if (isLogin){ %>
				<%=mdto.getName()%>[<%=mdto.getId()%>]�� �α��� ��..
<%		}else { %>
				�α����� �� �ּ���
<%		} %><br>	
				<jsp:include page="/count/count.jsp" /></td>
				<td width="80%">
				
				
				
				
				
				
				
				