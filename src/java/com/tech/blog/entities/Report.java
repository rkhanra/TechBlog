package com.tech.blog.entities;

import java.sql.Timestamp;

public class Report {
    private int id;
    private String rname;
    private String remail;
    private String message;
    private Timestamp rdate;
    private boolean processed;

    public Report(int id, String rname, String remail, String message, Timestamp rdate, boolean processed) {
        this.id = id;
        this.rname = rname;
        this.remail = remail;
        this.message = message;
        this.rdate = rdate;
        this.processed = processed;
    }

    public Report() {}

    public Report(String rname, String remail, String message) {
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

    public boolean isProcessed() {
        return processed;
    }

    public void setProcessed(boolean processed) {
        this.processed = processed;
    }
}
