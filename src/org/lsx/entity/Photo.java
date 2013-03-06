package org.lsx.entity;

/**
 * Created with IntelliJ IDEA.
 * User: root
 * Date: 13-3-6
 * Time: 下午2:04
 * To change this template use File | Settings | File Templates.
 */
public class Photo {
    private Long id;



    private String describe;//图片的描述
    private String filename;
    private Long albumId = 0L;//所属相册

    public Photo(Long id, String describe, String filename, Long albumId) {
        this.id = id;

        this.describe = describe;
        this.filename = filename;
        this.albumId = albumId;
    }

    public Photo() {
        this.setFilename("no.jpg");
        this.setDescribe("未找到相片");


    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public Long getAlbumId() {
        return albumId;
    }

    public void setAlbumId(Long albumId) {
        this.albumId = albumId;
    }
    @Override
    public String toString() {
        return "Photo{" +
                "id=" + id +
                ", describe='" + describe + '\'' +
                ", filename='" + filename + '\'' +
                ", albumId=" + albumId +
                '}';
    }
}
