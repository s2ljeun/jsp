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
		if (cmd.equals("/shopAdminIndex.mall")) {
			cmdIf = new ShopAdminIndexCommand();
		}else if (cmd.equals("/cate_input.mall")) {
			cmdIf = new CateInputCommand();
		}else if (cmd.equals("/cate_input_ok.mall")) {
			cmdIf = new CateInputOkCommand();
		}else if (cmd.equals("/cate_list.mall")) {
			cmdIf = new CateListCommand();
		}else if (cmd.equals("/cate_delete.mall")) {
			cmdIf = new CateDeleteCommand();
		}else if (cmd.equals("/prod_input.mall")) {
			cmdIf = new ProdInputCommand();
		}else if (cmd.equals("/prod_input_ok.mall")) {
			cmdIf = new ProdInputOkCommand();
		}else if (cmd.equals("/prod_list.mall")) {
			cmdIf = new ProdListCommand();
		}else if (cmd.equals("/prod_delete.mall")) {
			cmdIf = new ProdDeleteCommand();
		}else if (cmd.equals("/prod_update.mall")) {
			cmdIf = new ProdUpdateCommand();
		}else if (cmd.equals("/prod_update_ok.mall")) {
			cmdIf = new ProdUpdateOkCommand();
		}else if (cmd.equals("/prod_view.mall")) {
			cmdIf = new ProdViewCommand();
		}else if (cmd.equals("/mall.mall")) {
			cmdIf = new MallCommand();
		}else if (cmd.equals("/mall_cgProdList.mall")){
			cmdIf = new MallCgProdListCommand();	
		}else if (cmd.equals("/mall_prodView.mall")) {
			cmdIf = new MallProdViewCommand();
		}else if (cmd.equals("/mall_cartAdd.mall")) {
			cmdIf = new MallCartAddCommand();
		}
		return cmdIf;
	}
}
