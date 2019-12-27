package cn.com.shxt.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import cn.com.shxt.model.Administrator;
import cn.com.shxt.model.Serve;
import cn.com.shxt.model.Yuyue;
import cn.com.shxt.model.Hair_teacher;
import cn.com.shxt.model.Activity;
import cn.com.shxt.model.User;
import cn.com.shxt.util.DB;
import cn.com.shxt.util.Page;
public class WebService {
	String price;
	String number2;
	String total;
	String cmoney;
	String pxiaofei;
	String hxiaofei;
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd  ");
	String tdate = sdf.format(date);
	
	/**
	 * 
	 * @描述:根据主键id查询活动信息
	 * @作者:
	 * @时间:2015-9-24 下午09:00:16
	 * @参数:@param page
	 * @参数:@param c
	 * @参数:@return 
	 * @返回值：List<Map<String,String>>
	 */
	public List<Map<String,String>> showSp(String id){
		String sql = "SELECT id,account,sname,pinpai,price,zhidi,tnumber,photo from activity WHERE id= "+id;
		
		List<Map<String, String>> list = new DB().queryMap(sql);
		return list;
	}
	
	
	/**
	 * 
	 * @描述:用户完善个人信息
	 * @作者:
	 * @时间:2015-9-24 下午08:59:58
	 * @参数:@param c 
	 * @返回值：void
	 */
	public void addXx(User u){
		String sql = "INSERT INTO user1(userName,sex,email,phone,address,bianhao)VALUES (?,?,?,?,?,?)";
		new DB().update(sql,new String[]{u.getNicheng(),u.getSex(),u.getEmail(),u.getTel(),u.getAddress(),u.getBianhao()});
	}
	/**
	 * 
	 * @描述:用户查看个人信息
	 * @作者:
	 * @时间:2015-9-24 下午09:00:16
	 * @参数:@param page
	 * @参数:@param c
	 * @参数:@return 
	 * @返回值：List<Map<String,String>>
	 * 
	 */
	public List<Map<String,String>> selGr(String id){
		String sql = "SELECT u.id,u.userName,u.sex,u.email,u.phone,u.address,u.bianhao,a.loginName from user1 u join administrator a on u.bianhao=a.id WHERE a.id="+id;
		List<Map<String, String>> list = new DB().queryMap(sql);
		return list;
	}
	/**
	 * 
	 * @描述:用户修改密码信息
	 * @作者:\
	 * @时间:2016-4-2 下午12:40:38
	 * @参数:@param c 
	 * @返回值：void
	 */
	public void updatepassword(Administrator a){
		String sql = "update administrator SET password= ? where id=?";
		new DB().update(sql,new String []{a.getPassword(),a.getId()});
	}
	
	/**
	 * 
	 * @描述:
	 * @作者:
	 * @时间:2015-9-24 下午09:00:16
	 * @参数:@param page
	 * @参数:@param c
	 * @参数:@return 
	 * @返回值：List<Map<String,String>>
	 * 
	 */
	public List<Map<String,String>> selXsp(String id){
		String sql = "SELECT id,account,sname,pinpai,price,zhidi,tnumber,photo from activity WHERE state = 1 and id ="+id;
		List<Map<String, String>> list = new DB().queryMap(sql);
		return list;
	}
	
	
	
	
	/**
	 * 
	 * @描述:查看教练 信息
	 * @作者:
	 * @时间:2015-9-24 下午09:00:16
	 * @参数:@param page
	 * @参数:@param c
	 * @参数:@return 
	 * @返回值：List<Map<String,String>>
	 * 
	 */
	public List<Map<String,String>> selQc(Hair_teacher j,Page page){
		String sql = "select id,account,qname,tnumber,pinpai,cprice,suit,photo from hair_teacher WHERE 1 = 1";
		if(j.getWeizhi() != null && !"".equals(j.getWeizhi())) {
			sql += " AND weizhi LIKE '%" +j.getWeizhi() + "%'";
		}
		
		List<Map<String, String>> list = new DB().queryMap(sql);
		return list;
		
	}
	/**
	 * 
	 * @描述:根据主键id查询
	 * @作者:
	 * @时间:2015-9-24 下午09:00:16
	 * @参数:@param page
	 * @参数:@param c
	 * @参数:@return 
	 * @返回值：List<Map<String,String>>
	 */
	public List<Map<String,String>> showQc(String id){
		String sql = "SELECT id,age,hairTeacherInfo,phone,photo,level,hairTeacherName,address from hair_teacher WHERE id= "+id;
		
		List<Map<String, String>> list = new DB().queryMap(sql);
		return list;
	}
	/**
	 * 
	 * @描述:根据主键id查询服务信息
	 * @作者:
	 * @时间:2015-9-24 下午09:00:16
	 * @参数:@param page
	 * @参数:@param c
	 * @参数:@return 
	 * @返回值：List<Map<String,String>>
	 */
	public List<Map<String,String>> showFw(String id){
		String sql = "SELECT fname,photo,orderTime,serveInfo,price from serve WHERE id= "+id;
		
		List<Map<String, String>> list = new DB().queryMap(sql);
		return list;
	}
	/**
	 * 
	 * @描述:添加预约单信息
	 * @作者:
	 * @时间:2015-9-24 下午08:59:58
	 * @参数:@param c 
	 * @返回值：void
	 */
	public void addPl(Yuyue p){
		String sql = "INSERT INTO yuyue(account,bianhao,fname,date,yuyue)VALUES (?,?,?,?,?)";
		new DB().update(sql,new String[]{p.getAccount(),p.getBianhao(),p.getFname(),p.getDate(),p.getYuyue()});
	}
	/**
	 * 
	 * @描述:用户查看个人预约信息
	 * @作者:
	 * @时间:2015-9-24 下午09:00:16
	 * @参数:@param page
	 * @参数:@param c
	 * @参数:@return 
	 * @返回值：List<Map<String,String>>
	 * 
	 */
	public List<Map<String,String>> selYy(Yuyue p,Page page){
		String sql = "select id,account,bianhao,fname,date,yuyue from yuyue WHERE  bianhao= "+p.getId();
		
		if(p.getDate() != null && !"".equals(p.getDate())) {
			sql += " AND date LIKE '%" +p.getDate() + "%'";
		}
		
		List<Map<String, String>> list = new DB().queryMap(sql);
		return list;
		
	}
	/**
	 * 
	 * @描述:用户取消预约信息
	 * @作者:
	 * @时间:2015-9-24 下午09:01:19
	 * @参数:@param c 
	 * @返回值：void
	 */
	public void deleteYy(String id){
		String sql1 = "DELETE FROM yuyue WHERE id = ?";
		new DB().update(sql1,new String[]{id});
	}
	
}
