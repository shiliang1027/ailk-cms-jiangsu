package com.linkage.module.cms.alarm.totalflow.param
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.alarm.framework.common.util.AlarmUtil;
	import com.linkage.module.cms.alarm.totalflow.AlarmContainer;

	/**
	 *统计参数
	 * @author mengqiang
	 *
	 */
	public class StatParam
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.alarm.totalflowalarm.param.StatParam");
		/**
		 *权限内属地
		 */
		private var _citys:Array=[];
		/**
		 *权限内专业
		 */
		private var _specs:Array=[];
		/**
		 *告警概览
		 */
		private var _generas:Array=[];
		/**
		 *用户对象
		 */
		private var _mapInfo:Object=null;
		/**
		 *区域树XML
		 */
		private var _areaXml:XML=null;
		/**
		 *功能图XML
		 */
		private var _funcXml:XML=null;
		/**
		 *省份
		 */
		private var _provice:String=null;
		/**
		 *告警过滤器
		 */
		private var _alarmFilter:String=null;

		public function StatParam(params:Object)
		{
			initParams(params);
		}

		/**
		 * 初始化方法
		 *
		 */
		private function initParams(params:Object):void
		{
			log.info("[总流水窗口参数初始化开始++++++]");
			// 属地
			if (params.hasOwnProperty(AlarmContainer.PARAMKEY_CITYJSON))
			{
				var cityJson:String=params[AlarmContainer.PARAMKEY_CITYJSON];
				if (cityJson != null)
				{
					log.info("[参数] 权限内本地网: " + cityJson);
					_citys=AlarmUtil.jsonDecode(cityJson) as Array;
				}
			}
			// 专业
			if (params.hasOwnProperty(AlarmContainer.PARAMKEY_SPECJSON))
			{
				var specJson:String=params[AlarmContainer.PARAMKEY_SPECJSON];

				if (specJson != null)
				{
					log.info("[参数] 权限内专业: " + specJson);
					_specs=AlarmUtil.jsonDecode(specJson) as Array;
				}
			}
			//概览
			if (params.hasOwnProperty(AlarmContainer.PARAMKEY_GENERAJSON))
			{
				var generaJson:String=params[AlarmContainer.PARAMKEY_GENERAJSON];

				if (generaJson != null)
				{
					log.info("[参数] 告警概览: " + generaJson);
					_generas=AlarmUtil.jsonDecode(generaJson) as Array;
				}
			}
			// 用户对象
			if (params.hasOwnProperty(AlarmContainer.PARAMKEY_MAPINFO))
			{
				var mapStr:String=params[AlarmContainer.PARAMKEY_MAPINFO];
				log.info("[参数] 用户对象: " + mapStr);
				_mapInfo=AlarmUtil.jsonDecode(mapStr);
			}
			// 区域树
			if (params.hasOwnProperty(AlarmContainer.PARAMKEY_AREAXML))
			{
				var areaXmlStr:String=params[AlarmContainer.PARAMKEY_AREAXML];
				log.info("[参数] 区域树XML: " + areaXmlStr);
				_areaXml=new XML(areaXmlStr);
			}
			// 功能图
			if (params.hasOwnProperty(AlarmContainer.PARAMKEY_FUNCXML))
			{
				var funcXmlStr:String=params[AlarmContainer.PARAMKEY_FUNCXML];
				log.info("[参数] 功能图XML: " + funcXmlStr);
				_funcXml=new XML(funcXmlStr);
			}
			// 省份
			if (params.hasOwnProperty(AlarmContainer.PARAMKEY_PROVICE))
			{
				_provice=params[AlarmContainer.PARAMKEY_PROVICE];
				log.info("[参数] 省份: " + _provice);
			}
			// 告警过滤器
			if (params.hasOwnProperty(AlarmContainer.PARAMKEY_ALARMFILTER))
			{
				_alarmFilter=params[AlarmContainer.PARAMKEY_ALARMFILTER];
				log.info("[参数] 告警过滤器: " + _alarmFilter);
			}
			log.info("[总流水窗口参数初始化结束++++++]");
		}

		/**
		 * 区域XML
		 */
		public function get areaXml():XML
		{
			return _areaXml;
		}

		/**
		 * 功能图XML
		 */
		public function get funcXml():XML
		{
			return _funcXml;
		}

		/**
		 * 权限内本地网数组 [{id:id,name:name},{id:id,name:name}]
		 */
		public function get citys():Array
		{
			return _citys;
		}

		/**
		 * 权限内专业数组 [{id:id,name:name},{id:id,name:name}]
		 */
		public function get specs():Array
		{
			return _specs;
		}

		/**
		 * 告警概览数组 [{id:id,name:name},{id:id,name:name}]
		 */
		public function get generas():Array
		{
			return _generas;
		}

		/**
		 * 用户对象
		 */
		public function get mapInfo():Object
		{
			return _mapInfo;
		}

		public function get provice():String
		{
			return _provice;
		}

		public function get alarmFilter():String
		{
			return _alarmFilter;
		}
	}
}