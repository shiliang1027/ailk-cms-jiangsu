package com.linkage.module.cms.alarm.countflow.param
{
	import com.linkage.module.cms.alarm.framework.common.util.AlarmUtil;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;

	public class AlarmStatParam
	{
		//日志记录器
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.alarm.countflow.param.AlarmStatParam");
		//用户对象
		private var _mapInfo:Object=null;
		//是否本地调试
		private var _local:Boolean=false;
		//告警统计列对象JSON
		private var _warnColumnsJson:Array=null;
		private var _warnColumnsJsonNew:Array=null;
		//工单统计列对象JSON
		private var _sheetColumnsJson:Array=null;
		//关联统计列对象JSON
		private var _relationColumnsJson:Array=null;
		//地市一级告警列对象JSON
		private var _cityAlarmColumnsJson:Array=null;

		public function AlarmStatParam(params:Object)
		{
			initParams(params);
		}

		private function initParams(params:Object):void
		{
			log.info("[总统计参数初始化开始++++++]");
			// 用户对象
			if (params.hasOwnProperty(StatContainer.PARAMKEY_MAPINFO))
			{
				var mapStr:String=params[StatContainer.PARAMKEY_MAPINFO];
				log.info("[参数] 用户对象: " + mapStr);
				_mapInfo=AlarmUtil.jsonDecode(mapStr);
			}
			//是否本地调试
			if (params.hasOwnProperty(StatContainer.PARAMKEY_LOCAL))
			{
				var local:String=params[StatContainer.PARAMKEY_LOCAL];
				log.info("[参数] 是否本地调试: " + local);
				_local=(local == "true") ? true : false;
			}
			// 告警统计列
			if (params.hasOwnProperty(StatContainer.PARAMKEY_WARNCOLUMNS))
			{
				var warnColumn:String=params[StatContainer.PARAMKEY_WARNCOLUMNS];
				if (warnColumn != null)
				{
					log.info("[参数] 告警统计列: " + warnColumn);
					_warnColumnsJson=AlarmUtil.jsonDecode(warnColumn) as Array;
				}
			}
			// 告警统计列
			if (params.hasOwnProperty(StatContainer.PARAMKEY_WARNCOLUMNS_NEW))
			{
				var warnColumnNew:String=params[StatContainer.PARAMKEY_WARNCOLUMNS_NEW];
				if (warnColumnNew != null)
				{
					log.info("[参数] 告警统计列2: " + warnColumnNew);
					_warnColumnsJsonNew=AlarmUtil.jsonDecode(warnColumnNew) as Array;
				}
			}
			// 工单统计列
			if (params.hasOwnProperty(StatContainer.PARAMKEY_SHEETCOLUMNS))
			{
				var sheetColumn:String=params[StatContainer.PARAMKEY_SHEETCOLUMNS];
				if (sheetColumn != null)
				{
					log.info("[参数] 工单统计列: " + sheetColumn);
					_sheetColumnsJson=AlarmUtil.jsonDecode(sheetColumn) as Array;
				}
			}
			// 关联告警统计列
			if (params.hasOwnProperty(StatContainer.PARAMKEY_RELATIONCOLUMNS))
			{
				var relaColumn:String=params[StatContainer.PARAMKEY_RELATIONCOLUMNS];
				if (relaColumn != null)
				{
					log.info("[参数] 关联告警统计列: " + relaColumn);
					_relationColumnsJson=AlarmUtil.jsonDecode(relaColumn) as Array;
				}
			}
			// 地市一级告警统计列
			if (params.hasOwnProperty(StatContainer.PARAMKEY_CITYALARMCOLUMNS))
			{
				var cityAlarmColumn:String=params[StatContainer.PARAMKEY_CITYALARMCOLUMNS];
				if (cityAlarmColumn != null)
				{
					log.info("[参数] 地市一级告警统计列: " + cityAlarmColumn);
					_cityAlarmColumnsJson=AlarmUtil.jsonDecode(cityAlarmColumn) as Array;
				}
			}
		}

		public function get local():Boolean
		{
			return _local;
		}

		public function get mapInfo():Object
		{
			return _mapInfo;
		}

		public function get warnColumnsJson():Array
		{
			return _warnColumnsJson;
		}

		public function get warnColumnsJsonNew():Array
		{
			return _warnColumnsJsonNew;
		}

		public function get sheetColumnsJson():Array
		{
			return _sheetColumnsJson;
		}

		public function get relationColumnsJson():Array
		{
			return _relationColumnsJson;
		}
		public function get cityAlarmColumnsJson():Array
		{
			return _cityAlarmColumnsJson;
		}
		
	}
}

