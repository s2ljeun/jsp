<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>�����߰�</title>
	<script type="text/javascript">
		function checkForm(){
			if (f.name.value==""){
				alert("�̸��� �Է��ϼ���.")
				f.name.focus()
				return;
			}
			if (f.cname.value==""){
				alert("�б޸��� �Է��ϼ���.")
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
					<th>�̸�</th>
					<td>
						<input type="text" name="name">
					</td>
				</tr>
				<tr>
					<th>�б޸�</th>
					<td>
						<input type="text" name="cname">
					</td>
				</tr>
				<tr>
					<th>����</th>
					<td>
						<input type="text" name="kor">
					</td>
				</tr>
				<tr>
					<th>����</th>
					<td>
						<input type="text" name="eng">
					</td>
				</tr>
				<tr>
					<th>����</th>
					<td>
						<input type="text" name="math">
					</td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<a href="javascript:checkForm()">Ȯ��</a>
						<input type="reset" value="�������"></input>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>