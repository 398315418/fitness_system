package cn.com.shxt.service;

import java.util.List;
import java.util.Map;

import cn.com.shxt.model.Administrator;
import cn.com.shxt.util.DB;
	/**
	 * 
	 * @描述:登陆
	 * @作者:
	 * @版本:1.0
	 * @版权所有:
	 * @时间 2015-9-24 下午09:01:56
	 */
public class LoginService {
	public Administrator login(String account,String password){
		String sql = "SELECT password,id,loginName,a_role,adminId FROM administrator WHERE  loginName = ?";
		List<Map<String,String>> list = new DB().queryMap(sql,new String []{account});
		if(list.isEmpty()||!list.get(0).get("password").equals(password)){
			return null;
		}else{
			Administrator ad = new Administrator();
			ad.setAccount(list.get(0).get("loginName"));
			ad.setId(list.get(0).get("id"));
			ad.setRole(list.get(0).get("a_role"));
			ad.setBianhao(list.get(0).get("adminId"));
			return ad;	
		}
	}
}
