<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*,java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Giudice Eliminato</title>
    </head>
    <body>
     <% 
    try{
         String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=zuliani.nicolo;password=xxx123#";
         
         Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
         
         Connection connection = DriverManager.getConnection(connectionUrl);
         
         	String nome = request.getParameter("nome");
            String cognome = request.getParameter("cognome");
         
            String sql1= "DELETE FROM Giudice WHERE cognome = ? AND nome = ? ";
            PreparedStatement prepStmt1 = connection.prepareStatement(sql1);
            prepStmt1.setString(1, nome);
            prepStmt1.setString(2, cognome);
            prepStmt1.executeUpdate();
            out.println("giudice rimosso");

	        connection.close();
		} catch (Exception e) {
		    
			out.println(e);
         
     }

    %>
            

		
    </body>
</html>