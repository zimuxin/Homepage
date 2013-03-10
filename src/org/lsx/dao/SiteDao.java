package org.lsx.dao;

import org.lsx.entity.Site;
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
 * Date: 13-3-7
 * Time: 下午4:03
 * To change this template use File | Settings | File Templates.
 */
public class SiteDao extends BaseDao {

    public List<Site> listBySiteSortId(Long sortId) {
        List<Site> list = new ArrayList<Site>();
        Connection conn = DbUtil.getConnection();

        try {
            PreparedStatement ps = conn.prepareStatement("select id,title,url,sortId from tb_site where sortId=?");
            ps.setLong(1, sortId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Site(rs.getLong("id"), rs.getString("title"), rs.getString("url"), rs.getLong("sortId")));

            }
        } catch (SQLException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } finally {
            DbUtil.closeAll(rs, ps, conn);
        }
        return list;
    }

    public boolean add(Site site) {
        Connection conn = DbUtil.getConnection();

        try {
            PreparedStatement ps = conn.prepareStatement("insert into tb_site(title,url,sortId) values(?,?,?)");

            ps.setString(1, site.getTitle());
            ps.setString(2, site.getUrl());
            ps.setLong(3, site.getSortId());
            if (ps.executeUpdate() > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } finally {
            DbUtil.closeAll(rs, ps, conn);
        }
        return false;
    }


}
