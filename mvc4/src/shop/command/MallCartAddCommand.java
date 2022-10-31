package shop.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.dao.ProductList;
import shop.dto.ProductDTO;

public class MallCartAddCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String pnum = req.getParameter("pnum");
		String select = req.getParameter("select");
		String pqty = req.getParameter("pqty");
		
		HttpSession session = req.getSession();
		ProductList plist = (ProductList)session.getAttribute("prodList");
		List<ProductDTO> cart = (List)session.getAttribute("cart");
		if (cart == null) {
			cart = new ArrayList<>();
		}
		ProductDTO dto = plist.getProduct(Integer.parseInt(pnum), select);
		for (ProductDTO pdto : cart) {
			if (pdto.getPnum() == dto.getPnum()) {
				pdto.setPqty(pdto.getPqty() + Integer.parseInt(pqty));
				session.setAttribute("cart", cart);
				return "mall_cartList.mall";
			}
		}
		dto.setPqty(Integer.parseInt(pqty));
		cart.add(dto);
		session.setAttribute("cart", cart);
		return "mall_cartList.mall";
	} 
 
}













