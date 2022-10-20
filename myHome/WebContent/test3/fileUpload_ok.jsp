<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.*, java.io.*" %>
<!-- fileUpload_ok.jsp -->

<%
	MultipartRequest mr = null;
	String upPath = config.getServletContext().getRealPath("/test3");
	//String upPath = application.getRealPath("/test3");
	//String upPath = request.getServletContext().getRealPath("/test3");
	//String upPath = this.getServletContext().getRealPath("/test3");
	//out.println("path= " + upPath);
	int len = 10*1024*1024; //10mb // byte->kbyte->mbyte->gbyte->tbyte 2의10승 1024씩 증가

	try{
		mr = new MultipartRequest(request, upPath, len, "EUC-KR");
		//mr에서 파라메터 값을 꺼낼 수 있다.
		out.println("파일 업로드 성공!!");
	}catch(IOException e){
		out.println("파일 업로드 실패!!");
		e.printStackTrace();
	}

%>
<br>
올린이:<%=mr.getParameter("name")%><br>
파일이름:<%=mr.getFilesystemName("filename") %><br>
파일크기:<%
	File file = mr.getFile("filename"); // 올라온 파일 이름으로 파일 객체를 만들고 length 구하기
	int filesize = 0;
	if(file !=null){
		filesize = (int)file.length(); //file.length()의 결과는 long 타입으로 나오기 때문에 형변환
	}
%>
<%=filesize%>bytes<br>
파일타입:<%=mr.getContentType("filename") %><br>