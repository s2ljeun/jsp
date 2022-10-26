package student;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InsertCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		StudentDTO dto = new StudentDTO();
		dto.setId(req.getParameter("id"));
		dto.setName(req.getParameter("name"));
		dto.setCname(req.getParameter("cname"));
		StudentDAO dao = new StudentDAO();
		String msg = null, url = null;
		try {
			int res = dao.insertStudent(dto);
			if (res>0) {
				msg = "학생등록성공!! 학생목록페이지로 이동합니다.";
				url = "student.do?command=list";
			}else {
				msg = "학생등록실패!! 학생관리페이지로 이동합니다.";
				url = "student.do?command=start";
			}
		}catch(SQLException e) {
			msg = "DB오류 발생!! 관리자에게 문의해 주세요.";
			url = "student.do?command=start";
			e.printStackTrace();
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message.jsp";
	}

}
