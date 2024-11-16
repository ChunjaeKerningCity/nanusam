package net.fullstack7.nanusam.filter;

import java.io.IOException;
import java.net.URLEncoder;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.fullstack7.nanusam.service.AdminService;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

@WebFilter(urlPatterns = {"/admin/logout.do", "/admin/main.do", "/admin/memberMm.do", "/admin/updateMemberStatus.do", "/admin/noticeMm.do", "/admin/goodsMm.do", "/admin/deleteGoods.do", "/admin/updateGoodsStatus.do", "/admin/deleteMember.do"})
public class AdminFilter implements Filter {

    private AdminService adminService;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(filterConfig.getServletContext());
        this.adminService = context.getBean(AdminService.class);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        String memberId = (String) request.getSession().getAttribute("memberId");

        if (memberId == null || !adminService.isAdmin(memberId)) {
            String originalURL = request.getRequestURI();
            if (request.getQueryString() != null) {
                originalURL += "?" + request.getQueryString();
            }
            request.getSession().setAttribute("redirectAfterLogin", URLEncoder.encode(URLEncoder.encode(originalURL, "UTF-8"), "UTF-8"));
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<script>");
            response.getWriter().println("alert('관리자 로그인 이후 이용 가능합니다');");
            response.getWriter().println("location.href='/admin/login.do';");
            response.getWriter().println("</script>");
            return;
        }

        filterChain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // 종료 시 필요한 코드가 있으면 작성
    }
}
