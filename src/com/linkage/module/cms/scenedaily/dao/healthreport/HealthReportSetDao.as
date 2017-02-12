package com.linkage.module.cms.scenedaily.dao.healthreport
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.domain.common.IUser;

	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-9-18
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class HealthReportSetDao implements IHealthReportSetDao
	{
		private var log:ILogger = Log.getLoggerByClass(HealthReportSetDao);
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
		 * 查询健康分类设置左侧树信息
		 */
		public function getHealthTreeInfo():AsyncToken
		{
			return rmtObj.getHealthTreeInfo();
		}

		/**
		 *根据树节点ID和指标类别查询健康指标配置信息
		 */
		public function getHealthKpiByCond(treeNodeId:String, kpiTypeId:String):AsyncToken
		{
			var param:Object = new Object;
			param.treeNodeId = treeNodeId;
			param.kpiTypeId = kpiTypeId;
			param.user = user;
			return rmtObj.getHealthKpiByCond(param);
		}

		/**
		 * 保存健康报告分类信息
		 */
		public function saveHealthReportInfo(saveObj:Object):AsyncToken
		{
			return rmtObj.saveHealthReportInfo(saveObj);
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