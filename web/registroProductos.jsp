<%-- 
    Document   : registroProductos
    Created on : 22/03/2021, 06:38:03 PM
    Author     : Alysay
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="clases.ConectarBase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Artículos</title>
        <style type="text/css">
            input[type=text]{
                width: 200px;
                padding: 5px;
                margin: 5px;
                box-sizing: border-box;
                background-color: #96bb7c;
                color: #184d47;
                border-radius: 5px;                
            }
            input[type=text]:focus{
                background-color: #fad586;
            }
            select{
                width: 200px;
                padding: 5px;
                margin: 5px;
                background-color: #96bb7c;
                color: #184d47;
                border-radius: 5px;
            }
            select:focus{
                background-color: #9ddfd3;
            }
            label{
                font-family: 'Arial';
                font-size: 14px;
                color: #151515;
            }
            form{
                height: 300px;
                width: 400px;
                background-color: #ccffbd;
                border-radius: 15px;
                border-style: solid;
                border-width: 2px;
                padding: 8px;
                margin: 10px 480px;
            }
            input[type=submit],input[type=reset]{
                background-color: #c64756;
                text-decoration: none;
                cursor: pointer;
                border: none;
                padding: 5px;
                border-radius: 5px;
                color: white;
            }
        </style>
    </head>
    <body>
        <div style="height: 50px; text-align: center;
             background-color: lemonchiffon; padding: 20px;
             font-size: 35px;">
            Registro de Artículos de Papelería
        </div>
        <div>
            <form method="post" action="guardarDatos.jsp" target="_blank">
                <label for="fCodigo">Código del Artículo</label>
                <input type="text" name="txtCodigo" />
                <br>
                <label for="fArticulo>">Nombre de Artículo</label>
                <input type="text" name="txtNombre" />
                <br>
                <label for="fUnidad">Unidad de Medida</label>
                <select name="cmbUnidad">
                    <option label="Pieza" value="pz"></option>
                    <option label="Caja" value="cj"></option>
                    <option label="Paquete" value="pq"></option>
                    <option label="Bolsa" value="bl"></option>
                    <option label="Gramos" value="gr"></option>
                    <option label="Mililitros" value="ml"></option>
                    <option label="Litro" value="lt"></option>
                    <option label="Kilogramos" value="kg"></option>
                </select>
                <br>
                <label for="fPrecio">Precio</label>
                <input type="text" name="txtPrecio" />
                <br>
                <label for="fMarca">Código de Marca</label>
                <select name="cmbMarca">
                <%
                    ConectarBase conexion=new ConectarBase();
                    try{
                        String consulta="SELECT codigo_marca,nombre_marca FROM marcas";
                        PreparedStatement comando=(PreparedStatement)conexion.conectar.prepareStatement(consulta);
                        ResultSet markas=comando.executeQuery();
                        while(markas.next()){
                            out.print("<option label="+markas.getString(2)+" value="+markas.getString(1)+"></option>");
                        }
                    } catch(SQLException e){
                        out.print("Error al consultar las marcas de los artículos");
                    }
                %>
                </select>
                <br><br>
                <input type="submit" value="Enviar..." />
                <input type="reset" value="Cancelar" />
            </form>
        </div>    
    </body>
</html>
