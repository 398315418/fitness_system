package cn.com.shxt.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class LoginFilter implements Filter {

	public void destroy() {
		System.out.println("过滤器，摧毁了");
	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException {
		//获取servlet中的request和response
		HttpServletRequest request = (HttpServletRequest)arg0;
		HttpServletResponse response = (HttpServletResponse)arg1;
		//获取本次请求的地址
		String url = request.getServletPath();
		//不需要过滤的请求
		if("/qiantai/user.do".equals(url) ||"/login.do".equals(url) || ("/qiantai/Userlogin.do".equals(url) && "Userlogin".equals(request.getParameter("method"))
		) ){
			chain.doFilter( arg0, arg1);
			return;
		}
		//需要过滤的请求

		String loginId = (String) request.getSession().getAttribute("id");//获取登录用户的id
		if(loginId == null) {//用户没有登录
			//response.sendRedirect("login1.jsp");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			StringBuilder sb = new StringBuilder();
			sb.append(" <script type='text/javascript'> ");
			sb.append(" alert('请先登录。。。。。。');");
			sb.append(" window.top.location.href='");
			sb.append(request.getContextPath()+"/qiantai/login.jsp");
			sb.append("';");
			sb.append(" </script> ");
			
			out.write(sb.toString());
			
			out.flush();
			out.close();
			return;
			//request.getRequestDispatcher("/login.jsp").forward(request, response);//没登录，重定向到登录页面
		}
		chain.doFilter( arg0, arg1);//让请求，继续访问
	}

	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("过滤器，创建了");
	}

}
