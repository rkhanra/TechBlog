/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

import java.util.*;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();

        try {

            String q = "select * from categories";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                Category c = new Category(cid, name, description);
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean savePost(Post p) {
        boolean f = false;
        try {

            String q = "insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());
            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

//    get all the posts
    public List<Post> getAllPosts() {

        List<Post> list = new ArrayList<>();
        //fetch all the post
        try {

            PreparedStatement p = con.prepareStatement("select * from posts order by pid desc");

            ResultSet set = p.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();
        //fetch all post by id
        //fetch all the post
        try {

            PreparedStatement p = con.prepareStatement("select * from posts where catId=?");
            p.setInt(1, catId);
            ResultSet set = p.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");

                int userId = set.getInt("userId");
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Post getPostByPostId(int postId) {
        Post post = null;
        String q = "select * from posts where pid=?";
        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, postId);

            ResultSet set = p.executeQuery();

            if (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int cid = set.getInt("catId");
                int userId = set.getInt("userId");
                post = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }

    // ON WORKING
    public boolean updatePosts(Post updatedPost) {

        boolean isUpdated = false;

        try {
            String query = "update posts set pTitle=?, pContent=?, pCode=?, pPic=? where pid=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, updatedPost.getpTitle());
            pstmt.setString(2, updatedPost.getpContent());
            pstmt.setString(3, updatedPost.getpCode());
            pstmt.setString(4, updatedPost.getpPic());
            pstmt.setInt(5, updatedPost.getPid());

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                isUpdated = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isUpdated;
    }


    public List<Post> getPostsByUserId(int userId) {
        List<Post> list = new ArrayList<>();

        try {
            String query = "select * from posts where userId=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, userId);

            ResultSet set = pstmt.executeQuery();

            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    
   // construction running so do not un-comment this code block
// Method to get the total number of posts for each user
//public Map<Integer, Integer> getUserPostCounts() {
//    Map<Integer, Integer> userPostCounts = new HashMap<>();
//
//    try {
//        // Prepare SQL query to sum the count of posts for each user
//        String query = "SELECT userId, COUNT(*) AS totalPostCount FROM posts GROUP BY userId";
//        PreparedStatement pstmt = con.prepareStatement(query);
//
//        // Execute the query
//        ResultSet rs = pstmt.executeQuery();
//
//        // Process the results
//        while (rs.next()) {
//            int userId = rs.getInt("userId");
//            int totalPostCount = rs.getInt("totalPostCount");
//            userPostCounts.put(userId, totalPostCount);
//        }
//
//        // Close the ResultSet and PreparedStatement
//        rs.close();
//        pstmt.close();
//    } catch (SQLException e) {
//        e.printStackTrace();
//    }
//
//    return userPostCounts;
//}

}
