
package Conexion;


//Importamos la libreria necesaria para la conexión
import java.sql.*;

public class ConexionDB {
    private static final String nameDB = "CuackProyecto";
    private static final String userDB = "root";
    private static final String passDB = "admin";
    //Creamos el metodo que permite la conexion a la DB
    public static Connection getConexion(){
        Connection cn = null;
        try{
            //Cargamos el driver MYSQL
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+nameDB, userDB, passDB);
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
