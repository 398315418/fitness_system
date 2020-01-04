<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>无标题文档</title>
	<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="resource/commons/utils.js"></script>
</head>
			<%
			List<Map<String, String>> list = (List<Map<String, String>>)request.getAttribute("list");
			%>
<body>
<div class="place">
	<span>位置：</span>
	<ul class="placeul">
		<li><a href="#">教练管理</a></li>
		<li><a href="#">添加教练信息</a></li>
	</ul>
</div>
<form action = "shangpin.do?method=addQc" method = "post" enctype = "multipart/form-data"  class="validate" onsubmit="return add();" >
	<div class="formbody">
		<div class="formtitle"><span>添加教练信息</span></div>
		<ul class="forminfo">
			<li>
				<label>姓名</label>
				<input name="name" id="name"  type="text" class="dfinput required" /><font color="red">*</font>必填
			</li>
			<li>
				<label>年龄</label>
				<input name="age" id="age"  type="text" class="dfinput required" /><font color="red">*</font>
			</li>
			<li>
				<label>电话</label>
				<input name="phone" id="phone"  type="text" class="dfinput required" /><font color="red">*</font>
			</li>
			<li>
				<label>家庭住址</label>
				<input name="address" id="address"  type="text" class="dfinput required" /><font color="red">*</font>
			</li>
			<li>
				<label>工作年限</label>
				<input name="worktime" id="worktime"  type="text" class="dfinput required" />（年）<font color="red">*</font>
			</li>
			<li>
				<label>描述</label>
				<textarea name="detail" id="detail" cols="100" rows="8" style="width:400px;height:100px" class="dfinput required" ></textarea><font color="red">*</font>
			</li>
			<li>
				<label>照片</label>
				<input name="photo" id="photo" type="file" onchange="preview(this,'preview','imghead',150,100)"/><font color="red">*</font>
				<div id="preview">
					<img id="imghead" width="100" height="150" />
				</div>
			</li>
			
			<li>
				<label>&nbsp;</label>
					<input type="submit" class="btn" onclick="toAdd();" value="确认"/>
				<a href="index/admin/qicai/addQc.jsp"><input type="button" class="btn" value="重置"/></a>
			</li>
		</ul>
	</div>
</form>
<script type="text/javascript">
	/**
	 * 这个使用的单选框选择判断
	 */
	 function add(){
			var name=$.trim($("#name").val());
			var age=$.trim($("#age").val());
			var phone=$.trim($("#phone").val());
			var address=$.trim($("#address").val());
			var worktime=$.trim($("#worktime").val());
				if(name.length==0){
					alert("姓名不能为空");
					$("#name").focus();
					return false;
				}
				if(age.length==0){
					alert("年龄不能为空");
					$("#age").focus();
					return false;
				}
				if(phone.length==0){
					alert("电话不能为空");
					$("#phone").focus();
					return false;
				}
				if(worktime.length==0){
					alert("工作年限不能为空");
					$("worktime").focus();
					return false;
				}
				if(address.length==0){
					alert("家庭地址不能为空");
					$("#address").focus();
					return false;
				}
				if(!(/^1[3456789]\d{9}$/.test(phone))){ 
			        alert("手机号码有误，请重填");  
			        $("#phone").focus();
			        return false; 
			    } 
				if(!utils.isNumber(age)){//判断账号是否是数字或字母
	        		alert("年龄信息有误，请重填");
	        		$("#age").focus();
	        		return false;
	        	}
				if(!utils.isNumber(worktime)){//判断账号是否是数字或字母
	        		alert("工作年限信息有误，请重填");
	        		$("#worktime").focus();
	        		return false;
	        	}
				alert("添加成功！！！");
				return true;
		}
	function toAdd(){
		
	}
	$(function(){
		$('.tablelist tbody tr:odd').addClass('odd');
		
		$("#formtitle").click(function(){
			$("#forminfo").slideToggle("slow");
		});
	});
</script>
<script type="text/javascript" src="<%=basePath %>plugins/jQuery/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>js/validate.js"></script>
<script type="text/javascript" src="<%=path %>plugins/imagePreview/imagePreview.js"></script>
<script type="text/javascript" src="<%=path%>plugins/My97DatePicker/WdatePicker.js"></script> 
</body>
</html>
	