<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- writePro.jsp -->
<!-- ★참고: member_input.jsp -->

<%
		request.setCharacterEncoding("EUC-KR");
%>

<jsp:useBean id="bdto" class="my.board.BoardDTO" />
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="my.board.BoardDAO" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="bdao" value="<%=pool%>"/>		

<%//자바빈 객체 "bdto"의 필드값을 지정할 건데, request로 넘어온 파라미터 값과 동일한 이름의
  //setter메소드를 사용하여 각각 지정한다.
  //value값이 없으면 자동으로 파라메터 값으로 들어간다
  
  //DTO -> 게시글 객체 만들기 DAO -> pool연결
  
  //"bdao" 라는 자바빈객체에 "pool"이라는 이름을 가진 setter메소드를 이용하여,
  //<%=pool>==자바빈객체를 설정
%>

<%
		if (bdto.getWriter() == null || bdto.getWriter().trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}

		bdto.setIp(request.getRemoteAddr());
		int res = bdao.insertBoard(bdto);
		String msg = null, url = null;
		if (res>0){
			msg = "게시글 등록 성공!! 게시글 목록페이지로 이동합니다.";
			url = "list.jsp";
		}else {
			msg = "게시글 등록 실패!! 게시글 등록페이지로 이동합니다.";
			url = "writeForm.jsp";
		}
		%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>












