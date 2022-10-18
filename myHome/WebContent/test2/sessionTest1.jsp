<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- sessionTest1.jsp -->
<html>
<head>
<title>세션테스트</title>
</head>
<body>
	<div align="center">
		<form name="f" action="result.jsp" method="post">
			<table border="0" width="400">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pwd"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="로그인">
					</td>
				</tr>
			</table>
			
		</form>
	</div>
</body>
</html>