package shop.dao;

import java.util.*;

import shop.dto.ProductDTO;

public class CartBean {
	private List<ProductDTO> cart;
	private ProductList plist;
	
	public CartBean() {
		cart = new ArrayList<>();
	}
	
	public void setPlist(ProductList plist) {
		this.plist = plist;
	}
	
	public int insertCart(int pnum, String select, int pqty) {
		ProductDTO dto = plist.getProduct(pnum, select);
		dto.setPqty(pqty);
		for(ProductDTO cdto : cart) {
			if (pnum == cdto.getPnum()) {
				cdto.setPqty(cdto.getPqty() + pqty);
				return 1;
			}
		}
		cart.add(dto);
		return 1;
	}
	
	public List<ProductDTO> listCart(){
		return cart;
	}
	
	public int editCart(int pnum, int pqty) {
		for(ProductDTO cdto : cart) {
			if (cdto.getPnum() == pnum) {
				if (pqty == 0) {
					deleteCart(pnum);
					return 1;
				}
				cdto.setPqty(pqty);
				return 1;
			}
		}
		return 0;
	}
	
	public int deleteCart(int pnum) {
		for(ProductDTO cdto : cart) {
			if (cdto.getPnum() == pnum) {
				cart.remove(cdto);
				return 1;
			}
		}
		return 0;
	}
	
	public void deleteCart() {
		cart.clear();
	}
}













