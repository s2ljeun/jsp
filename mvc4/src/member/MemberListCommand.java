package member;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberListCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		List<MemberDTO> list = null;
		try {
			if (req.getParameter("mode") == null) {
				list = dao.listMember();
			}else {
				String search = req.getParameter("search");
				String searchString = req.getParameter("searchString");
				list = dao.findMember(search, searchString);
			}
			req.setAttribute("listMember", list);
		}catch(SQLException e) {
			req.setAttribute("msg", "DB 서버 오류 발생!! 관리자에게 문의하세요");
			req.setAttribute("url", "index.mem");
			return "message.jsp";
		}
		return "WEB-INF/member/member_list.jsp";
	}

}
