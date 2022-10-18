<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*"%>
<!-- count.jsp -->
<%!
		int count = 0;
		String filename = "";
		public void jspInit(){ //�������̵� //jsp ��ü�� ó�� ������� �� �ҷ����� �޼ҵ�
			filename = this.getServletContext().getRealPath("count/count.txt"); //��Ŭ������ ����Ű�� �� RealPath��
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
				fw = new FileWriter(filename);//file�� �������� ������ file�� ���� ��ü �ϼ�
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
		if (session.isNew()){	//���ο� �������� ��û�� �Ǿ�����.. 
			count++;
		}

		if (count%10 == 0){
			countSaveFile();
		}
%>
<b>�湮�ڼ� : </b>
<%
		String countStr = String.valueOf(count);
		out.println(countStr); //out -> console�� �ƴ� �������� write�ϴ� ��ü
%>





