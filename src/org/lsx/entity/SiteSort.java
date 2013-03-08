package org.lsx.entity;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: root
 * Date: 13-3-7
 * Time: 下午3:58
 * To change this template use File | Settings | File Templates.
 */
public class SiteSort {

    private Long id;
    private String name;
    private List<Site> siteList;

    public SiteSort(Long id, String name, List<Site> siteList) {
        this.id = id;
        this.name = name;
        this.siteList = siteList;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Site> getSiteList() {
        return siteList;
    }

    public void setSiteList(List<Site> siteList) {
        this.siteList = siteList;
    }
}
