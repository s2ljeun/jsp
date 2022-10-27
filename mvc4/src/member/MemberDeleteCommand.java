package member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberDeleteCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String no = req.getParameter("no");
		MemberDAO dao = new MemberDAO();
		try {
			int res = dao.deleteMember(Integer.parseInt(no));
			if (res>0) {
				req.setAttribute("msg", "ȸ����������!! ȸ�������������� �̵��մϴ�.");
				req.setAttribute("url", "member_list.mem");
			}else {
				req.setAttribute("msg", "ȸ������ ����!! ȸ�������������� �̵��մϴ�.");
				req.setAttribute("url", "member_list.mem");
			}
		}catch(SQLException e) {
			req.setAttribute("msg", "DB ���� ���� �߻�!! �����ڿ��� �����ϼ���");
			req.setAttribute("url", "index.mem");
		}
		return "message.jsp";
	}
}