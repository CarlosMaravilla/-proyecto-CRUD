  
<%-- 
    Document   : index
    Created on : 3 jun. 2020, 20:30:21
    Author     : marav
--%>
<%@page import="java.sql.*"%>
<%
    try{
    Connection conexion=null;
    PreparedStatement stmt=null;
    ResultSet rs=null;
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/tienda", "root","");
        stmt = conexion.prepareStatement("select * from productos");
        rs = stmt.executeQuery();
  
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    </head>
    <body>
    <h1><span class="d-block p-2 bg-success text-white">CRUD<p style="font-family:courier">Productos De Una Tienda   <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-cart" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/></svg><div style="text-align: center;">
    </div></p></span></h1><br><br>
         
        
        
        <h2 class="right">
        <span class="d-block p-2 bg-primary text-white">Tabla de Productos    
           <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-basket" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
           <path fill-rule="evenodd" d="M10.243 1.071a.5.5 0 0 1 .686.172l3 5a.5.5 0 1 1-.858.514l-3-5a.5.5 0 0 1 .172-.686zm-4.486 0a.5.5 0 0 0-.686.172l-3 5a.5.5 0 1 0 .858.514l3-5a.5.5 0 0 0-.172-.686z"/>
           <path fill-rule="evenodd" d="M1 7v1h14V7H1zM.5 6a.5.5 0 0 0-.5.5v2a.5.5 0 0 0 .5.5h15a.5.5 0 0 0 .5-.5v-2a.5.5 0 0 0-.5-.5H.5z"/>
           <path fill-rule="evenodd" d="M14 9H2v5a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V9zM2 8a1 1 0 0 0-1 1v5a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V9a1 1 0 0 0-1-1H2z"/>
           <path fill-rule="evenodd" d="M4 10a.5.5 0 0 1 .5.5v3a.5.5 0 1 1-1 0v-3A.5.5 0 0 1 4 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 1 1-1 0v-3A.5.5 0 0 1 6 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 1 1-1 0v-3A.5.5 0 0 1 8 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 1 1-1 0v-3a.5.5 0 0 1 .5-.5zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 1 1-1 0v-3a.5.5 0 0 1 .5-.5z"/>
           </svg>
         <a class="btn btn-secondary" href="index.jsp">Agregar Producto</a>
        </span>
        </h2>
       
    
        
        <table class="table table-striped table-hover thead-dark table-bordered">  
        <thead class="thead-dark">
        <tr>
        <th>ID del Producto</th>
        <th>Nombre del Producto</th>
        <th>Precio</th>
        <th>Descripcion</th>
        <th>Cantidad de Producto</th>
        <th>Departamentos</th>
        <th colspan="3">Acciones</th>
        </tr>
        </thead>
        <%while(rs.next()){%>
        <tr>
        <td><%=rs.getInt("Id_producto")%></td>
        <td><%=rs.getString("Nombre_Producto")%></td>
        <td><%=rs.getString("Precio")%></td>
        <td><%=rs.getString("Descripcion")%></td>
        <td><%=rs.getString("Cantidad_Producto")%></td>
        <td><%=rs.getString("id_departamento")%></td>
        
        <td><a class="btn btn-warning btn-block" href="newindex.jsp?id=<%=rs.getInt("Id_producto")%>">Editar</a></td>
        <td><a class="btn btn-danger btn-block" href="newindex.jsp?id=<%=rs.getInt("Id_producto")%>">Eliminar</a></td>
        <td><a class="btn btn-danger btn-block" href="newindex.jsp?id=<%=rs.getInt("Id_producto")%>">EliminarV2</a></td>
        </tr>
        <%}%>
        </table>
        

        <br><br>
        <div class="container">
  
        <h2><span class="d-block p-2 bg-primary text-white">Tabla de Departamentos  <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-calendar" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
        <path fill-rule="evenodd" d="M1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1zm1-3a2 2 0 0 0-2 2v11a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2H2z"/>
        <path fill-rule="evenodd" d="M3.5 0a.5.5 0 0 1 .5.5V1a.5.5 0 0 1-1 0V.5a.5.5 0 0 1 .5-.5zm9 0a.5.5 0 0 1 .5.5V1a.5.5 0 0 1-1 0V.5a.5.5 0 0 1 .5-.5z"/>
        </svg>
        <a class="btn btn-secondary" href="index.jsp">Agregar Producto</a>
         </span></span></h2>
        <%rs = stmt.executeQuery("select * from ca_departamentos");%>
        <table class="table table-striped table-hover thead-dark table-bordered"> 
        <thead class="thead-dark">
        <tr>
        <th>ID del Departamento</th>
        <th>Departamento</th>
        <th colspan="3">Acciones</th>
        </tr>
        </thead>
        <%while(rs.next()){%>
        <tr>
        <td><%=rs.getInt("id_departamento")%></td>
        <td><%=rs.getString("departamento")%></td>
        <td><a class="btn btn-warning btn-block" href="newindex.jsp?id=<%=rs.getInt("id_departamento")%>">Editar  Departamento</a></td>
        <td><a class="btn btn-danger btn-block" href="newindex.jsp?id=<%=rs.getInt("id_departamento")%>">Eliminar Departamento</a></td>
        <td><a class="btn btn-danger btn-block" href="newindex.jsp?id=<%=rs.getInt("id_departamento")%>">Eliminar V2</a></td>
        </tr>
        <%}%>
        </table>    
        </div>   
    <%}catch(SQLException e ){
        if(String.valueOf(e.getSQLState()).equalsIgnoreCase("42000")){
           out.println("Error SQL: la base de datos no existe");
        }else{
            if(String.valueOf(e.getSQLState()).equalsIgnoreCase("42S02")){
            out.println("Error SQL: la tabla no existe"); 
            }else{
                if(String.valueOf(e.getSQLState()).equalsIgnoreCase("28000")){
                out.println("Error SQL: Acceso denegado para el usuario 'root' @ 'localhost' (usando la contraseña: YES)");
                 }else{
                     if(String.valueOf(e.getSQLState()).equalsIgnoreCase("08S01")){
                     out.println("Error de enlace de comunicaciones El último paquete enviado con éxito al servidor fue hace 0 milisegundos. El controlador no ha recibido ningún paquete del servidor.");
                     }else{
                         if(String.valueOf(e.getSQLState()).equalsIgnoreCase("S1009")){
                         out.println("Índice de columna fuera de rango, 7 > 6"); 
                         }else{
                         out.println(e.getSQLState());
                         out.println("error aun no registrado "+e.getMessage());
                         } 
                     }
                 }
             }
        }
    }
    %>    
       
    </body>
</html>