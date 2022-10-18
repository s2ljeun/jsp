<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*"%>
<!-- count.jsp -->
<%!
		int count = 0;
		String filename = "";
		public void jspInit(){ //오버라이드 //jsp 객체가 처음 만들어질 때 불려가는 메소드
			filename = this.getServletContext().getRealPath("count/count.txt"); //이클립스가 가리키는 곳 RealPath는
																				//G:\jieun\study2\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\myHome\count
			FileReader fr = null;
			BufferedReader br = null;
			try{
				fr = new FileReader(filename);
				br = new BufferedReader(fr);
				String line = br.readLine();
				if (line != null) count = Integer.parseInt(line.trim());
				br.close();
				fr.close();
			}catch(FileNotFoundException e){
				countSaveFile();
			}catch(IOException e){
				e.printStackTrace();
				countSaveFile();
			}
		}
		
		public void countSaveFile(){
			FileWriter fw = null;
			PrintWriter pw = null;
			try{
				fw = new FileWriter(filename);//file이 존재하지 않으면 file을 만들어서 객체 완성
				pw = new PrintWriter(fw, true);
				pw.println(count);
				pw.close();
				fw.close();
			}catch(IOException e){
				e.printStackTrace();
			}
		}
		
		public void jspDestroy(){
			countSaveFile();
		}
%>
<%
		if (session.isNew()){	//새로운 브라우저가 요청이 되었을때.. 
			count++;
		}

		if (count%10 == 0){
			countSaveFile();
		}
%>
<b>방문자수 : </b>
<%
		String countStr = String.valueOf(count);
		out.println(countStr); //out -> console이 아닌 브라우저에 write하는 객체
%>





