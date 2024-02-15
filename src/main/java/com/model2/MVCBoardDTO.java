package com.model2;

import java.util.Date;

public class MVCBoardDTO {
    private String idx;
    private String name;
    private String title;
    private String content;
    private String ofile;
    private String sfile;
    private Integer downcount;
    private String pass;
    private Integer visitcount;
    private Date postdate;

    public String getIdx() {
        return idx;
    }

    public void setIdx(String idx) {
        this.idx = idx;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getOfile() {
        return ofile;
    }

    public void setOfile(String ofile) {
        this.ofile = ofile;
    }

    public String getSfile() {
        return sfile;
    }

    public void setSfile(String sfile) {
        this.sfile = sfile;
    }

    public Integer getDowncount() {
        return downcount;
    }

    public void setDowncount(Integer downcount) {
        this.downcount = downcount;
    }

    public Integer getVisitcount() {
        return visitcount;
    }

    public void setVisitcount(Integer visitcount) {
        this.visitcount = visitcount;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }


    public Date getPostdate() {
        return postdate;
    }

    public void setPostdate(Date postdate) {
        this.postdate = postdate;
    }
}
