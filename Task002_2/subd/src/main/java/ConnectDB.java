import java.sql.*;

public class ConnectDB implements IConnectDB {
    private Connection connectToDb;

    public ConnectDB(String host, int port, String dbName, String login, String password) throws SQLException {
        this.connectToDb = DriverManager.getConnection("jdbc:mysql://"+host+":"+port+"/"+dbName+"?serverTimezone=UTC", login, password);
    }

    @Override
    public ResultSet selectFromTable() throws SQLException {
        PreparedStatement ps = connectToDb.prepareStatement("select * from orders");
        return ps.executeQuery();
    }

    @Override
    public ResultSet selectFromTable(int id) {
        return null;
    }

    @Override
    public ResultSet selectFromTable(String like) {
        return null;
    }
}
