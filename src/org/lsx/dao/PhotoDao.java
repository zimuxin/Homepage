package org.lsx.dao;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.lsx.entity.Photo;
import org.lsx.utils.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: root
 * Date: 13-3-6
 * Time: 下午2:44
 * To change this template use File | Settings | File Templates.
 */
public class PhotoDao extends BaseDao {

    public Photo get(Long id) {
        conn = DbUtil.getConnection();
        try {
            ps = conn.prepareStatement("select id,descr,filename,albumId from tb_photo where id=?");
            ps.setLong(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Photo p = new Photo(rs.getLong("id"), rs.getString("descr"), rs.getString("filename"), rs.getLong("albumId"));
                return p;
            }
        } catch (SQLException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        return new Photo();

    }


    public List<Photo> listByAlbumId(Long albumId) {
        conn = DbUtil.getConnection();
        List list = new ArrayList<Photo>();
        try {

            ps = conn.prepareStatement("select id,descr,filename,albumId from tb_photo where albumId=?");
            ps.setLong(1, albumId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Photo(rs.getLong("id"), rs.getString("descr"), rs.getString("filename"), rs.getLong("albumId")));
            }
        } catch (SQLException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } finally {
            DbUtil.closeAll(rs, ps, conn);
        }
        return list;
    }

    public boolean add(Photo photo) {
        Connection conn = DbUtil.getConnection();
        QueryRunner qr = new QueryRunner();
        boolean flag = false;
        try {
            conn.setAutoCommit(false);

            int i = qr.update(conn, "insert into tb_photo (albumid,descr,filename) values(?,?,?)", photo.getAlbumId(), photo.getDescribe(), photo.getFilename());


            if (i > 0) {
                Long photoId = 0L;
                PreparedStatement ps = conn.prepareStatement("select max(id) as id from tb_photo");
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    photoId = rs.getLong("id");
                }
                int ij = qr.update(conn, "insert into tb_album_photo(albumid,photoid) values(?,?)", photo.getAlbumId(), photoId);

                if (ij > 0) {
                    flag = true;
                }

            }
            conn.commit();

        } catch (SQLException e) {

            try {
                conn.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
            }

            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } finally {

            DbUtils.closeQuietly(conn);
        }
        return flag;
    }

    public boolean update(Photo photo) {
        Connection conn = DbUtil.getConnection();
        QueryRunner qr = new QueryRunner();
        try {
            int i = qr.update(conn, "update tb_photo set descr=?,albumId=? where id=?", photo.getDescribe(), photo.getAlbumId(), photo.getId());
            if (i > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } finally {
            DbUtils.closeQuietly(conn);
        }
        return false;
    }

    public boolean del(Long id) {
        Connection conn = DbUtil.getConnection();
        QueryRunner qr = new QueryRunner();
        try {
            int i = qr.update(conn, "delete from tb_photo where id=?", id);
            if (i > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } finally {
            DbUtils.closeQuietly(conn);
        }
        return false;
    }


    public boolean updateSupport(String sql, Object[] params) {
//        Connection conn=DbUtil.getConnection();
//        QueryRunner qr=new QueryRunner();
//        try {
//            int i= qr.update(conn,"delete from tb_photo where id=?",);
//            if(i>0){
//                return true;
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
//        }    finally{
//            DbUtils.closeQuietly(conn);
//        }
        return false;
    }
}
