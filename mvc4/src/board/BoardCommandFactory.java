package board;

import board.command.*;

public class BoardCommandFactory {
	private BoardCommandFactory() {}
	private static BoardCommandFactory instance = new BoardCommandFactory();
	public static BoardCommandFactory getInstance() {
		return instance;
	}
	
	public CommandIf createCommand(String cmd) {
		CommandIf cmdIf = null;
		if (cmd.equals("/list.board")) {
			cmdIf = new BoardListCommand();
		}else if (cmd.equals("/writeForm.board")) {
			cmdIf = new BoardWriteFormCommand();
		}else if (cmd.equals("/writePro.board")) {
			cmdIf = new BoardWriteProCommand();
		}else if (cmd.equals("/content.board")) {
			cmdIf = new BoardContentCommand();
		}else if (cmd.equals("/deleteForm.board")) {
			cmdIf = new BoardDeleteFormCommand();
		}else if (cmd.equals("/deletePro.board")) {
			cmdIf = new BoardDeleteProCommand();
		}else if (cmd.equals("/updateForm.board")) {
			cmdIf = new BoardUpdateFormCommand();
		}else if (cmd.equals("/updatePro.board")) {
			cmdIf = new BoardUpdateProCommand();
		}
		return cmdIf;
	}
}
