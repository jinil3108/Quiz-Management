<%-- 
    Document   : specificquiz
    Created on : 23-Apr-2022, 12:14:34 PM
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
        </div>
                
                <%
                    
                    
                    //String idd = (String) session.getAttribute("idd");
                    QuizDao dao = new QuizDao();
                    
                    if(dao.getTotalQuizQuestions(request.getParameter("id"))>0)
                    {
                        
                        %>
                        
                        <s:setDataSource var = "snapshot" url="jdbc:mysql://localhost:3306/innovative" 
                         driver="com.mysql.cj.jdbc.Driver" 
                         user="root" 
                         password=""/>
                        
                        <s:query dataSource="${snapshot}" var = "rs">
                            SELECT * from quizdetail where id=<%= request.getParameter("id")%>;
                         </s:query>
                         <% int count = 1; %>
                        
                        <form method="POST" action="viewscore.jsp?id=<%= request.getParameter("id")%>">    
                        <c:forEach var = "row" items = "${rs.rows}">
                            
                            <div class="contain">
                                Question <%= count%>:<br><span><c:out value = "${row.question}"/></span><br><br>
                            <input type="radio" id="option1" value="1" name="question_<%=count%>"/> 
                            <c:out value = "${row.option1}"/>
                            <br>
                            <input type="radio" id="option2" value="2" name="question_<%=count%>"/> 
                            <c:out value = "${row.option2}"/>
                            <br>
                            
                            <input type="radio" id="option3" value="3" name="question_<%=count%>"/> 
                            <c:out value = "${row.option3}"/>
                            <br>
                            
                            <input type="radio" id="option4" value="4" name="question_<%=count%>"/> 
                            <c:out value = "${row.option4}"/>
                            <br>
                            
                            </div>
                            <% count++; %>
                        </c:forEach>
                            
                            <center><input type="submit" value="Submit Quiz"/></center><br><br>
                        </form>
                         
                         
                        <%
                    }
                    else
                    {
                        %>
                         
                        <div class="container">
                            <%="No Questions Available"%></div>
                       
                        <%
                        //Zero Quizzes Available.
                    }
                %>
                <div>
                    
                </div>
                
                
        
        
        <footer class="footer">
            Copyright &copy; 2022 | Sarthak and Jinil | All Rights Reserved 
        </footer>
    </body>
</html>
