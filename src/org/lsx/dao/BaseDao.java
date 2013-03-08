package org.lsx.dao;

import org.lsx.entity.Site;
import org.lsx.utils.DbUtils;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
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
 * Time: 下午1:59
 * To change this template use File | Settings | File Templates.
 */
public class BaseDao {
   static Connection conn   =null;
   static PreparedStatement ps=null;
  static  ResultSet rs=null;

    public List<Object> list(Object obj,String tableName){
        Class clazz=obj.getClass();
          List<Object> list=new ArrayList<Object>() ;
          conn= DbUtils.getConnection();
          StringBuffer columns=new StringBuffer("");
          Field[] fs=clazz.getDeclaredFields();

             for(int i=0;i<fs.length;i++){
                   Field f=fs[i];
                 String fieldName=f.getName();
                 fieldName+=",";
                 String fieldType=f.getGenericType().toString().replace("class java.lang.","") ;
                 System.out.println(fieldName+"["+fieldType+"]");
                 columns.append(fieldName);

             }
                System.out.println(columns);
                columns=new StringBuffer(columns.substring(0,columns.length()-1));
                System.out.println(columns.toString());
                String sql="select "+columns+" from "+tableName;
        try {
            ps=conn.prepareStatement(sql) ;

            rs=ps.executeQuery();
            while(rs.next()){
                try {
                 Object objInstance=   clazz.getConstructor(new Class[]{}).newInstance(new Object[]{});


                } catch (InstantiationException e) {
                    e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
                } catch (IllegalAccessException e) {
                    e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
                } catch (InvocationTargetException e) {
                    e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
                } catch (NoSuchMethodException e) {
                    e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
                } finally {
                }


            }
        } catch (SQLException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } finally {
        }
        return list;
    }

    public static void main(String[] args) {
        BaseDao bd=new BaseDao();
        bd.list(Site.class,"tb_site");
    }
}
