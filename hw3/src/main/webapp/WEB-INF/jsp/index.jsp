<html>
<head>
    <title>Andrew Mroczkowski's HW3</title>
</head>
<body>
<%@ page import = "java.sql.*" %>
<%
    try {
        Connection conn = DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/postgres", "postgres", "password"); // <== Check!
        if (conn != null) {
            System.out.println("Connected to the PostgreSQL server successfully.");
            Statement stmt = conn.createStatement();

            String sqlStr = "SELECT VERSION()";

            System.out.println("Query statement is " + sqlStr); // for debugging
            ResultSet rset = stmt.executeQuery(sqlStr);
            rset.next();
%>
<h1>Andrew Mroczkowski's HW3</h1>
<p><%= rset.getString("version") %></p>
<%
            rset.close();
            stmt.close();
            conn.close();
        } else {
            System.out.println("Failed to make connection");
        }
    } catch (Exception e){
        System.out.println ("error: " + e.getMessage());
    }
%>
</body>
</html>