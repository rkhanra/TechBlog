/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.*;
import java.util.*;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    //method to insert user to data base:
    public boolean saveUser(User user) {
        boolean f = false;
        try {
            //user -->database

            String query = "insert into user(name,email,password,gender,about) values (?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());

            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }

    //get user by useremail and userpassword:
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;

        try {

            String query = "select * from user where email =? and password=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                user = new User();

//             data from db
                String name = set.getString("name");
//             set to user object
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public boolean updateUser(User user) {

        boolean f = false;
        try {

            String query = "update user set name=? , email=? , password=? , gender=? ,about=? , profile=? where  id =?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getGender());
            p.setString(5, user.getAbout());
            p.setString(6, user.getProfile());
            p.setInt(7, user.getId());

            p.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public User getUserByUserId(int userId) {
        User user = null;
        try {
            String q = "select * from user where id=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, userId);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                user = new User();

//             data from db
                String name = set.getString("name");
//             set to user object
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    
    
        public List<User> getAllUsers() {
        List<User> userList = new ArrayList<>();

        try {
            // SQL query to fetch names and emails from the users table
            String query = "SELECT name, email, about, rdate , profile FROM user";

            // Prepare the statement
            PreparedStatement pstmt = con.prepareStatement(query);

            // Execute the query
            ResultSet resultSet = pstmt.executeQuery();

            // Process the result set
            while (resultSet.next()) {
                // Retrieve name and email from the result set
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String about = resultSet.getString("about");
                Timestamp rdatee = resultSet.getTimestamp("rdate");
                String profile = resultSet.getString("profile");
                
                // Create a new User object and add it to the list
                User user = new User(name, email,  about, rdatee, profile);
                
                userList.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return userList;
    }
    
}
