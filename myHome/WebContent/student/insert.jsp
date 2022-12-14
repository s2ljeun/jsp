<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- insert.jsp -->
<%--
	1. 넘어온 데이터 받기
	2. 넘어온 데이터 유효성 검사하기
	3. 드라이버 연결하기
	4. 오라클에 접속하여 쿼리문 전송하기
	5. 결과를 받아 처리하기
	6. db연결 닫기
--%>
<%		//1.
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String cname = request.getParameter("cname");
		
		//2.
		if(id==null||name==null||cname==null
			||id.trim().equals("")||name.trim().equals("")||cname.trim().equals("")){%>
			<script type="text/javascript">
				alert("아이디, 학생명, 학급명을 모두 입력해주세요!!");
				history.back(); //자바스크립트의 뒤로가기
			</script>
<%			return; //변환된 java파일에서 우리 코드가 적힌 void 메소드를 빠져나오기
		}%>
		
		<jsp:useBean id="stdao" class="my.student.StudentDAO" />
		<!-- StudentDAO stdao = new StudentDAO(); 와 같음  -->
		<!-- useBean은 무조건 디폴트 생성자만 불러낼 수 있음. -->

<%
		int res = stdao.insertStudent(id, name, cname);
		//5.
		if (res>0){%>
		<script type="text/javascript">
			alert("학생등록 성공!! 학생목록페이지로 이동합니다.")
			location.href="list.jsp" //자바스크립트의 a태그 - 해당 파일로 이동
		</script>			
<%	}else {%>
		<script type="text/javascript">
			alert("학생등록 실패!! 학생관리페이지로 이동합니다.")
			location.href="student.jsp"
		</script>
<%	} %>