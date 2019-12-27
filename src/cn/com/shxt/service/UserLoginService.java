package cn.com.shxt.service;

import java.util.List;
import java.util.Map;

import cn.com.shxt.model.User;
import cn.com.shxt.util.DB;
	/**
	 * 
	 * @描述:用户登陆
	 * @作者:
	 * @版本:1.0
	 * @版权所有:
	 * @时间 2016-2-4 下午12:19:32
	 */
public class UserLoginService {
	public User login(String account,String password){
		String sql = "SELECT password,id,name,account FROM user WHERE account=?";
		List<Map<String,String>> list = new DB().queryMap(sql,new String[]{account});
		if(list.isEmpty()||!list.get(0).get("password").equals(password)){
			return null;
		}else {
			//保存用户信息
			User u = new User();
			u.setId(list.get(0).get("id"));
			return u;
		}
	}
}
