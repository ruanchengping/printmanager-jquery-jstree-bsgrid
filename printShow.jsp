<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="utf-8">
<head>
	<meta charset="utf-8">
	<title>打印管理</title>
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
    <link rel="stylesheet" href="bsgrid/validationEngine/css/validationEngine.jquery.css"/>	
</head>
<body>
	<script src="js/jquery.min.js"></script>
	<script type="text/javascript" src="bsgrid/js/lang/grid.zh-CN.min.js"></script>
	<script type="text/javascript" src="bsgrid/merged/bsgrid.all.min.js"></script>
	<script type="text/javascript" src="bsgrid/js/common.min.js"></script>
	<script type="text/javascript" src="bsgrid/js/util.min.js"></script>
	<script type="text/javascript" src="bsgrid/js/form.min.js"></script>
	
	<script type="text/javascript" src="bsgrid/validationEngine/js/languages/jquery.validationEngine-zh_CN.js"></script>
	<script type="text/javascript" src="bsgrid/validationEngine/js/jquery.validationEngine.js"></script>
	<script type="text/javascript" src="bsgrid/validationEngine-addition-rules.js"></script>
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
				<input type="radio" id="copy" name="radio"><label for="copy">复制</label>
				<input type="radio" id="cut" name="radio"><label for="cut">剪切</label>
				<input type="radio" id="paste" name="radio"><label for="paste">粘贴</label>
		</div>
		<div id="controlgroup1">
			<button id="queryModule">查询</button>
			<button id="refreshModule">刷新</button>
		</div>
		
		<div id="controlgroup2">
			<button id="design">格式设计</button>		
			<button id="import">导入</button>
			<button id="export">导出</button>
		</div>
	</div>
</fieldset>
<table width="100%" style="margin:5px">
	<tbody>
	<tr>
	<td style="width:30%">
		<div style="border:1px solid #ccc;vertical-align:top;height:850px;overflow: auto">
			<div style="margin:5px">打印模板分类</div>
			<div>
				<span>&nbsp;&nbsp;</span>
				<span id="controlgroup3" style="float:right;margin-right:1px;">
					<button id="addSort"><span class="ui-icon ui-icon-plus"></span>新增</button>
					<button id="editSort"><span class="ui-icon ui-icon-pencil"></span>修改</button>
					<button id="deleteSort"><span class="ui-icon ui-icon-closethick"></span>删除</button>
					
					
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
						<th w_check="true" w_index="id" width="5%;"></th>
						<th w_index="code" width="15%;">模板编码</th>
						<th w_index="name" width="15%;">模板名称</th>
						<th w_index="pk_dir" w_align="left" width="15%;">模板分类编码</th>
						<th w_index="pk_dirname" w_align="left" width="15%;">模板分类名称</th>						
						<th w_index="descrpition" w_align="left" width="20%;">说明</th>
						<th w_index="id" width="15%;" >模板ID</th>

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
				<td class="formInput" >
				<input id="pk_dir" name="pk_dir" type="hidden" value="" />
				<input id="pk_dirname" name="pk_dirname" editAble="false" type="text" value="" />
				</td>
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
					<input id="pk_parent" name="pk_parent" type="hidden" value="" />
					<input id="sortParent" name="sortParent" editAble="false" type="text" value="" />
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


$( "#design" ).click(function( event ) {
	window.open('desigener/index.html#/app/StandardPrintArea?id=123', 'newwindow', 'height=800, width=1400, top=50, left=50, toolbar=no, menubar=no, scrollbars=no, resizable=yes, location=no, status=no'); //该句写成一行代码
});
$( "#import" ).click(function( event ) {
	window.open('desigener/index.html#/app/StandardPrintArea?id=123', 'newwindow', 'height=800, width=1400, top=50, left=50, toolbar=no, menubar=no, scrollbars=no, resizable=yes, location=no, status=no'); //该句写成一行代码
});
$( "#export" ).click(function( event ) {
	window.open('desigener/index.html#/app/StandardPrintArea?id=123', 'newwindow', 'height=800, width=1400, top=50, left=50, toolbar=no, menubar=no, scrollbars=no, resizable=yes, location=no, status=no'); //该句写成一行代码
});


$( "#button2" ).button({ label: "格式设计" });
$( "#radioset1" ).buttonset();
$( "#controlgroup" ).controlgroup();
$( "#controlgroup1" ).controlgroup();
$( "#controlgroup2" ).controlgroup();
$( "#controlgroup3" ).controlgroup();

/****************以下是 工具 ************************/

//获取时间格式化
function gshtime(time)
{
	var year = time.getFullYear();       //年</span>
	var month = time.getMonth() + 1;  //月
	var day = time.getDate();         //日
	var hh = time.getHours();       //时
	var mm = time.getMinutes();    //分
	var seconds = time.getSeconds();
	var str= year + "-";
	if(month < 10)
		str+= "0";
	str+= month + "-";
	if(day < 10)
		str+= "0";
	str+= day + " ";
	if(hh < 10)
		hh= "0"+hh;
	str+= hh + ":";
	if(mm < 10){
		mm= "0"+mm;
	}
	str+= mm + ":";
	if(seconds < 10)
		seconds= "0"+seconds;
	str+= seconds;
	console.log(str);
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
/***********************************************************/

var doFlag = "";//复制剪切粘贴的标记,0剪贴，1复制
var pasteIds = [];//粘贴的主键ids
$( "#copy" ).click(function( event ) {
	var ids = gridObj.getCheckedValues('id');
	var records = gridObj.getCheckedRowsRecords();
	for(var i=0;i<records.length;i++){
		
	}
	console.log(ids);
	if(ids.length>0 && ids[0]!=""){
		doFlag = '1';
		pasteIds = ids;
	}else{
		alert("请至少选择一行数据！");
	}
	event.preventDefault();
});

$( "#cut" ).click(function( event ) {
	var ids = gridObj.getCheckedValues('id');
	console.log(ids);
	if(ids.length>0 && ids[0]!=""){
		doFlag = '0';
		pasteIds = ids;
	}else{
		alert("请至少选择一行数据！");
	}
	event.preventDefault();
});
$( "#paste" ).click(function( event ) {
	var id = treeNodeId.id;//打印模板分类id
	if(pasteIds.length==0){
		alert("请至少选择一行数据！");
	}else{
		var templates = "";
		for(var i=0;i<pasteIds;i++){
			templates += pasteIds[i];
		}
		if(doFlag != ''){
			//pasteIds,insert into sql将编码和名称 后面加Copy(计数)
			var resultCode = {
						      "descatalog": id,
						      "copyFlag": doFlag,
						      "templates": templates,					      
						    };
			var url="http://localhost:8081/print/pasteTemplates";
			$.ajax({
			    url: url,
			    type: 'POST',
			    contentType: "application/json",
			    processData: false,
			    data: JSON.stringify(resultCode)
			  })
			  .done(function(data) {				  
				  alert(data.msg);
				  if(data.flag == 1){
					//查询后刷新表格					    		
						$('#searchTable_pt_outTab').remove();
						$(function () {
							gridObj = $.fn.bsgrid.init('searchTable', {
								dataType: 'jsonp',
					            url: "http://localhost:8081/print/loadPrintTemplatesQuery",
					            pageSizeSelect: true,
					            pageSize: 10,
								stripeRows: true,
								rowSelectedColor: true,
								displayBlankRows:false,
								rowHoverColor: true,
								extend: {
					                settings: {
					                     supportColumnMove: true, // if support extend column move, default false	       	               
					                }
					            },
							});
							doSearch(id);
						});
				  }
				  doFlag = "";
				  pasteIds = [];
			  }).fail(function(data) {
			      if(doFlag == "0"){
			    	  alert("剪切粘贴失败！");		    	
			      }else{
			    	  alert("复制粘贴失败！");    	 
			      }
			      doFlag = "";
				  pasteIds = [];
			  });
		}//if
	}
	
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
						console.log($('#moduleEditForm').serialize());
						//后台操作 增加模板
						var myDate=gshtime(new Date());
						var resultCode = {
					      "id": $( "#id" ).val()==""?null:$( "#id" ).val(),
					      "name": $( "#name" ).val(),
					      "code": $( "#code" ).val(),
					      "pk_dir": $( "#pk_dir" ).val(),
					      "creator": null,
					      "creationtime": null,
					      "modifier": null,
					      "modifiedtime": myDate,
					      "description": $( "#descrpition" ).val(),
					      "xmlData": null,
					      "jsonData": null
					    };
						var url="http://localhost:8081/print/savePrintTemplate";
						$.ajax({
						    url: url,
						    type: 'POST',
						    contentType: "application/json",
						    processData: false,
						    data: JSON.stringify(resultCode)
						  })
						  .done(function(data) {
						      console.log(data);
						      if(data.flag==1){
						    	alert("打印模板保存成功！");						    	
					    		
					    		//刷新表格					    		
					    		var id = treeNodeId.id;
					    		
					    		$('#searchTable_pt_outTab').remove();
					    		$(function () {
					    			gridObj = $.fn.bsgrid.init('searchTable', {
					    				dataType: 'jsonp',
					    	            url: "http://localhost:8081/print/loadPrintTemplatesAjax",//'data/json.jsp',//
					    	             //autoLoad: false,
					    	            pageSizeSelect: true,
					    	            pageSize: 10,
					    				stripeRows: true,
					    				rowSelectedColor: true,
					    				displayBlankRows:false,
					    				rowHoverColor: true,
					    				extend: {
					    	                settings: {
					    	                     supportColumnMove: true, // if support extend column move, default false	       	               
					    	                }
					    	            },
					    			});
					    		 doSearch(id);
					    		});
                                
						    	$( "#moduleEdit" ).dialog( "close" );
						      }else{
								  alert(data.msg);
								  
							  }
						  })
						  .fail(function(data) {						      
						    	alert("打印模板保存失败！");  
						      
						  });
						
						
					
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
	if(JSON.stringify(treeNodeId)=="{}" ){
		alert("请选择一个树节点！");
	}else{
		var sortId = treeNodeId.data.sortId;//主键
		var url="http://localhost:8081/print/loadCatalogByID?id="+sortId;
		$.ajax({
		    url: url,
		    type: 'GET',
		    contentType: "application/json",
		    processData: false,
		    //data: JSON.stringify(resultCode)
		  })
		  .done(function(data) {
		        var sortId = treeNodeId.data.sortId;//主键
				var pk_dirname = data.resultObj.name;
				$( "#pk_dir" ).val(sortId);
				$( "#pk_dirname" ).val(pk_dirname);
				$( "#code" ).val("");
				$( "#name" ).val("");
				$( "#descrpition" ).val("");
				$( "#id" ).val("");

				$( "#moduleEdit" ).dialog( "open" );
				$( "#moduleEdit" ).dialog( {title:"新增模板"} );

				// 隐藏所有校验提示
			    $('#moduleEditForm').validationEngine('hideAll');
			    formObj.showForm('edit');
		  });
		
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
	console.log(ids);
	if(ids.length>0){
		//后端删除
		for(var i=0;i<ids.length;i++){
			var url="http://localhost:8081/print/deleteTemplateByID?id="+ids[i];//根获取子模板分类
			$.ajax({
			    url: url,
			    type: 'DELETE',
			    contentType: "application/json",
			    processData: false,
			 })
			  .done(function(data) {
			  console.log(data);
			  if(data.flag==1){
				  alert("打印模板删除成功！");
			  }else{
				  alert(data.msg);
			  }
			}).fail(function(data) {
			  console.log(data);
			  alert("打印模板删除失败！");
			})
		}
	}else{
		alert("请至少选择一行数据！");
	}
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
				
				//查询后刷新表格					    		
				$('#searchTable_pt_outTab').remove();
				$(function () {
					gridObj = $.fn.bsgrid.init('searchTable', {
						dataType: 'jsonp',
			            url: "http://localhost:8081/print/loadPrintTemplatesQuery",
			            pageSizeSelect: true,
			            pageSize: 10,
						stripeRows: true,
						rowSelectedColor: true,
						displayBlankRows:false,
						rowHoverColor: true,
						extend: {
			                settings: {
			                     supportColumnMove: true, // if support extend column move, default false	       	               
			                }
			            },
					});
				 doSearchTable();
				});
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
	if(JSON.stringify(treeNodeId)=="{}" ){
		alert("请选择一个树节点！");
	}else{
		event.preventDefault();
		//刷新表格					    		
		var id = treeNodeId.id;
		$('#searchTable_pt_outTab').remove();
		$(function () {
			gridObj = $.fn.bsgrid.init('searchTable', {
				dataType: 'jsonp',
	            url: "http://localhost:8081/print/loadPrintTemplatesAjax",
	            pageSizeSelect: true,
	            pageSize: 10,
				stripeRows: true,
				rowSelectedColor: true,
				displayBlankRows:false,
				rowHoverColor: true,
				extend: {
	                settings: {
	                     supportColumnMove: true, // if support extend column move, default false	       	               
	                }
	            },
			});
		 doSearch(id);
		});
	}
});

$( "#queryModule" ).click(function( event ) {
	$( "#codeq" ).val("");
	$( "#nameq" ).val("");
	$( "#moduleQuery" ).dialog( "open" );
	$( "#moduleQuery" ).dialog( {title:"查询模板"} );
	event.preventDefault();
});

//打印模板查询功能
function doSearchTable() {
    gridObj.options.otherParames = {'code':$("#codeq").val(),'name':$("#nameq").val()};
  	gridObj.page(1);
}

/****************以下是sort增删改查 ************************/
var sortformObj;
$(function () {
	sortformObj = $.fn.bsgrid_form.init('sortEditForm', {});
	
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
					//var sortName = treeNodeId.text;
					//var submitName = $( "#sortName" ).val();
					
					var myDate=gshtime(new Date());
					console.log($('#sortEditForm'));
					 console.log($('#sortEditForm').serialize()+myDate);
					//后端处理
					var url="http://localhost:8081/print/savePrintCatalog";//保存分类
					var resultCode={
					    "name": $( "#sortName" ).val(),
					    "modulecode": $( "#modulecode" ).val(),
					    "pk_dir": $( "#sortId" ).val(),
					    "pk_parent": $( "#pk_parent" ).val(),
					    "creator": $( "#creator" ).val(),
					    "creationtime": null,
					    "modifier": $( "#modifier" ).val(),
					    "modifiedtime": myDate,
					    "description": $( "#remark" ).val()
					};
					$.ajax({
					    url: url,
					    type: 'POST',
					    contentType: "application/json; charset=utf-8",
					    processData: false,
					    data: JSON.stringify(resultCode)
					 })
					  .done(function(data) {
						  console.log(JSON.stringify(data));
						  if(data.flag=="1"){
							  alert("模板分类保存成功！");
							  //保存后刷新
							  $("#evts").jstree().refresh(true);
							  $( "#sortEdit" ).dialog( "close" );
						  }else{
							  alert(data.msg);
							  
						  }
					  
					}).fail(function(data) {
						  console.log(JSON.stringify(data));
						 alert("模板分类保存失败！ "); 
						
					  
					});
					//$( this ).dialog( "close" );
					
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
 	if(JSON.stringify(treeNodeId)=="{}" ){
		alert("请选择一个树节点！");
	}else{		
		var  sortId = treeNodeId.id;
		var sortName = treeNodeId.text;		
		$( "#pk_parent" ).val( sortId);
		$( "#sortParent" ).val( sortName);
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

 $( "#editSort" ).click(function( event ) {
	if(JSON.stringify(treeNodeId)=="{}" ){
		alert("请选择一个树节点！");
	}else if(treeNodeId.parent=="#" ){
		alert("树根节点不可修改！");
	}else{
		var pk_parent = treeNodeId.parent;
		//ajax获取节点名称
		var url="http://localhost:8081/print/loadCatalogByID?id="+pk_parent;
		$.ajax({
		    url: url,
		    type: 'GET',
		    contentType: "application/json",
		    processData: false,
		    //data: JSON.stringify(resultCode)
		  })
		  .done(function(data) {
		      var sortId = treeNodeId.data.sortId;//主键
			  var sortName = treeNodeId.text;			  
		      var modulecode = treeNodeId.id;
				var remark = treeNodeId.data.remark;//说明，树节点除了id,title,parent以外增加的信息
				var creator = treeNodeId.data.creator;
				var sortParent = data.resultObj.name;
				var creationtime = treeNodeId.data.creationtime;
				$( "#sortId" ).val(sortId);
				$( "#sortName" ).val(sortName);
				$( "#pk_parent" ).val(pk_parent);
				$( "#sortParent" ).val(sortParent);
				$( "#modulecode" ).val(modulecode);
				$( "#remark" ).val(remark);
				$( "#creator" ).val(creator);		
				$( "#creationtime" ).val(creationtime);

				$( "#sortEdit" ).dialog( "open" );
				$( "#sortEdit" ).dialog( {title:"修改分类"} );
				// 隐藏所有校验提示
		        $('#sortEditForm').validationEngine('hideAll');
		        sortformObj.showForm('edit');
		  });
		
	}

	event.preventDefault();
});

 $( "#deleteSort" ).click(function( event ) {
	 if(JSON.stringify(treeNodeId)=="{}" ){
		 alert("请选择一个树节点！");
	 }else{
		//后端删除
		
		 var url="http://localhost:8081/print/deleteCatalogByID?id="+treeNodeId.data.sortId;

		 $.ajax({
		     url: url,
		     type: 'DELETE',
		     contentType: "application/json",
		     processData: false,
		   })
		   .done(function(data) {
		       console.log(data.flag==1);
		       if(data.flag==1){
		    	   alert("模板分类删除 成功！");
		       }else{
		    	   alert(data.msg);
		       }
		   })
		   .fail(function(data) {	      
		    	alert("模板分类删除 失败！");
		   });
	}
	event.preventDefault();
});

/****************以下是tree ************************/
var treeNodeId={};
var rootId="";
loadTree();

function doSearch(id) {
    // 提供以下三种带参数方式，可任选其中任意一种
    // gridObj.options.otherParames = 'param1=val1¶m2=val2';
    // gridObj.options.otherParames = {'param1': 'val1', 'param2': 'val2'};
  //  gridObj.options.otherParames = $('#searchForm').serializeArray();      // jQuery推荐方式
  gridObj.options.otherParames = 'id='+id;
  gridObj.page(1);
}
// inline data demo
function loadTree(){
	$('#evts')
    .on("changed.jstree", function (e, data) {
    	console.log(data);
    	
    	if(data.selected.length) {
    		treeNodeId = data.instance.get_node(data.selected[0]);//选择的树节点信息
    		var id = treeNodeId.id;
    		//后端处理，根据treeNodeId 联动 表格		
    		$('#searchTable_pt_outTab').remove();
    		$(function () {
    			gridObj = $.fn.bsgrid.init('searchTable', {
    				dataType: 'jsonp',
    	            url: "http://localhost:8081/print/loadPrintTemplatesAjax",//'data/json.jsp',//
    	             //autoLoad: false,
    	            pageSizeSelect: true,
    	            pageSize: 10,
    				stripeRows: true,
    				rowSelectedColor: true,
    				displayBlankRows:false,
    				rowHoverColor: true,
    				extend: {
    	                settings: {
    	                     supportColumnMove: true, // if support extend column move, default false	       	               
    	                }
    	            },
    			});
    		 doSearch(id);
    		});
    	}
    })
    .jstree({
    	'core' : {
    		"data" : function (node, cb) {
    			
    			//获取树的根节点pk_dir
    			var url="http://localhost:8081/print/loadRootCatalogs";//根获取子模板分类
				$.ajax({
				    url: url,
				    type: 'GET',
				    contentType: "application/json; charset=utf-8",
				    processData: false,
				 })
				  .done(function(data) {
					  rootId=data.resultObj[0].pk_dir;

					  if(node.id==="#"){//树控件默认根节点是#
							id="";
						}else{
							id=node.id;
						}
						var url="http://localhost:8081/print/loadTree?id="+id;//根获取子模板分类
						$.ajax({
						    url: url,
						    type: 'GET',
						    contentType: "application/json; charset=utf-8",
						    processData: false,
						 })
						  .done(function(data) {
							  console.log(JSON.stringify(data));
						  cb(data);
						});
				});	
				
			}
    	}
    });
}


/****************以下是table ************************/
var backData = [];

var gridObj;

$('#searchTable_pt_outTab').remove();
$(function () {
		gridObj = $.fn.bsgrid.init('searchTable', {
			dataType: 'jsonp',
           url: "http://localhost:8081/print/loadPrintTemplatesAjax",//'data/json.jsp',//
            //autoLoad: false,
           pageSizeSelect: true,
           pageSize: 10,
			stripeRows: true,
			rowSelectedColor: true,
			displayBlankRows:false,
			rowHoverColor: true,
			extend: {
               settings: {
                    supportColumnMove: true, // if support extend column move, default false	       	               
               }
           },
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
