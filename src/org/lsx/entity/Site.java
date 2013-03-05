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
    private String netAddress;

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

    public String getNetAddress() {
        return netAddress;
    }

    public void setNetAddress(String netAddress) {
        this.netAddress = netAddress;
    }
}
