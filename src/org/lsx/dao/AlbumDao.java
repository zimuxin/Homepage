package org.lsx.dao;

import org.lsx.entity.Album;
import org.lsx.entity.Photo;
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
 * User: root
 * Date: 13-3-6
 * Time: 下午1:59
 * To change this template use File | Settings | File Templates.
 */
public class AlbumDao extends BaseDao {

          public boolean add(Album a){
              conn= DbUtils.getConnection();
              try {
                  ps=conn.prepareStatement("insert into tb_album(name,createDate,photoList) values(?,?,?)");
                  ps.setString(1,a.getName());ps.setString(2, a.getCreateDate());
                  ps.setObject(3,null);//空相册，里面没有相片
                  if(ps.executeUpdate()>0){
                      return true;
                  }
              } catch (SQLException e) {
                  e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
              }    finally{
                  DbUtils.closeAll(null,ps,conn);
              }
              return false;
          }

        public List<Album> list(){
            Connection conn= DbUtils.getConnection();
            List<Album> list=new ArrayList<Album>();

            try {
               // conn.setAutoCommit(false);
              PreparedStatement ps=conn.prepareStatement("select id, name,coverPath,createDate,photoList from tb_album") ;

                ResultSet rs=ps.executeQuery();

              while(rs.next()){
                   Album a=new Album(rs.getLong("id"),rs.getString("name"),rs.getString("coverPath"),rs.getString("createDate"),new PhotoDao().listByAlbumId(rs.getLong("id")));
                    if(a.getCoverPath()==null){
                        a.setCoverPath("nocover.png");
                    }
                  list.add(a);
               }
              //  conn.getTransactionIsolation();
              //  conn.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
            }   finally{
                      DbUtils.closeAll(rs,ps,conn);
            }

            return list;
        }


        public  Album get(Long id){
            conn= DbUtils.getConnection();


            try {
                ps=conn.prepareStatement("select id,name,coverPath,createDate,photoList from tb_album where id=?") ;
                ps.setLong(1,id);
                rs=ps.executeQuery();
                while(rs.next()){

                    Album a=new Album(rs.getLong("id"),rs.getString("name"),rs.getString("coverPath"),rs.getString("createDate"),new PhotoDao().listByAlbumId(rs.getLong("id")));


                    System.out.println("check:::"+a);
                  return a;

                }
            } catch (SQLException e) {
                e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
            }

            return new Album(0L,"","nopic.png","",new ArrayList<Photo>());
        }


    public static void main(String[] args) {
        AlbumDao ad=new AlbumDao();
        List list=ad.list();
        Commons.PrintList(list);
    }

}
