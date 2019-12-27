package cn.com.shxt.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import cn.com.shxt.model.Administrator;
import cn.com.shxt.service.LoginService;

public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5184594285402428126L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//管理员登陆
		request.setCharacterEncoding("UTF-8");
		String method = request.getParameter("method");
		if("login".equals(method)){
			String account = request.getParameter("account");
			String password = request.getParameter("password");
			String role = request.getParameter("role");
			Administrator ad = new LoginService().login(account, password);
			if(ad == null){//登陆失败
				 request.setAttribute("message","用户名或密码错误");
				 request.getRequestDispatcher("/login.jsp").forward(request, response);
			}else if("1".equals(ad.getRole())){//系统管理员
				request.getSession().setAttribute("id",ad.getId());
				request.getSession().setAttribute("account", ad.getAccount());
				response.sendRedirect("index/admin/index.html");
			}else if("2".equals(ad.getRole())/*&&"2".equals(role)*/){//
				request.getSession().setAttribute("id",ad.getId());
				request.getSession().setAttribute("account", ad.getAccount());
				response.sendRedirect("index.jsp");	
			}
		}
	}
}
