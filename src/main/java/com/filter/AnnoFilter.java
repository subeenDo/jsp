package com.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;

import java.io.IOException;

@WebFilter(filterName = "AnnoFilter", urlPatterns = "/15/AnnoFilter.jsp")
public class AnnoFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
            throws IOException, ServletException {
        String searchFiled = req.getParameter("searchFiled");
        String searchWord = req.getParameter("searchWord");

        System.out.println("검색필드 : " +searchFiled);
        System.out.println("검색어 : " +searchWord);

        chain.doFilter(req, resp);
    }

    @Override
    public void destroy() {
        System.out.println("AnnoFilter -> destroy()호출");
    }
}
