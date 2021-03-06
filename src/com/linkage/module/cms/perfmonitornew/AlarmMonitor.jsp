<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="lk" uri="/linkage"%>
<%@taglib prefix="ui" uri="/ailk-ui"%>
<%
	String sessId = request.getSession().getId();
	Map map = (Map) request.getSession().getAttribute(
			"session_userinfo");
%>
<%--
/**
 * 该jsp的描述信息
 * @author panyin(66870)
 * @version 1.0
 * @since 2012-7-26
 * 
 * <br>版权：南京联创科技 网管科技部
 * 
 */
 --%>
<%@page import="java.util.Map"%>
<html>
<head>
<title></title>
<ui:uiheader />
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<style type="text/css" media="screen">
html,body {
	height: 100%;
}

body {
	margin: 0;
	padding: 0;
	overflow: auto;
	text-align: center;
	background-color: #ffffff;
}

#flashContent {
	display: none;
}
</style>

<link rel="stylesheet" type="text/css"
	href="<s:url value="/flex-release/history/history.css"/>" />
	
<script type="text/javascript"
	src="<s:url value="/flex-release/history/history.js"/>"></script>
	
<script type="text/javascript"
	src="<s:url value="/flex-release/history/history.js"/>"></script>

<!-- END Browser History required section -->

<script type="text/javascript"
	src="<s:url value="/flex-release/swfobject.js"/>"></script>
	
<script type="text/javascript" src="<s:url value="/cms/Js/alarm.js"/>"></script>

<script type="text/javascript">            var swfVersionStr = "10.0.0";
            <!-- To use express install, set to playerProductInstall.swf, otherwise the empty string. -->
            var xiSwfUrlStr = "<s:url value="/"/>flex-release/playerProductInstall.swf";
           
			var flashvars = {};
            flashvars.styleUrl="<s:url value="/"/>flex-release/css/common/<s:property value="#session.ui_theme_key==null?'show':#session.ui_theme_key"/>/ui.swf";
			flashvars.moduleUrl="<s:url value='/flex-release/com/linkage/module/cms/perfmonitornew/alarm/AlarmMonitor.swf'/>";
            flashvars.context = "<s:url value="/"/>";
          
            var sessionId = "<%=sessId%>";
            var account = "<%=map.get("acc_loginname")%>";
            var roleId = "<%=map.get("role_id")%>";
            var areaId = "<%=map.get("area_id")%>";
            
            flashvars.mapInfo = "{'sessionId':'" + sessionId + 
            	"','account':'" + account + 
            	"','roleId':'" + roleId + 
            	"','areaId':'" + areaId + 
            	"','context':'<s:url value="/"/>'}";
            	
            flashvars.areaId = areaId;
            flashvars.account = account;
           
            flashvars.level = "1";
            flashvars.LogLevel="debug";
            flashvars.LogType="1"
			flashvars.LogFilters="com.linkage.module.cms.perfmonitornew.*";

            
            var params = {};
            params.quality = "high";
            params.bgcolor = "#ffffff";
            params.allowscriptaccess = "sameDomain";
            params.allowfullscreen = "true";
            params.wmode = "window";

            var attributes = {};
            attributes.id = "AlarmMonitor";
            attributes.name = "AlarmMonitor";
            attributes.align = "middle";
            swfobject.embedSWF(
                "<s:url value="AlarmMonitorApp.swf"/>", "flashContent", 
                "100%", "100%", 
                swfVersionStr, xiSwfUrlStr, 
                flashvars, params, attributes);
			<!-- JavaScript enabled so display the flashContent div in case it is not replaced with a swf object. -->
			swfobject.createCSS("#flashContent", "display:block;text-align:left;");
			
			
			function export2Excel(url, data, type)
			{
				if(type == "1" || type == "2")
				{
					document.getElementById('sheetName').value=data.sheetName;
					document.getElementById('cityId').value=data.cityId;
				}

				document.getElementById("exportFrm").action=url;
				document.getElementById("exportFrm").submit();
			}
function exportExcelLoc(url,type,datas)
			{
				if($("#exportExcelLoc").length == 0)
				{
					$("body").append("<form id='exportExcelLoc' method='post' style='display:none;'><input type='hidden' id='dataStr' name='datas'/><input type='hidden' id='dataType' name='type'/></form>");
				}
				$("#dataStr").val(datas);
				$("#dataType").val(type);
				$("#exportExcelLoc").attr("action",url);
				$("#exportExcelLoc").submit();
			}
			
        </script>
</head>
<body>

	<form action="" method="post" name="exportFrm" id="exportFrm"
		style="display: none">
		<input type="hidden" id="sheetName" name="sheetName" /> <input
			type="hidden" id="cityId" name="cityId" />

	</form>


	<!-- SWFObject's dynamic embed method replaces this alternative HTML content with Flash content when enough 
			 JavaScript and Flash plug-in support is available. The div is initially hidden so that it doesn't show
			 when JavaScript is disabled.
		-->
	<div id="flashContent">
		<p>To view this page ensure that Adobe Flash Player version 10.0.0
			or greater is installed.</p>
	</div>

	<noscript>
		<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
			width="100%" height="100%" id="AlarmMonitor">
			<param name="movie" value="<s:url value="/flex-release/Main.swf"/>" />
			<param name="quality" value="high" />
			<param name="bgcolor" value="#ffffff" />
			<param name="allowScriptAccess" value="sameDomain" />
			<param name="allowFullScreen" value="true" />
			<!--[if !IE]>-->
			<object type="application/x-shockwave-flash"
				data="<s:url value="/flex-release/Main.swf"/>" width="100%"
				height="100%">
				<param name="quality" value="high" />
				<param name="bgcolor" value="#ffffff" />
				<param name="allowScriptAccess" value="sameDomain" />
				<param name="allowFullScreen" value="true" />
				<!--<![endif]-->
				<!--[if gte IE 6]>-->
				<p>Either scripts and active content are not permitted to run or
					Adobe Flash Player version 10.0.0 or greater is not installed.</p>
				<!--<![endif]-->
				<!--[if !IE]>-->
			</object>
			<!--<![endif]-->
		</object>
	</noscript>
</body>
</html>