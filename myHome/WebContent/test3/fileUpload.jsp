<%
/*
���Ͼ��ε�
- www.servlets.com���� cos.jar������ �ٿ�޾� lib������ ��ġ (jsp)
- form�±��� method Ÿ���� post��
- form�±��� enctype�� multipart/form-data��
- form�±��� inputŸ���� file��
- �޴� �������� cos.jar���Ͽ� �ִ� MultipartRequest ��ü�� �޴´�.

	- MultipartRequest
		- �ּ� 4���� �Ű������� �־���� �Ѵ�.
		- 1. request��ü��
		- 2. ��ġ�� String ���·�
		- 3. �ִ�ũ�Ⱚ�� int ���·�
		- 4. �۲��� String ���·�
		- 5. FileRenamePolicy ��ü��.. �ᵵ �ǰ� �� �ᵵ �Ǵµ�.. ����ϸ� ������ ���ϸ��� �� ��ȣ�� �ο��Ѵ�
*/
%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- fileUpload.jsp -->
<html>
<head>
	<title>���Ͼ��ε�</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>�� �� �� �� �� �� �� Ʈ</h2>
		<hr color="green" width="300">
		<form name="f" action="fileUpload_ok.jsp" method="post" 
																enctype="multipart/form-data"><%//���� ����: post��� + enctype + input type="file" %>
			<table border="1" width="500">
				<tr>
					<th>�ø���</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>���ϸ�</th>
					<td><input type="file" name="filename"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="���ε�">
						<input type="reset" value="�ٽ��ۼ�">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>

