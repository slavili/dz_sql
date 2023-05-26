import java.sql.*;
import java.util.List;

public class ConnectDB implements IConnectDB {
    private Connection connectToDb;
    private String createTableSql = "CREATE TABLE articles(\n" +
            "\tID INT UNSIGNED NOT NULL AUTO_INCREMENT\n" +
            "    , Title varchar(255) NOT NULL\n" +
            "    , Content text NOT NULL\n" +
            "    , CONSTRAINT UX_articles_title UNIQUE KEY (Title)\n" +
            "    , CONSTRAINT PK_articles_id PRIMARY KEY (ID)\n" +
            ")  engine=innodb default charset=utf8mb4 collate=utf8mb4_general_ci;";
    private String tableName = "articles";
    public ConnectDB(String host, int port, String dbName, String login, String password) throws SQLException {
        this.connectToDb = DriverManager.getConnection("jdbc:mysql://"+host+":"+port+"/"+dbName+"?serverTimezone=UTC", login, password);
        String sql = "select count(*) as cnt \n" +
                "from information_schema.tables \n" +
                "where table_schema = ? \n" +
                "and table_name = ? ;";
        PreparedStatement select = connectToDb.prepareStatement(sql);
        select.setString(1, dbName);
        select.setString(2, this.tableName);
        ResultSet resultSelect = select.executeQuery();
        resultSelect.next();
        int cnt = resultSelect.getInt("cnt");
        if(cnt == 0){
            PreparedStatement createTable = this.connectToDb.prepareStatement(createTableSql);
            createTable.executeUpdate();
        }
    }

    @Override
    public ResultSet selectFromTable() throws SQLException {
        String sql = "SELECT\n" +
                "      ID -- идентификатор статьи\n" +
                "    , Title -- Название статьи\n" +
                "    , Content -- Содержимое статьи\n" +
                "FROM articles;";
        PreparedStatement select = connectToDb.prepareStatement(sql);
        return select.executeQuery();
    }

    @Override
    public ResultSet selectFromTable(int id) throws SQLException {
        String sql = "SELECT\n" +
                "      ID -- идентификатор статьи\n" +
                "    , Title -- Название статьи\n" +
                "    , Content -- Содержимое статьи\n" +
                "FROM articles\n" +
                "WHERE ID=?;";
        PreparedStatement select = connectToDb.prepareStatement(sql);
        select.setInt(1, id);
        return select.executeQuery();
    }

    @Override
    public void insertIntoTable(String[] userArray) throws SQLException {
        String sql = "INSERT INTO articles (Title, Content) VALUES (?, ?);";
        PreparedStatement insert = this.connectToDb.prepareStatement(sql);
        insert.setString(1, userArray[0]);
        insert.setString(2, userArray[1]);
        System.out.printf("Вставлено %d строк! \n", insert.executeUpdate());
    }

    @Override
    public void deleteFromTable(int id) throws SQLException {
        String sql = "DELETE FROM articles WHERE ID=?";
        PreparedStatement delete = this.connectToDb.prepareStatement(sql);
        delete.setInt(1, id);
        System.out.printf("Удалено %d строк! \n", delete.executeUpdate());
    }

    @Override
    public void updateTable(String[] userArray) throws SQLException {
        String sql = "UPDATE articles SET Title=?, Content=?  WHERE ID=?";
        PreparedStatement update = this.connectToDb.prepareStatement(sql);
        update.setString(1, userArray[1]);
        update.setString(2, userArray[2]);
        update.setInt(3, Integer.parseInt(userArray[0]));
        System.out.printf("Обновлено %d строк! \n", update.executeUpdate());
    }

    @Override
    public void closeConnection() throws SQLException {
        this.connectToDb.close();
    }
}
