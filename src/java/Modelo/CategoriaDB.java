package Modelo;

import java.sql.*;
import java.util.*;
import Conexion.ConexionDB;

public class CategoriaDB {

    // Método para buscar categorías por nombre
    public static ArrayList<Categoria> buscarCategorias(String search) {
        ArrayList<Categoria> categorias = new ArrayList<>();
        try {
            Connection con = ConexionDB.getConexion();
            String sql = "call buscarNombreCategoria(?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, search);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Categoria c = new Categoria(
                        rs.getInt("idCategoria"),
                        rs.getString("nombre")
                );
                categorias.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categorias;
    }

    // Método que permite traer todas las categorías
    public static ArrayList<Categoria> obtenerCategorias() {
        ArrayList<Categoria> lista = new ArrayList<>();
        Connection cn = ConexionDB.getConexion();
        try {
            CallableStatement csta = cn.prepareCall("{call listar_categoria()}");
            ResultSet rs = csta.executeQuery();
            while (rs.next()) {
                Categoria c = new Categoria(rs.getInt(1), rs.getString(2));
                lista.add(c);
            }
        } catch (SQLException e) {
            System.out.println("Error al traer las categorías: " + e);
        }
        return lista;
    }

    // Método que permite insertar categorías en la base de datos
    public static boolean insertarCategoria(String nombre) {
        boolean rpta = false;
        Connection cn = ConexionDB.getConexion();
        try {
            CallableStatement csta = cn.prepareCall("{call insertar_categoria(?)}");
            csta.setString(1, nombre);
            int i = csta.executeUpdate();
            if (i == 1) {
                rpta = true;
            }
        } catch (SQLException e) {
            System.out.println("Error al insertar la categoría: " + e);
        }
        return rpta;
    }

    // Método que permite actualizar una categoría en la base de datos
    public static boolean editarCategoria(int idCategoria, String nombreCategoria) {
        boolean rpta = false;
        Connection cn = ConexionDB.getConexion();
        try {
            CallableStatement csta = cn.prepareCall("{call editar_categoria(?,?)}");
            csta.setInt(1, idCategoria);
            csta.setString(2, nombreCategoria);

            int i = csta.executeUpdate();
            if (i == 1) {
                rpta = true;
            } else {
                System.out.println("No se pudo modificar la categoría.");
            }
        } catch (SQLException e) {
            System.out.println("Error al modificar la categoría: " + e);
        }
        return rpta;
    }

    // Método que permite obtener una categoría por su ID
    public static Categoria obtenerCategoria(int idCategoria) {
        Categoria c = null;
        try {
            CallableStatement cl = ConexionDB.getConexion().prepareCall("{CALL obtener_categoria(?)}");
            cl.setInt(1, idCategoria);
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                c = new Categoria(rs.getInt(1), rs.getString(2));
            }
        } catch (SQLException e) {
            System.out.println("Error al traer la categoría: " + e);
        }
        return c;
    }
    
    
    public static boolean eliminarCategoria(int idCategoria) {
        Categoria c = null;
        Connection cn = ConexionDB.getConexion();
        boolean rpta= false; 
        try{
            String sql = "CALL eliminar_categoria(?)";
            PreparedStatement csta = cn.prepareStatement(sql);
            csta.setInt(1, idCategoria);
            csta.execute();
            rpta=true;
        }catch( Exception e){
            rpta=false;
        }
        
        return rpta;

    }
    
    

    
    
}
