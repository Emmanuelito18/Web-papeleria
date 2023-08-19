<%-- 
    Document   : guardarDatos
    Created on : 25/03/2021, 06:21:01 PM
    Author     : Alysay
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="clases.ConectarBase"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Guardar Productos</title>
        <style type="text/css">
            div{
                height: 50px;
                border-style: double;
                border-width: 5px;
                border-color: orangered;
                border-radius: 20px;
                margin: 10px;
                text-align: center;
                font-size: 35px;
                padding: 10px;
            }
            h1{
                font-size: 40px;
                color: darkgoldenrod;
                text-align: center;
            }
            h2{
                font-size: 30px;
                color: red;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div>
            Almacenar Productos en la Tabla Artículos
        </div>
        <%
        try{
            ConectarBase conexion=new ConectarBase();
            String codigo=request.getParameter("txtCodigo");
            String nom=request.getParameter("txtNombre");
            String uni=request.getParameter("cmbUnidad");
            String precio=request.getParameter("txtPrecio");
            String marca=request.getParameter("cmbMarca");
            String insertar="INSERT INTO articulos VALUES(?,?,?,?,?)";
            PreparedStatement comando=(PreparedStatement)conexion.conectar.prepareStatement(insertar);
            comando.setString(1, codigo);
            comando.setString(2, nom);
            comando.setString(3, uni);
            comando.setString(4, precio);
            comando.setString(5, marca);
            comando.executeUpdate();
            out.print("<h1>Producto registrado con éxito</h1>");
        }catch(SQLException e){
            out.print("<h2>Error al guardar los datos del producto</h2>");
        }
        %>
    </body>
</html>
