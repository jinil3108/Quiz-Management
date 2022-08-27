<%-- 
    Document   : viewscore
    Created on : 24-Apr-2022, 1:49:12 AM
    Author     : PATEL SARTHAK
--%>

<%
    if(session.getAttribute("userLogin")==null){
        response.sendRedirect("./index.html");
    } else{
    
    
    }            
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.QuizDao"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quiz Management System</title>
        <link rel="stylesheet" href="./css/login.css"/>
        <style>
            
            .box{
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
            
            body{
                font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
                font-size: .9375rem;
                font-weight: 400;
                line-height: 1.5;
                background-color: #fff;
            }
            .username
            {
                margin-right: 15px;
                color:white;
            }
            .contain{
                font-size: 20px;
                display:block;
                margin: 20px 80px 20px 80px;
                height:290px;
                border: 1px solid #bbb;
                border-radius: 4px;
                padding: 20px;
                box-sizing: border-box;
                background-color: #def2f8;
            }
            
            .container{
                height:250px;
                width: 450px;
                position: fixed;
                top: 50%;
                left: 50%;
                margin-top: -125px;
                margin-left: -225px;
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
                float:left;
                border-radius: 4px;
                cursor: pointer;
                margin: 20px 0px 10px 0px;
                text-decoration: none;
                font-size: 14px;
                font-family: "Times New Roman", Times, serif;
            }
            
            .endbox{
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                border: none;
                float:right;
                border-radius: 4px;
                cursor: pointer;
                margin: 20px 0px 10px 0px;
                text-decoration: none;
                font-size: 14px;
                font-family: "Times New Roman", Times, serif;
            }
            
            </style>
    </head>
    <body>
        <div style="background-color: #343a40;" class="navbar">
            
                <a href="./index.html" class="navbar-brand text-light">
                    Quiz Management System
                </a>
            
            <span class="button">
                
                <span class="username"><%=session.getAttribute("userLogin")%></span>
                
                <a href="Logout.jsp" class="btn btn-outline-light mr-3">
                    <i class="fa fa-sign-out" aria-hidden="true"></i> Log Out
                </a>
            </span>
        </div><!-- comment -->
        
        <%
            //String total_question=(String)session.getAttribute("total_question");
            QuizDao dao = new QuizDao();
                
            int n = dao.getTotalQuizQuestions(request.getParameter("id"));
            if(n>0)
            {
                %>
                    
                <s:setDataSource var = "snapshot" url="jdbc:mysql://localhost:3306/innovative" 
                     driver="com.mysql.cj.jdbc.Driver" 
                     user="root" 
                     password="" scope="session"/>

                <s:query dataSource="${snapshot}" var = "rs">
                    SELECT * from quizdetail where id=<%= request.getParameter("id")%>;
                </s:query>
                <% int count = 1; 
                int marks=0;%>
                
                <c:forEach var="row" items = "${rs.rows}"> 
                    
                        <c:set var="correct" value="${row.correct}" scope="request"/>
                        <c:set var="mark" value="${row.mark}" scope="request"/>
    
                        <%
//                            String total_question=(String)request.getSession().getAttribute("total_question");
                            int choice = Integer.parseInt(request.getParameter("question_"+count));
                            int correct = (Integer)request.getAttribute("correct");
                            if(choice==correct)
                            {
                                ++marks;
                            }
                        %>
                        
                    <%count++; %>
                </c:forEach>
                
                <div class="container">
                    <s:query dataSource="${snapshot}" var="result">
                        SELECT * FROM quizzes where id=<%= request.getParameter("id")%> and email="<%= session.getAttribute("userLogin")%>";
                    </s:query>
                        
                        <s:update dataSource="${snapshot}" var="x">
                            UPDATE quizzes SET visited="true" WHERE email="<%= session.getAttribute("userLogin")%>" and id=<%= request.getParameter("id")%>;
                        </s:update>
                        <s:update dataSource="${snapshot}" var="rs"> 
                            UPDATE quizzes SET marks=<%=marks%> WHERE email="<%= session.getAttribute("userLogin")%>" and id=<%= request.getParameter("id")%>;
                        </s:update>
                        <%
                            String total_question=(String)session.getAttribute("total_question");
                        %>
                    <c:forEach var="row" items="${result.rows}">
                        <center><h3>Quiz Name: <br><c:out value="${row.name}"/></h3><br><br>
                            Marks Obtained: <c:out value="${row.marks}"/>/<c:out value="${row.total_marks}"/>
                            <br><br>
                            <a class="box" href="ViewQuizzes.jsp">Back to Quiz Menu</a>
                        </center>
                    </c:forEach>
                        
                        
                </div>
                <%
                }
        %>
        
        <footer class="footer">
            Copyright &copy; 2022 | Sarthak and Jinil | All Rights Reserved 
        </footer>
    </body>
</html>
