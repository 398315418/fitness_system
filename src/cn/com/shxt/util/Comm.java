package cn.com.shxt.util;

import javax.servlet.http.HttpServletRequest;

/**
 * 一些常用的公共方法
 * @author 
 * @ClassName: Comm
 * @Version 1.0
 * @ModifiedBy
 * @Copyright
 * @date 2015-7-7 下午07:14:04
 * @description
 */
public class Comm {
	/**
	 * 获取登录用户的id
	 * @author 
	 * @title: getUserInfoId
	 * @date 2015-7-7 下午07:13:45
	 * @param request
	 * @return String
	 */
	public static String getUserInfoId(HttpServletRequest request) {
		return (String) request.getSession().getAttribute("id");
	}
	public static String getAccountUserInfoId(HttpServletRequest request) {
		return (String) request.getSession().getAttribute("account");
	}
	public static String getUserInfoBianhao(HttpServletRequest request) {
		return (String) request.getSession().getAttribute("bianhao");
	}
}
