package shop;

import shop.command.*;

public class ShopCommandFactory {
	private ShopCommandFactory() {}
	private static ShopCommandFactory instance = new ShopCommandFactory();
	public static ShopCommandFactory getInstance() {
		return instance;
	}
	
	public CommandIf createCommand(String cmd) {
		CommandIf cmdIf = null;
		if(cmd.equals("/shopAdmin.mall")){
			cmdIf = new ShopAdminCommand();
		}else if(cmd.equals("/mall.mall")){ //ºÓ«Œ∏Ù∆‰¿Ã¡ˆ
			cmdIf = new ShopAdminCommand();
		}else if(cmd.equals("/cate_input.mall")){
			cmdIf = new ShopCateInputCommand();
		}else if(cmd.equals("/cate_input_ok.mall")){
			cmdIf = new ShopCateInputProCommand();
		}else if(cmd.equals("/cate_list.mall")){
			cmdIf = new ShopCateListCommand();
		}else if(cmd.equals("/cate_delete.mall")){
			cmdIf = new ShopCateDeleteCommand();
		}else if(cmd.equals("/prod_input.mall")){
			cmdIf = new ShopProdInputCommand();
		}else if(cmd.equals("/prod_input_ok.mall")){
			cmdIf = new ShopProdInputProCommand();
		}else if(cmd.equals("/prod_list.mall")){
			cmdIf = new ShopProdListCommand();
		}
		return cmdIf;
	}
	
}
