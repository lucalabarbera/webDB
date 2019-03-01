<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.java.text.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.PreparedStatement"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Inseririmento Giudici</title>
    </head>
    <body>
     <% 
     if(request.getParameter("nome")==null || request.getParameter("nome").isEmpty()){
      %>
       <h1>Non hai inserito nessun nome</h1>
      <%
        return;
      } 
      %>

             <% 
     if(request.getParameter("cognome")==null || request.getParameter("cognome").isEmpty()){
      %>
       <h1>Non hai inserito nessun cognome</h1>
      <%
        return;
      } 
      %>

      <h1>Elenco dei giudici di <%= request.getParameter("luogo") %></h1>
        <% 
            
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=zuliani.nicolo;password=xxx123#";

            try {

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        
            Connection connection = DriverManager.getConnection(connectionUrl);
			
			String nome = request.getParameter("nome");
            String cognome = request.getParameter("cognome");
            // selezione dell'ultimo ID
            Statement stmt4 = connection.createStatement();
            String sqlId = "Select Max(ID) as MaxId from Giudice";
            ResultSet rs4 = stmt4.executeQuery(sqlId);
            rs4.next();
            // calcolo nuovo ID
            int newId = rs4.getInt("MaxId") + 1;
            // inserimento del nuovo giudice
            String sql4 = "INSERT INTO Giudice (ID, Nome, Cognome) VALUES (?, ?, ?)";
            PreparedStatement prepStmt = connection.prepareStatement(sql4);
            prepStmt.setInt(1, newId);
            prepStmt.setString(2, nome);
            prepStmt.setString(3, cognome);
            prepStmt.executeUpdate();
            out.println("---- GIUDICE INSERITO ---");
	        connection.close();
		} catch (Exception e) {
		    
			out.println(e);
		}
        
        %>
    </body>
</html>