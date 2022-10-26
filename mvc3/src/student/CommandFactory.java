package student;

public class CommandFactory {
	private CommandFactory() {} //생성자가 private이므로 외부에서는 만들 수 없다
	private static CommandFactory instance = new CommandFactory(); //싱글톤객체 -> 매번 객체를 만드는 게 아니라,한 번만 만들어 그 객체를 모든 사용자가 사용할 수 있게 해준다.
	public static CommandFactory getInstance() {
		return instance;
	}
	
	public CommandIf createCommand(String cmd) {
		CommandIf cmdIf = null;
		if (cmd.equals("insert")) {
			cmdIf = new InsertCommand();
		}else if (cmd.equals("delete")) {
			cmdIf = new DeleteCommand();
		}else if (cmd.equals("find")) {
			cmdIf = new FindCommand();
		}else if (cmd.equals("list")) {
			cmdIf = new ListCommand();
		}else if (cmd.equals("start")) {
			cmdIf = new StartCommand();
		}
		return cmdIf;
	}
}





