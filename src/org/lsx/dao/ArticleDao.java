package org.lsx.dao;


import org.lsx.entity.Article;
import org.lsx.utils.Commons;
import org.lsx.utils.DbUtils;
import org.lsx.utils.EncodeTool;

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
 * Time: 3:50 PM
 * To change this template use File | Settings | File Templates.
 */
public class ArticleDao {
    public List<Article> list() {
        Connection conn = DbUtils.getConnection();
        List<Article> list = new ArrayList<Article>();
        try {
            if(conn==null){
                System.out.println("conn is  null!!");}
            PreparedStatement ps = conn.prepareStatement("select id,title,content,post from tb_article");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Article a = new Article(rs.getLong("id"), rs.getString("title"), rs.getString("content"), rs.getString("post"));
                list.add(a);
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        return list;
    }

    public Article get(Long id) {
        Connection conn = DbUtils.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement("select id,title,content,post from tb_article");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Article a = new Article(rs.getLong("id"), rs.getString("title"), rs.getString("content"), rs.getString("post"));
                return a;
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } finally {

        }
        return null;
    }


    public boolean add(Article a) {
        Connection conn = DbUtils.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement("insert into tb_article(title,content,post) values(?,?,?);");
            ps.setString(1, a.getTitle());
            ps.setString(2, EncodeTool.encode(a.getContent()));
            ps.setString(3, a.getPostDate());
            if (ps.execute()) {
                return true;
            }
            ps.close();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        return false;
    }

    public boolean del(Long id) {
        Connection conn = DbUtils.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement("delete tb_article where id=?");
            ps.setLong(1, id);
            if (ps.execute()) {
                return true;
            }
            ps.close();
            conn.close();


        } catch (SQLException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        return false;
    }

    public boolean update(Article a) {
        Connection conn = DbUtils.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement("update tb_article set title=?,content=?,post=? where id=?");
            ps.setString(1, a.getTitle());
            ps.setString(2, a.getContent());
            ps.setString(3, a.getPostDate());
            ps.setLong(4, a.getId());
            if (ps.execute()) {
                return true;
            }
            ps.close();
            conn.close();


        } catch (SQLException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        return false;
    }

    public static void main(String[] args) {

        List<Article> list = new ArticleDao().list();
        Commons.PrintList(list);
        Article a = (new ArticleDao()).get(0L);
        System.out.println(a.getId());
        a.setContent("new content");
        new ArticleDao().update(a);
        Commons.PrintList(new ArticleDao().list());


    }

}
