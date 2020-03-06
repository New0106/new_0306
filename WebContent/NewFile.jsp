<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>wangEditor demo</title>
    
</head>
<body>
	<table style="border:1px solid black">
		<tr>
			<td style="text-align: center;">招聘对象</td>
			<td><input type="text" name="fname" placeholder="行业客户经理"/></td>
		</tr>
		<tr>
			<td style="text-align: center;">招聘人数</td>
			<td><input type="text" name="cname" placeholder="2" />人</td>
		</tr>
		<tr>
			<td style="text-align: center;">工作地点</td>
			<td><input type="text" name="tname" placeholder="上海" /></td>
		</tr>
		<tr>
			<td style="text-align: center;">工资待遇</td>
			<td><input type="text" name="aname" placeholder="面议" /></td>
		</tr>
		<tr>
			<td style="text-align: center;">发布日期</td>
			<td><input type="text" name="fname" placeholder="2005-12-18"/></td>
		</tr>
		<tr>
			<td style="text-align: center;">有效期限</td>
			<td><input type="text" name="fname" placeholder="20"/>天</td>
		</tr>
		<tr>
			<td style="text-align: center;">招聘要求</td>
			<td id="td1"></td>
		</tr>
	</table>
	<script src="${pageContext.request.contextPath}/static/wangEditor.min.js"></script>
	<script>
   		var E = window.wangEditor;
    	var editor = new E('#td1');
    	editor.create();
    </script>
</body>
</html>