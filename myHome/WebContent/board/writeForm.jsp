<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- writeForm.jsp -->
<%@ include file="../top.jsp"%>
<link rel="stylesheet" type="text/css" href="../style.css">
<script type="text/javascript">
	function checkBoard(){
		if (f.writer.value==""){
			alert("�̸��� �Է��� �ּ���!!")
			f.writer.focus()
			return false
		}
		if (!f.subject.value){
			alert("������ �Է��� �ּ���!!")
			f.subject.focus()
			return false
		}
		if (f.content.value==""){
			alert("������ �Է��� �ּ���!!")
			f.content.focus()
			return false
		}
		if (f.passwd.value==""){
			alert("��й�ȣ�� �Է��� �ּ���!!")
			f.passwd.focus()
			return false
		}
		return true		
	}
</script>
<%
		int num = 0, re_step = 0, re_level = 0;
		String snum = request.getParameter("num");
		if (snum != null) {		//��۾��⿡�� �Դٸ�...
			num = Integer.parseInt(snum);
			re_step = Integer.parseInt(request.getParameter("re_step"));
			re_level = Integer.parseInt(request.getParameter("re_level"));
		}
%>
<div align="center">
	<form name="f" action="writePro.jsp" method="post" onsubmit="return checkBoard()">
		<input type="hidden" name="num" value="<%=num%>"/>
		<input type="hidden" name="re_step" value="<%=re_step%>"/>
		<input type="hidden" name="re_level" value="<%=re_level%>"/>
		<table border="1" width="500">
			<tr bgcolor="yellow">
				<td colspan="2" align="center">�� �� ��</td>
			</tr>
			<tr>
				<th bgcolor="yellow">�� ��</th>
				<td><input type="text" name="writer"></td>
			</tr>
			 <tr>
				<th bgcolor="yellow">�� ��</th>
				<td><input type="text" name="subject" size="50"></td>
			</tr>
			<tr>
				<th bgcolor="yellow">Email</th>
				<td><input type="text" name="email" size="50"></td>
			</tr>
			<tr>
				<th bgcolor="yellow">�� ��</th>
				<td><textarea name="content" rows="11" cols="50"></textarea></td>
			</tr>
			<tr>
				<th bgcolor="yellow">��й�ȣ</th>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr bgcolor="yellow">
				<td colspan="2" align="center">
					<input type="submit" value="�۾���">
					<input type="reset" value="�ٽ��ۼ�">
					<input type="button" value="��Ϻ���" onclick="window.location='list.jsp'">
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../bottom.jsp"%>











