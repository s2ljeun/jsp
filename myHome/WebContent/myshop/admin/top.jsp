<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- top.jsp -->
<html>
<head>
	<title>���θ�Ȩ</title>
	<link rel="stylesheet" type="text/css" href="../../style.css">
</head>
<body>
	<div align="center">
		<font size="6">���θ�(�����ڿ�)</font><br>
		<a href="<%=request.getContextPath()%>/myshop/display/mall.jsp">���θ�Ȩ</a> | 
		<a href="<%=request.getContextPath()%>/index.jsp">����Ȩ</a><br>
		<table border="1" width="800" height="600">
			<tr height="50">
				<th width="160">
					<a href="cate_input.jsp">ī�װ����</a>
				</th>
				<th width="160">
					<a href="cate_list.jsp">ī�װ����</a>
				</th>
				<th width="160">
					<a href="prod_input.jsp">��ǰ���</a>
				</th>
				<th width="160">
					<a href="prod_list.jsp">��ǰ���</a>
				</th>
				<th width="160">
					<a href="<%=request.getContextPath()%>/myshop/display/mall.jsp">���θ�Ȩ</a>
				</th>
			</tr>
			<tr height="80%">
				<td align="center" colspan="5">