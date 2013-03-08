import org.junit.Test;
import org.lsx.dao.AlbumDao;
import org.lsx.entity.Album;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: root
 * Date: 13-3-7
 * Time: 下午6:26
 * To change this template use File | Settings | File Templates.
 */
public class AlbumDaoTest {

    @Test
    public void list(){
        AlbumDao ad=new AlbumDao();
        List<Album> list=ad.list()  ;
           for(int i=0;i<list.size();i++){
               Album a=list.get(i);
               System.out.println(a);
           }
    }
}
