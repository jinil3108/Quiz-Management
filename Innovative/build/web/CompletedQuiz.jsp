<%-- 
    Document   : CompletedQuiz
    Created on : Apr 30, 2022, 11:03:49 PM
    Author     : Jinil
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.QuizDao"%>
<%
    if(session.getAttribute("userLogin")==null){
        response.sendRedirect("./index.html");
    } else{
    
    
    }            
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
                
                <span class="username"><%=session.getAttribute("userLogin")%></span>
                
                <a href="Logout.jsp" class="btn btn-outline-light mr-3">
                    <i class="fa fa-sign-out" aria-hidden="true"></i> Log Out
                </a>
            </span>
        </div>
                
                <%
                    
                    QuizDao dao = new QuizDao();
                    ResultSet rs = dao.fetchList((String)session.getAttribute("userLogin"));
//                    getAttribute("total_question"));
                    if(dao.getTotalQuiz((String)session.getAttribute("userLogin"))>0)
                    {
                        
                        %>
                        <div class="btn">
                                <input type="submit" value="Go Back" style="position:relative; margin-left: 1350%" onclick="window.location.href='ViewQuizzes.jsp'"/>                                
                        </div>
                        
                        <s:setDataSource var = "snapshot" url="jdbc:mysql://localhost:3306/innovative" 
                         driver="com.mysql.cj.jdbc.Driver" 
                         user="root" 
                         password=""/>
                        
                        <s:query dataSource="${snapshot}" var = "rs">
                            SELECT * from quizzes where email="<%= session.getAttribute("userLogin")%>" and visited="true";
                         </s:query>
                        
                        <c:forEach var = "row" items = "${rs.rows}">
                            <div class="contain">
                                <span><c:out value = "${row.name}"/></span>
                                
                                <span><p class="startbox" <c:out value = "${row.id}"/>">
                                        
                                    Your Marks: <c:out value = "${row.marks}"/>/<c:out value="${row.total_marks}"/></p></span>
                                
                                
                            </div>
                                   
                        </c:forEach>
                        
                        <%
                        
                    }
                    else
                    {
                        %>
                         
                        <div class="container">
                            <%="No Quizzes Available"%></div>
                       
                        <%
                        //Zero Quizzes Available.
                    }
                %>
                
                 <footer class="footer">
            Copyright &copy; 2022 | Sarthak and Jinil | All Rights Reserved 
        </footer>
    </body>
</html>
