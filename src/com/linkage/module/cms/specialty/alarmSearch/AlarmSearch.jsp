<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK" import="java.util.Map"%>
<%@taglib prefix="s" uri="/struts-tags"%> 
<html >	
    <!-- 
    Smart developers always View Source. 
    
    This application was built using Adobe Flex, an open source framework
    for building rich Internet applications that get delivered via the
    Flash Player or to desktops via Adobe AIR. 
    
    Learn more about Flex at http://flex.org 
    // -->

    <head>
        <title>�ۺϼ��--�澯��ѯ</title>         
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
        			document.getElementById('AlarmSearch').confCallBack();
        		}catch(e)
        		{
        			alert(e);
        		}
        	}
        	
        	function open4sheet(url, data)
        	{
        		document.getElementById('warnStr').value=data.warnStr;
				document.getElementById('type').value=data.type;
				document.getElementById("exportFrm").action=url;
				document.getElementById("exportFrm").target='_blank';
				document.getElementById("exportFrm").submit();
        	}
        
			function export2Excel(url, data, type)
			{
				if(type == "1")
				{
					document.getElementById('beginRowNum').value=data.beginRowNum;
					document.getElementById('endRowNum').value=data.endRowNum;
					document.getElementById('maxnum').value=data.maxnum;
					document.getElementById('isExce').value=data.isExce;
					document.getElementById('timeType').value=data.timeType;
					document.getElementById('startTime').value=data.startTime;
					document.getElementById('endTime').value=data.endTime;
					document.getElementById('alarmregion').value=data.alarmregion;
					document.getElementById('vendor').value=data.vendor;
					document.getElementById('specialty').value=data.specialty;
					document.getElementById('equipmentclass').value=data.equipmentclass;
					document.getElementById('nename').value=data.nename;
					document.getElementById('nename_flag').value=data.nename_flag;
					document.getElementById('alarmseverity').value=data.alarmseverity;
					document.getElementById('alarmStatus').value=data.alarmStatus;
					document.getElementById('alarmtitle').value=data.alarmtitle;
					document.getElementById('alarmtitle_flag').value=data.alarmtitle_flag;
					document.getElementById('ackStatus').value=data.ackStatus;
					document.getElementById('sheetStatus').value=data.sheetStatus;
					document.getElementById('dispStatus').value=data.dispStatus;
					document.getElementById('projectStatus').value=data.projectStatus;
					document.getElementById('alarmuniqueid').value=data.alarmuniqueid;
					document.getElementById('alarmuniqueid_flag').value=data.alarmuniqueid_flag;
					document.getElementById('vendorserialno').value=data.vendorserialno;
					document.getElementById('vendorserialno_flag').value=data.vendorserialno_flag;
					document.getElementById('sheetno').value=data.sheetno;
					document.getElementById('sheetno_flag').value=data.sheetno_flag;
					document.getElementById('rule_id').value=data.rule_id;
					document.getElementById('isGroup').value=data.isGroup;
					document.getElementById('isLight').value=data.isLight;
					document.getElementById('isRela').value=data.isRela;
					document.getElementById('systemname').value=data.systemname;
					document.getElementById('nmsalarmtype').value=data.nmsalarmtype;
					document.getElementById('servicesystem').value=data.servicesystem;
					document.getElementById('serviceSystem_flag').value=data.serviceSystem_flag;
					document.getElementById('businesssystem').value=data.businesssystem;
					document.getElementById('businessSystem_flag').value=data.businessSystem_flag;
					document.getElementById('projectno').value=data.projectno;
					document.getElementById('projectno_flag').value=data.projectno_flag;
					document.getElementById('locatenename').value=data.locatenename;
					document.getElementById('locatenename_flag').value=data.locatenename_flag;
					
					document.getElementById('circ_name').value=data.circ_name;
					document.getElementById('circ_name_flag').value=data.circ_name_flag;

					document.getElementById('sceneName').value=data.sceneName;
					document.getElementById('sceneNameFlag').value=data.sceneNameFlag;

					document.getElementById('areaName').value=data.areaName;
					document.getElementById('areaNameFlag').value=data.areaNameFlag;
					
					document.getElementById('groupcustomer').value=data.groupcustomer;
					document.getElementById('groupcustomer_flag').value=data.groupcustomer_flag;
					document.getElementById('cusbuss_id').value=data.cusbuss_id;
					document.getElementById('cusbuss_id_flag').value=data.cusbuss_id_flag;
					
					
					document.getElementById('customerclass').value=data.customerclass;
					document.getElementById('businesslevel').value=data.businesslevel;
					document.getElementById('safelevel').value=data.safelevel;
					document.getElementById('businesscategory').value=data.businesscategory;
					
					document.getElementById('login_name').value=data.login_name;
				}
				else
				{
					document.getElementById('alarmuniqueids').value=data.alarmuniqueids;
					document.getElementById('startTime').value=data.startTime;
					document.getElementById('endTime').value=data.endTime;
				}
				
				document.getElementById("exportFrm").action=url;
				document.getElementById("exportFrm").submit();
				
			}

            <!-- For version detection, set to min. required Flash Player version, or 0 (or 0.0.0), for no version detection. --> 
            var swfVersionStr = "10.0.0";
            <!-- To use express install, set to playerProductInstall.swf, otherwise the empty string. -->
            var xiSwfUrlStr = "/cms/flex-release/playerProductInstall.swf";
            var flashvars = {'login_name':'<%=login_name %>'};
			flashvars.context = "<s:url value="/"/>";
            flashvars.styleUrl="<s:url value="/"/>flex-release/css/common/<s:property value="#session.ui_theme_key==null?'show':#session.ui_theme_key"/>/ui.swf";
            flashvars.moduleUrl="<s:url value='/flex-release/com/linkage/module/cms/specialty/alarmSearch/AlarmSearchModule.swf'/>";
            var params = {};
            params.quality = "high";
            params.bgcolor = "#ffffff";
            params.allowscriptaccess = "sameDomain";
            params.allowfullscreen = "true";
            params.wmode = "window";
            var attributes = {};
            attributes.id = "AlarmSearch";
            attributes.name = "AlarmSearch";
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
    	<form action="" method="post" name="exportFrm" id="exportFrm"  style="display:none">
    		<input type="hidden" name="alarmuniqueids" id="alarmuniqueids"/>
    		<input type="hidden" name="beginRowNum" id="beginRowNum"/>
    		<input type="hidden" name="endRowNum" id=endRowNum/>
    		<input type="hidden" name="maxnum" id=maxnum/>
    		<input type="hidden" name="isExce" id=isExce/>
    		<input type="hidden" name="timeType" id="timeType"/>
    		<input type="hidden" name="startTime" id=startTime/>
    		<input type="hidden" name="endTime" id=endTime/>
    		<input type="hidden" name="alarmregion" id=alarmregion/>
    		<input type="hidden" name="vendor" id=vendor/>
    		<input type="hidden" name="specialty" id=specialty/>
    		<input type="hidden" name="equipmentclass" id=equipmentclass/>
    		<input type="hidden" name="nename" id=nename/>
    		<input type="hidden" name="nename_flag" id=nename_flag/>
    		<input type="hidden" name="alarmseverity" id=alarmseverity/>
    		<input type="hidden" name="alarmStatus" id=alarmStatus/>
    		<input type="hidden" name="alarmtitle" id=alarmtitle/>
    		<input type="hidden" name="alarmtitle_flag" id=alarmtitle_flag/>
    		<input type="hidden" name="ackStatus" id=ackStatus/>
    		<input type="hidden" name="sheetStatus" id=sheetStatus/>
    		<input type="hidden" name="dispStatus" id=dispStatus/>
    		<input type="hidden" name="projectStatus" id=projectStatus/>
    		<input type="hidden" name="alarmuniqueid" id=alarmuniqueid/>
    		<input type="hidden" name="alarmuniqueid_flag" id=alarmuniqueid_flag/>
    		<input type="hidden" name="vendorserialno" id=vendorserialno/>
    		<input type="hidden" name="vendorserialno_flag" id=vendorserialno_flag/>
    		<input type="hidden" name="sheetno" id=sheetno/>
    		<input type="hidden" name="sheetno_flag" id=sheetno_flag/>
    		<input type="hidden" name="rule_id" id=rule_id/>
    		<input type="hidden" name="isGroup" id=isGroup/>
    		<input type="hidden" name="isLight" id=isLight/>
    		<input type="hidden" name="isRela" id=isRela/>
    		<input type="hidden" name="systemname" id=systemname/>
    		<input type="hidden" name="nmsalarmtype" id=nmsalarmtype/>
    		<input type="hidden" name="servicesystem" id=servicesystem/>
    		<input type="hidden" name="serviceSystem_flag" id=serviceSystem_flag/>
    		<input type="hidden" name="projectno" id=projectno/>
    		<input type="hidden" name="projectno_flag" id=projectno_flag/>
    		<input type="hidden" name="locatenename" id=locatenename/>
    		<input type="hidden" name="locatenename_flag" id=locatenename_flag/>
    		
    		<input type="hidden" name="circ_name" id=circ_name/>
    		<input type="hidden" name="circ_name_flag" id=circ_name_flag/>
    		
    		<input type="hidden" name="groupcustomer" id=groupcustomer/>
    		<input type="hidden" name="groupcustomer_flag" id=groupcustomer_flag/>
    		<input type="hidden" name="cusbuss_id" id=cusbuss_id/>
    		<input type="hidden" name="cusbuss_id_flag" id=cusbuss_id_flag/>
    		
    		<input type="hidden" name="customerclass" id=customerclass/>
    		<input type="hidden" name="businesslevel" id=businesslevel/>
    		<input type="hidden" name="safelevel" id=safelevel/>
    		<input type="hidden" name="businesscategory" id=businesscategory/>
    		
    		<input type="hidden" name="login_name" id=login_name/>
    		
    		
    		<input type="hidden" name="warnStr" id=warnStr/>
    		<input type="hidden" name="type" id=type/>
    	</form>
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
            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="100%" height="100%" id="AlarmSearch">
                <param name="movie" value="/cms/flex-release/AlarmSearch.swf" />
                <param name="quality" value="high" />
                <param name="bgcolor" value="#ffffff" />
                <param name="allowScriptAccess" value="sameDomain" />
                <param name="allowFullScreen" value="true" />
                <param name="wmode" value="window" /> 
                <!--[if !IE]>-->
                <object type="application/x-shockwave-flash" data="AlarmSearch.swf" width="100%" height="100%">
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
                        <img src="" alt="" />
                    </a>
                <!--[if !IE]>-->
                </object>
                <!--<![endif]-->
            </object>
	    </noscript>	
   </body>
</html>
