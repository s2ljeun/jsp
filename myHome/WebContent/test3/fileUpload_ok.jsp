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
	int len = 10*1024*1024; //10mb // byte->kbyte->mbyte->gbyte->tbyte 2��10�� 1024�� ����

	try{
		mr = new MultipartRequest(request, upPath, len, "EUC-KR");
		//mr���� �Ķ���� ���� ���� �� �ִ�.
		out.println("���� ���ε� ����!!");
	}catch(IOException e){
		out.println("���� ���ε� ����!!");
		e.printStackTrace();
	}

%>
<br>
�ø���:<%=mr.getParameter("name")%><br>
�����̸�:<%=mr.getFilesystemName("filename") %><br>
����ũ��:<%
	File file = mr.getFile("filename"); // �ö�� ���� �̸����� ���� ��ü�� ����� length ���ϱ�
	int filesize = 0;
	if(file !=null){
		filesize = (int)file.length(); //file.length()�� ����� long Ÿ������ ������ ������ ����ȯ
	}
%>
<%=filesize%>bytes<br>
����Ÿ��:<%=mr.getContentType("filename") %><br>