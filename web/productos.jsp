<%-- 
    Document   : productos
    Created on : 19/03/2021, 06:29:41 PM
    Author     : Alysay
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="clases.ConectarBase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos Existentes</title>
        <link href="https://fonts.googleapis.com/css2?family=Chango&family=Pacifico&display=swap" rel="stylesheet">
        <style type="text/css">
            table{
                background-color: lightyellow; 
                border-collapse: collapse;
            }
            th{
                background-color: orangered;
                color: white;
            }
            th,td{
                text-align: center;
                font-size: 24px;
                padding: 6px;
                border-bottom: 1px solid red;
            }
            tr:nth-child(even){
                background: orange;
            }
            tr:hover{
                background-color: red;
                color: white;
            }
        </style>
    </head>
    <body>
        <div style="height: 80px; font-family: 'Chango', cursive; 
             font-size: 45px; color: #0a043c; padding: 15px; 
             background-color: #a3ddcb; text-align: center;">
            Productos registrados en la base de datos
        </div>
        <%
          out.println("<center><h1>Tabla artículos</h1></center>");
          ConectarBase conexion=new ConectarBase();        
          try{              
            String consulta="SELECT * FROM articulos";
            PreparedStatement comando=(PreparedStatement)conexion.conectar.prepareStatement(consulta);
            ResultSet registro=comando.executeQuery();
        %>
            <center> <%--out.print("<center>"); --%>
            <table>
            <tr>
                <th>Codigo</th>
                <th>Nombre</th>  
                <th>Unidad</th>
                <th>Precio</th>
                <th>Codigo Marca</th>
            </tr>
        <%
            while(registro.next()){
                out.print("<tr>");
                out.print("<td>"+registro.getString(1)+"</td>");
                out.print("<td>"+registro.getString(2)+"</td>");
                out.print("<td>"+registro.getString(3)+"</td>");
                out.print("<td>"+registro.getString(4)+"</td>");
                out.print("<td>"+registro.getString(5)+"</td>");
                out.print("</tr>");
            }
            out.print("</table></center>");
        }catch(SQLException e){
            out.print("<br><br>Error al efectuar la consulta");
        }            
            %>
    </body>
</html>
