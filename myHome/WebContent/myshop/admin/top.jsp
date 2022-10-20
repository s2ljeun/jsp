<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- top.jsp -->
<html>
<head>
	<title>쇼핑몰홈</title>
	<link rel="stylesheet" type="text/css" href="../../style.css">
</head>
<body>
	<div align="center">
		<font size="6">쇼핑몰(관리자용)</font><br>
		<a href="<%=request.getContextPath()%>/myshop/display/mall.jsp">쇼핑몰홈</a> | 
		<a href="<%=request.getContextPath()%>/index.jsp">메인홈</a><br>
		<table border="1" width="800" height="600">
			<tr height="50">
				<th width="160">
					<a href="cate_input.jsp">카테고리등록</a>
				</th>
				<th width="160">
					<a href="cate_list.jsp">카테고리목록</a>
				</th>
				<th width="160">
					<a href="prod_input.jsp">상품등록</a>
				</th>
				<th width="160">
					<a href="prod_list.jsp">상품목록</a>
				</th>
				<th width="160">
					<a href="<%=request.getContextPath()%>/myshop/display/mall.jsp">쇼핑몰홈</a>
				</th>
			</tr>
			<tr height="80%">
				<td align="center" colspan="5">