package member;

public class MemberCommandFactory {
	private MemberCommandFactory() {}
	private static MemberCommandFactory instance = new MemberCommandFactory();
	public static MemberCommandFactory getInstance() {
		return instance;
	}
	
	public CommandIf createCommand(String cmd) {
		CommandIf cmdIf = null;
		if (cmd.equals("/index.mem")) {
			cmdIf = new MemberIndexCommand();
		}else if (cmd.equals("/member_ssn.mem")) {
			cmdIf = new MemberSsnCommand();
		}else if (cmd.equals("/member_check.mem")) {
			cmdIf = new MemberCheckCommand();
		}else if (cmd.equals("/member_input.mem")) {
			cmdIf = new MemberInputCommand();
		}else if (cmd.equals("/member_input_ok.mem")) {
			cmdIf = new MemberInputOkCommand();
		}else if (cmd.equals("/member_list.mem")) {
			cmdIf = new MemberListCommand();
		}else if (cmd.equals("/member_delete.mem")) {
			cmdIf = new MemberDeleteCommand();
		}else if (cmd.equals("/member_update.mem")) {
			cmdIf = new MemberUpdateCommand();
		}else if (cmd.equals("/member_update_ok.mem")) {
			cmdIf = new MemberUpdateOkCommand();
		}else if (cmd.equals("/login.mem")) {
			cmdIf = new LoginCommand();
		}else if (cmd.equals("/member_search.mem")) {
			cmdIf = new MemberSearchCommand();
		}else if (cmd.equals("/member_search_ok.mem")) {
			cmdIf = new MemberSearchOkCommand();
		}
		return cmdIf;
	}
}
