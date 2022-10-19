<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- deletePro.jsp -->
<%
		String num = request.getParameter("num");
		String passwd = request.getParameter("passwd");
		if (num==null || num.trim().equals("")){
			response.sendRedirect("list.jsp");
			return;			
		}
		if (passwd==null || passwd.trim().equals("")){%>
			<script type="text/javascript">
				alert("비밀번호를 입력하셔야 합니다.")
				history.back()
			</script>	
<%		return;
		}%>
<jsp:useBean id="bdao" class="my.board.BoardDAO"/>
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="bdao" value="<%=pool%>"/>		
<%
		int res = bdao.deleteBoard(Integer.parseInt(num), passwd);
		String msg = null, url = null;
		if (res>0){
			msg = "게시글 삭제 성공!! 게시글 목록 페이지로 이동합니다.";
			url = "list.jsp";
		}else if (res<0){
			msg = "비밀번호가 틀렸습니다. 다시 입력해 주세요.";
			url = "deleteForm.jsp?num=" + num;
		}else {
			msg = "게시글 삭제 실패!! 게시글 상세보기 페이지로 이동합니다.";
			url = "content.jsp?num=" + num;
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>















		