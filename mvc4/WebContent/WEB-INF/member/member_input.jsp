<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="style.css">
		<script type="text/javascript">
			function check(){
				if (f.id.value==""){
					alert("���̵� �Է��� �ּ���!!")
					f.id.focus()
					return
				}
				if (f.passwd.value==""){
					alert("��й�ȣ�� �Է��� �ּ���!!")
					f.passwd.focus()
					return
				}
				document.f.submit()
			}
		</script>
	</head>
<%
		String name = (String)session.getAttribute("name");
		String ssn1 = (String)session.getAttribute("ssn1");
		String ssn2 = (String)session.getAttribute("ssn2");
%>
	<body>	
		<form name="f" method="post" action="member_input_ok.mem">
			<table width="550" align="center" class="outline">
  				<tr>
					<td colspan="2" align=center class="m2">ȸ������</td>
 				</tr>
				<tr>
					<td width="150" class="m3">�̸�</td>
					<td class="m3">
						<input type="text" name="name" class="box" value="<%=name%>" disabled>
						<input type="hidden" name="name" value="<%=name%>"/>
					</td>
				</tr>
				<tr>
					<td width="150" class="m3">���̵�</td>
					<td class="m3">
						<input type="text" name="id" class="box">
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">��й�ȣ</td>
					<td class="m3">
						<input type="password" name="passwd" class="box">
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">�ֹι�ȣ</td>
					<td class="m3">
						<input type="text" name="ssn1" class="box" value="<%=ssn1%>" readOnly> -
				<input type="password" name="ssn2" class="box" value="<%=ssn2%>" readOnly>
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">�̸���</td>
					<td class="m3">
						<input type="text" name="email" class="box">
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">����ó</td>
					<td class="m3">
						<input type="text" name="hp1" class="box" size="3" maxlength="3"> -
						<input type="text" name="hp2" class="box" size="4" maxlength="4"> -
						<input type="text" name="hp3" class="box" size="4" maxlength="4">
					</td>
  				</tr>
  				<tr>
					<td colspan="2" align="center">
						<a href="javascript:check()">[����]</a>
						<a href="#">[���]</a>
					</td>
  				</tr>
  			</table>
		</form>
	</body>
</html>