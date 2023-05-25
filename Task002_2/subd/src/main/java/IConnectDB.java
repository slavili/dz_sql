import java.sql.ResultSet;
import java.sql.SQLException;

public interface IConnectDB {
    public ResultSet selectFromTable() throws SQLException;
    public ResultSet selectFromTable(int id);
    public ResultSet selectFromTable(String like);

}
