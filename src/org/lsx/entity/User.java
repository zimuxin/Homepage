package org.lsx.entity;

/**
 * Created with IntelliJ IDEA.
 * User: root
 * Date: 13-3-9
 * Time: 下午5:49
 * To change this template use File | Settings | File Templates.
 */
public class User {
    private Long id;
    private String loginName;
    private String loginPwd;
    private String nickName;

    public User(Long id, String loginName, String loginPwd, String nickName) {
        this.id = id;
        this.loginName = loginName;
        this.loginPwd = loginPwd;
        this.nickName = nickName;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getLoginPwd() {
        return loginPwd;
    }

    public void setLoginPwd(String loginPwd) {
        this.loginPwd = loginPwd;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public User() {
    }

    @Override
    public String toString() {
        return "User{" +
                "nickName='" + nickName + '\'' +
                ", id=" + id +
                ", loginName='" + loginName + '\'' +
                ", loginPwd='" + loginPwd + '\'' +
                '}';
    }
}
