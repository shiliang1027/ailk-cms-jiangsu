package com.linkage.module.cms.groupclientalarm
{
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;
	
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class Config
	{
		private static var log:ILogger = Log.getLogger("com.linkage.module.cms.groupclient.data.Config");
		[Bindable]
		private static var _alarmColorConfig:Array=new Array();
		public function Config()
		{
		}
		public static function init():void{
			var service:HTTPService = new HTTPService();  
			service.url = "com/linkage/module/cms/groupclient/xml/AlarmConfig.xml";   
			service.method="get";
			service.resultFormat="e4x";
			service.addEventListener(ResultEvent.RESULT, function(event:ResultEvent):void{
				var config:XML = event.result as XML;
				
				for each(var color:XML in event.result.Color){
					
					_alarmColorConfig[color.Lever]=color.Value;
				}
			});   
			service.send(); 
		}
		
		public static function get alarmColorConfig():Array{
			return _alarmColorConfig;
		}
	}
}