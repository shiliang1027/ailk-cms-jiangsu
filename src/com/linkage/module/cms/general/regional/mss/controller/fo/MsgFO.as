package com.linkage.module.cms.general.regional.mss.controller.fo
{
	import com.linkage.module.cms.general.regional.mss.Container;
	
	import mx.logging.ILogger;
	import mx.logging.Log;

	/**
	 *信息发布FO
	 * @author mengqiang
	 *
	 */
	public class MsgFO
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.general.regional.mss.controller.fo.MsgFO");
		/**
		 *上下文信息
		 */
		private var _context:String=null;
		/**
		 *是否本地调试
		 */
		private var _local:Boolean=false;
		/**
		 *模板ID
		 */
		private var _monitorId:String=null;

		public function MsgFO(params:Object)
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
			//上下文信息
			if (params.hasOwnProperty(Container.PARAMKEY_CONTEXT))
			{
				_context=params[Container.PARAMKEY_CONTEXT];
				log.info("[参数] 上下文信息: " + _context);
			}
			//场景ID
			if (params.hasOwnProperty(Container.PARAMKEY_MONITORID))
			{
				_monitorId=params[Container.PARAMKEY_MONITORID];
				log.info("[参数] 场景ID: " + _monitorId);
			}
			//是否本地调试
			if (params.hasOwnProperty(Container.PARAMKEY_LOCAL))
			{
				var local:String=params[Container.PARAMKEY_LOCAL];
				log.info("[参数] 是否本地调试: " + local);
				_local=(local == "true") ? true : false;
			}
		}

		public function get context():String
		{
			return _context;
		}

		public function get local():Boolean
		{
			return _local;
		}

		public function get monitorId():String
		{
			return _monitorId;
		}
	}
}