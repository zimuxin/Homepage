package org.lsx.utils;

/**
 * Created with IntelliJ IDEA.
 * User: lsx
 * Date: 3/4/13
 * Time: 5:12 PM
 * To change this template use File | Settings | File Templates.
 */
public class EncodeTool {

    public static  String encode(String s)
    {
        String str=s;
        str = str.replace("'", "''");
        str = str.replace("\"", "&quot;");
        str = str.replace("<", "&lt;");
        str = str.replace(">", "&gt;");
        str = str.replace("\n", "<br>");
        str = str.replace("“", "&ldquo;");
        str = str.replace("”", "&rdquo;");
        return str;
    }
    public static String Decode(String str)
    {
        str = str.replace("&rdquo;", "”");
        str = str.replace("&ldquo;", "“");
        str = str.replace("<br>", "\n");
        str = str.replace("&gt;", ">");
        str = str.replace("&lt;", "<");
        str = str.replace("&quot;", "\"");
        str = str.replace("''", "'");
        return str;
    }
}
