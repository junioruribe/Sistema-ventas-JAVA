
package Modelo;

//import com.sun.jdi.connect.spi.Connection;
import com.mysql.jdbc.Connection;
import java.sql.DriverManager;

public class Conectar {
    private static Connection con;
    private static String path;
    
    public static Connection open(){
        path="jdbc:mysql://localhost:3306/dbventas";
        try {
            if (con== null || con.isClosed()) {
                Class.forName("com.mysql.jdbc.Driver");
                con = (Connection) DriverManager.getConnection(path,"root","");
            }
        } catch (Exception e) {
            con= null;
        }
        return con;
        
    }
    public static boolean cerrar(){
        try {
            con.close();
            return true;
        } catch (Exception ex) {
            return false;
        }
    }
    
}