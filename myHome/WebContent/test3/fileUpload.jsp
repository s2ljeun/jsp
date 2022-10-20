<%
/*
파일업로드
- www.servlets.com에서 cos.jar파일을 다운받아 lib폴더에 설치 (jsp)
- form태그의 method 타입은 post로
- form태그의 enctype은 multipart/form-data로
- form태그의 input타입은 file로
- 받는 곳에서는 cos.jar파일에 있는 MultipartRequest 객체로 받는다.

	- MultipartRequest
		- 최소 4개의 매개변수를 넣어줘야 한다.
		- 1. request객체를
		- 2. 위치를 String 형태로
		- 3. 최대크기값을 int 형태로
		- 4. 글꼴을 String 형태로
		- 5. FileRenamePolicy 객체를.. 써도 되고 안 써도 되는데.. 사용하면 동일한 파일명일 때 번호를 부여한다
*/
%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- fileUpload.jsp -->
<html>
<head>
	<title>파일업로드</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>파 일 업 로 드 테 스 트</h2>
		<hr color="green" width="300">
		<form name="f" action="fileUpload_ok.jsp" method="post" 
																enctype="multipart/form-data"><%//파일 전송: post방식 + enctype + input type="file" %>
			<table border="1" width="500">
				<tr>
					<th>올린이</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>파일명</th>
					<td><input type="file" name="filename"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="업로드">
						<input type="reset" value="다시작성">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>

