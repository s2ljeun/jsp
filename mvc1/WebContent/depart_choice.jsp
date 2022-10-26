<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- depart_choice.jsp -->
<html>
<head>
	<title>학과선택</title>
</head>
<body>
	<h1 align="center">학과 선택 페이지</h1>
	<form name="f" action="depart.do" method="post">
		학과선택 :
		<select name="depart" size="1">
			<option value="kor">국문학과</option>
			<option value="eng">영문학과</option>
			<option value="com">컴퓨터공학과</option>
			<option value="game">게임학과</option>
		</select>
		<input type="submit" value="전송"/>
	</form>
</body>
</html>