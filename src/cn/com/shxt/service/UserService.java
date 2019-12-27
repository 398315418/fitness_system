package cn.com.shxt.service;

import java.util.List;
import java.util.Map;


import cn.com.shxt.model.Yuyue;
import cn.com.shxt.model.User;
import cn.com.shxt.util.DB;
import cn.com.shxt.util.Page;

public class UserService {
	/**
	 * 
	 * @描述:删除用户
	 * @作者:
	 * @时间:2015-9-24 下午09:05:38
	 * @参数:@param u 
	 * @返回值：void
	 */
	public void deleteUser(User u){
		String sql = "DELETE FROM user1 WHERE id = ?";
		new DB().update(sql,new String[]{u.getId()});
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
		String sql = "select id,account,bianhao,fname,date,yuyue from yuyue WHERE 1 = 1";
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