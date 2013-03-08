import junit.framework.Assert;
import org.junit.Test;
import org.lsx.dao.SiteSortDao;
import org.lsx.entity.SiteSort;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: root
 * Date: 13-3-7
 * Time: 下午5:12
 * To change this template use File | Settings | File Templates.
 */
public class SiteSortDaoTest {
    @Test
    public void list(){
     SiteSortDao ssd=   new SiteSortDao();
        List<SiteSort> lst=ssd.list();
        Assert.assertTrue("网址分类列表为空啊！！是不是没有导入数据啊！？", lst.size() > 0);
        for(int i=0;i<lst.size();i++){
            SiteSort ss=lst.get(i);
            System.out.println(lst.get(i));
            for(int j=0;j<ss.getSiteList().size();j++){
                System.out.println(ss.getSiteList().get(j));
                System.out.println(ss.getSiteList().get(j).getTitle());
            }
        }
        //Commons.PrintList(lst);
     }
}
