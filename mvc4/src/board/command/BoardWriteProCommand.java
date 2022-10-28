package board.command;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDAO;
import board.dto.BoardDTO;

public class BoardWriteProCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		BoardDTO dto = new BoardDTO();
		dto.setWriter(req.getParameter("writer"));
		dto.setEmail(req.getParameter("email"));
		dto.setSubject(req.getParameter("subject"));
		dto.setPasswd(req.getParameter("passwd"));
		dto.setContent(req.getParameter("content"));
		dto.setIp(req.getRemoteAddr());
		dto.setNum(Integer.parseInt(req.getParameter("num")));
		dto.setRe_step(Integer.parseInt(req.getParameter("re_step")));
		dto.setRe_level(Integer.parseInt(req.getParameter("re_level")));
		
		BoardDAO dao = new BoardDAO();
		try {
			int res = dao.insertBoard(dto);
			if (res>0) {
				req.setAttribute("msg", "�Խñ� ��� ����!! �Խñ� ����������� �̵��մϴ�.");
				req.setAttribute("url", "list.board");
			}else {
				req.setAttribute("msg", "�Խñ� ��� ����!! �Խñ� ����������� �̵��մϴ�.");
				req.setAttribute("url", "writeForm.board");
			}
		}catch(SQLException e) {
			req.setAttribute("msg", "DB ���� �߻�!! �����ڿ��� �����ϼ���.");
			req.setAttribute("url", "index.do");
		}
		return "message.jsp";
	}
}








