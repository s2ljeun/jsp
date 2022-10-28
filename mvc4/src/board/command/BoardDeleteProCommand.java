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
				req.setAttribute("msg", "게시글 삭제 성공!! 게시글 목록페이지로 이동합니다.");
				req.setAttribute("url", "list.board");
			}else if (res<0) {
				req.setAttribute("msg", "비밀번호가 틀렸습니다. 다시 입력해 주세요");
				req.setAttribute("url", "deleteForm.board?num=" + num);
			}else {
				req.setAttribute("msg", "게시글 삭제 실패!! 게시글 상세보기페이지로 이동합니다.");
				req.setAttribute("url", "content.board?num=" + num);
			}
		}catch(SQLException e) {
			req.setAttribute("msg", "DB 오류 발생!! 관리자에게 문의하세요.");
			req.setAttribute("url", "index.do");
		}
		return "message.jsp";
	}

}
