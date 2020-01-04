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
		<li><a href="#">课程管理</a></li>
		<li><a href="#">修改课程信息</a></li>
	</ul>
</div>
<form action = "shangpin.do?method=updateCz" method = "post" enctype = "multipart/form-data"  class="validate" onsubmit="return add();" >
	<input name="id" id="xilie"  type="hidden" value="<%=list.get(0).get("id")%>" class="dfinput required" />
	<div class="formbody">
		<div class="formtitle"><span>修改课程信息</span></div>
		<ul class="forminfo">
			<li>
				<label>课程名称</label>
				<input name="fname" id="fname" value="<%=list.get(0).get("fname")%>"  type="text" class="dfinput required" /><font color="red">*</font>必填
			</li>
			<li>
				<label>价格</label>
				<input name="price" id="price" value="<%=list.get(0).get("price")%>"  type="text" class="dfinput required" />（元）<font color="red">*</font>
			</li>
			<li>
				<label>描述</label>
				<textarea name="detail" id="detail" cols="100" rows="8" style="width:400px;height:100px" class="dfinput required" ></textarea><font color="red">*</font>
			</li>
			<li>
				<label>图片</label>
				<input name="photo" id="photo" type="file" onchange="preview(this,'preview','imghead',150,100)"/><font color="red">*</font>
				<div id="preview">
					<img id="imghead" width="150" height="200" src = "<%=basePath %>image/<%=list.get(0).get("photo") %>" />
				</div>
			</li>
			
			<li>
				<label>&nbsp;</label>
					<input type="submit" class="btn" onclick="toAdd();" value="确认"/>
				<a href="index/admin/shangpin/addSp.jsp"><input type="button" class="btn" value="重置"/></a>
			</li>
		</ul>
	</div>
</form>
<script type="text/javascript">
	/**
	 * 这个使用的单选框选择判断
	 */
	 function add(){
			var fname=$.trim($("#fname").val());
			var price=$.trim($("#price").val());
				if(fname.length==0){
					alert("名称不能为空");
					$("#fname").focus();
					return false;
				}
				if(price.length==0){
					alert("价格不能为空");
					$("#price").focus();
					return false;
				}
				if(!(/^\\d+(\\.\\d+)?|([0-9]*[1-9][0-9]*)$/.test(price))){
			        alert("价格有误，请重填");  
			        $("#price").focus();
			        return false; 
			    } 
				alert("修改成功！！！");
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
	