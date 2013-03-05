package org.lsx.dao;

import org.lsx.entity.Message;
import org.lsx.utils.Commons;
import org.lsx.utils.DbUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: lsx
 * Date: 3/4/13
 * Time: 9:19 PM
 * To change this template use File | Settings | File Templates.
 */
public class MessageDao {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Message> list() {
        conn = DbUtils.getConnection();
        List<Message> list = new ArrayList<Message>();
        try {
            ps = conn.prepareStatement("SELECT id,sender,email,content,date FROM tb_message order by id desc");
            rs = ps.executeQuery();
            while (rs.next()) {
                Message msg = new Message(rs.getLong("id"), rs.getString("sender"), rs.getString("email"), rs.getString("content"),rs.getString("date"));
                list.add(msg);
            }
        } catch (SQLException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } finally {
            try {
                rs.close();
                ps.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
            }

        }
        return list;
    }

    public Message get(Long id) {
        conn = DbUtils.getConnection();
        try {
            ps = conn.prepareStatement("SELECT id,sender,email,content FROM tb_message WHERE id=?");
            ps.setLong(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Message msg = new Message(rs.getLong("id"), rs.getString("sender"), rs.getString("email"), rs.getString("content"),rs.getString("date"));
                return msg;
            }
        } catch (SQLException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } finally {

            DbUtils.closeAll(rs, ps, conn);


        }
        return null;
    }

    public boolean del(Long id) {
        conn = DbUtils.getConnection();
        try {
            ps = conn.prepareStatement("DELETE FROM tb_message WHERE id=?");
            ps.setLong(1, id);
            if (ps.execute()) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } finally {

            DbUtils.closeAll(null, ps, conn);


        }


        return false;
    }

    public boolean update(Message msg) {
        conn = DbUtils.getConnection();
        try {
            ps = conn.prepareStatement("UPDATE tb_message SET sender=?,email=?,content=?,date=? WHERE id=?");

            ps.setString(1, msg.getSender());
            ps.setString(2, msg.getEmail());
            ps.setString(3, msg.getContent());
            ps.setString(4, msg.getDate());
            ps.setLong(5, msg.getId());
            if (ps.execute()) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } finally {

            DbUtils.closeAll(null, ps, conn);


        }


        return false;
    }

    public boolean add(Message msg) {
        conn = DbUtils.getConnection();
        try {
            ps = conn.prepareStatement("INSERT INTO  tb_message(sender,email,content,date) VALUES(?,?,?,?)");

            ps.setString(1, msg.getSender());
            ps.setString(2, msg.getEmail());
            ps.setString(3, msg.getContent());
            ps.setString(4,msg.getDate());

            if (ps.executeUpdate()>0) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } finally {

            DbUtils.closeAll(null, ps, conn);
        }


        return false;
    }


    public static void main(String[] args) {
        MessageDao md = new MessageDao();

        for (int i = 0; i < 7; i++) {
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
            }
            md.add(new Message(0L, "sender" + i, "sender" + i + "@mail.com", "content" + i,Commons.nowTime()));
        }

        Commons.PrintList(md.list());
        Message msg = md.list().get(0);
        System.out.println(md.get(msg.getId()));
        msg.setContent("new content");
        md.update(msg);
        Commons.PrintList(md.list());

        md.del(msg.getId());
        List<Message> list = md.list();
        for (int i = 0; i < list.size(); i++) {
               //  md.del(list.get(i).getId());
        }

    }


}
