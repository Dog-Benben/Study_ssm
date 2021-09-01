package pers.zjh.shop.interceptor;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import pers.zjh.shop.pojo.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;

/**
 * 前端展示拦截器，未登录状态下拦截一些页面请求
 */

public class ForeLoginInterceptor extends HandlerInterceptorAdapter {

    /**
     * 在业务处理器处理请求之前调用
     * 如果返回false 退出拦截器 不执行Controller 里的方法
     * 如果返回true 执行被拦截的Controller 的方法
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws IOException
     */
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
        HttpSession session = request.getSession();
        String contextPath = session.getServletContext().getContextPath();
        // 存储不需要登录也能访问的路径
        String[] noNeedLoginPage = new String[]{
                "Home",
                "checkLogin",
                "loginAjax",
                "product",
                "category",
                "search",
                "_login",
                "register"
        };
        String uri = request.getRequestURI();
        uri = StringUtils.remove(uri, contextPath);
        if(uri.startsWith("/fore/fore")){
            String s = StringUtils.substringAfterLast(uri,"/fore/fore");
            if(!Arrays.asList(noNeedLoginPage).contains(s)){
                User user = (User) session.getAttribute("user");
                if(null == user){
                    response.sendRedirect("/fore/Login");
                    return false;
                }
            }
        }
        return true;
    }
}
