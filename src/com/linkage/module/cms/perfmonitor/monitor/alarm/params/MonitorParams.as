package com.linkage.module.cms.perfmonitor.monitor.alarm.params
{
	import com.linkage.module.cms.alarm.framework.common.util.AlarmUtil;
	
	import mx.logging.ILogger;
	import mx.logging.Log;

	public class MonitorParams
	{
		//日志记录器
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.perfmonitor.monitor.alarm.params.MonitorParams");
		//用户对象
		private var _mapInfo:Object=null;
		//是否本地调试
		private var _local:Boolean=false;
		//命名上下文
		private var _context:String=null;
		//统计列数组
		private var _statColumns:Object=null;
		//设备性能菜单
		private var _devPerfMenu:Object=null;
		//业务性能菜单
		private var _servPerfMenu:String=null;
		//属地ID映射
		private var _cityIdNameObj:Object=null;

		public function MonitorParams(params:Object)
		{
			initParams(params);
		}

		private function initParams(params:Object):void
		{
			log.info("[性能监控首页参数初始化开始++++++]");
			//是否本地调试
			if (params.hasOwnProperty(MonitorContainer.PARAMKEY_LOCAL))
			{
				var local:String=params[MonitorContainer.PARAMKEY_LOCAL];
				log.info("[参数] 是否本地调试: " + local);
				_local=(local == "true") ? true : false;
			}
			// 用户对象
			if (params.hasOwnProperty(MonitorContainer.PARAMKEY_MAPINFO))
			{
				var mapStr:String=params[MonitorContainer.PARAMKEY_MAPINFO];
				log.info("[参数] 用户对象: " + mapStr);
				_mapInfo=AlarmUtil.jsonDecode(mapStr);
				_context=_mapInfo[MonitorContainer.PARAMKEY_CONTEXT];
			}
			// 统计列数组
			if (params.hasOwnProperty(MonitorContainer.PARAMKEY_STATCOLUMNS))
			{
				var columns:String=params[MonitorContainer.PARAMKEY_STATCOLUMNS];
				log.info("[参数] 统计列数组: " + columns);
				_statColumns=AlarmUtil.jsonDecode(columns);
			}
			//设备性能菜单
			if (params.hasOwnProperty(MonitorContainer.PARAMKEY_DEVPREFMENU))
			{
				var devMenu:String=params[MonitorContainer.PARAMKEY_DEVPREFMENU];
				log.info("[参数] 设备性能菜单: " + devMenu);
				_devPerfMenu=AlarmUtil.jsonDecode(devMenu);
			}
			//业务性能菜单
			if (params.hasOwnProperty(MonitorContainer.PARAMKEY_SERVPREFMENU))
			{
				_servPerfMenu=params[MonitorContainer.PARAMKEY_SERVPREFMENU];
				log.info("[参数] 业务性能菜单: " + _servPerfMenu);
			}
			//属地名称和ID的映射关系
			if (params.hasOwnProperty(MonitorContainer.PARAMKEY_CITYIDOBJECT))
			{
				var city:String=params[MonitorContainer.PARAMKEY_CITYIDOBJECT];
				log.info("[参数] 属地名称和ID的映射关系: " + city);
				_cityIdNameObj=AlarmUtil.jsonDecode(city);
			}
		}

		public function get local():Boolean
		{
			return _local;
		}

		public function get context():String
		{
			return _context;
		}

		public function get mapInfo():Object
		{
			return _mapInfo;
		}

		public function get statColumns():Object
		{
			return _statColumns;
		}

		public function get devPerfMenu():Object
		{
			return _devPerfMenu;
		}

		public function get servPerfMenu():String
		{
			return _servPerfMenu;
		}

		public function get cityIdNameObj():Object
		{
			return _cityIdNameObj;
		}
	}
}