package shop.command;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.dao.CategoryDAO;
import shop.dto.CategoryDTO;

public class ShopCateInputProCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		CategoryDTO dto = new CategoryDTO();
		dto.setCode(req.getParameter("code"));
		dto.setCname(req.getParameter("cname"));
		
		CategoryDAO dao = new CategoryDAO();
		try {
			int res = dao.insertCate(dto);
			if(res>0) {
				req.setAttribute("msg", "ī�װ� ��ϼ���! ī�װ� ������� �̵��մϴ�.");
				req.setAttribute("url", "cate_list.mall");
			}else {
				req.setAttribute("msg", "ī�װ� ��Ͻ���! ī�װ� ������� �̵��մϴ�.");
				req.setAttribute("url", "cate_list.mall");
			}
		} catch (SQLException e) {
			req.setAttribute("msg", "db����! ������ ����");
			req.setAttribute("url", "index.do");
		}

		return "message.jsp";
	}

}
