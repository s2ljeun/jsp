<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.board.*"%>
<!-- updateForm.jsp -->
<%
		String num = request.getParameter("num");
		if (num == null || num.trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}
%>
<jsp:useBean id="bdao" class="my.board.BoardDAO"/>
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="bdao" value="<%=pool%>"/>		
<%
		BoardDTO dto = bdao.getBoard(Integer.parseInt(num), "update");
%>
<%@ include file="../top.jsp"%>
<link rel="stylesheet" type="text/css" href="../style.css">
<script type="text/javascript">
	function checkBoard(){
		if (!f.subject.value){
			alert("제목을 입력해 주세요!!")
			f.subject.focus()
			return false
		}
		if (f.content.value==""){
			alert("내용을 입력해 주세요!!")
			f.content.focus()
			return false
		}
		if (f.passwd.value==""){
			alert("비밀번호를 입력해 주세요!!")
			f.passwd.focus()
			return false
		}
		return true		
	}
</script>
<div align="center">
	<b>글수정</b>
	<form name="f" action="updatePro.jsp" method="post" onsubmit="return checkBoard()">
		<input type="hidden" name="num" value="<%=num%>" />
		<table border="1" width="500">
			<tr>
				<th bgcolor="yellow">이 름</th>
				<td><input type="text" name="writer" value="<%=dto.getWriter()%>" readOnly></td>
			</tr>
			 <tr>
				<th bgcolor="yellow">제 목</th>
				<td><input type="text" name="subject" size="50" value="<%=dto.getSubject()%>"></td>
			</tr>
			<tr>
				<th bgcolor="yellow">Email</th>
				<td><input type="text" name="email" size="50" value="<%=dto.getEmail()%>"></td>
			</tr>
			<tr>
				<th bgcolor="yellow">내 용</th>
				<td><textarea name="content" rows="11" cols="50"><%=dto.getContent()%></textarea></td>
			</tr>
			<tr>
				<th bgcolor="yellow">비밀번호</th>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr bgcolor="yellow">
				<td colspan="2" align="center">
					<input type="submit" value="글수정">
					<input type="reset" value="다시작성">
					<input type="button" value="목록보기" onclick="window.location='list.jsp'">
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../bottom.jsp"%>