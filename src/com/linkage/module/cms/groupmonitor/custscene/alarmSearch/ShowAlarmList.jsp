<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK" import="java.util.Map"%>
<%@taglib prefix="s" uri="/struts-tags"%> 
<%@taglib prefix="lk" uri="/linkage"%> 
<html>	
    <!-- 
    Smart developers always View Source. 
    
    This application was built using Adobe Flex, an open source framework
    for building rich Internet applications that get delivered via the
    Flash Player or to desktops via Adobe AIR. 
    
    Learn more about Flex at http://flex.org 
    // -->
    <head>
        <title></title>         
        <meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<!-- Include CSS to eliminate any default margins/padding and set the height of the html element and 
		     the body element to 100%, because Firefox, or any Gecko based browser, interprets percentage as 
			 the percentage of the height of its parent container, which has to be set explicitly.  Initially, 
			 don't display flashContent div so it won't show if JavaScript disabled.
		-->
        <style type="text/css" media="screen"> 
			html, body	{ height:100%; }
			body { margin:0; padding:0; overflow:hidden; text-align:center; 
			       background-color: #ffffff; }   
			#flashContent { display:none; }
        </style>
		<%
			Map map = (Map)session.getAttribute("session_userinfo");
			String login_name = String.valueOf(map.get("acc_loginname"));
			
			String isExce = request.getParameter("isExce");
			String startTime = request.getParameter("startTime");
			String endTime = request.getParameter("endTime");
			String alarmregion = request.getParameter("alarmregion");
			String vendor = request.getParameter("vendor");
			String specialty = request.getParameter("specialty");
			String equipmentclass = request.getParameter("equipmentclass");
			String nename = request.getParameter("nename");
			String neId = request.getParameter("neId");
			String alarmseverity = request.getParameter("alarmseverity");
			String alarmStatus = request.getParameter("alarmStatus");
			String alarmtitle = request.getParameter("alarmtitle");
			String ackStatus = request.getParameter("ackStatus");
			String sheetStatus = request.getParameter("sheetStatus");
			String dispStatus = request.getParameter("dispStatus");
			String projectStatus = request.getParameter("projectStatus");
			String sheetno = request.getParameter("sheetno");
			String rule_id = request.getParameter("rule_id");
			String isGroup = request.getParameter("isGroup");
			String isLight = request.getParameter("isLight");
			String isRela = request.getParameter("isRela");
			String neroom = request.getParameter("neroom");
			String customerFlag = request.getParameter("customerFlag");
			String rule_id = request.getParameter("groupcustomerNum");
			String isGroup = request.getParameter("pduSign");
			String isLight = request.getParameter("clentLevel");
			String isRela = request.getParameter("businessType");

		%>
		<!-- Enable Browser History by replacing useBrowserHistory tokens with two hyphens -->
        <!-- BEGIN Browser History required section -->
        <link rel="stylesheet" type="text/css" href="/cms/flex-release/history/history.css" />
        <script type="text/javascript" src="/cms/flex-release/history/history.js"></script>
        <!-- END Browser History required section -->  
		    
        <script type="text/javascript" src="/cms/flex-release/swfobject.js"></script>
        <script type="text/javascript">
        
        	var openParam = "status=no,toolbar=no,location=no,resizable=yes,menubar=no,top=40,left=150,height=645";
			function openUrl(url)
			{
				window.open(url,"",openParam);
			}
			
        	function showColConfWindow()
        	{
        		//var returnVal = window.showModalDialog("/cms/warn/view/config/warnViewConfAction!initViewSet.action?hangToolBar=yes&monitor_viewname=queryalarm&tab=displayColumn&time="+new Date().getTime(), null, "dialogWidth=700px;dialogHeight=500px");
        		  var returnVal = window.showModalDialog("/cms/warn/view/set/alarmSetAction!initViewSet.action?hangToolBar=yes&monitor_viewname=queryalarm&tab=ta_displaycolumn&time="+new Date().getTime(), null, "dialogWidth=700px;dialogHeight=500px");
        		try{
        			document.getElementById('ShowAlarmList').confCallBack();
        		}catch(e)
        		{
        			alert(e);
        		}
        	}
        
            <!-- For version detection, set to min. required Flash Player version, or 0 (or 0.0.0), for no version detection. --> 
            var swfVersionStr = "10.0.0";
            <!-- To use express install, set to playerProductInstall.swf, otherwise the empty string. -->
            var xiSwfUrlStr = "/cms/flex-release/playerProductInstall.swf";
            var flashvars = {'login_name':'<%=login_name %>'};
            flashvars.context = "<s:url value="/"/>";
            flashvars.styleUrl = "<s:url value="/"/>flex-release/css/common/<s:property value="#session.ui_theme_key==null?'show':#session.ui_theme_key"/>/ui.swf";
            flashvars.moduleUrl="<s:url value='/flex-release/com/linkage/module/cms/groupmonitor/custscene/alarmSearch/ShowAlarmListModule.swf'/>";
            flashvars.isExce = '<%=isExce %>';
            flashvars.startTime = '<%=startTime %>';
            flashvars.endTime = '<%=endTime %>';
            flashvars.alarmregion = '<%=alarmregion %>';
            flashvars.vendor = '<%=vendor %>';
            flashvars.specialty = '<%=specialty %>';
            flashvars.equipmentclass = '<%=equipmentclass %>';
            flashvars.nename = '<%=nename %>';
            flashvars.neroom = '<%=neroom %>';
            flashvars.neId = '<%=neId %>';
            flashvars.alarmseverity = '<%=alarmseverity %>';
            flashvars.alarmStatus = '<%=alarmStatus %>';
            flashvars.alarmtitle = '<%=alarmtitle %>';
            flashvars.ackStatus = '<%=ackStatus %>';
            flashvars.sheetStatus = '<%=sheetStatus %>';
            flashvars.dispStatus = '<%=dispStatus %>';
            flashvars.projectStatus = '<%=projectStatus %>';
            flashvars.sheetno = '<%=sheetno %>';
            flashvars.rule_id = '<%=rule_id %>';
            flashvars.isGroup = '<%=isGroup %>';
            flashvars.isLight = '<%=isLight %>';
            flashvars.isRela = '<%=isRela %>';
            flashvars.customerFlag = '<%=customerFlag %>';
            flashvars.isGroup = '<%=groupcustomerNum %>';
            flashvars.isLight = '<%=pduSign %>';
            flashvars.isRela = '<%=clentLevel %>';
            flashvars.customerFlag = '<%=businessType %>';
            
            var params = {};
            params.quality = "high";
            params.bgcolor = "#ffffff";
            params.wmode = "window";
            params.allowscriptaccess = "sameDomain";
            params.allowfullscreen = "true";
            var attributes = {};
            attributes.id = "ShowAlarmList";
            attributes.name = "ShowAlarmList";
            attributes.align = "middle";
            swfobject.embedSWF(
                "/cms/flex-release/Main.swf", "flashContent", 
                "100%", "100%", 
                swfVersionStr, xiSwfUrlStr, 
                flashvars, params, attributes);
			<!-- JavaScript enabled so display the flashContent div in case it is not replaced with a swf object. -->
			swfobject.createCSS("#flashContent", "display:block;text-align:left;");
        </script>
    </head>
    <body>
        <!-- SWFObject's dynamic embed method replaces this alternative HTML content with Flash content when enough 
			 JavaScript and Flash plug-in support is available. The div is initially hidden so that it doesn't show
			 when JavaScript is disabled.
		-->
        <div id="flashContent">
        	<p>
	        	To view this page ensure that Adobe Flash Player version 
				10.0.0 or greater is installed. 
			</p>
			<script type="text/javascript"> 
				var pageHost = ((document.location.protocol == "https:") ? "https://" :	"http://"); 
				document.write("<a href=''><img src='' alt='Get Adobe Flash player' /></a>" ); 
			</script> 
        </div>
	   	
       	<noscript>
            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="100%" height="100%" id="ShowAlarmList">
                <param name="movie" value="/cms/flex-release/ShowAlarmList.swf" />
                <param name="quality" value="high" />
                <param name="bgcolor" value="#ffffff" />
                <param name="allowScriptAccess" value="sameDomain" />
                <param name="allowFullScreen" value="true" />
                <param name="wmode" value="window" /> 
                <!--[if !IE]>-->
                <object type="application/x-shockwave-flash" data="ShowAlarmList.swf" width="100%" height="100%">
                    <param name="quality" value="high" />
                    <param name="bgcolor" value="#ffffff" />
                    <param name="allowScriptAccess" value="sameDomain" />
                    <param name="allowFullScreen" value="true" />
                    <param name="wmode" value="window" />
                <!--<![endif]-->
                <!--[if gte IE 6]>-->
                	<p> 
                		Either scripts and active content are not permitted to run or Adobe Flash Player version
                		10.0.0 or greater is not installed.
                	</p>
                <!--<![endif]-->
                    <a href="">
                        <img src="" alt="Get Adobe Flash Player" />
                    </a>
                <!--[if !IE]>-->
                </object>
                <!--<![endif]-->
            </object>
	    </noscript>		
   </body>
</html>
