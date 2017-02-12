package com.linkage.module.cms.scenedaily.dao.impkpi
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.domain.common.IUser;

	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-8-21
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ImpProKpiDao implements IImpProKpiDao
	{
		private var log:ILogger = Log.getLoggerByClass(ImpProKpiDao);
		private var _destination:String;
		private var _endpoint:String;
		private var rmtObj:RemoteObject;

		[Inject("user")]
		public var user:IUser;

		[Init]
		public function init():void
		{
			rmtObj = new RemoteObject(this._destination);
			rmtObj.endpoint = this._endpoint;
		}

		/**
		 * 获取指标概览信息
		 * cityId：城市ID
		 * viewType：视图层次(1:领导,2:管理,3:一线)
		 * 	interval：粒度(1:日,2:周,3:月)
		 * isHealthOrThreshold：健康度、阀值劣化(1：健康度，2：阀值劣化)
		 * gatherTime：统计日期
		 */
		public function getImpKpiGeneralInfo(indexPage:int, perPageCount:int, perfName:String):AsyncToken
		{
			var param:Object = new Object;
			param.viewType = user.viewType;
			param.interval = user.interval;
			param.isHealthOrThreshold = user.isHealthOrThreshold;
			param.gatherTime = user.gatherTime;
			param.resId = user.resId;
			param.resType = user.resType;
			param.indexPage = indexPage;
			param.perPageCount = perPageCount;
			param.perfName = perfName;
			param.user = user;
			log.debug("传入参数：");
			log.debug(param);
			return rmtObj.getImpKpiGeneralInfo(param);
		}

		/**
		 * 根据状态信息查询指标信息
		 *status：0为未选择指标,  1为已选择指标。
		 *cityId:城市id。
		 *viewType：视图层次(1:领导,2:管理,3:一线)
		 */
		public function getImpKpiCfgInfo(status:int):AsyncToken
		{
			var param:Object = new Object;
			param.status = status;
			param.cityId = user.cityId;
			param.viewType = user.viewType;
			param.user = user;
			log.debug(param);
			return rmtObj.getImpKpiCfgInfo(param);
		}

		/**
		 *保存指标信息
		 */
		public function saveImpKpiCfgInfo(isSelectArrData:ArrayCollection):AsyncToken
		{
			var param:Object = new Object;
			param.viewType = user.viewType;
			param.data = isSelectArrData;
			param.user = user;
			return rmtObj.saveImpKpiCfgInfo(param);
		}


		public function loadDelistingMoData(param:Object):AsyncToken
		{
			return rmtObj.loadDelistingMoData(param);
		}

		public function get destination():String
		{
			return _destination;
		}

		public function set destination(value:String):void
		{
			_destination = value;
		}

		public function get endpoint():String
		{
			return _endpoint;
		}

		public function set endpoint(value:String):void
		{
			_endpoint = value;
		}


	}
}

