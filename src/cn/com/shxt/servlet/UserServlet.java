package cn.com.shxt.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.com.shxt.model.Administrator;
import cn.com.shxt.model.Serve;
import cn.com.shxt.model.Hair_teacher;
import cn.com.shxt.model.Yuyue;
import cn.com.shxt.model.Activity;
import cn.com.shxt.model.User;
import cn.com.shxt.service.AdministratorService;
import cn.com.shxt.service.AdministratoeguanliService;
import cn.com.shxt.service.UserService;
import cn.com.shxt.service.WebService;
import cn.com.shxt.util.Comm;
import cn.com.shxt.util.FileUploadTool;
import cn.com.shxt.util.Page;

public class UserServlet extends HttpServlet {

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
		if("add".equals(method)){
			String account = request.getParameter("account");
			String password = request.getParameter("password");
			String state = request.getParameter("state");
			
			Administrator a = new Administrator();
			a.setAccount(account);
			a.setPassword(password);
			a.setState(state);
			new AdministratorService().addUser(a);
			response.sendRedirect("index.jsp");
		}else if("delete".equals(method)){//删除用户信息
			String id = request.getParameter("id");
			User u = new User();
			u.setId(id);
			new AdministratorService().deleteUser(id);
			response.sendRedirect("user.do?method=sel");
		  }else if("showPass".equals(method)){    //显示管理员信息
		    	String id = request.getParameter("id");
		    	request.getRequestDispatcher("/administrator/password.jsp").forward(request, response);	
		 }else if("password".equals(method)){//修改密码
			String id = request.getParameter("id");
			String account = request.getParameter("account");
			String password =request.getParameter("password");
			Administrator as = new Administrator();
			as.setId(id);
			as.setAccount(account);
			as.setPassword(password);
			new AdministratorService().password(as);
			response.sendRedirect("administrator.do?method=sel&id="+Comm.getUserInfoId(request));

		}else if("showSp".equals(method)){//用户查看器械信息
			String id = request.getParameter("id");
			List<Map<String, String>> list =new AdministratoeguanliService().showSp(id);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/qiantai/huodong.jsp").forward(request, response);
		}else if("selQc".equals(method)){//用户查看教练信息
				selQc(request,response);
		}else if("showQc".equals(method)){//用户查看教练详细信息
			String id = request.getParameter("id");
			List<Map<String, String>> list =new WebService().showQc(id);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/qiantai/xinxi.jsp").forward(request, response);
		}else if("showFw".equals(method)){//用户查看课程详细信息
			String id = request.getParameter("id");
			List<Map<String, String>> list =new WebService().showFw(id);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/qiantai/Fxinxi.jsp").forward(request, response);
		}else if("selCz".equals(method)){//用户查看课程信息
			selCz(request,response);
		}else if("selYy".equals(method)){//管理员查看用户预约信息
			selYy(request,response);
		}else if("deleteYy".equals(method)){//管理员删除预约信息
			String id = request.getParameter("id");
			new UserService().deleteYy(id);
			response.sendRedirect("user.do?method=selYy");
		}else if("selSp".equals(method)){//查看器械信息
			String pageIndex = request.getParameter("pageIndex");//第几页
			
			Page page = new Page();
		
			if(pageIndex == null || "".equals(pageIndex)) {
				page.index = 1;
			}else {
				page.index = Integer.parseInt(pageIndex);
			}
				page.size = 100;
				request.setAttribute("paging",page);
				
				String weizhi = request.getParameter("weizhi");

				//条件实体类
				Activity s = new Activity();
				s.setWeizhi(weizhi);
				List<Map<String, String>> list = new AdministratoeguanliService().selSp(s,page);
				request.setAttribute("list", list);
			request.getRequestDispatcher("/qiantai/shangpin.jsp").forward(request, response);
	}
}
		private void selQc(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {

			//************************分页*******************************/
			String pageIndex = request.getParameter("pageIndex");//第几页
		
			Page page = new Page();
		
			if(pageIndex == null || "".equals(pageIndex)) {
				page.index = 1;
			}else {
				page.index = Integer.parseInt(pageIndex);
			}
				page.size = 100;
				request.setAttribute("paging",page);


			//****************************条件查询***********************************
				String weizhi = request.getParameter("weizhi");

				//条件实体类
				Hair_teacher j = new Hair_teacher();
				j.setWeizhi(weizhi);
				List<Map<String, String>> list = new AdministratoeguanliService().selQc(j,page);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/qiantai/hair_teacher.jsp").forward(request, response);
		}
		private void selCz(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {

			//************************分页*******************************/
			String pageIndex = request.getParameter("pageIndex");//第几页
		
			Page page = new Page();
		
			if(pageIndex == null || "".equals(pageIndex)) {
				page.index = 1;
			}else {
				page.index = Integer.parseInt(pageIndex);
			}
				page.size = 100;
				request.setAttribute("paging",page);


			//****************************条件查询***********************************
				String fname = request.getParameter("fname");

				//条件实体类
				Serve c = new Serve();
				c.setFname(fname);
				List<Map<String, String>> list = new AdministratoeguanliService().selCz(c,page);
				request.setAttribute("list", list);
				request.getRequestDispatcher("//qiantai/fuwu.jsp").forward(request, response);
		}
		private void selYy(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {

			//************************分页*******************************/
			String pageIndex = request.getParameter("pageIndex");//第几页
		
			Page page = new Page();
		
			if(pageIndex == null || "".equals(pageIndex)) {
				page.index = 1;
			}else {
				page.index = Integer.parseInt(pageIndex);
			}
				page.size = 100;
				request.setAttribute("paging",page);


			//****************************条件查询***********************************
				String date = request.getParameter("date");

				//条件实体类
				Yuyue  p = new Yuyue();
				p.setDate(date);
				List<Map<String, String>> list = new UserService().selYy(p,page);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/index/admin/yuyue/selYy.jsp").forward(request, response);
		}
}


