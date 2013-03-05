package org.lsx.entity;

/**
 * Created with IntelliJ IDEA.
 * User: lsx
 * Date: 3/4/13
 * Time: 3:35 PM
 * To change this template use File | Settings | File Templates.
 */
public class Message {
    private Long id;
    private String sender;
    private String email;
    private String content;
    private String date;

    public Message(Long id, String sender, String email, String content,String date) {
        this.id = id;
        this.sender = sender;
        this.email = email;
        this.content = content;
        this.date=date;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Message{" +
                "id=" + id +
                ", sender='" + sender + '\'' +
                ", email='" + email + '\'' +
                ", content='" + content + '\'' +
                ", date='" + date + '\'' +
                '}';
    }
}
