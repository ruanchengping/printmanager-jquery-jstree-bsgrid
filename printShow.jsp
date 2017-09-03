<!doctype html>
<html lang="us">
<head>
	<meta charset="utf-8">
	<title>jQuery UI Example Page</title>
	<link href="jquery-ui/jquery-ui.css" rel="stylesheet">
	<link rel="stylesheet" href="jstree/style.min.css" />
	<style>
		.ui-autocomplete {
			z-index: 11111;
			max-height: 200px;
			overflow-y: auto;
			/* prevent horizontal scrollbar */
			overflow-x: hidden;
			/* add padding to account for vertical scrollbar */
			padding-right: 20px;
		}
		/* IE 6 doesn't support max-height
        * we use height instead, but this forces the menu to always be this tall
        */
		* html .ui-autocomplete {
			height: 100px;
		}
		.no-close .ui-dialog-titlebar-close {
			display: none;
		}
	</style>

	<link rel="stylesheet" href="bsgrid/merged/bsgrid.all.min.css"/>
	<link rel="stylesheet" href="bsgrid/css/skins/grid_sky_blue.min.css"/>
	<link rel="stylesheet" href="bsgrid/css/form.min.css"/>
	<link rel="stylesheet" href="bsgrid/example.css"/>
	<link rel="stylesheet" href="bsgrid/artDialog/skins/blue.css"/>
    <link rel="stylesheet" href="bsgrid/artDialog/override/artDialog.skins.override.css"/>
    
	<script src="js/jquery.min.js"></script>
	<script type="text/javascript" src="bsgrid/artDialog/jquery.artDialog.min.js"></script>
    <script type="text/javascript" src="bsgrid/artDialog/artDialog.plugins.min.js"></script>
    <script type="text/javascript" src="bsgrid/artDialog/override/artDialog.plugin.override.js"></script> 
    <script type="text/javascript" src="bsgrid/artDialog/override/artDialog.plugin.override.zh-CN.js"></script>    
    <script type="text/javascript" src="bsgrid/artDialog/override.pop.js"></script>

	<script type="text/javascript" src="bsgrid/js/lang/grid.zh-CN.min.js"></script>
	<script type="text/javascript" src="bsgrid/merged/bsgrid.all.min.js"></script>
	<script type="text/javascript" src="bsgrid/js/common.min.js"></script>
	<script type="text/javascript" src="bsgrid/js/util.min.js"></script>
	<script type="text/javascript" src="bsgrid/js/form.min.js"></script>
	<link rel="stylesheet" href="bsgrid/validationEngine/css/validationEngine.jquery.css"/>
	<script type="text/javascript" src="bsgrid/validationEngine/js/languages/jquery.validationEngine-zh_CN.js"></script>
	<script type="text/javascript" src="bsgrid/validationEngine/js/jquery.validationEngine.js"></script>
	<script type="text/javascript" src="bsgrid/validationEngine-addition-rules.js"></script>

</head>
<body>

<fieldset>
	<legend>打印模板管理</legend>
	<div>

		<div id="controlgroup" >
			<button id="addModule" class="ui-button ui-corner-all ui-widget">
				新增
			</button>
			<button id="editModule" class="ui-button ui-corner-all ui-widget">修改</button>
			<button id="deleteModule" class="ui-button ui-corner-all ui-widget">删除</button>
		</div>
		<div id="radioset1">
				<input type="radio" id="radio6" name="radio"><label for="radio6">复制</label>
				<input type="radio" id="radio4" name="radio"><label for="radio4">剪切</label>
				<input type="radio" id="radio5" name="radio"><label for="radio5">粘贴</label>
			</div>
		<div id="controlgroup1">
			<button id="queryModule">查询</button>
			<button id="refreshModule">刷新</button>
		</div>
		<button id="button2">格式设计</button>
		<div id="controlgroup2">		
			<button>导入</button>
			<button>导出</button>
		</div>
	</div>
</fieldset>
<table width="100%" style={margin:'5px'}>
	<tbody>
	<tr>
	<td style="width:30%"}>
		<div style="border:1px solid #ccc;vertical-align:top;height:850px;overflow: auto">
			<div style="margin:5px">打印模板分类</div>
			<div>
				<span>&nbsp;&nbsp;</span>
				<span id="controlgroup3" style="float:right;margin-right:1px;">
					<button id="addSort"><span class="ui-icon ui-icon-plus"></span>新增</button>
					<button id="editSort"><span class="ui-icon ui-icon-pencil"></span>修改</button>
					<button id="deleteSort"><span class="ui-icon ui-icon-closethick"></span>删除</button>
					
					<button id="refreshSort"><span class="ui-icon ui-icon-refresh"></span>刷新</button>
				</span>
			</div>
			<br />

			<div id="evts" class="demo"></div>
		</div>
	</td>
	<td style={width:"70%"}>
			<div style="border:1px solid #ccc;vertical-align:top;height:850px;overflow: auto">
				<div style="margin-left: 25px">全选当前页</div>
				<table id="searchTable">
					<tr>
						<th w_check="true" w_index="id" width="10%;"></th>
						<th w_index="code" width="15%;">模板编码</th>
						<th w_index="name" width="15%;">模板名称</th>
						<th w_index="pk_dir" w_align="left" width="15%;">模板分类</th>
						<th w_index="descrpition" w_align="left" width="30%;">说明</th>
						<th w_index="id" width="15%;">模板ID</th>

					</tr>
				</table>
			</div>
		</td>
	</tr>
	</tbody>
</table>
<div id="moduleEdit" style="width:800px">
	<div style=margin-top:120px">&nbsp;&nbsp;</div>
	<form id="moduleEditForm" class="bsgrid_form">
		<table width="100%"  >
			<tr showType="edit" >
				<td class="formLabel"><span class="require">*</span>模板编码:</td>
				<td class="formInput" >
					<input id="code" name="code" class="validate[required]"  type="text" value="" />
				</td>
			</tr>
			<tr showType="edit" >
				<td class="formLabel"><span class="require">*</span>模板名称:</td>
				<td class="formInput" ><input id="name" name="name" class="validate[required]" type="text" value="" /></td>
			</tr>
			<tr showType="edit" >
				<td class="formLabel">模板分类:</td>
				<td class="formInput" ><input id="pk_dir" name="pk_dir" editAble="false" type="text" value="" /></td>
			</tr>
			<tr showType="edit" >
				<td class="formLabel">说明:</td>
				<td class="formInput" >
					<textarea id="descrpition" name="descrpition" >
					</textarea>
				</td>
			</tr>
		</table>
		<input id="id" name="id" type="hidden" value="" />
	</form>
</div>

<div id="moduleQuery" style="width:800px">
	<form id="moduleQueryForm" class="bsgrid_form">
		<table width="100%"  >
			<tr>
				<td class="formLabel">模板编码:</td>
				<td class="formInput" >
					<input id="codeq" name="codeq" type="text" value="" />
				</td>
			</tr>
			<tr>
				<td class="formLabel">模板名称:</td>
				<td class="formInput" >
					<input id="nameq" name="nameq" type="text" value="" /></td>
			</tr>
						
		</table>		
	</form>
</div>

<div id="sortEdit">
	<div style=margin-top:120px">&nbsp;&nbsp;</div>
	<form id="sortEditForm" class="bsgrid_form">
		<table width="100%"  >
			<tr showType="edit" >
				<td class="formLabel"><span class="require">*</span>分类名称:</td>
				<td class="formInput" >
					<input id="sortId" name="sortId" type="hidden" value="" />
					<input id="sortName" name="sortName" class="validate[required]" type="text" value="" />
				</td>
			</tr>
			<tr showType="edit" >
				<td class="formLabel">上级分类:</td>
				<td class="formInput" >
					<input id="pk_parent" name="pk_parent" editAble="false" type="text" value="" />
				</td>
			</tr>
			<tr showType="edit" >
			  <td class="formLabel"><span class="require">*</span>分类编码:</td>
			  <td class="formInput" >
				<input id="modulecode" name="modulecode" class="validate[required]" type="text" value="" />
			  </td>
			</tr>
			<tr showType="edit" >
				<td class="formLabel">说明:</td>
				<td class="formInput" >
					<textarea id="remark" name="remark" >
					</textarea>
					<input id="creator" name="creator" type="hidden" value="张三" />					
					<input id="creationtime" name="creationtime" type="hidden" value="" />
				</td>
			</tr>
		</table>
	</form>
</div>

<script src="jquery-ui/jquery-ui.js"></script>
<script src="jstree/jstree.min.js"></script>
<script>
/**参考http://www.w3school.com.cn/jquery/jquery_ajax_get_post.asp**/
/**
var url="http://localhost:8078/print/loadTemplatesByCatalog?id=1";
$.ajax({
    url: url,
    type: 'GET',
    contentType: "application/json",
    processData: false,
    //data: JSON.stringify(resultCode)
  })
  .done(function(data) {
      console.log(data)
  });
**/

/**
var url="http://localhost:8078/print/savePrintCalog";
var resultCode={
	    "name": "模板分类1",
	    "modulecode": "a1",
	    "pk_dir": "1",
	    "pk_parent": "a2",
	    "creator": "a3",
	    "creationtime": "2009-06-08 00:00:00",
	    "modifier": "a4",
	    "modifiedtime": "2009-06-18 00:00:00",
	    "description": "test模板分类描述1"
	};
$.ajax({
    url: url,
    type: 'POST',
    contentType: "application/json",
    processData: false,
    data: JSON.stringify(resultCode)
  })
  .done(function(data) {
      console.log(data)
  });
**/


/**
var url="http://localhost:8078/print/deleteCatalogByID?id=2";
var resultCode={
	    "name": "模板分类1",
	    "modulecode": "a1",
	    "pk_dir": "1",
	    "pk_parent": "a2",
	    "creator": "a3",
	    "creationtime": "2009-06-08 00:00:00",
	    "modifier": "a4",
	    "modifiedtime": "2009-06-18 00:00:00",
	    "description": "test模板分类描述1"
	};
$.ajax({
    url: url,
    type: 'DELETE',
    contentType: "application/json",
    processData: false,
    //data: JSON.stringify(resultCode)
  })
  .done(function(data) {
      console.log(data)
  });
**/



$( "#button2" ).button({ label: "格式设计" });
$( "#radioset1" ).buttonset();
$( "#controlgroup" ).controlgroup();
$( "#controlgroup1" ).controlgroup();
$( "#controlgroup2" ).controlgroup();
$( "#controlgroup3" ).controlgroup();
$( "#fromTime" ).datepicker({
	inline: true
});
$( "#toTime" ).datepicker({
	inline: true
});

var userTags = [
	"张三",
	"AppleScript",
	"Asp",
	"BASIC",
	"C",
	"C++",
	"Clojure",
	"COBOL",
	"ColdFusion",
	"Erlang",
	"Fortran",
	"Groovy",
	"Haskell",
	"Java",
	"JavaScript",
	"Lisp",
	"Perl",
	"PHP",
	"Python",
	"Ruby",
	"Scala",
	"Scheme"
];
$( "#creatorq" ).autocomplete({
	source: userTags
});

var pk_parentTags = [];//"模板1","模板2","模板1-1"
for (var i = 1; i < 10; i++) {
	pk_parentTags.push("模板"+i);
	for (var j = 1; j < 21; j++) {
		pk_parentTags.push("模板"+i+"-"+j);
	}
}
$( "#pk_parent" ).autocomplete({
//	source: pk_parentTags,
	source:function(request,response){
		var matcher = new RegExp("^"+ $.ui.autocomplete.escapeRegex(request.term),"i");
		response($.grep(pk_parentTags,function(item){
			return matcher.test(item);
		}));
	}
//	minLength: 2,
});
/****************以下是 工具 ************************/

//获取时间格式化
function gshtime(time)
{
	var year = time.getFullYear();       //年</span>
	var month = time.getMonth() + 1;  //月
	var day = time.getDate();         //日
//	var hh = time.getHours();       //时
//	var mm = time.getMinutes();    //分
//	var seconds = time.getSeconds();
	var str= year + "-";
	if(month < 10)
		str+= "0";
	str+= month + "-";
	if(day < 10)
		str+= "0";
	str+= day ;
//	if(hh < 10)
//		hh+= "0";
//	str+= hh + ":";
//	if(mm < 10)
//		mm+= "0";
//	str+= mm + ":";
//	if(seconds < 10)
//		seconds+= "0";
//	str+= seconds;
	return(str);
}
//datepicker汉化
jQuery(function ($) {
	$.datepicker.regional['zh-CN'] = {
		closeText: '关闭',
		prevText: '<上月',
		nextText: '下月>',
		currentText: '今天',
		monthNames: ['一月', '二月', '三月', '四月', '五月', '六月',
			'七月', '八月', '九月', '十月', '十一月', '十二月'],
		monthNamesShort: ['一', '二', '三', '四', '五', '六',
			'七', '八', '九', '十', '十一', '十二'],
		dayNames: ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'],
		dayNamesShort: ['周日', '周一', '周二', '周三', '周四', '周五', '周六'],
		dayNamesMin: ['日', '一', '二', '三', '四', '五', '六'],
		weekHeader: '周',
		dateFormat: 'yy-mm-dd',
		firstDay: 1,
		isRTL: false,
		showMonthAfterYear: true,
		yearSuffix: '年'
	};
	$.datepicker.setDefaults($.datepicker.regional['zh-CN']);
});

/****************以下是module增删改查 ************************/
var formObj;
$(function () {
	formObj = $.fn.bsgrid_form.init('moduleEditForm', {});
	// 校验插件初始化，注意校验只能初始化一遍（注意需要在全局设置之后进行初始化，这样全局设置才起作用）
	//$("#moduleEditForm").validationEngine();
	// 隐藏所有校验提示
    //$('#moduleEditForm').validationEngine('hideAll');
});

function vcode(arr,submitCode){
	var flag=false;
	for(var i=0;i<arr.length;i++){
		if(arr[i].code==submitCode){
			flag=true;
			break;
		}
	}
	return flag;
}

function vname(arr,submitName){
	var flag=false;
	for(var i=0;i<arr.length;i++){
		if(arr[i].name==submitName){
			flag=true;
			break;
		}
	}
	return flag;
}



$( "#moduleEdit" ).dialog({
	autoOpen: false,
	dialogClass: "no-close",
	width: 400,
	buttons: [
		{
			text: "确定",
			click: function() {
				if( $("#moduleEditForm").validationEngine("validate")){
					var submitCode = $( "#code" ).val();
					var submitName = $( "#name" ).val();
					var records = gridObj.getCheckedRowsRecords();
					var code = gridObj.getRecordIndexValue(records[0], 'code');
					var name = gridObj.getRecordIndexValue(records[0], 'name');
					console.log(treeData);

					if(code!=submitCode && vcode(backData,submitCode)){
						alert("模板编码不可以重复！");
					}else if(name!=submitName && vname(backData,submitName)){
						alert("模板名称不可以重复！");
					}else{
						console.log($('#moduleEditForm').serialize());
						//后台操作 增加模板
											
						$( this ).dialog( "close" );
					}
				}
			}
		},
		{
			text: "取消",
			click: function() {
				
				$( this ).dialog( "close" );
			}
		}
	]
});

$( "#addModule" ).click(function( event ) {
	if(JSON.stringify(treeNodeId)=="{}" || treeNodeId.data.sortId=="root"){
		alert("请至少选择一个树节点！");
	}else{
		var sortId = treeNodeId.data.sortId;//主键
		var sortName = treeNodeId.text;
		$( "#pk_dir" ).val(sortName);
		$( "#code" ).val("");
		$( "#name" ).val("");
		$( "#descrpition" ).val("");
		$( "#id" ).val("");

		$( "#moduleEdit" ).dialog( "open" );
		$( "#moduleEdit" ).dialog( {title:"新增模板"} );

		// 隐藏所有校验提示
	    $('#moduleEditForm').validationEngine('hideAll');
	    formObj.showForm('edit');
	}
	event.preventDefault();
});
$( "#editModule" ).click(function( event ) {
	var ids = gridObj.getCheckedValues('id');
	console.log(ids);
	if(ids.length>0 && ids[0]!=""){
		var records = gridObj.getCheckedRowsRecords();
		var code = gridObj.getRecordIndexValue(records[0], 'code');
		var name = gridObj.getRecordIndexValue(records[0], 'name');
		var pk_dir = gridObj.getRecordIndexValue(records[0], 'pk_dir');
		var descrpition = gridObj.getRecordIndexValue(records[0], 'descrpition');
		var id = gridObj.getRecordIndexValue(records[0], 'id');
		$( "#code" ).val(code);
		$( "#name" ).val(name);
		$( "#pk_dir" ).val(pk_dir);
		$( "#descrpition" ).val(descrpition);
		$( "#id" ).val(id);

		$( "#moduleEdit" ).dialog( "open" );
		$( "#moduleEdit" ).dialog( {title:"修改模板"} );
		// 隐藏所有校验提示
        $('#moduleEditForm').validationEngine('hideAll');
        formObj.showForm('edit');
	}else{
		alert("请至少选择一行数据！");
	}

	event.preventDefault();
});

$( "#deleteModule" ).click(function( event ) {
	var ids = gridObj.getCheckedValues('id');
	if(ids.length>0){
		//后端删除
	}else{
		alert("请至少选择一行数据！");
	}
	event.preventDefault();
});

$( "#queryModule" ).click(function( event ) {
	$( "#codeq" ).val("");
	$( "#nameq" ).val("");
	$( "#moduleQuery" ).dialog( "open" );
	$( "#moduleQuery" ).dialog( {title:"查询模板"} );
	event.preventDefault();
});

$( "#moduleQuery").dialog({
	autoOpen: false,
	dialogClass: "no-close",
	width: 400,
	buttons: [
		{
			text: "清空值",
			click: function() {
				$( "#codeq" ).val("");
				$( "#nameq" ).val("");
			}
		},
		{
			text: "确定",
			click: function() {
				console.log($('#moduleQueryForm').serialize());
				//后端处理
				
				$( this ).dialog( "close" );
			}
		},
		{
			text: "取消",
			click: function() {
				
				$( this ).dialog( "close" );
			}
		}
	]
});

$( "#refreshModule" ).click(function( event ) {
	event.preventDefault();
	//getAllModule后端处理
});
/****************以下是sort增删改查 ************************/
var sortformObj;
$(function () {
	sortformObj = $.fn.bsgrid_form.init('sortEditForm', {});
	// 校验插件初始化，注意校验只能初始化一遍（注意需要在全局设置之后进行初始化，这样全局设置才起作用）
	//$("#sortEditForm").validationEngine();
	// 隐藏所有校验提示
    //$('#sortEditForm').validationEngine('hideAll');
});

$( "#sortEdit" ).dialog({
	autoOpen: false,
	dialogClass: "no-close",
	width: 400,
	buttons: [
		{
			text: "确定",
			click: function() {
				if( $("#sortEditForm").validationEngine("validate")){
					var sortName = treeNodeId.text;
					var submitName = $( "#sortName" ).val();
					
					if(sortName!=submitName && validateSortName(treeData,submitName)){
						alert("分类名称不可以重复！");
					}else{
						var myDate=gshtime(new Date());
						console.log($('#sortEditForm'));
						// console.log($('#sortEditForm').serialize()+myDate);
						//后端处理
						
						$( this ).dialog( "close" );
					}
				}
			}
		},
		{
			text: "取消",
			click: function() {

				$( this ).dialog( "close" );
			}
		}
	]
});

 $( "#addSort" ).click(function( event ) {
 	if(JSON.stringify(treeNodeId)=="{}" || treeNodeId.data.sortId=="root"){
		alert("请至少选择一个树节点！");
	}else{		
		var sortName = treeNodeId.text;		
		$( "#pk_parent" ).val(sortName);
		$( "#sortId" ).val("");
		$( "#sortName" ).val("");
		$( "#modulecode" ).val("");
		$( "#remark" ).val("");
		$( "#creator" ).val("");
		$( "#creationtime" ).val("");
		$( "#sortEdit" ).dialog( "open" );
		$( "#sortEdit" ).dialog( {title:"新增分类"} );
		// 隐藏所有校验提示
        $('#sortEditForm').validationEngine('hideAll');
        sortformObj.showForm('edit');
	}	
	event.preventDefault();
});
function validateSortName(arr,sortName){
	var flag=false;
	for(var i=0;i<arr.length;i++){
		if(arr[i].text==sortName){
			flag=true;
			break;
		}else{
			if(arr[i].children){
				validateSortName(arr[i].children,sortName);
			}
		}
	}
	return flag;
}
//根据节点id获取title
function getNodeTitle(arr,nodeCode){
	if(nodeCode=="root"){
		return "打印模板分类";
	}else{
		var text="";
		for(var i=0;i<arr.length;i++){
			if(arr[i].id==nodeCode){
				text=arr[i].text;
				break;
			}else{
				if(arr[i].children){
					getNodeTitle(arr[i].children,nodeCode);
				}
			}
		}
		return text;
	}
}

 $( "#editSort" ).click(function( event ) {
	if(JSON.stringify(treeNodeId)=="{}" || treeNodeId.data.sortId=="root"){
		alert("请至少选择一个树节点！");
	}else{
		var sortId = treeNodeId.data.sortId;//主键
		var sortName = treeNodeId.text;
		var parentCode = treeNodeId.parent;
		var pk_parent = getNodeTitle(treeData,parentCode);

		var modulecode = treeNodeId.id;
		var remark = treeNodeId.data.remark;//说明，树节点除了id,title,parent以外增加的信息
		var creator = treeNodeId.data.creator;
		
		var creationtime = treeNodeId.data.creationtime;
		$( "#sortId" ).val(sortId);
		$( "#sortName" ).val(sortName);
		$( "#pk_parent" ).val(pk_parent);
		$( "#modulecode" ).val(modulecode);
		$( "#remark" ).val(remark);
		$( "#creator" ).val(creator);
		
		$( "#creationtime" ).val(creationtime);

		$( "#sortEdit" ).dialog( "open" );
		$( "#sortEdit" ).dialog( {title:"修改分类"} );
		// 隐藏所有校验提示
        $('#sortEditForm').validationEngine('hideAll');
        sortformObj.showForm('edit');
	}

	event.preventDefault();
});

 $( "#deleteSort" ).click(function( event ) {
	 if(JSON.stringify(treeNodeId)=="{}" || treeNodeId.data.sortId=="root"){
		 alert("请至少选择一个树节点！");
	 }else{
		//后端删除
	}
	event.preventDefault();
});

 
 $( "#refreshSort" ).click(function( event ) {
	event.preventDefault();
	//getAllSort后端处理
});
/****************以下是tree ************************/
var treeData = [];
for (var i = 1; i < 21; i++) {
	var childData = [];
	var json = {
		"text" : "模板"+i,
		"id":i,
		data:{
			"sortId":i,
			"remark":"模板说明"+i,
		}
	};
	for (var j = 1; j < 21; j++) {
		var json1 = {
			"text" : "模板"+i+"-"+j,
			"id":i+"-"+j,
			data:{
				"sortId":i+"-"+j,
				"remark":"模板说明"+i+"-"+j,
			}
		};
		childData.push(json1);
	}
	json.children=childData;
	treeData.push(json);
}
var treeNodeId={};
// inline data demo
$('#evts')
.on("changed.jstree", function (e, data) {
	console.log(data);
	if(data.selected.length) {
//		alert('The selected node is: ' + data.instance.get_node(data.selected[0]).id);
		treeNodeId= data.instance.get_node(data.selected[0]);
		console.log(treeNodeId);
		//后端处理，根据treeNodeId 联动 表格
	}
})
.jstree({
	'core' : {
		'multiple' : false,
//		'data' : {//ajax获取
//			"url" : "./root.json",
//			"dataType" : "json" // needed only if you do not supply JSON headers
//		}
		'data' : [
			{ "text" : "打印模板分类","id":"root",
				data:{
					"sortId":"root",
					"remark":"模板说明root",
				},
				"state" : { "opened" : true },
				"children" : treeData
			}
		]
	}
});

/****************以下是table ************************/
var backData = [];
for (let i = 0; i < 90; i++) {
	var json = {
		"code": "m"+i,
		"name":'打印模板'+i,
		"pk_dir":'a',
		"descrpition":'abc',
		"id":i,
	};
	backData.push(json);
}
var gridObj;
$(function () {
	gridObj = $.fn.bsgrid.init('searchTable', {
		localData: backData,
		// autoLoad: false,
		pageSizeSelect: true,
		pageSize:25,
		stripeRows: true,
	});
});

function getCheckedIds() {
	// values are array
	alert (gridObj.getCheckedValues('id'));
}

function commitModuleEditForm() {

		alert($('#moduleEditForm').serialize() );

}

</script>
</body>
</html>
