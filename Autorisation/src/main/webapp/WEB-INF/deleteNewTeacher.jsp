<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<%
String course = request.getParameter("math");

try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    String query = "DELETE FROM teacher WHERE course='" + course + "'";
    int rowsAffected = st.executeUpdate(query);
    
    if (rowsAffected > 0) {
        response.sendRedirect("adminHome.jsp");
    } else {
        out.println("Failed to delete teacher.");
    }
    
    st.close();
    con.close();
} catch (Exception e) {
    out.println(e);
}
%>