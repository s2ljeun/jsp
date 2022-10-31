package shop.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.dao.ProductList;
import shop.dto.ProductDTO;

public class MallCartDelCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		List<ProductDTO> cart = (List)session.getAttribute("cart");
		String pnum = req.getParameter("pnum");
		for(ProductDTO dto : cart) {
			if (dto.getPnum() == Integer.parseInt(pnum)) {
				cart.remove(dto);
				break;
			}
		}
		
		return "WEB-INF/shop/display/mall_cartList.jsp";
	}

}












