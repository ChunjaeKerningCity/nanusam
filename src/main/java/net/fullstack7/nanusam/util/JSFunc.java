package net.fullstack7.nanusam.util;

import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class JSFunc {
    public static void alertLocation(String msg, String url, HttpServletResponse response) {
        try {
            PrintWriter writer = response.getWriter();
            response.setContentType("text/html;charset=UTF-8");
            String code = "<script>"
                    + "alert('"+msg+"');"
                    + "location.href='"+url+"';"
                    + "</script>";
            writer.print(code);
        }catch(Exception e) {

        }
    }
    public static void back(HttpServletResponse response) {
        try {
            PrintWriter writer = response.getWriter();
            response.setContentType("text/html;charset=UTF-8");
            String code = "<script>"
                    + "history.back();"
                    + "</script>";
            writer.print(code);
        }catch(Exception e) {

        }
    }
    public static void alertBack(String msg, HttpServletResponse response) {
        try {
            PrintWriter writer = response.getWriter();
            response.setContentType("text/html;charset=UTF-8");
            String code = "<script>"
                    + "alert('"+msg+"');"
                    + "history.back();"
                    + "</script>";
            writer.print(code);
        }catch(Exception e) {

        }
    }
    public static void alert(String msg, HttpServletResponse response) {
        try {
            PrintWriter writer = response.getWriter();
            response.setContentType("text/html;charset=UTF-8");
            String code = "<script>"
                    + "alert('"+msg+"');"
                    + "</script>";
            writer.print(code);
        }catch(Exception e) {

        }
    }
}
