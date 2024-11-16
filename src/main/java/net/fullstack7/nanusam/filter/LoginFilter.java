package net.fullstack7.nanusam.filter;

import net.fullstack7.nanusam.util.CommonUtil;
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
            String referer = request.getHeader("referer");
            String refererUri = referer != null ? CommonUtil.urlToUri(referer) : "";

            if (refererUri != null && !refererUri.isEmpty()) {
                refererUri = URLEncoder.encode(URLEncoder.encode(refererUri, "UTF-8"), "UTF-8"); // 두 번 인코딩
            }
            request.getSession().setAttribute("redirectAfterLogin", refererUri);
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