package demo
{
	import com.adobe.serialization.json.JSON;
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.system.structure.map.Map;
	
	import flash.display.Sprite;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	/**
	 * 参数缓存
	 * @author mengqiang
	 *
	 */
	public class ParamCache
	{
		private static var  log:ILogger = Log.getLoggerByClass(ParamCache);
		private static var service:HTTPService = new HTTPService();
		private static var paramCache:*;
		//static
		{
			service.url = "json/paramcache.json";
			service.method="POST";
			service.resultFormat = "text";
			service.addEventListener(ResultEvent.RESULT, function(event:ResultEvent):void{
				paramCache = JSON.decode(String(event.result));
				coulumnLabelMap = paramCache.coulumnLabelMap;
				levelLabelMap = paramCache.levelLabelMap;
				relationTypeLabelMap = paramCache.relationTypeLabelMap;
				filterColumnMap = paramCache.filterColumnMap;
				columnKeyWidthMap = paramCache.columnKeyWidthMap;
				stateIconNameMap = paramCache.stateIconNameMap;
			});
			service.addEventListener(FaultEvent.FAULT, function(event:FaultEvent):void{
				log.error(event);
			});
			service.send();
		}
		/**
		 *窗口ID和窗口唯一标识对应关系
		 */
		public static var windowMap:Map=new Map(); 
		/**
		 *状态图标标识
		 */
		public static var stateIconMap:Map=new Map();
		/**
		 *状态图标标识
		 */
		public static var stateIconObject:Object=new Object();    
		/**
		 *告警等级
		 */
		public static var levelLabelMap:Object; 
		/**
		 *关联关系描述
		 */
		public static var relationTypeLabelMap:Object;
		/**
		 *列转换Map
		 */
		public static var coulumnLabelMap:Object;
		/**
		 *列对应过滤类型 0:状态标识 1：输入文本 2：下拉框选择 3：时间查询 4:下拉文本
		 */
		public static var filterColumnMap:Object;
		/**
		 *列关键字长度映射
		 */
		public static var columnKeyWidthMap:Object;
		/**
		 *状态图标标识和类型映射  
		 */
		public static var stateIconNameMap:Object;
	}
}