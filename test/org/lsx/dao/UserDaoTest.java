package org.lsx.dao;

import junit.framework.Assert;
import org.junit.Test;
import org.lsx.entity.User;

/**
 * Created with IntelliJ IDEA.
 * User: root
 * Date: 13-3-9
 * Time: 下午6:16
 * To change this template use File | Settings | File Templates.
 */
public class UserDaoTest {
    @Test
    public void list() {
        Assert.assertTrue("结果集不为空哦！", new UserDao().list().size() > 0);

    }

    @Test
    public void add() {
        User user = new UserDao().get(1L);
        user.setLoginName("loyy");
        user.setLoginPwd("123123");
        user.setNickName("wangHan");
        boolean i = new UserDao().add(user);
        Assert.assertTrue(i);
    }

    @Test
    public void get() {
        System.out.println("s" + new UserDao().get(1L));
        Assert.assertTrue(new UserDao().get(1L).getId() > 0);
    }

    @Test
    public void update() {
        User user = new UserDao().get(1L);
        User user2 = user;
        user.setNickName("ShixiLee");
        new UserDao().update(user);
        user = new UserDao().get(1L);
        Assert.assertNotSame(user.getNickName(), user2.getNickName());
    }


}
