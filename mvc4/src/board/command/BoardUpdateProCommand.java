package board.command;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDAO;
import board.dto.BoardDTO;

public class BoardUpdateProCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		BoardDTO dto = new BoardDTO();
		dto.setWriter(req.getParameter("writer"));
		dto.setEmail(req.getParameter("email"));
		dto.setSubject(req.getParameter("subject"));
		dto.setPasswd(req.getParameter("passwd"));
		dto.setContent(req.getParameter("content"));
		dto.setNum(Integer.parseInt(req.getParameter("num")));
		
		BoardDAO dao = new BoardDAO();
		try {
			int res = dao.updateBoard(dto);
			if (res>0) {
				req.setAttribute("msg", "�Խñ� ���� ����!! �Խñ� ����������� �̵��մϴ�.");
				req.setAttribute("url", "list.board");
			}else if (res<0) {
				req.setAttribute("msg", "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է��� �ּ���");
				req.setAttribute("url", "updateForm.board?num=" + dto.getNum());
			}else {
				req.setAttribute("msg", "�Խñ� ���� ����!! �Խñ� �󼼺����������� �̵��մϴ�.");
				req.setAttribute("url", "content.board?num=" + dto.getNum());
			}
		}catch(SQLException e) {
			req.setAttribute("msg", "DB ���� �߻�!! �����ڿ��� �����ϼ���.");
			req.setAttribute("url", "index.do");
		}
		return "message.jsp";
	}

}
