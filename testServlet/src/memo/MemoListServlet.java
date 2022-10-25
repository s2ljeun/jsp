package memo;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemoListServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
														throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		resp.setContentType("text/html; charset=EUC-KR");
		PrintWriter out = resp.getWriter();
		out.println("<html><head><title>�޸𸮽�Ʈ</title></head>");
		out.println("<body><div align='center'>");
		out.println("<hr color='green' width='300'>");
		out.println("<h2>�� �� �� �� Ʈ</h2>");
		out.println("<hr color='green' width='300'>");
		out.println("<table border='1' width='500'");
		out.println("<tr>");
		out.println("<th>ID</th><th width='20%'>�̸���</th><th width='70%'>�޸�</th>");
		out.println("</tr>");
		MemoDAO dao = new MemoDAO();
		List<MemoDTO> list = dao.listMemo();
		if (list == null || list.size()==0) {
			out.println("<tr>");
			out.println("<td colspan='3'>��ϵ� �޸� �����ϴ�.</td>");
			out.println("</tr>");
		}else {
			for(MemoDTO dto : list) {
				out.println("<tr>");
				out.println("<td>"+ dto.getId() + "</td>");
				out.println("<td>"+ dto.getEmail() + "</td>");
				out.println("<td>"+ dto.getContents() + "</td>");
				out.println("</tr>");
			}
		}
		out.println("</div></body></html>");
	}
	
}










