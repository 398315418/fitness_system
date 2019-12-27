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
import cn.com.shxt.model.Yuyue;
import cn.com.shxt.model.Hair_teacher;
import cn.com.shxt.model.Activity;
import cn.com.shxt.model.User;
import cn.com.shxt.service.AdministratorService;
import cn.com.shxt.service.AdministratoeguanliService;
import cn.com.shxt.service.WebService;
import cn.com.shxt.util.Comm;
import cn.com.shxt.util.FileUploadTool;
import cn.com.shxt.util.Page;

public class WebServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8272973503552210639L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			String method = request.getParameter("method");
		
			
			 if("selSp1".equals(method)){//用户查看教练信息
					selSp1(request,response);	
				}else if("showSp".equals(method)){//
					String id = request.getParameter("id");
					List<Map<String, String>> list =new AdministratoeguanliService().showSp(id);
					request.setAttribute("list", list);
					request.getRequestDispatcher("/index/admin/shangpin/updateSp.jsp").forward(request, response);
				}else if("selQc".equals(method)){//用户查看课程信息
						selQc(request,response);		
				}else if("addXx".equals(method)){//用户完善个人信息
						User u = new User();
						u.setNicheng(request.getParameter("nicheng"));
						u.setSex(request.getParameter("sex"));
						u.setEmail(request.getParameter("email"));
						u.setTel(request.getParameter("tel"));
						u.setBianhao(Comm.getUserInfoId(request));
						u.setAddress(request.getParameter("address"));
						new WebService().addXx(u);
						response.sendRedirect("gerenxinxi.jsp");
				}else if("selGr".equals(method)){//显示个人信息
					String id = request.getParameter("id");
					List<Map<String, String>> list =new WebService().selGr(id);
					request.setAttribute("list", list);
					request.getRequestDispatcher("/qiantai/ziliao.jsp").forward(request, response);
				}else if("updatePassword".equals(method)){//用户修改个人密码
						String password = request.getParameter("password");
						String id = request.getParameter("id");
						
						Administrator a = new Administrator();
						a.setPassword(password);
						a.setId(id);
						new WebService().updatepassword(a);
						response.sendRedirect("gerenxinxi.jsp");
				}else if("showQc".equals(method)){//用户查看教练详细信息
					String id = request.getParameter("id");
					List<Map<String, String>> list =new WebService().showQc(id);
					request.setAttribute("list", list);
					request.getRequestDispatcher("/qiantai/xinxi.jsp").forward(request, response);
				}else if("chuzuQc".equals(method)){//显示信息到添加预约单信息页面
					String id = request.getParameter("id");
					List<Map<String, String>> list =new AdministratoeguanliService().showCz(id);
					request.setAttribute("list", list);
					
					List<Map<String, String>> list1 =new AdministratoeguanliService().selQc1();
					request.setAttribute("list1", list1);
					
					request.getRequestDispatcher("/qiantai/yuyue.jsp").forward(request, response);
				}else if("addPl".equals(method)){//添加预约单信息
					Yuyue p = new Yuyue();
					p.setAccount(Comm.getAccountUserInfoId(request));
					p.setBianhao(request.getParameter("id"));
					p.setDate(request.getParameter("date"));
					p.setFname(request.getParameter("fname"));
					p.setYuyue(request.getParameter("yuyue"));
					new WebService().addPl(p);
					response.sendRedirect("success.jsp");
				}else if("selYy".equals(method)){//用户查看个人预约信息
					selYy(request,response);
				}else if("deleteYy".equals(method)){//用户取消预约信息
					String id = request.getParameter("id");
					new WebService().deleteYy(id);
					response.sendRedirect("web.do?method=selYy&id="+Comm.getUserInfoId(request));
		}
	}
	private void selSp1(HttpServletRequest request, HttpServletResponse response)
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
			request.getRequestDispatcher("/qiantai/shangpin.jsp").forward(request, response);
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
			page.size = 4;
			request.setAttribute("paging",page);


		//****************************条件查询***********************************
			String weizhi = request.getParameter("weizhi");

			//条件实体类
			Hair_teacher j = new Hair_teacher();
			j.setWeizhi(weizhi);
			List<Map<String, String>> list = new WebService().selQc(j,page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/qiantai/qicai.jsp").forward(request, response);
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
			String id = Comm.getUserInfoId(request);
			//条件实体类
			Yuyue  p = new Yuyue();
			p.setDate(date);
			p.setId(id);
			List<Map<String, String>> list = new WebService().selYy(p,page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/qiantai/selYy.jsp").forward(request, response);
	}
	
}
