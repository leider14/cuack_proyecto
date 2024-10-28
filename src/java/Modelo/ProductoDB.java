
package Modelo;

import java.sql.*;
import java.util.*;
import Conexion.ConexionDB;



public class ProductoDB {
    
    public static ArrayList<Productos> buscarProductos(String search) {
        ArrayList<Productos> productos = new ArrayList<>();
        try {
            Connection con = ConexionDB.getConexion();
            System.out.print("aqui");
            String sql = "call buscar_producto(\"" +search +"\")";
             System.out.print(sql);
            PreparedStatement ps = con.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Productos p = new Productos(
                        rs.getInt("codigoProducto"),
                        rs.getString("nombre"),
                        rs.getInt("precio"),
                        rs.getString("imagen"),
                        rs.getInt("idCategoria")
                );
                productos.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productos;
    }
    
    //Metodo que permite traer todos los productos
    public static ArrayList<Productos> obtenerProductos(){
        ArrayList<Productos> lista = new ArrayList<>();
        Connection cn = ConexionDB.getConexion();
        //Esto es para llamar a los procedimientos almacenados
        try{
            CallableStatement csta = cn.prepareCall("{call listar_producto()}");
            ResultSet rs = csta.executeQuery();
            while (rs.next()){
                Productos p = new Productos(rs.getInt(1), rs.getString(2), rs.getInt(3),rs.getString(4), rs.getInt(5));
                lista.add(p);
            }
        }catch(SQLException e){
            System.out.println("Error al traer los productos: "+e);
        }
        return lista;
    }
    
    //Metodo que permite insertar productos a la base de datos
    public static boolean insertarProducto(Productos pro){
        boolean rpta = false;
        Connection cn = null;
        CallableStatement csta = null;
        cn = ConexionDB.getConexion();
        try{
            csta = cn.prepareCall("{call insertar_producto (?,?,?,?)}");
            csta.setString(1, pro.getNombre());
            csta.setFloat(2, pro.getPrecio());
            csta.setString(3, pro.getImagen());
            csta.setInt(4, pro.getIdCategoria());
            
            System.out.println("AQUIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII" + csta);
            int i = csta.executeUpdate();
            System.out.println(i);
            rpta=true;
            
        }catch(Exception e){
            System.out.println("Error al insertar el producto: "+e);
            rpta=false;
        }
        return rpta;
    }
    
    public static boolean eliminarProducto(int id){
        Connection cn = ConexionDB.getConexion();
        boolean rpta= false; 
        try{
            String sql = "CALL eliminar_producto(?)";
            PreparedStatement csta = cn.prepareStatement(sql);
            csta.setInt(1, id);
            csta.execute();
            rpta=true;
        }catch( Exception e){
            rpta=false;
        }
        
        return rpta;
    }
    
    //Metodo que permite actualizar un producto de la base de datos
    public static boolean editarProducto(int idProducto, Productos pro) {
    boolean rpta = false;
    Connection cn = null;
    CallableStatement csta = null;
    
    try {
        cn = ConexionDB.getConexion();
        csta = cn.prepareCall("{call editar_producto(?,?,?,?,?)}");
        csta.setInt(1, idProducto); // ID del producto a modificar
        csta.setString(2, pro.getNombre());
        csta.setInt(3, pro.getPrecio());
        csta.setString(4, pro.getImagen());
        csta.setInt(5, pro.getIdCategoria());
        
        int i = csta.executeUpdate();
        if (i == 1) {
            rpta = true;
        } else {
            System.out.println("No se pudo modificar el producto.");
        }
    } catch (Exception e) {
        System.out.println("Error al modificar el producto: " + e);
    } finally {
        try {
            if (csta != null) {
                csta.close();
            }
            if (cn != null) {
                cn.close();
            }
            } catch (SQLException e) {
                System.out.println("Error al cerrar la conexión: " + e);
            }
        }

        return rpta;
    }

    //Creamos el metodo que nos permitirá mostrar un producto al dar clic en "Añadir"
    
    public static Productos obtenerProducto(int codigo){
        Productos p = null;
        try{
            CallableStatement cl = ConexionDB.getConexion().prepareCall("{CALL obtener_producto(?)}");
            cl.setInt(1, codigo);
            ResultSet rs = cl.executeQuery();
            while (rs.next()){
                p = new Productos(rs.getInt(1), rs.getString(2), rs.getInt(3),rs.getString(4), rs.getInt(5));
            }
            
        }catch(Exception e){
            System.out.println("Error al traer el producto: "+e);
        }
        return p;
    }
    
    
    public static ArrayList<Productos> obtenerProductosPorCategoria(int idCategoria){
        
        ArrayList<Productos> lista = new ArrayList<>();
        Connection cn = ConexionDB.getConexion();
        //Esto es para llamar a los procedimientos almacenados
        
        Productos p = null;
        try{
            CallableStatement cl = cn.prepareCall("{CALL obtener_producto_categoria(?)}");
            cl.setInt(1, idCategoria);
            ResultSet rs = cl.executeQuery();
            while (rs.next()){
                p = new Productos(rs.getInt(1), rs.getString(2), rs.getInt(3),rs.getString(4), rs.getInt(5));
                lista.add(p);
            }
            
        }catch(Exception e){
            System.out.println("Error al traer el producto: "+e);
        }
        return lista;
    }
    
}
