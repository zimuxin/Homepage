package org.lsx.entity;


import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: root
 * Date: 13-3-6
 * Time: 下午1:50
 * To change this template use File | Settings | File Templates.
 */
public class Album {

    private Long id;
    private String name;    //相册名字
    private String coverPath="nopic.png";  //封面
    private String createDate;
    private List<Photo> photoList=new ArrayList<Photo>();  //相册中有很多相片，这个用来存相片的地址

    public Album(Long id, String name, String coverPath,String createDate, List<Photo> photoList) {
        this.id = id;
        this.name = name;
        this.coverPath=coverPath;
        this.createDate = createDate;
        this.photoList = photoList;
    }

    public String getCoverPath() {
        return coverPath;
    }

    public void setCoverPath(String coverPath) {
        this.coverPath = coverPath;
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

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public List<Photo> getPhotoList() {
        return photoList;
    }

    public void setPhotoList(List<Photo> photoList) {
        this.photoList = photoList;
    }

    @Override
    public String toString() {
        return "Album{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", coverPath='" + coverPath + '\'' +
                ", createDate='" + createDate + '\'' +
                ", photoList=" + photoList +
                '}';
    }
}
