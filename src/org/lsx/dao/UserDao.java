package org.lsx.dao;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.lsx.entity.User;
import org.lsx.utils.Commons;
import org.lsx.utils.DbUtil;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: root
 * Date: 13-3-9
 * Time: 下午5:51
 * To change this template use File | Settings | File Templates.
 */
public class UserDao {
    ResultSetHandler<List<User>> h = new BeanListHandler<User>(User.class);

    public List<User> list() {
        Connection conn = DbUtil.getConnection();
        List<User> list = new ArrayList<User>();
        QueryRunner qr = new QueryRunner();
        try {

            String sql = "select id,loginname,loginpwd,nickname from tb_user";
            list = qr.query(conn, sql, h);

            Commons.PrintList(list);

        } catch (SQLException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } finally {
            org.apache.commons.dbutils.DbUtils.closeQuietly(conn);
        }
        return list;
    }

    public User get(Long id) {
        Connection conn = DbUtil.getConnection();
        QueryRunner qr = new QueryRunner();
        try {
            return qr.query(conn, "select id,loginname,loginpwd,nickname from tb_user where id=?", h, id).get(0);

        } catch (SQLException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }


        return null
                ;
    }

    public boolean update(User user) {
        Connection conn = DbUtil.getConnection();
        QueryRunner qr = new QueryRunner();
        try {
            int rst = qr.update(conn, "update tb_user set nickname=?,loginpwd=? where id=?", user.getNickName(), user.getLoginPwd(), user.getId());
            return rst > 0;
        } catch (SQLException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        return false;
    }

    public boolean del(Long id) {
        Connection conn = DbUtil.getConnection();
        QueryRunner qr = new QueryRunner();
        try {
            return qr.update(conn, "delete from tb_user where id=?", id) > 0;
        } catch (SQLException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        return false;
    }

    public boolean add(User user) {
        Connection conn = DbUtil.getConnection();
        QueryRunner qr = new QueryRunner();
        try {
            return qr.update(conn, "insert into tb_user (loginname,loginpwd,nickname) values(?,?,?)", user.getNickName(), user.getLoginPwd(), user.getNickName()) > 0;
        } catch (SQLException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } finally {
            DbUtils.closeQuietly(conn);
        }
        return false;

    }

    public User getByNameAndPassword(String name, String pwd) {
        User user = null;
        Connection conn = DbUtil.getConnection();
        QueryRunner qr = new QueryRunner();
        try {
            List<User> list = qr.query(conn, "select id,loginname,loginpwd,nickname from tb_user where loginname=? and loginpwd=?", h, name, pwd);
            if (null != list && !list.isEmpty() && list.size() > 0) {
                try {
                    user = list.get(0);
                } catch (IndexOutOfBoundsException e) {
                    e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
                    return null;
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } finally {
            DbUtils.closeQuietly(conn);
        }
        return user;
    }
}
