package org.lsx.dao;

import org.lsx.entity.Photo;
import org.lsx.utils.DbUtil;

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
}
