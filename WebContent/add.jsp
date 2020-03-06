<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type">
<title>Insert title here</title>
<style type="text/css">
table {
	border-right: 1px solid blue;
	border-bottom: 1px solid blue;
	font-size: 15px;
	margin: auto;
	width: 700px;
}

table td {
	border-left: 1px solid blue;
	border-top: 1px solid blue
}
</style>
</head>
<body>
	<table>
		<tr>
			<td colspan="4">产品管理</td>
		</tr>
		<tr>
			<td colspan="4">管理导航：&nbsp;&nbsp;&nbsp; <span>产品类别添加</span>&nbsp;&nbsp;&nbsp;
				<span>产品信息管理</span></td>
		</tr>
		<tr>
			<td>添加产品类别</td>
			<td colspan="3">产品类别： <select name="liebei">
					<option value="volvo">Volvo</option>
					<option value="saab">Saab</option>
					<option value="fiat">Fiat</option>
					<option value="audi">Audi</option>
				</select> 
				关键字搜索：<input type="text" name="cname" />
				<button type="button">搜索</button>
			</td>
		</tr>
		<tr>
			<td colspan="4">中文产品列表</td>
		</tr>
		<tr>
			<td>选择语言：</td>
			<td colspan="3"><input type="radio" checked="checked" name="yu"
				value="中文" /></td>
		</tr>
		<tr>
			<td>产品分类：</td>
			<td><select name="fenglei">
					<option value="volvo">Volvo</option>
					<option value="saab">Saab</option>
					<option value="fiat">Fiat</option>
					<option value="audi">Audi</option>
			</select></td>
			<td>发布日期：</td>
			<td></td>
		</tr>
		<tr>
			<td>产品名称：</td>
			<td></td>
			<td>附加名称：</td>
			<td></td>
		</tr>
		<tr>
			<td>添加附件</td>
			<td></td>
			<td></td>
			<td><button></button>
				<button></button></td>
		</tr>
		<tr>
			<td rowspan="2">简要介绍
			<p>(少于300个字)</p></td>
			<td rowspan="2" style="margin: auto;"><textarea rows="6" cols="20"></textarea></td>
			<td rowspan="2">添加产品介绍图片</td>
			<td rowspan="2"></td>
		</tr>
		<tr></tr>
		<tr>
			<td colspan="4">产品内容</td>
		</tr>
		<tr>
			<td colspan="4" id="td1"></td>
		</tr>
		<tr>
			<td colspan="4"><button type="button">修改产品内容</button></td>
		</tr>
	</table>
	<script
		src="${pageContext.request.contextPath}/static/wangEditor.min.js"></script>
	<script>
		var E = window.wangEditor;
		var editor = new E('#td1');
		// 关闭粘贴样式的过滤
	    editor.customConfig.pasteFilterStyle = true
	    // 忽略粘贴内容中的图片
	    editor.customConfig.pasteIgnoreImg = true
	 // 自定义处理粘贴的文本内容
	    editor.customConfig.pasteTextHandle = function (content) {
	        // content 即粘贴过来的内容（html 或 纯文本），可进行自定义处理然后返回
	        return content + '<p></p>'
	    }

	    editor.customConfig.colors = [
	        '#000000',
	        '#eeece0',
	        '#1c487f',
	        '#4d80bf',
	        '#c24f4a',
	        '#8baa4a',
	        '#7b5ba1',
	        '#46acc8',
	        '#f9963b',
	        '#ffffff',
	        'pink'
	    ]
	
	    editor.customConfig.menus = [
	        'fontSize',  // 字号
	        'fontName',  // 字体
	        'italic',  // 斜体
	        'underline',  // 下划线
	        'strikeThrough',  // 删除线
	        'foreColor',  // 文字颜色
	        'backColor',  // 背景颜色
	        'image',  // 插入图片
	        'undo',  // 撤销
	        'redo'  // 重复
	    ]

		// 上传图片到服务器(处理上传的后台代码)
		editor.customConfig.uploadImgServer = '${pageContext.request.contextPath}/upload';
		// 隐藏“网络图片”菜单(true是显示--默认，false隐藏)
		editor.customConfig.showLinkImg = false;
		// 将每张图片大小限制为 3M(单位为字节)
		editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024;
		// 限制一次最多能传几张图片，默认为 10000 张（即不限制），需要限制可自己配置
		// 限制一次最多上传 5 张图片
		editor.customConfig.uploadImgMaxLength = 5;
		// 监听函数，可使用监听函数在上传图片的不同阶段做相应处理
		editor.customConfig.uploadImgHooks = {
			// 如果服务器端返回的不是 {errno:0, data: [...]} 这种格式，可使用该配置
			// （但是，服务器端返回的必须是一个 JSON 格式字符串！！！否则会报错）
			// 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
			customInsert : function(insertImg, result, editor) {
				// insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果
				// 举例：假如上传图片成功后，服务器端返回的是 [url,url,...] 这种格式，即可这样插入图片：
				for ( var i in result) {// result 必须是一个 JSON 格式字符串！！！否则报错
					insertImg('${pageContext.request.contextPath}/static/file/'
							+ result[i]);
				}
			}
		}
		editor.create();
	</script>
</body>
</html>