package member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginOkCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String id = req.getParameter("id");
		String passwd = req.getParameter("passwd");
		String saveId = req.getParameter("saveId");
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = null;
		try{
			dto = dao.getMember(id);
		}catch(SQLException e) {
			req.setAttribute("msg", "DB ���� ���� �߻�!! �����ڿ��� �����ϼ���");
			req.setAttribute("url", "index.mem");
			return "message.jsp";
		}
		if (dto == null){
			req.setAttribute("msg", "�ش��ϴ� ���̵� �����ϴ�. �ٽ� Ȯ���Ͻð� �Է��� �ּ���!!");
			req.setAttribute("url", "login.mem");
		}else {
			if (dto.getPasswd().equals(passwd)){
				req.setAttribute("msg", dto.getName()+"��, ȯ���մϴ�.");
				req.setAttribute("url", "index.do");
				//��������
				HttpSession session = req.getSession();
				session.setAttribute("mdto", dto);
				//��Ű����
				Cookie ck = new Cookie("saveId", id);
				if (saveId == null) ck.setMaxAge(0);
				else ck.setMaxAge(24*60*60);
				resp.addCookie(ck);
			}else {
				req.setAttribute("msg", "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� Ȯ���Ͻð� �Է��� �ּ���!!");
				req.setAttribute("url", "login.mem");
			}
		}
		return "message.jsp";
	}

}
