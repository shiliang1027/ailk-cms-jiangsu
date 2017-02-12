package com.linkage.module.cms.alarm.specialrule.params
{
	import com.linkage.module.cms.alarm.framework.AlarmContainer;
	import com.linkage.module.cms.alarm.framework.common.util.AlarmUtil;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;

	public class CustomRuleParams
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.alarm.specialrule.params.CustomRuleParams");
		/**
		 *用户对象
		 */
		private var _mapInfo:Object=null;
		/**
		 *展示视图 {viewId:'',monitorViewname:'',creator:'',windownum:''}
		 */
		private var _viewJsons:Array = [];
		
		public function CustomRuleParams(params:Object)
		{
			initParams(params);
		}

		/**
		 * 初始化方法
		 *
		 */
		private function initParams(params:Object):void
		{
			log.info("[自定义窗口参数初始化开始++++++]");
			// 用户对象
			if (params.hasOwnProperty(AlarmContainer.PARAMKEY_MAPINFO))
			{
				var mapStr:String=params[AlarmContainer.PARAMKEY_MAPINFO];
				log.info("[参数] 用户对象: " + mapStr);
				_mapInfo=AlarmUtil.jsonDecode(mapStr);
			}
			//告警视图
			if (params.hasOwnProperty(AlarmContainer.PARAMKEY_VIEWJSON))
			{
				var viewJson:String = params[AlarmContainer.PARAMKEY_VIEWJSON];
				log.info("[参数] 告警视图: " + viewJson);
				_viewJsons = AlarmUtil.jsonDecode(viewJson) as Array;
			}
			log.info("[自定义窗口参数初始化结束++++++]");
		}

		/**
		 * 用户对象
		 */
		public function get mapInfo():Object
		{
			return _mapInfo;
		}
		
		/**
		 * 视图数组
		 */
		public function get viewJsons():Array
		{
			return _viewJsons;
		}
	}
}