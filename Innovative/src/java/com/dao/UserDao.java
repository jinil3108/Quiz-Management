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
public class UserDao {
    
    public boolean isuser(String email, String password)
    {
        try{
            Connection conn = DBConnect.getConn();
            String ePassword = PasswordEncrypt.hashPassword(password);
            String query = "select * from credentials where email = ? and password = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setString(1, email);
            pt.setString(2, ePassword);
            ResultSet rs = pt.executeQuery();
            if(rs.next()){
                return true;
            } else{
                return false;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    public boolean UserRegister(String name, String email, String password)
    {
        try{
            Connection conn = DBConnect.getConn();
            String ePassword = PasswordEncrypt.hashPassword(password);
            
            // Checking for the user if already present.
            String query1 = "select * from credentials where email = ?";
            PreparedStatement pt1 = conn.prepareStatement(query1);
            pt1.setString(1, email);
            ResultSet rs1 = pt1.executeQuery();
            if(rs1.next()){
                return false;
            } else{
                String query = "insert into credentials (name,email,password) values(?,?,?)";
                PreparedStatement pt3 = conn.prepareStatement(query);
                pt3.setString(1, name);
                pt3.setString(2, email);
                pt3.setString(3 , ePassword);
                int i  = pt3.executeUpdate();
                return true;
            }
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
}
