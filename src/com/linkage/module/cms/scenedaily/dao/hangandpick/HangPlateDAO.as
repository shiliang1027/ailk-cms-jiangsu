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
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-9-7
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class HangPlateDAO implements IHangPlateDAO
	{
		private var log:ILogger = Log.getLoggerByClass(HangPlateDAO);
		private var _destination:String;
		private var _endpoint:String;
		private var rmtObj:RemoteObject;

		[Inject("user")]
		public var user:IUser;

		[Init]
		public function init():void
		{
			log.debug("[挂牌]:远程对象开始初始化...");
			rmtObj = new RemoteObject(this._destination);
			rmtObj.endpoint = this._endpoint;
			log.debug("[挂牌]:远程对象初始化成功...");
		}

		public function queryListInfo(param:Object):AsyncToken
		{
			log.info("[挂牌]调用接口queryListInfo传递参数");
			param.user = user;
			log.info(param);
			return rmtObj.queryListInfo(param);
		}

		public function delist(param:Object):AsyncToken
		{
			log.info("[挂牌]摘牌功能调用接口delist传递参数");
			log.info(param);
			return rmtObj.delist(param);
		}

		public function loadListingMoData(param:Object):AsyncToken
		{
			log.info("[挂牌列表]挂牌列表数据有条件查询");
			log.info(param);
			return rmtObj.loadListingMoData(param);
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