package com.util;

import jakarta.servlet.jsp.JspWriter;

public class JSFunction {
    //메세지 알림창 띄우고 특정 페이지로 이동 시키는 자바스크립트 함수
    public static void alertLocation(String msg, String url, JspWriter out) {

        try {
            String script = ""
                    + "<script>"
                    + "alert('" + msg + "');"
                    + "location.href='" + url + "';"
                    +"</script>";
            out.print(script);
        } catch (Exception e) {
        }

    }

    //메세지 알림창을 띄우고 이전 페이지로 돌아가는 JS함수
    public static void alertBack(String msg, JspWriter out) {
        try {
            String script = ""
                    + "<script>"
                    + "alert('" + msg + "');"
                    + "history.back();"
                    +"</script>";
            out.print(script);
        } catch (Exception e) {
        }

    }
}