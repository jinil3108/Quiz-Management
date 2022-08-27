/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PATEL SARTHAK
 */
public class QuizDao {
    
    public ResultSet fetchList(String email)
    {
        try{
            Connection conn = DBConnect.getConn();
            String query = "select * from quizzes where email=?";
            
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setString(1, email);
            ResultSet rs = pt.executeQuery();
            
            if(rs.next())
                return rs;
            return null;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return null;
    }
    
     public int getTotalQuiz(String email){
        int total = 0;
         try{
            Connection conn = DBConnect.getConn();
            String query = "SELECT COUNT(*) AS total FROM quizzes where email = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setString(1, email);
            ResultSet rs = pt.executeQuery();
            if(rs.next()){
                total = rs.getInt("total");
            }
        } catch(SQLException ex){
            ex.printStackTrace();
        }
        return total;
    }
     
     public int getTotalQuizQuestions(String id){
        int total = 0;
         try{
            Connection conn = DBConnect.getConn();
            String query = "SELECT COUNT(*) AS total FROM quizdetail where id = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setString(1, id);
            ResultSet rs = pt.executeQuery();
            if(rs.next()){
                total = rs.getInt("total");
            }
        } catch(SQLException ex){
            ex.printStackTrace();
        }
        return total;
    }
}
