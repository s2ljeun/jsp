<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>성적추가</title>
	<script type="text/javascript">
		function checkForm(){
			if (f.name.value==""){
				alert("이름을 입력하세요.")
				f.name.focus()
				return;
			}
			if (f.cname.value==""){
				alert("학급명을 입력하세요.")
				f.cname.focus()
				return;
			}
			document.f.submit()
			
		}
	</script>
</head>

<body>
	<div align="center">
		<form name="f" action="sungjuk_input.jsp" method="post">
			<table border="1" width="300" height="400">
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="name">
					</td>
				</tr>
				<tr>
					<th>학급명</th>
					<td>
						<input type="text" name="cname">
					</td>
				</tr>
				<tr>
					<th>국어</th>
					<td>
						<input type="text" name="kor">
					</td>
				</tr>
				<tr>
					<th>영어</th>
					<td>
						<input type="text" name="eng">
					</td>
				</tr>
				<tr>
					<th>수학</th>
					<td>
						<input type="text" name="math">
					</td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<a href="javascript:checkForm()">확인</a>
						<input type="reset" value="내용삭제"></input>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>