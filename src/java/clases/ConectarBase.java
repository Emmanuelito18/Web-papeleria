/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author holas
 */
public class ConectarBase {
    public Connection conectar=null;
    
    public ConectarBase(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/papeleria?serverTimezone=UTC";//?serverTimezone=UTC es solo para MySQL 8.0.22
            String user="root";
            String password="";
            conectar=DriverManager.getConnection(url,user,password);
        }
        catch(SQLException e){
            JOptionPane.showMessageDialog(null,"No existe la base de datos"+e);
        } catch (ClassNotFoundException ex) {
            JOptionPane.showMessageDialog(null,"Falta la libreria de MySQL");
        }
   } 
}
