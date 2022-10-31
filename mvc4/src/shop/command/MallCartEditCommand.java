package shop.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.dto.ProductDTO;

public class MallCartEditCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		List<ProductDTO> cart = (List)session.getAttribute("cart");
		int pnum = Integer.parseInt(req.getParameter("pnum"));
		int pqty = Integer.parseInt(req.getParameter("pqty"));
		
		for(ProductDTO dto : cart) {
			if (dto.getPnum() == pnum) {
				if (pqty == 0) {
					cart.remove(dto);
					break;
				}else {
					dto.setPqty(pqty);
					break;
				}
			}
		}
		
		return "WEB-INF/shop/display/mall_cartList.jsp";
	}

}













