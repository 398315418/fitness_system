package cn.com.shxt.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import cn.com.shxt.model.Serve;
import cn.com.shxt.model.Yuyue;
import cn.com.shxt.model.Hair_teacher;
import cn.com.shxt.model.Activity;
import cn.com.shxt.util.DB;
import cn.com.shxt.util.Page;
public class AdministratoeguanliService {
	String price;
	String money;
	String number;
	String number1;
	String number2;
	String total;
	String hcontent;
	String cmoney;
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd  ");
	String tdate = sdf.format(date);
	
	/**
	 * 
	 * @描述:添加器械信息
	 * @作者:
	 * @时间:2015-9-24 下午08:59:58
	 * @参数:@param c 
	 * @返回值：void
	 */
	public void addSp(Activity s){
		String sql = "INSERT INTO activity (activityInfo,time,photo,title)VALUES (?,?,?,?)";
		new DB().update(sql,new String[]{s.getQiwen(),s.getDate(),s.getRizhao(),s.getWeizhi()});
	}
	/**
	 * 
	 * @描述:查看器械信息
	 * @作者:
	 * @时间:2015-9-24 下午09:00:16
	 * @参数:@param page
	 * @参数:@param c
	 * @参数:@return 
	 * @返回值：List<Map<String,String>>
	 * 
	 */
	public List<Map<String,String>> selSp(Activity s,Page page){
		String sql = "select id,activityInfo,time,photo,title from activity WHERE 1=1";
		if(s.getWeizhi() != null && !"".equals(s.getWeizhi())) {
			sql += " AND title LIKE '%" +s.getWeizhi() + "%'";
		}
		
		List<Map<String, String>> list = new DB().queryMap(sql);
		return list;
		
	}
	
	/**
	 * 
	 * @描述:根据主键id查询器械信息
	 * @作者:
	 * @时间:2015-9-24 下午09:00:16
	 * @参数:@param page
	 * @参数:@param c
	 * @参数:@return 
	 * @返回值：List<Map<String,String>>
	 */
	public List<Map<String,String>> showSp(String id){
		String sql = "SELECT id,activityInfo,time,photo,title from activity WHERE id= "+id;
		
		List<Map<String, String>> list = new DB().queryMap(sql);
		return list;
	}
	/**
	 * 
	 * @描述:修改器械信息
	 * @作者:\
	 * @时间:2016-4-2 下午12:40:38
	 * @参数:@param c 
	 * @返回值：void
	 */
	public void updateSp(Activity s){
		String sql = "update activity set activityInfo=?,time=?,photo=?,title=? where id=?";
		new DB().update(sql,new String []{s.getQiwen(),s.getDate(),s.getRizhao(),s.getWeizhi(),s.getId()});
	}
	/**
	 * 
	 * @描述:删除器械信息
	 * @作者:
	 * @时间:2015-9-24 下午09:01:19
	 * @参数:@param c 
	 * @返回值：void
	 */
	public void deleteSp(String id){
		String sql1 = "DELETE FROM activity WHERE id = ?";
		new DB().update(sql1,new String[]{id});
	}
	
	/**
	 * 
	 * @描述:添加教练信息
	 * @作者:
	 * @时间:2015-9-24 下午08:59:58
	 * @参数:@param c 
	 * @返回值：void
	 */
	public void addQc(Hair_teacher j){
		String sql = "INSERT INTO hair_teacher (age,hairTeacherInfo,phone,photo,level,hairTeacherName,address)VALUES (?,?,?,?,?,?,?)";
		new DB().update(sql,new String[]{j.getChushui(),j.getDimao(),j.getMianji(),j.getPhoto(),j.getType(),j.getWeizhi(),j.getZuowu()});
	}
	/**
	 * 
	 * @描述:查看教练信息
	 * @作者:
	 * @时间:2015-9-24 下午09:00:16
	 * @参数:@param page
	 * @参数:@param c
	 * @参数:@return 
	 * @返回值：List<Map<String,String>>
	 * 
	 */
	public List<Map<String,String>> selQc(Hair_teacher j,Page page){
		String sql = "select id,age,hairTeacherInfo,phone,photo,level,hairTeacherName,address from hair_teacher WHERE 1 = 1";
		if(j.getWeizhi() != null && !"".equals(j.getWeizhi())) {
			sql += " AND hairTeacherName LIKE '%" +j.getWeizhi() + "%'";
		}
		
		List<Map<String, String>> list = new DB().queryMap(sql);
		return list;
	}
	public List<Map<String,String>> selQc1(){
		String sql = "select id,age,hairTeacherInfo,phone,photo,level,hairTeacherName,address from hair_teacher ";
		List<Map<String, String>> list = new DB().queryMap(sql);
		return list;
	}
	/**
	 * 
	 * @描述:根据主键id查询教练信息
	 * @作者:
	 * @时间:2015-9-24 下午09:00:16
	 * @参数:@param page
	 * @参数:@param c
	 * @参数:@return 
	 * @返回值：List<Map<String,String>>
	 */
	public List<Map<String,String>> showQc(String id){
		String sql = "SELECT id,age,hairTeacherInfo,phone,photo,level,hairTeacherName,address from hair_teacher WHERE  id = "+id ;
		
		List<Map<String, String>> list = new DB().queryMap(sql);
		return list;
	}
	/**
	 * 
	 * @描述:修改教练信息
	 * @作者:
	 * @时间:2015-9-24 下午08:59:58
	 * @参数:@param c 
	 * @返回值：void
	 */
	public void updateQc(Hair_teacher j){
		String sql1 = "UPDATE hair_teacher SET age =?,hairTeacherInfo =?,phone =?,photo =?,level =?,hairTeacherName =?,address =? WHERE id = '" + j.getId() + "'";
		new DB().update(sql1,new String []{j.getChushui(),j.getDimao(),j.getMianji(),j.getPhoto(),j.getType(),j.getWeizhi(),j.getZuowu()});
		
	}
	/**
	 * 
	 * @描述:删除教练信息
	 * @作者:
	 * @时间:2015-9-24 下午09:01:19
	 * @参数:@param c 
	 * @返回值：void
	 */
	public void deleteQc(String id){
		String sql1 = "DELETE FROM hair_teacher WHERE id = ?";
		new DB().update(sql1,new String[]{id});
	}
	/**
	 * 
	 * @描述:添加课程信息
	 * @作者:
	 * @时间:2015-9-24 下午08:59:58
	 * @参数:@param c 
	 * @返回值：void
	 */
	public void addCz(Serve c){
		String sql = "INSERT INTO serve(fname,photo,orderTime,serveInfo,price)VALUES (?,?,?,?,?)";
		new DB().update(sql,new String[]{c.getFname(),c.getYshui(),tdate,c.getBianhao(),c.getTotal()});
	}
	
	/**
	 * 
	 * @描述:查看课程信息
	 * @作者:
	 * @时间:2015-9-24 下午09:00:16
	 * @参数:@param page
	 * @参数:@param c
	 * @参数:@return 
	 * @返回值：List<Map<String,String>>
	 * 
	 */
	public List<Map<String,String>> selCz(Serve c,Page page){
		String sql = "SELECT id,fname,photo,orderTime,serveInfo,price from serve WHERE 1=1";
		if(c.getFname() != null && !"".equals(c.getFname())) {
			sql += " AND fname LIKE '%" +c.getFname() + "%'";
		}
		
		List<Map<String, String>> list = new DB().queryMap(sql);
		return list;
		
	}
	/**
	 * 
	 * @描述:根据主键id查询课程信息
	 * @作者:
	 * @时间:2015-9-24 下午09:00:16
	 * @参数:@param page
	 * @参数:@param c
	 * @参数:@return 
	 * @返回值：List<Map<String,String>>
	 */
	public List<Map<String,String>> showCz(String id){
		String sql = "SELECT id,fname,photo,orderTime,serveInfo,price from serve WHERE  id = "+id ;
		
		List<Map<String, String>> list = new DB().queryMap(sql);
		return list;
	}
	/**
	 * 
	 * @描述:修改课程信息
	 * @作者:
	 * @时间:2015-9-24 下午08:59:58
	 * @参数:@param c 
	 * @返回值：void
	 */
	public void updateCz(Serve c){
		String sql1 = "UPDATE serve SET fname =?,photo =?,price =?,serveInfo=? WHERE id = '" + c.getId() + "'";
		new DB().update(sql1,new String []{c.getFname(),c.getYshui(),c.getTotal(),c.getBianhao()});
		
	}
	/**
	 * 
	 * @描述:删除课程信息
	 * @作者:
	 * @时间:2015-9-24 下午09:01:19
	 * @参数:@param c 
	 * @返回值：void
	 */
	public void deleteCz(String id){
		String sql1 = "DELETE FROM serve WHERE id = ?";
		new DB().update(sql1,new String[]{id});
	}
	/**
	 * 
	 * @描述:查看课程信息
	 * @作者:
	 * @时间:2015-9-24 下午09:00:16
	 * @参数:@param page
	 * @参数:@param c
	 * @参数:@return 
	 * @返回值：List<Map<String,String>>
	 */
	public List<Map<String,String>> selPl(Yuyue p,Page page){
		String sql = "select id,account,bianhao,cg,jishu,date,cailiao,fangfa,state from pinglun WHERE 1=1";
		if(p.getAccount() != null && !"".equals(p.getAccount())) {
			sql += " AND account LIKE '%" +p.getAccount() + "%'";
		}
		if(p.getDate() != null && !"".equals(p.getDate())) {
			sql += " AND date LIKE '%" +p.getDate() + "%'";
		}
		List<Map<String, String>> list = new DB().queryMap(sql);
		return list;
		
	}
	/**
	 * 
	 * @描述
	 * @作者:
	 * @时间:2015-9-24 下午09:00:16
	 * @参数:@param page
	 * @参数:@param c
	 * @参数:@return 
	 * @返回值：List<Map<String,String>>
	 */
	public List<Map<String,String>> selPl1(Yuyue p,Page page){
		String sql = "select id,account,bianhao,cg,jishu,date,cailiao,fangfa,state from yuyue WHERE state=1";
		if(p.getAccount() != null && !"".equals(p.getAccount())) {
			sql += " AND account LIKE '%" +p.getAccount() + "%'";
		}
		if(p.getDate() != null && !"".equals(p.getDate())) {
			sql += " AND date LIKE '%" +p.getDate() + "%'";
		}
		List<Map<String, String>> list = new DB().queryMap(sql);
		return list;
		
	}
	/**
	 * 
	 * @描述:通过审核
	 * @作者:
	 * @时间:2015-9-24 下午08:59:58
	 * @参数:@param c 
	 * @返回值：void
	 */
	public void xianshiPl(String id ){
		String sql1 = "UPDATE pinglun SET state =1 WHERE id = '" + id + "'";
		new DB().update(sql1);
		
	}
	/**
	 * 
	 * @描述:
	 * @作者:
	 * @时间:2015-9-24 下午09:01:19
	 * @参数:@param c 
	 * @返回值：void
	 */
	public void deletePl(String id){
		String sql1 = "DELETE FROM yuyue WHERE id = ?";
		new DB().update(sql1,new String[]{id});
	}
}
