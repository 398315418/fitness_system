package cn.com.shxt.service;

import java.util.List;
import java.util.Map;

import cn.com.shxt.model.Administrator;

import cn.com.shxt.util.DB;
import cn.com.shxt.util.Page;

public class AdministratorService {
	/**
	 * 
	 * @描述:添加用户账号
	 * @作者:
	 * @时间:2015-9-24 下午09:02:30
	 * @参数:@param as 
	 * @返回值：void
	 */
	public void addUser(Administrator as){
		String sql = "INSERT INTO administrator (loginName,adminId,password) VALUES (?,?,?)";
		new DB().update(sql,new String[]{as.getAccount(),as.getBianhao(),as.getPassword()});
	}
	/**
	 * 
	 * @描述:查看用户账号
	 * @作者:、
	 * @时间:2015-9-24 下午09:02:52
	 * @参数:@param page
	 * @参数:@param as
	 * @参数:@return 
	 * @返回值：List<Map<String,String>>
	 */
	public List<Map<String,String>> selUser(Administrator as){
		String sql = "SELECT id,loginName,adminId,password FROM administrator where a_role= 2 ";
	
		
		if(as.getAccount() != null && !"".equals(as.getAccount())) {
			sql += " AND loginName LIKE '%" + as.getAccount() + "%'";
		}
		List<Map<String, String>> list = new DB().queryMap(sql);
		return list;
	}
	
	/**
	 * 
	 * @描述:删除
	 * @时间:2015-9-24 下午09:03:55
	 * @参数:@param as 
	 * @返回值：void
	 */
	public void deleteUser(String id){
		String sql = "DELETE FROM administrator WHERE id = ?";
		new DB().update(sql,new String[]{id});
	}
	/**
	 * 
	 * @描述:修改密码信息
	 * @作者:\
	 * @时间:2016-4-2 下午12:40:38
	 * @参数:@param c 
	 * @返回值：void
	 */
	public void password(Administrator as){
		String sql = "update administrator  SET loginName= ?,password = ? where id=?";
		new DB().update(sql,new String []{as.getAccount(),as.getPassword(),as.getId()});
	}
}
