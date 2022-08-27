<%-- 
    Document   : AddStudDet
    Created on : May 1, 2022, 9:15:42 AM
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quiz Management System</title>
        <link rel="stylesheet" href="./css/login.css"/>
        <style>
            .form-style-9{
                    max-width: 450px;
                    background: #FAFAFA;
                    padding: 30px;
                    margin: 50px auto;
                    box-shadow: 1px 1px 25px rgba(0, 0, 0, 0.35);
                    border-radius: 10px;
                    border: 6px solid #4caf50;
            }
            .form-style-9 ul{
                    padding:0;
                    margin:0;
                    list-style:none;
            }
            .form-style-9 ul li{
                    display: block;
                    margin-bottom: 10px;
                    min-height: 35px;
            }
            .form-style-9 ul li  .field-style{
                    box-sizing: border-box; 
                    -webkit-box-sizing: border-box;
                    -moz-box-sizing: border-box; 
                    padding: 8px;
                    outline: none;
                    border: 1px solid #B0CFE0;
                    -webkit-transition: all 0.30s ease-in-out;
                    -moz-transition: all 0.30s ease-in-out;
                    -ms-transition: all 0.30s ease-in-out;
                    -o-transition: all 0.30s ease-in-out;

            }.form-style-9 ul li  .field-style:focus{
                    box-shadow: 0 0 5px #B0CFE0;
                    border:1px solid #B0CFE0;
            }
            .form-style-9 ul li .field-split{
                    width: 49%;
            }
            .form-style-9 ul li .field-full{
                    width: 100%;
            }
            .form-style-9 ul li input.align-left{
                    float:left;
            }
            .form-style-9 ul li input.align-right{
                    float:right;
            }
            .form-style-9 ul li textarea{
                    width: 100%;
                    height: 100px;
            }
            .form-style-9 ul li input[type="button"], 
            .form-style-9 ul li input[type="submit"] {
                    -moz-box-shadow: inset 0px 1px 0px 0px #3985B1;
                    -webkit-box-shadow: inset 0px 1px 0px 0px #3985B1;
                    box-shadow: inset 0px 1px 0px 0px #3985B1;
                    background-color: #216288;
                    border: 1px solid #17445E;
                    display: inline-block;
                    cursor: pointer;
                    color: #FFFFFF;
                    padding: 8px 18px;
                    text-decoration: none;
                    font: 12px Arial, Helvetica, sans-serif;
            }
            .form-style-9 ul li input[type="button"]:hover, 
            .form-style-9 ul li input[type="submit"]:hover {
                    background: linear-gradient(to bottom, #2D77A2 5%, #337DA8 100%);
                    background-color: #28739E;
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
                
                <span class="username">Welcome Admin</span>
                
                <a href="Logout.jsp" class="btn btn-outline-light mr-3">
                    <i class="fa fa-sign-out" aria-hidden="true"></i> Log Out
                </a>
            </span>
        </div>
        
        <% 
            int total = Integer.parseInt((String) session.getAttribute("total_question"));
            
            
            String idd = (String) session.getAttribute("idd");
            
            for(int i=0;i<total;i++)
            {
                String question = request.getParameter("question_"+(i+1));
                String option1 = request.getParameter("option1_"+(i+1));
                String option2 = request.getParameter("option2_"+(i+1));
                String option3 = request.getParameter("option3_"+(i+1));
                String option4 = request.getParameter("option4_"+(i+1));
                
                String correct = request.getParameter("correct_"+(i+1));
                
                try
                {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/innovative", "root", "");
                String query = "insert into quizdetail (id,question,option1,option2,option3,option4,correct,mark) values (?,?,?,?,?,?,?,1)";
                PreparedStatement ps=conn.prepareStatement(query);
                ps.setString(1, idd);
                ps.setString(2, question);
                ps.setString(3, option1);
                ps.setString(4, option2);
                ps.setString(5, option3);
                ps.setString(6, option4);
                ps.setString(7, correct);
                
                int x  = ps.executeUpdate();
               
                }
                catch(Exception e)
                {
                    System.out.print(e);
                    e.printStackTrace();
                }
            }
            
            
        %>
        
        <form method="POST" action="addstudent.jsp" class="form-style-9">
            Enter the number of students to be added: 
            <input class="field-style field-full align-none" type="number" name="total_stud"/><br>
            <input type="submit"/>
            
        </form>
        
        <footer class="footer">
            Copyright &copy; 2022 | Sarthak and Jinil | All Rights Reserved 
        </footer>
    </body>
</html>
