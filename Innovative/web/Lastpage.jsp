<%-- 
    Document   : Lastpage
    Created on : May 1, 2022, 9:18:06 AM
    Author     : Jinil
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int total_stud = Integer.parseInt((String) session.getAttribute("total_stud"));
            int total_ques = Integer.parseInt((String) session.getAttribute("total_question"));
//            PrintWriter pw=response.getWriter();
//            out.println(total_ques);
            String idd = (String) session.getAttribute("idd");
            String quizname = (String) session.getAttribute("quizname");
            for(int i=0;i<total_stud;i++)
            {
                String email = request.getParameter("email_"+(i+1));
                try
                {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/innovative", "root", "");
                String query = "insert into quizzes (email,name,marks,id,total_marks,visited) values (?,?,?,?,?,\"false\")";
                PreparedStatement ps=conn.prepareStatement(query);
                ps.setString(1, email);
                ps.setString(2, quizname);
                ps.setInt(3, 0);
                ps.setInt(4, Integer.parseInt(idd));
                ps.setInt(5, total_ques);
//                ps.setInt(6, total_ques);
                
                int x  = ps.executeUpdate();
               
                }
                catch(Exception e)
                {
                    System.out.print(e);
                    e.printStackTrace();
                }
                
            }
            
        %>
        
        <jsp:forward page="CreateQuiz.html"/>
        <footer class="footer">
            Copyright &copy; 2022 | Sarthak and Jinil | All Rights Reserved 
        </footer>
    </body>
</html>
