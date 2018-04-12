package Models;

public enum QType {
    INSERT("INSERT INTO ", " VALUES(", ")"),
    UPDATE("UPDATE ", " SET ", " WHERE id = "),
    SEARCH("SELECT * FROM ", " WHERE id = ", ""),
    DELETE("DELETE FROM ", " WHERE id = ", "");

    private final String command1;
    private final String command2;
    private final String command3;

    public String createCommand(String table, SQLCommands command) {
        return command1 + table + command2 + command.getOptional1() + command3 + command.getOptional2();
    }

    private QType(String command1, String command2, String command3) {
        this.command1 = command1;
        this.command2 = command2;
        this.command3 = command3;
    }
}
