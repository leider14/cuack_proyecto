
package Conexion;
import java.sql.*;
import utils.Constants;

public class ConexionDB {
    
    public static Connection getConexion(){
        Connection cn = null;
        try{
            //Cargamos el driver MYSQL
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection(Constants.DB_URL, Constants.DB_USER, Constants.DB_PASSWORD);
            System.out.println("Conexion Satisfactoria :)");
                    
        }catch(Exception e){
            System.out.println("Error de Conexión"+e);
        }
        return cn; 
    }
    
    
    
    public static void main(String[] args) {
        getConexion();
    }
    
}
