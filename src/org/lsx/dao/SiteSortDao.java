package org.lsx.dao;

import org.apache.commons.dbutils.QueryRunner;
import org.lsx.entity.SiteSort;
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
 * Time: 下午3:59
 * To change this template use File | Settings | File Templates.
 */
public class SiteSortDao extends BaseDao {
    public List<SiteSort> list() {
        List<SiteSort> list = new ArrayList<SiteSort>();
        Connection conn = DbUtil.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement("select id,name from tb_sitesort");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new SiteSort(rs.getLong("id"), rs.getString("name"), new SiteDao().listBySiteSortId(rs.getLong("id"))));
            }
        } catch (SQLException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } finally {
        }
        return list;
    }

    public boolean add(SiteSort ss) {
        Connection conn = DbUtil.getConnection();
        QueryRunner qr = new QueryRunner();
        try {
            int i = qr.update(conn, "insert into tb_sitesort(name) values(?)", ss.getName());
            if (i > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        return false;
    }


}
