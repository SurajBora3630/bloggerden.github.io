
package com.blogProject.helper;

public class message {
    private String message;
    private String type;
    private String cssClass;

    public message(String message, String type, String cssClass) {
        this.message = message;
        this.type = type;
        this.cssClass = cssClass;
    }
// getters and setters 
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCssClass() {
        return cssClass;
    }

    public void setCssClass(String cssClass) {
        this.cssClass = cssClass;
    }
    
}
