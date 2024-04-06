/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

import java.sql.*;
/**
 *
 * @author Rohit Khanra
 */
public class Report {
    private int id;
    private String rname;
    private String remail;
    private String message;
    private Timestamp rdate;
    
    public Report(int id, String rname, String remail, String message, Timestamp rdate){
        this.id = id;
        this.rname = rname;
        this.remail = remail;
        this.message = message;
        this.rdate = rdate;
    }
    public  Report(){
        
    }
    
    public  Report(String rname, String remail, String message){
        this.rname = rname;
        this.remail = remail;
        this.message = message;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public String getRemail() {
        return remail;
    }

    public void setRemail(String remail) {
        this.remail = remail;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Timestamp getRdate() {
        return rdate;
    }

    public void setRdate(Timestamp rdate) {
        this.rdate = rdate;
    }
    
    
    
}
