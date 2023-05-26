import com.google.protobuf.UnknownFieldSet;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class program2 {
    public static void main(String[] args) throws SQLException {
        ConnectDB dbOrders = new ConnectDB("localhost", 3306,"sql_dz_vvs","root","123qwe");
        Boolean startLoop = true;
        System.out.println("help - показать команды управления");
        System.out.println("insert - добавить новую статью");
        System.out.println("delete - удалить статью");
        System.out.println("update - обновление статьи");
        System.out.println("select - показать список всех статей");
        System.out.println("q - выход");

        while(startLoop) {
            Scanner in = new Scanner(System.in);
            System.out.print("Введите комманду: ");
            String cmd = in.nextLine();
            switch(cmd){
                case "select" -> {
                    ResultSet rs = dbOrders.selectFromTable();
                    while(rs.next()){
                        int id = rs.getInt("ID");
                        String title = rs.getString("Title");
                        String content = rs.getString("Content");
                        System.out.printf("%d ### %s ### %s \n", id, title, content);
                    }
                } case "insert" -> {
                    String[] userArrayStrings = new String[2];
                    System.out.print("Наберите заголовок статьи: ");
                    userArrayStrings[0] = in.nextLine();
                    System.out.print("Наберите содержимое статьи: ");
                    userArrayStrings[1] = in.nextLine();
                    dbOrders.insertIntoTable(userArrayStrings);
                }
                case "delete" -> {
                    System.out.print("Введите идентификатор удаляемой статьи: ");
                    int id = Integer.parseInt(in.nextLine());
                    dbOrders.deleteFromTable(id);
                }
                case "update" -> {
                    String[] userArray = new String[3];
                    System.out.print("Введите идентификатор статьи, которую нужно исправить: ");
                    int idArticle = Integer.parseInt(in.nextLine());
                    ResultSet update = dbOrders.selectFromTable(idArticle);
                    if(update.next()){
                        userArray[0] = Integer.toString(update.getInt("ID"));
                        userArray[1] = update.getString("Title");
                        userArray[2] = update.getString("Content");
                        System.out.printf("Старый заголовок: %s \n", userArray[1]);
                        System.out.print("Введите новый заголовок(если просто нажать Enter, то заголовок будет старым): ");
                        String title = in.nextLine();
                        if(!title.equals("")){
                            userArray[1] = title;
                        }
                        System.out.printf("Старый контент: %s \n", userArray[2]);
                        System.out.print("Введите новый контент(если просто нажать Enter, то контент будет старым): ");
                        String content = in.nextLine();
                        if(!content.equals("")){
                            userArray[2] = content;
                        }
                        dbOrders.updateTable(userArray);
                    }
                    else {
                        System.out.printf("Статьи с номером %d не существует \n", idArticle);
                    }
                }
                case "help" -> {
                    System.out.println("help - показать команды управления");
                    System.out.println("insert - добавить новую статью");
                    System.out.println("delete - удалить статью");
                    System.out.println("update - обновление статью");
                    System.out.println("select - показать список всех статью");
                    System.out.println("q - выход");
                }
                case "q" ->{
                    System.out.println("Работа с программой завершена!");
                    startLoop = false;
                }
                default -> System.out.println("Неизвестная комманда");
            }
        }

    }
}
