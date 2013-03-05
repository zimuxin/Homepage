package org.lsx.utils;

import java.sql.*;

/**
 * Created with IntelliJ IDEA.
 * User: lsx
 * Date: 3/4/13
 * Time: 4:07 PM
 * To change this template use File | Settings | File Templates.
 */
public class DbUtils {

    private static String driverClassName="org.apache.derby.jdbc.ClientDriver";
    private  static String url="jdbc:derby://localhost:1527/homepage;create=true";
    private  static String username="";
    private  static String password="";
    public static Connection getConnection(){
        try {
            Class.forName(driverClassName);
           return DriverManager.getConnection(url);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } catch (SQLException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } finally{

        }

        return null;
    }


    public static void closeAll(ResultSet rs,PreparedStatement ps,Connection conn){
        try {
           if(rs!=null){rs.close();}
            if(ps!=null)ps.close();
            if(conn!=null)conn.close();
        } catch (SQLException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }  finally{

        }
    }


    public static void main(String[] args) {
       Connection conn= DbUtils.getConnection();
        System.out.println(conn);
    }
}
