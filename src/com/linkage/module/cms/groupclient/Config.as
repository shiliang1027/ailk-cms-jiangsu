package com.linkage.module.cms.groupclient
{
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class Config
	{
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