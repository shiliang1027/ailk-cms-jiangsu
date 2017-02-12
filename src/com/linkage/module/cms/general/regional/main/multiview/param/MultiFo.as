package com.linkage.module.cms.general.regional.main.multiview.param
{
	import com.linkage.module.cms.general.regional.main.multiview.util.MultiUtil;

	import mx.logging.ILogger;
	import mx.logging.Log;

	/**
	 *多维视图FO
	 * @author mengqiang
	 *
	 */
	public class MultiFo
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.general.regional.main.multiview.param.MultiFo");
		/**
		 *权限内专业
		 */
		private var _specs:Array=[{'id': '1', 'name': '交换'}, {'id': '2', 'name': '数据网'}, {'id': '3', 'name': '传输网'}, {'id': '4', 'name': '动环网'}, {'id': '5', 'name': '2G无线'}, {'id': '6', 'name': 'TD无线'}];
		/**
		 *告警等级数组
		 */
		private var _alarmLevelArray:Array=[{id: '1', name: '一级告警'}, {id: '2', name: '二级告警'}, {id: '3', name: '三级告警'}, {id: '4', name: '四级告警'}];
		/**
		 *基本URL
		 */
		private var _baseURL:String=null;
		/**
		 *用户对象
		 */
		private var _mapInfo:Object=null;
		/**
		 *视图Id
		 */
		private var _viewId:String=null;
		/**
		 *是否本地调试
		 */
		private var _local:Boolean=false;

		public function MultiFo(param:Object)
		{
			initParams(param);
		}

		//初始化参数
		private function initParams(param:Object):void
		{
			log.info("[多维视图参数初始化开始++++++]");
			// 专业
			if (param.hasOwnProperty(MultiContainer.PARAMKEY_SPECJSON))
			{
				var specJson:String=param[MultiContainer.PARAMKEY_SPECJSON];

				if (specJson != null)
				{
					log.info("[参数] 权限内专业: " + specJson);
					_specs=MultiUtil.jsonDecode(specJson) as Array;
				}
			}
			// 视图ID
			if (param.hasOwnProperty(MultiContainer.PARAMKEY_VIEWID))
			{
				_viewId=param[MultiContainer.PARAMKEY_VIEWID];
				log.info("[参数] 视图ID: " + _viewId);
			}
			// 用户对象
			if (param.hasOwnProperty(MultiContainer.PARAMKEY_MAPINFO))
			{
				var mapStr:String=param[MultiContainer.PARAMKEY_MAPINFO];
				log.info("[参数] 用户对象: " + mapStr);
				_mapInfo=MultiUtil.jsonDecode(mapStr);
				_baseURL=_mapInfo[MultiContainer.PARAMKEY_CONTEXT];
			}
			//是否本地调试
			if (param.hasOwnProperty(MultiContainer.PARAMKEY_LOCAL))
			{
				var local:String=param[MultiContainer.PARAMKEY_LOCAL];
				log.info("[参数] 是否本地调试: " + local);
				_local=local == "true" ? true : false;
			}
			log.info("[多维视图参数初始化结束++++++]");
		}

		public function get baseURL():String
		{
			return _baseURL;
		}

		public function get local():Boolean
		{
			return _local;
		}

		public function get viewId():String
		{
			return _viewId;
		}

		public function get specs():Array
		{
			return _specs;
		}

		public function get mapInfo():Object
		{
			return _mapInfo;
		}

		public function get alarmLevelArray():Array
		{
			return _alarmLevelArray;
		}
	}
}