package cn.com.shxt.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.com.shxt.model.Administrator;
import cn.com.shxt.model.User;
import cn.com.shxt.service.AdministratorService;
import cn.com.shxt.service.AdministratoeguanliService;
import cn.com.shxt.service.UserService;
import cn.com.shxt.util.Comm;
import cn.com.shxt.util.FileUploadTool;
import cn.com.shxt.util.Page;

public class AdministratorServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6135720467057497215L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//添加用户
		request.setCharacterEncoding("UTF-8");
		String method = request.getParameter("method");
		if("addUser".equals(method)){
			String account = request.getParameter("account");
			String password = request.getParameter("password");
			String state = request.getParameter("state");
			String ymoney = request.getParameter("ymoney");
			String bianhao = request.getParameter("bianhao");
			
			Administrator a = new Administrator();
			a.setAccount(account);
			a.setPassword(password);
			a.setState(state);
			a.setYmoney(ymoney);
			a.setBianhao(bianhao);
			new AdministratorService().addUser(a);
			response.sendRedirect("administrator.do?method=selUser");
		}else if("selUser".equals(method)){//查看
			selUser(request,response);
		}else if("deleteUser".equals(method)){//删除用户信息
			String id = request.getParameter("id");
			User u = new User();
			u.setId(id);
			new AdministratorService().deleteUser(id);
			response.sendRedirect("administrator.do?method=selUser");
			}		
		}
	private void selUser(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

		//************************分页*******************************/
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
			String account = request.getParameter("account");

			//条件实体类
			Administrator a = new Administrator();
			a.setAccount(account);


			List<Map<String, String>> list = new AdministratorService().selUser(a);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/index/admin/user/selUser.jsp").forward(request, response);
	}
}


