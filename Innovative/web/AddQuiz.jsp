<%-- 
    Document   : AddQuiz
    Created on : Apr 25, 2022, 9:59:49 PM
    Author     : Jinil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.QuizDao"%>
<!DOCTYPE html>

<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quiz Management System</title>
        <link rel="stylesheet" href="./css/login.css"/>
        <style>
            input[type=button]{
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                margin: 25px 0px 10px 0px;
                text-decoration: none;
                font-size: 14px;
                font-family: "Times New Roman", Times, serif;
            }
            
            .username
            {
                margin-right: 15px;
                color:white;
            }
            
            .contain{
                display:block;
                font-size: 24px;
                margin: 10px;
                height:90px;
                border: 1px solid #bbb;
                border-radius: 8px;
                padding: 20px;
                box-sizing: border-box;
                background-color: white;
            }
            
            .startbox{
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                float: right;
                margin: 0px 0px 10px 0px;
                text-decoration: none;
                font-size: 14px;
                font-family: "Times New Roman", Times, serif;
            }
            
            p{
                font-size: 12px;
            }
        </style>
    </head>
    <body>
        <div style="background-color: #343a40;" class="navbar">
                <a href="./index.html" class="navbar-brand text-light">
                    Quiz Management System
                </a>
            
            <span class="button">
                
                <span class="username">Welcome Admin</span>
                
                <a href="Logout.jsp" class="btn btn-outline-light mr-3">
                    <i class="fa fa-sign-out" aria-hidden="true"></i> Log Out
                </a>
            </span>
        
            <%
                String email=(String)session.getAttribute("email");
//                String quizname=(String)session.getAttribute("quizname");
//                String marks=(String)session.getAttribute("marks");
                String quizid=(String)session.getAttribute("quizid");
//                String visited=(String)session.getAttribute("visited");
                

                try
                {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/innovative", "root", "");
                String query = "insert into quizzes (email,name,marks,id,visited) values(?,?,false)";
                PreparedStatement ps=conn.prepareStatement(query);
                ps.setString(1, email);
//                ps.setString(2, quizname);
//                ps.setString(3, marks);
                ps.setString(4, quizid);
//                ps.setString(5, visited);
                
                int i  = ps.executeUpdate();
    //            int i=st.executeUpdate("insert into quizdetail(id,question,option1,option2,option3,option4,correct,Mark)values('"+id+"','"+question+"','"+option1+"','"+option2+"','"+option3+"','"+option4+"','"+correct+"','"+Mark+")");
                out.println("Data is successfully inserted!");
            }
            catch(Exception e)
            {
            System.out.print(e);
            e.printStackTrace();
            }
            %>
            
        <footer class="footer">
            Copyright &copy; 2022 | Sarthak and Jinil | All Rights Reserved 
        </footer>
        </div>
    </body>
</html>
