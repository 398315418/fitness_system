package cn.com.shxt.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.com.shxt.model.Administrator;
import cn.com.shxt.model.Hair_teacher;
import cn.com.shxt.model.Activity;
import cn.com.shxt.model.User;
import cn.com.shxt.service.LoginService;
import cn.com.shxt.service.AdministratoeguanliService;
import cn.com.shxt.service.UserLoginService;
import cn.com.shxt.service.WebService;
import cn.com.shxt.util.Page;

public class UserLoginServlet extends HttpServlet {

	private static final long serialVersionUID = 6176295069369646641L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request,response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			String method = request.getParameter("method");
			
			if("Userlogin".equals(method)){
				String account = request.getParameter("account");
				String password = request.getParameter("password");
				Administrator ad = new LoginService().login(account, password);
				if(ad == null){//登陆失败
					 request.setAttribute("message","用户名或密码错误");
					 request.getRequestDispatcher("/qiantai/login.jsp").forward(request, response);
				}else {//首页
					request.getSession().setAttribute("id",ad.getId());
					request.getSession().setAttribute("account", ad.getAccount());
					request.getSession().setAttribute("bianhao", ad.getBianhao());
					String pageIndex = request.getParameter("pageIndex");//第几页
					
					Page page = new Page();
				
					if(pageIndex == null || "".equals(pageIndex)) {
						page.index = 1;
					}else {
						page.index = Integer.parseInt(pageIndex);
					}
						page.size = 4;
						request.setAttribute("paging",page);


					//****************************条件查询***********************************
						request.getRequestDispatcher("/qiantai/index.jsp").forward(request, response);
				}
			}
				else if("UserZx".equals(method)){
					request.getSession().setAttribute("id", null);
					request.getSession().setAttribute("account", null);
					response.sendRedirect("index.jsp");
					
		}
	}
}
