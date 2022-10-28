package shop.command;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.dao.ProductDAO;
import shop.dto.ProductDTO;

public class ShopProdListCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		ProductDAO dao = new ProductDAO();
		try {
			List<ProductDTO> list = dao.listProd();
			req.setAttribute("prodList", list);
			
		} catch (SQLException e) {
			req.setAttribute("msg", "db에러! 관리자 문의");
			req.setAttribute("url", "index.do");
			return "message.jsp";
		}
		
		return "WEB-INF/shop/prod_list.jsp";
	}

}
