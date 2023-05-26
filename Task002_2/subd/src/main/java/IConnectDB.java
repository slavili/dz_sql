import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public interface IConnectDB {
    public ResultSet selectFromTable() throws SQLException;
    public ResultSet selectFromTable(int id) throws SQLException;

    public void insertIntoTable(String[] userArray) throws SQLException;
    public void deleteFromTable(int id) throws SQLException;
    public void updateTable(String[] userstring) throws SQLException;
    public void closeConnection() throws SQLException ;
}
