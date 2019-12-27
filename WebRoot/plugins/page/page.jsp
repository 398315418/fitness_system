<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="cn.com.shxt.util.Page" %>

<%
	Page paging = (Page)request.getAttribute("paging");
%>

<input type="hidden" name="pageIndex" id="pageIndex" value="<%=paging.index %>"/>
<div class="pagin">
	<div class="message">共<i class="blue"><%=paging.rows %></i>条记录，当前显示第&nbsp;<i class="blue"> <%=paging.index %>&nbsp;</i>页</div>
	<ul class="paginList">
		<li class="paginItem"><a href="javascript:paging('prev');"><span class="pagepre"></span></a></li>
		<li class="paginItem "><a href="javascript:;">1</a></li>
		<li class="paginItem "><a href="javascript:;">2</a></li>
		<li class="paginItem"><a href="javascript:;">3</a></li>
		<li class="paginItem"><a href="javascript:;">4</a></li>
		<li class="paginItem"><a href="javascript:;">5</a></li>
		<li class="paginItem more"><a href="javascript:;">...</a></li>
		<li class="paginItem"><a href="javascript:;">10</a></li>
		<li class="paginItem"><a href="javascript:paging('next');"><span class="pagenxt"></span></a></li>
	</ul>
</div>
	
<script type="text/javascript">
	function paging(type) {
		var $pageIndex = $("#pageIndex");//获取隐藏域的对象
		var index = parseInt($pageIndex.val());
		
		if(type == "next") {
			if(index == "<%=paging.pages %>") {
				return;
			}
			index++;
		}else if (type == "prev"){
			if(index == 1) {
				return ;
			}
			index--;
		}else if(type == "first") {
			if(index == 1) {
				return ;
			}
			index = 1;
		}else if(type == "end") {
			if(index == "<%=paging.pages %>") {
				return;
			}
			index = "<%=paging.pages %>";
		}
		
		
		
		$pageIndex.val(index);
		
		$("form[rel='page']").submit();
	}
</script>