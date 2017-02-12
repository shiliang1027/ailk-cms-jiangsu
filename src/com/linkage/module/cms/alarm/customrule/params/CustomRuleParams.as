package com.linkage.module.cms.alarm.customrule.params
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
		private var log:ILogger = Log.getLogger("com.linkage.module.cms.alarm.customrule.params.CustomRuleParams");
		/**
		 *用户对象
		 */
		private var _mapInfo:Object = null;

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
				var mapStr:String = params[AlarmContainer.PARAMKEY_MAPINFO];
				log.info("[参数] 用户对象: " + mapStr);
				_mapInfo = AlarmUtil.jsonDecode(mapStr);
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
	}
}