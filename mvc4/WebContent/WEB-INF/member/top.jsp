<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="member.*"%>
<!-- top.jsp -->
<html>
<head>
	<title>ȸ������</title>
	<script type="text/javascript">
		function checkMember(){
			window.open("member_ssn.mem", "", "width=640, height=400")
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
			<%
				if(isLogin){ //�α��εǾ������� / ���ǿ� �������� mdto�� �����ϸ�%>
				<th width="20%"><a href="logout.mem">�α׾ƿ�</a></th>	
			<%}else{%>
				<th width="20%"><a href="login.mem">�α���</a></th>
			<%}%>
			<th width="20%"><a href="javascript:checkMember()">ȸ������</a></th>
			<th width="20%"><a href="member_list.mem">ȸ������</a></th>
			<th width="20%"><a href="member_list.mem?mode=find">ȸ��ã��</a></th>
			<th width="20%"><a href="index.do">��������</a></th>
		</tr>
		<tr height="80%">
			<td colspan="5">
			
			
			
			
			
			