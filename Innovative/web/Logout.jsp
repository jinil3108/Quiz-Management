<%-- 
    Document   : Logout
    Created on : 23-Apr-2022, 12:04:25 PM
    Author     : PATEL SARTHAK
--%>
<%
    session.removeAttribute("userLogin");
    session.invalidate();
    response.sendRedirect("./index.html");
    
%>