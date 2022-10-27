package member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberUpdateOkCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		MemberDTO dto = new MemberDTO();
		dto.setPasswd(req.getParameter("passwd"));
		dto.setEmail(req.getParameter("email"));
		dto.setHp1(req.getParameter("hp1"));
		dto.setHp2(req.getParameter("hp2"));
		dto.setHp3(req.getParameter("hp3"));
		dto.setNo(Integer.parseInt(req.getParameter("no")));
		MemberDAO dao = new MemberDAO();
		try {
			int res = dao.updateMember(dto);
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
