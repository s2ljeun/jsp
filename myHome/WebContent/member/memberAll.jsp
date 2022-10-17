<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.member.*" %>    
<!-- memberAll.jsp -->
<%@ include file="../top.jsp"%>
<link rel="stylesheet" type="text/css" href="../style.css">
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="mbdao" value="<%=pool%>"/>
<!-- property�� ����Ű�� �� :  setPool �޼ҵ� -->
<!-- name�� ����Ű�� �� : setPool�޼ҵ尡 �ִ� ��ü -->
<!-- value�� ����Ű�� �� : setPool�޼ҵ��� �Ű����� �ȿ� �� ��ü -->
<%
		request.setCharacterEncoding("EUC-KR");
		//request�� �۲� ������ �ݵ�� getParameter�� ������ ���� ����� �Ѵ�.
		String mode = request.getParameter("mode");
		if (mode==null){
			mode = "all";
		}
%>
<div align="center">
	<hr color="green" width="300">
<%	if (mode.equals("all")){ %>	
	<h2>ȸ �� �� �� �� ��</h2>
<%	}else { %>
	<h2>ȸ �� ã ��</h2>
	<form name="f" method="post">
		<select name="search">
			<option value="id">���̵�</option>
			<option value="name">�̸�</option>
		</select>
		<input type="text" name="searchString">
		<input type="submit" value="ã��">
	</form>
	<jsp:setProperty property="*" name="mbdao"/>
<%	} %>	
	<hr color="green" width="300">
	<table width="100%" class="outline">
		<tr>
			<th class="m3">��ȣ</th>
			<th class="m3">�̸�</th>
			<th class="m3">���̵�</th>
			<th class="m3">�̸���</th>
			<th class="m3">��ȭ��ȣ</th>
			<th class="m3">������</th>
			<th class="m3">����|����</th>
		</tr>
<%
		List<MemberDTO> list = null;
		if (mode.equals("all")) list = mbdao.listMember();
		else list = mbdao.findMember();
		
		if (list == null || list.size()==0){%>
		<tr>
			<td colspan="7">��ϵ�(ã���ô�) ȸ���� �����ϴ�.</td>
		</tr>		
<%	}else {
			for(MemberDTO dto : list){%>
		<tr>
			<td><%=dto.getNo()%></td>
			<td><%=dto.getName()%></td>
			<td><%=dto.getId()%></td>
			<td><%=dto.getEmail()%></td>
			<td><%=dto.getAllHp()%></td>
			<td><%=dto.getJoindate()%></td>
			<td>
			<a href="member_update.jsp?no=<%=dto.getNo()%>">����</a> | 
			<a href="member_delete.jsp?no=<%=dto.getNo()%>">����</a></td>
		</tr>	
<%		}
		}%>					
	</table>
</div>
<%@ include file="../bottom.jsp"%>













