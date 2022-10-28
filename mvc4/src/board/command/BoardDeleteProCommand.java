package board.command;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDAO;

public class BoardDeleteProCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String num = req.getParameter("num");
		String passwd = req.getParameter("passwd");
		
		BoardDAO dao = new BoardDAO();
		try {
			int res = dao.deleteBoard(Integer.parseInt(num), passwd);
			if (res>0) {
				req.setAttribute("msg", "�Խñ� ���� ����!! �Խñ� ����������� �̵��մϴ�.");
				req.setAttribute("url", "list.board");
			}else if (res<0) {
				req.setAttribute("msg", "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է��� �ּ���");
				req.setAttribute("url", "deleteForm.board?num=" + num);
			}else {
				req.setAttribute("msg", "�Խñ� ���� ����!! �Խñ� �󼼺����������� �̵��մϴ�.");
				req.setAttribute("url", "content.board?num=" + num);
			}
		}catch(SQLException e) {
			req.setAttribute("msg", "DB ���� �߻�!! �����ڿ��� �����ϼ���.");
			req.setAttribute("url", "index.do");
		}
		return "message.jsp";
	}

}
