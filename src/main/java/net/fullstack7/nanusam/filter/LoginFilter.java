package net.fullstack7.nanusam.filter;

import org.springframework.context.annotation.Bean;
import org.springframework.web.filter.CharacterEncodingFilter;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

@WebFilter(urlPatterns = {"/member/*", "/payment/*","/review/*","/cart/*","/chat/*","/bbs/view.do","/goods/regist.do","/goods/modify.do","/goods/delete.do"})
public class LoginFilter  implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        if(request.getSession().getAttribute("memberId") == null){
            // 문제 있으면 이 부분 지우셈...
            //String originalURL = request.getRequestURI();
            String originalURL = request.getHeader("Referer");

//            if (originalURL == null || originalURL.isEmpty()) {
//                originalURL = request.getRequestURI();
//                if (request.getQueryString() != null) {
//                    originalURL += "?" + request.getQueryString();
//                }
//            }

            if (request.getQueryString() != null) {
                originalURL += "?" + request.getQueryString();
            }
            request.getSession().setAttribute("redirectAfterLogin", URLEncoder.encode(URLEncoder.encode(originalURL,"UTF-8"),"UTF-8"));
            //-------------------------
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<script>");
            response.getWriter().println("alert('로그인 후 이용 가능합니다');");
            response.getWriter().println("location.href='/login/login.do';");
            response.getWriter().println("</script>");
            return;
        }
        filterChain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
