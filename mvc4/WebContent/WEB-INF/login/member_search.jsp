<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- searchMember.jsp -->
<%
		String mode = request.getParameter("mode");
%>
<html>
<head>
	<title>ȸ��ã��</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<script type="text/javascript">
		function check(){
			if (f.name.value==""){
				alert("�̸��� �Է��� �ּ���!!")
				f.name.focus()
				return false
			}
			if (f.ssn1.value==""){
				alert("�ֹι�ȣ ���ڸ��� �Է��� �ּ���!!")
				f.ssn1.focus()
				return false
			}
			if (f.ssn2.value==""){
				alert("�ֹι�ȣ ���ڸ��� �Է��� �ּ���!!")
				f.ssn2.focus()
				return false
			}
			if (mode=="pw" && f.id.value==""){
				alert("���̵� �Է��� �ּ���!!")
				f.id.focus()
				return false
			}
			return true
		}
	</script>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
<%	if (mode.equals("id")){ %>		
		<h2>�� �� �� ã ��</h2>
<%	}else { %>		
		<h2>�� �� �� ȣ ã ��</h2>
<%	} %>		
		<hr color="green" width="300">
		<form name="f" action="member_search_ok.mem" method="post" onsubmit="return check()">
			<table width="500" class="outline">
				<tr>
					<th>�̸�</th>
					<td><input type="text" name="name" class="box"></td>
				</tr>
				<tr>
					<th>�ֹι�ȣ</th>
					<td><input type="text" name="ssn1" class="box" maxlength="6"> - 
					<input type="password" name="ssn2" class="box" maxlength="7"></td>
				</tr>
<%			if (mode.equals("pw")){%>
				<tr>
					<th>���̵�</th>
					<td><input type="text" name="id" class="box"></td>
				</tr>	
<%			} %>				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="��ȸ">
						<input type="reset" value="�ٽ��Է�">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>