package org.lsx.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created with IntelliJ IDEA.
 * User: root
 * Date: 13-3-6
 * Time: 下午1:59
 * To change this template use File | Settings | File Templates.
 */
public class BaseDao {
   static Connection conn   =null;
   static PreparedStatement ps=null;
  static  ResultSet rs=null;
}
