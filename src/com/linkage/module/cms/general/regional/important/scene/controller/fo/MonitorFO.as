package com.linkage.module.cms.general.regional.important.scene.controller.fo
{
	import com.linkage.module.cms.general.regional.important.scene.Container;

	import mx.logging.ILogger;
	import mx.logging.Log;

	/**
	 *场馆监控FO
	 * @author mengqiang
	 *
	 */
	public class MonitorFO
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.general.regional.important.scene.controller.fo.MonitorFO");
		/**
		 *用户对象
		 */
		private var _mapInfo:String=null;
		/**
		 *上下文信息
		 */
		private var _context:String=null;
		/**
		 *是否本地调试
		 */
		private var _local:Boolean=false;

		public function MonitorFO(params:Object)
		{
			initParams(params);
		}

		//初始化参数信息
		private function initParams(params:Object):void
		{
			//判断参数是否为空
			if (params == null)
			{
				log.info("【外部传入参数为空，不能初始化参数信息】");
				return;
			}
			// 提取用户对象
			if (params.hasOwnProperty(Container.PARAMKEY_MAPINFO))
			{
				_mapInfo=params[Container.PARAMKEY_MAPINFO];
				log.info("[参数] 用户对象: " + _mapInfo);
			}
			//上下文信息
			if (params.hasOwnProperty(Container.PARAMKEY_CONTEXT))
			{
				_context=params[Container.PARAMKEY_CONTEXT];
				log.info("[参数] 上下文信息: " + _context);
			}
			//是否本地调试
			if (params.hasOwnProperty(Container.PARAMKEY_LOCAL))
			{
				var local:String=params[Container.PARAMKEY_LOCAL];
				log.info("[参数] 是否本地调试: " + local);
				_local=(local == "true") ? true : false;
			}
		}

		public function get mapInfo():String
		{
			return _mapInfo;
		}

		public function get context():String
		{
			return _context;
		}

		public function get local():Boolean
		{
			return _local;
		}
	}
}