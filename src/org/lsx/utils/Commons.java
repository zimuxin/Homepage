package org.lsx.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: lsx
 * Date: 3/4/13
 * Time: 4:46 PM
 * To change this template use File | Settings | File Templates.
 */
public class Commons {

    public static void PrintList(List list){

        for(int i=0;i<list.size();i++){
            System.out.println(list.get(i));
        }
    }

    public static String  nowTime(){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Date date=new Date();

       return  sdf.format(date) ;
    }

    public static void main(String[] args) {
        System.out.println(nowTime());
    }
}
