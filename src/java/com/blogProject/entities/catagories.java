
package com.blogProject.entities;


public class catagories {
    private int cid;
    private String name;
    private String description;
    private String refrenceLink;

    public catagories(int cid, String name, String description,String refrenceLink) {
        this.cid = cid;
        this.name = name;
        this.description = description;
        this.refrenceLink=refrenceLink;
    }

    public catagories() {
    }

    public catagories(String name, String description,String refrenceLink ) {
        this.name = name;
        this.description = description;
        this.refrenceLink=refrenceLink;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getRefrenceLink() {
        return refrenceLink;
    }

    public void setRefrenceLink(String refrenceLink) {
        this.refrenceLink = refrenceLink;
    }
    
    
    
    
}
