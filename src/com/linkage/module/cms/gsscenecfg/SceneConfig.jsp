<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="lk" uri="/linkage"%>
<%@taglib prefix="ui" uri="/ailk-ui"%>
<%
	String sessId = request.getSession().getId();
	Map map = (Map) request.getSession().getAttribute("session_userinfo");
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
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		     <style type="text/css" media="screen"> 
			html, body	{ height:100%; }
			body { margin:0; padding:0; overflow:auto; text-align:center; 
			       background-color: #ffffff; }   
			#flashContent { display:none; }
        </style>
		
		<!-- Enable Browser History by replacing useBrowserHistory tokens with two hyphens -->
        <!-- BEGIN Browser History required section -->
        <link rel="stylesheet" type="text/css" href="history/history.css" />
        <script type="text/javascript" src="history/history.js"></script>
        <!-- END Browser History required section -->  
		    
        <script type="text/javascript" src="swfobject.js"></script>
        <script type="text/javascript">
            <!-- For version detection, set to min. required Flash Player version, or 0 (or 0.0.0), for no version detection. --> 
            var swfVersionStr = "10.0.0";
            <!-- To use express install, set to playerProductInstall.swf, otherwise the empty string. -->
            var xiSwfUrlStr = "playerProductInstall.swf";
           
            var flashvars = {};
            
            flashvars.styleUrl="<s:url value="/"/>flex-release/css/common/<s:property value="#session.ui_theme_key==null?'show':#session.ui_theme_key"/>/ui.swf";
		        flashvars.context = "<s:url value="/"/>";
	          
	          flashvars.sessionId = "<%=sessId%>";
	          flashvars.acc_oid = "<%=map.get("acc_oid")%>";
	          flashvars.roleId = "<%=map.get("role_id")%>";
	          flashvars.areaId = "<%=map.get("area_id")%>";
	          flashvars.account = "<%=map.get("acc_loginname")%>";
	          
	         
	          flashvars.LogLevel="debug";
	          flashvars.LogType="1"
						flashvars.LogFilters="com.linkage.module.cms.gsscenecfg.*";
					
            var params = {};
            params.quality = "high";
            params.bgcolor = "#ffffff";
            params.allowscriptaccess = "sameDomain";
            params.allowfullscreen = "true";
            var attributes = {};
            attributes.id = "SceneConfig";
            attributes.name = "SceneConfig";
            attributes.align = "middle";
            swfobject.embedSWF(
                "SceneConfig.swf", "flashContent", 
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
				document.write("<a href='http://www.adobe.com/go/getflashplayer'><img src='" 
								+ pageHost + "www.adobe.com/images/shared/download_buttons/get_flash_player.gif' alt='Get Adobe Flash player' /></a>" ); 
			</script> 
        </div>
	   	
       	<noscript>
            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="100%" height="100%" id="SceneConfig">
                <param name="movie" value="SceneConfig.swf" />
                <param name="quality" value="high" />
                <param name="bgcolor" value="#ffffff" />
                <param name="allowScriptAccess" value="sameDomain" />
                <param name="allowFullScreen" value="true" />
                <!--[if !IE]>-->
                <object type="application/x-shockwave-flash" data="SceneConfig.swf" width="100%" height="100%">
                    <param name="quality" value="high" />
                    <param name="bgcolor" value="#ffffff" />
                    <param name="allowScriptAccess" value="sameDomain" />
                    <param name="allowFullScreen" value="true" />
                <!--<![endif]-->
                <!--[if gte IE 6]>-->
                	<p> 
                		Either scripts and active content are not permitted to run or Adobe Flash Player version
                		10.0.0 or greater is not installed.
                	</p>
                <!--<![endif]-->
                    <a href="http://www.adobe.com/go/getflashplayer">
                        <img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash Player" />
                    </a>
                <!--[if !IE]>-->
                </object>
                <!--<![endif]-->
            </object>
	    </noscript>		
   </body>
</html>
