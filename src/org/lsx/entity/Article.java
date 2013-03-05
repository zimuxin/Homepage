package org.lsx.entity;

/**
 * Created with IntelliJ IDEA.
 * User: lsx
 * Date: 3/4/13
 * Time: 3:30 PM
 * To change this template use File | Settings | File Templates.
 */
public class Article {
    private Long id;
    private String title;
    private String content;
    private String postDate;

    public Article(Long id, String title, String content, String postDate) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.postDate = postDate;
    }

    @Override
    public String toString() {
        return "Article{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", postDate='" + postDate + '\'' +
                '}';
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public String getPostDate() {
        return postDate;
    }

    public void setPostDate(String postDate) {
        this.postDate = postDate;
    }
    

}
