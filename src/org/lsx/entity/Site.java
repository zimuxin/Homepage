package org.lsx.entity;

/**
 * Created with IntelliJ IDEA.
 * User: lsx
 * Date: 3/4/13
 * Time: 3:38 PM
 * To change this template use File | Settings | File Templates.
 */
public class Site {
    private Long id;
    private String title;
    private String url;
    private Long SortId;

    public Site(Long id, String title, String url, Long sortId) {
        this.id = id;
        this.title = title;
        this.url = url;
        SortId = sortId;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public void setSortId(Long sortId) {
        SortId = sortId;
    }

    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getUrl() {
        return url;
    }

    public Long getSortId() {
        return SortId;
    }
}
