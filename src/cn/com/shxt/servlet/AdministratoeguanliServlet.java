package cn.com.shxt.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.com.shxt.model.Serve;
import cn.com.shxt.model.Yuyue;
import cn.com.shxt.model.Hair_teacher;
import cn.com.shxt.model.Activity;
import cn.com.shxt.service.AdministratoeguanliService;
import cn.com.shxt.service.WebService;
import cn.com.shxt.util.Comm;
import cn.com.shxt.util.FileUploadTool;
import cn.com.shxt.util.Page;

public class AdministratoeguanliServlet extends HttpServlet {

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
			
			
			 if("addSp".equals(method)){//添加器械信息
				 FileUploadTool fut = new FileUploadTool(request);
				 fut.upload();
				 Activity s = new Activity();
				s.setId(fut.getParameter("id"));
				s.setJs(fut.getParameter("js"));
				s.setQiwen(fut.getParameter("content"));
				s.setRizhao(fut.getParameter("photo"));
				s.setWeizhi(fut.getParameter("name"));
				s.setDate(fut.getParameter("brand"));
				new AdministratoeguanliService().addSp(s);
				response.sendRedirect("shangpin.do?method=selSp");
				}else if("selSp".equals(method)){//查看器械信息
					selSp(request,response);	
				}else if("showSp".equals(method)){//显示器械信息到修改页面
					String id = request.getParameter("id");
					List<Map<String, String>> list =new AdministratoeguanliService().showSp(id);
					request.setAttribute("list", list);
					request.getRequestDispatcher("/index/admin/shangpin/updateSp.jsp").forward(request, response);
				}else if("updateSp".equals(method)){//修改器械信息
					 FileUploadTool fut = new FileUploadTool(request);
					 fut.upload();
					 Activity s = new Activity();
					s.setId(fut.getParameter("id"));
					s.setJs(fut.getParameter("js"));
					s.setQiwen(fut.getParameter("content"));
					s.setRizhao(fut.getParameter("photo"));
					s.setWeizhi(fut.getParameter("name"));
					s.setDate(fut.getParameter("brand"));
					new  AdministratoeguanliService().updateSp(s);
					response.sendRedirect("shangpin.do?method=selSp");
				}else if("deleteSp".equals(method)){//删除器械信息
					String id = request.getParameter("id");
					new AdministratoeguanliService().deleteSp(id);
					response.sendRedirect("shangpin.do?method=selSp");
				}else if("addQc".equals(method)){//添加教练信息
					 FileUploadTool fut = new FileUploadTool(request);
					 fut.upload();
					 Hair_teacher j = new Hair_teacher();
					j.setId(fut.getParameter("id"));
					j.setWeizhi(fut.getParameter("name"));
					j.setChushui(fut.getParameter("age"));
					j.setMianji(fut.getParameter("phone"));
					j.setZuowu(fut.getParameter("address"));
					j.setType(fut.getParameter("worktime"));
					j.setDimao(fut.getParameter("detail"));
					j.setPhoto(fut.getParameter("photo"));
					
					new AdministratoeguanliService().addQc(j);
					response.sendRedirect("shangpin.do?method=selQc");
					}else if("selQc".equals(method)){//查看教练信息
						selQc(request,response);	
					}else if("showQc".equals(method)){//显示教练信息修改页面
						String id = request.getParameter("id");
						List<Map<String, String>> list =new AdministratoeguanliService().showQc(id);
						request.setAttribute("list", list);
						request.getRequestDispatcher("/index/admin/qicai/updateQc.jsp").forward(request, response);
					}else if("updateQc".equals(method)){//修改教练信息
						 FileUploadTool fut = new FileUploadTool(request);
						 fut.upload();
						 Hair_teacher j = new Hair_teacher();
						 j.setId(fut.getParameter("id"));
							j.setWeizhi(fut.getParameter("name"));
							j.setChushui(fut.getParameter("age"));
							j.setMianji(fut.getParameter("phone"));
							j.setZuowu(fut.getParameter("address"));
							j.setType(fut.getParameter("worktime"));
							j.setDimao(fut.getParameter("detail"));
							j.setPhoto(fut.getParameter("photo"));
							
						new AdministratoeguanliService().updateQc(j);
						response.sendRedirect("shangpin.do?method=selQc");
					}else if("deleteQc".equals(method)){//删除教练信息
						String id = request.getParameter("id");
						new AdministratoeguanliService().deleteQc(id);
						response.sendRedirect("shangpin.do?method=selQc");
					
					}else if("addCz".equals(method)){//添加课程信息
						 FileUploadTool fut = new FileUploadTool(request);
						 fut.upload();
						Serve c = new Serve();
						c.setId(fut.getParameter("id"));
						c.setFname(fut.getParameter("fname"));
						c.setYshui(fut.getParameter("photo"));
						c.setBianhao(fut.getParameter("detail"));
						c.setTotal(fut.getParameter("price"));
						new AdministratoeguanliService().addCz(c);
						response.sendRedirect("index/admin/chongzhi/addCz.jsp");
					}else if("selCz".equals(method)){//管理员查看课程信息
							selCz(request,response);
					}else if("showCz".equals(method)){//显示课程信息修改页面
						String id = request.getParameter("id");
						List<Map<String, String>> list =new AdministratoeguanliService().showCz(id);
						request.setAttribute("list", list);
						request.getRequestDispatcher("/index/admin/chongzhi/updateCz.jsp").forward(request, response);
					}else if("updateCz".equals(method)){//修改课程信息
						 FileUploadTool fut = new FileUploadTool(request);
						 fut.upload();
						Serve c = new Serve();
						c.setId(fut.getParameter("id"));
						c.setFname(fut.getParameter("fname"));
						c.setYshui(fut.getParameter("photo"));
						c.setBianhao(fut.getParameter("detail"));
						c.setTotal(fut.getParameter("price"));
						new AdministratoeguanliService().updateCz(c);
						response.sendRedirect("shangpin.do?method=selCz");
					}else if("deleteCz".equals(method)){//删除课程信息
						String id = request.getParameter("id");
						new AdministratoeguanliService().deleteCz(id);
						response.sendRedirect("shangpin.do?method=selCz");
					}else if("selPl".equals(method)){//
						String pageIndex = request.getParameter("pageIndex");//第几页
						
						Page page = new Page();
					
						if(pageIndex == null || "".equals(pageIndex)) {
							page.index = 1;
						}else {
							page.index = Integer.parseInt(pageIndex);
						}
							page.size = 4;
							request.setAttribute("paging",page);
							
							String account = request.getParameter("account");
							String date = request.getParameter("date");
							
							Yuyue p = new Yuyue();
							p.setAccount(account);
							p.setDate(date);
						List<Map<String, String>> list =new AdministratoeguanliService().selPl(p,page);
						request.setAttribute("list", list);
						request.getRequestDispatcher("/index/admin/pinglun/selPl.jsp").forward(request, response);
					}else if("xianshiPl".equals(method)){//
						String id = request.getParameter("id");
						new  AdministratoeguanliService().xianshiPl(id);
						response.sendRedirect("shangpin.do?method=selPl");
					}else if("deletePl".equals(method)){//
						String id = request.getParameter("id");
						new AdministratoeguanliService().deletePl(id);
						response.sendRedirect("shangpin.do?method=selPl");
					}
				}
	
	private void selSp(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

		//************************分页*******************************/
		String pageIndex = request.getParameter("pageIndex");//第几页
	
		Page page = new Page();
	
		if(pageIndex == null || "".equals(pageIndex)) {
			page.index = 1;
		}else {
			page.index = Integer.parseInt(pageIndex);
		}
			page.size = 20;
			request.setAttribute("paging",page);


		//****************************条件查询***********************************
			String weizhi = request.getParameter("weizhi");

			//条件实体类
			Activity s = new Activity();
			s.setWeizhi(weizhi);
			List<Map<String, String>> list = new AdministratoeguanliService().selSp(s,page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/index/admin/shangpin/selSp.jsp").forward(request, response);
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
			page.size = 20;
			request.setAttribute("paging",page);


		//****************************条件查询***********************************
			String weizhi = request.getParameter("weizhi");

			//条件实体类
			Hair_teacher j = new Hair_teacher();
			j.setWeizhi(weizhi);
			List<Map<String, String>> list = new AdministratoeguanliService().selQc(j,page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/index/admin/qicai/selQc.jsp").forward(request, response);
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
			page.size = 20;
			request.setAttribute("paging",page);


		//****************************条件查询***********************************
			String fname = request.getParameter("fname");

			//条件实体类
			Serve c = new Serve();
			c.setFname(fname);
			List<Map<String, String>> list = new AdministratoeguanliService().selCz(c,page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/index/admin/chongzhi/selCz.jsp").forward(request, response);
	}
	
}
