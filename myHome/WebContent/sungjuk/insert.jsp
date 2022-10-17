<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- insert.jsp -->
<html>
<head>
	<title>성적입력</title>
	<link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>학 생 성 적 입 력 페 이 지</h2>
		<hr color="green" width="300">
		<form name="f" action="insert_ok.jsp" method="post">
			<table border="1" width="400">
				<tr>
					<th width="100">이름</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th width="100">학급</th>
					<td><input type="text" name="cname"></td>
				</tr>
				<tr>
					<th width="100">국어</th>
					<td><input type="text" name="kor"></td>
				</tr>
				<tr>
					<th width="100">영어</th>
					<td><input type="text" name="eng"></td>
				</tr>
				<tr>
					<th width="100">수학</th>
					<td><input type="text" name="mat"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="입력">
						<input type="reset" value="다시입력">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>