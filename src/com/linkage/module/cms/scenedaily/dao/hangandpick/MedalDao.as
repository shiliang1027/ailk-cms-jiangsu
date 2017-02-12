package com.linkage.module.cms.scenedaily.dao.hangandpick
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
	 * @date 2012-9-13
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class MedalDao implements IMedalDao
	{
		private var log:ILogger = Log.getLoggerByClass(MedalDao);
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
		 *查询摘牌信息
		 */
		public function queryDelisted(starttime:String, endtime:String):AsyncToken
		{
			var param:Object = new Object;
			param.starttime = starttime;
			param.endtime = endtime;
			return rmtObj.queryDelisted(param);
		}

		/**
		 *查询摘牌网元详情
		 */
		public function queryDelistedDetail(id:String):AsyncToken
		{
			var param:Object = new Object;
			param.id = id;
			log.debug("[摘牌详情]传入参数");
			log.debug(param);
			return rmtObj.queryDelistedDetail(param);
		}

		/**
		 *查询挂牌网元详情
		 */
		public function queryListedDetail(id:String):AsyncToken
		{
			var param:Object = new Object;
			param.id = id;
			return rmtObj.queryListedDetail(param);
		}

		/**
		 *查询历史网元信息
		 */
		public function queryHisList(moId:String):AsyncToken
		{
			var param:Object = new Object;
			param.moId = moId;
			return rmtObj.queryHisList(param);
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