package com.linkage.module.cms.groupclientalarm.relation.param
{
	import com.linkage.module.cms.alarm.framework.common.util.AlarmUtil;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;

	/**
	 *关联窗口参数
	 * @author mengqiang
	 *
	 */
	public class RelationParams
	{
		//日志记录器
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.alarm.relation.param.RelationParams");
		/**
		 * 参数KEY: 关联关系展示列
		 */
		public static const KEYS_RELATIONCOLUMNJSON:String="relationColumnJson";
		/**
		 *窗口key和窗口名称之间映射
		 */
		public static const WINDOW_KEYJSON:String="windowKeyJson";
		/**
		 * 参数KEY: 传入参数信息
		 */
		public static const KEYS_MAPINFO:String="mapInfo";
		/**
		 * 参数KEY: 上下文路径
		 */
		public static const KEYS_CONTEXT:String="context";
		/**
		 *展示列JSONS
		 */
		private var _columnJsons:Object={};
		/**
		 *关键字和窗口名称之间映射关系
		 */
		private var _windowKeyJsons:Object={};
		/**
		 *基本URL前缀
		 */
		private var _baseUrl:String=null;

		public function RelationParams(params:Object)
		{
			initParams(params);
		}

		private function initParams(params:Object):void
		{
			// 提取用户对象
			if (params.hasOwnProperty(KEYS_MAPINFO))
			{
				var userStr:String=params[KEYS_MAPINFO];
				log.info("[参数] 用户对象: " + userStr);
				var mapInfo:Object=AlarmUtil.jsonDecode(userStr);
				_baseUrl=mapInfo[KEYS_CONTEXT];
			}
			// 关联关系展示列
			if (params.hasOwnProperty(KEYS_RELATIONCOLUMNJSON))
			{
				var columnsStr:String=params[KEYS_RELATIONCOLUMNJSON];
				log.info("[参数] 关联关系展示列: " + columnsStr);
				_columnJsons=AlarmUtil.jsonDecode(columnsStr);
			}
			//窗口key和窗口名称之间映射
			if (params.hasOwnProperty(WINDOW_KEYJSON))
			{
				var windowStr:String=params[WINDOW_KEYJSON];
				log.info("[参数] 窗口key和窗口名称之间映射: " + windowStr);
				_windowKeyJsons=AlarmUtil.jsonDecode(windowStr);
			}
		}

		public function get windowKeyJsons():Object
		{
			return _windowKeyJsons;
		}

		public function get columnJsons():Object
		{
			return _columnJsons;
		}

		public function get baseUrl():String
		{
			return _baseUrl;
		}
	}
}