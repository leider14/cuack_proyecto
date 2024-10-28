package Modelo;

import Conexion.ConexionDB;
import static Conexion.ConexionDB.getConexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UsuarioDB {

    public static boolean insertarUsuario(String name, String password, int level) {
        boolean rpta = false;
        Connection cn = ConexionDB.getConexion();
        try {
            CallableStatement csta = cn.prepareCall("call insertar_login(?,?,?,?)");
            csta.setString(1, name);
            csta.setString(2, password);
            csta.setInt(3, level);
            if (level == 1) {
                csta.setString(4, "cliente");
            } else {
                csta.setString(4, "empleado");
            }
            int i = csta.executeUpdate();
            System.out.println(i);
            rpta = true;

        } catch (Exception e) {
            rpta = false;
        }
        return rpta;
    }

    public static boolean eliminarUsuario(int id) {
        boolean rpta = false;
        Connection cn = ConexionDB.getConexion();
        try {
            CallableStatement csta = cn.prepareCall("call eliminar_login(?)");
            csta.setInt(1, id);
            int i = csta.executeUpdate();
            System.out.println(i);
            rpta = true;

        } catch (Exception e) {
            rpta = false;
        }
        return rpta;
    }

    //Metodo que permite traer todos los productos
    public static ArrayList<Usuario> obtenerUsuarios() {
        ArrayList<Usuario> lista = new ArrayList<>();
        Connection cn = ConexionDB.getConexion();
        //Esto es para llamar a los procedimientos almacenados
        try {
            CallableStatement csta = cn.prepareCall("{call listar_login()}");
            ResultSet rs = csta.executeQuery();
            while (rs.next()) {
                Usuario p = new Usuario(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                lista.add(p);
            }
        } catch (SQLException e) {
            System.out.println("Error al traer los productos: " + e);
        }
        return lista;
    }
    
    public static Usuario obtenerUsuarioId(int id) {
        int nivel = 0;
        Usuario usr = null;
        String sql = "call listar_login_id("+id+")";
        System.out.println(sql);
        try {  
            
            CallableStatement cl = ConexionDB.getConexion().prepareCall(sql);
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                usr = new Usuario(rs.getInt(1), rs.getString(2),rs.getString(2), rs.getInt(3));
            }
        } catch (Exception e) {
            System.out.println("Error al encontrar el usuario: " + e);
        }
        return usr;
    }

   public static Usuario obtenerUsuario(String user, String pass) {
        Usuario usuario = null;
        String sql = "SELECT id, usuario, nivel FROM login WHERE usuario=? AND contraseña=?";
        
        try {
            Connection con = getConexion();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                int id = rs.getInt("id");
                int nivel = rs.getInt("nivel");
                
                usuario = new Usuario(id, user, pass, nivel);
            }
            
            con.close();
        } catch (SQLException e) {
            System.out.println("Error al encontrar el usuario: " + e);
        }
        
        return usuario;
    }
}
