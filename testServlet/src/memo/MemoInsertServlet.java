package memo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemoInsertServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		resp.setContentType("text/html; charset=EUC-KR");
		PrintWriter out = resp.getWriter();
		MemoDTO dto = new MemoDTO();
		dto.setId(req.getParameter("id"));  
		dto.setEmail(req.getParameter("email"));
		dto.setContents(req.getParameter("contents"));
		MemoDAO dao = new MemoDAO();
		int res = dao.insertMemo(dto);
		if (res>0) {
			out.println("<script type='text/javascript'>");
			out.println("alert('�޸�� �ۼ� ����!! �޸𸮽�Ʈ�� �̵��մϴ�.')");
			out.println("location.href='listMemo.do'");
			out.println("</script>");
		}else {
			out.println("<script type='text/javascript'>");
			out.println("alert('�޸�� �ۼ� ����!! �޸��ۼ��������� �̵��մϴ�.')");
			out.println("location.href='memo.html'");
			out.println("</script>");
		}
	}
	
}












