import java.sql.ResultSet;
import java.sql.SQLException;

public class program {
    public static void main(String[] args) throws SQLException {
        ConnectDB dbOrders = new ConnectDB("localhost", 3306,"sql_dz_vvs","root","123qwe");

        ResultSet rs = dbOrders.selectFromTable();
        while(rs.next()){
            int id = rs.getInt("ID");
            String employee_id = rs.getString("employee_id");
            System.out.printf("%d %s \n", id, employee_id);
        }
    }
}
