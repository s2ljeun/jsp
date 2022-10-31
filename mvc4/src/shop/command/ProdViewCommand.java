package shop.command;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.dao.ProductBean;
import shop.dto.ProductDTO;

public class ProdViewCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String pnum = req.getParameter("pnum");
		ProductBean dao = new ProductBean();
		try {
			ProductDTO dto = dao.getProduct(Integer.parseInt(pnum));
			req.setAttribute("getProduct", dto);
			return "WEB-INF/shop/admin/prod_view.jsp";
		}catch(SQLException e) {
			req.setAttribute("msg", "DB 오류 발생!! 관리자에게 문의하세요.");
			req.setAttribute("url", "shopAdminIndex.mall");
			return "message.jsp";
		}
	}

}
