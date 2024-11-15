package DAO;
import Modelo.*;
import Conexion.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoletaDB {

    public static int generarBoleta(int idUsuario, String rutCliente, double total, ArrayList<Articulo> articulos) {
        Connection con = ConexionDB.getConexion();
        int idBoleta = 0;
        
        try {
            con.setAutoCommit(false);
            
            String sqlBoleta = "INSERT INTO boleta (idUsuario, rutCliente, total, estado) VALUES (?, ?, ?, 'vendido')";
            PreparedStatement psBoleta = con.prepareStatement(sqlBoleta, PreparedStatement.RETURN_GENERATED_KEYS);
            psBoleta.setInt(1, idUsuario);
            psBoleta.setString(2, rutCliente);
            psBoleta.setDouble(3, total);
            psBoleta.executeUpdate();
            
            ResultSet rs = psBoleta.getGeneratedKeys();
            if (rs.next()) {
                idBoleta = rs.getInt(1);
            }

            String sqlDetalle = "INSERT INTO detalle_boleta (idBoleta, idProducto, cantidad, valorProducto, total) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement psDetalle = con.prepareStatement(sqlDetalle);
            
            for (Articulo articulo : articulos) {
                Productos producto = (Productos) ProductoDB.obtenerProducto(articulo.getCodigoProducto());
                System.out.println(producto.getCodigoProducto());
                System.out.println(articulo.getCodigoProducto());
                psDetalle.setInt(1, idBoleta);
                psDetalle.setInt(2, producto.getCodigoProducto());
                psDetalle.setInt(3, articulo.getCantidad());
                psDetalle.setDouble(4, producto.getPrecio());
                psDetalle.setDouble(5, articulo.getCantidad() * producto.getPrecio());
                psDetalle.addBatch();
            }
            
            psDetalle.executeBatch();
            con.commit();
        } catch (SQLException e) {
            System.out.println("Eror: "+e);
            try {
                con.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                con.setAutoCommit(true);
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return idBoleta;
    }
    
    public static boolean actualizarBoleta(int idBoleta , String estadoBoleta) {
        Connection con = ConexionDB.getConexion();
        boolean resultado = false;
        
        try {
            String sql = "UPDATE boleta SET estado = ? WHERE idBoleta = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, estadoBoleta);
            ps.setInt(2, idBoleta);
            int rows = ps.executeUpdate();
            resultado = (rows > 0);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return resultado;
    }


    public static boolean anularBoleta(int idBoleta) {
        Connection con = ConexionDB.getConexion();
        boolean resultado = false;
        
        try {
            String sql = "UPDATE boleta SET estado = 'anulado' WHERE idBoleta = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idBoleta);
            int rows = ps.executeUpdate();
            resultado = (rows > 0);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return resultado;
    }

    public static ArrayList<Boleta> consultarBoleta(int idBoleta) {
        ArrayList<Boleta> boletas = new ArrayList<>();
        Connection con = ConexionDB.getConexion();
        
        try {
            String sql = "SELECT * FROM boleta WHERE idBoleta = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idBoleta);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Boleta boleta = new Boleta();
                boleta.setIdBoleta(rs.getInt("idBoleta"));
                boleta.setIdUsuario(rs.getInt("idUsuario"));
                boleta.setRutCliente(rs.getString("rutCliente"));
                boleta.setFechaCompra(rs.getTimestamp("fechaCompra"));
                boleta.setTotal(rs.getDouble("total"));
                boleta.setEstado(rs.getString("estado"));
                boletas.add(boleta);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return boletas;
    }

    public static ArrayList<Boleta> consultarMisCompras(String rutCliente) {
        ArrayList<Boleta> boletas = new ArrayList<>();
        Connection con = ConexionDB.getConexion();
        
        try {
            String sql = "SELECT * FROM boleta WHERE rutCliente = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, rutCliente);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Boleta boleta = new Boleta();
                boleta.setIdBoleta(rs.getInt("idBoleta"));
                boleta.setIdUsuario(rs.getInt("idUsuario"));
                boleta.setRutCliente(rs.getString("rutCliente"));
                boleta.setFechaCompra(rs.getTimestamp("fechaCompra"));
                boleta.setTotal(rs.getDouble("total"));
                boleta.setEstado(rs.getString("estado"));
                boletas.add(boleta);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return boletas;
    }
}
