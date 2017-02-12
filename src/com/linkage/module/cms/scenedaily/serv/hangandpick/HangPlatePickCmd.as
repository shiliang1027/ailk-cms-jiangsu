package com.linkage.module.cms.scenedaily.serv.hangandpick
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.hangandpick.IHangPlateDAO;
	import com.linkage.module.cms.scenedaily.domain.hangandpick.HangPlateDM;
	import com.linkage.module.cms.scenedaily.event.hangandpick.HangPlateEvent;

	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-9-13
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class HangPlatePickCmd
	{

		private var log:ILogger = Log.getLoggerByClass(HangPlateGetCmd);


		[Inject("hangPlateDM")]
		public var dm:HangPlateDM;

		[Inject("hangPlateDAO")]
		public var dao:IHangPlateDAO;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:HangPlateEvent):AsyncToken
		{
			log.info("[挂牌]摘牌功能调用接口delist获取数据结果!");
			return dao.delist(e.param);
		}

		public function result(obj:Object):void
		{
			log.info("调用[挂牌]摘牌功能调用接口获取数据结果 success!");
			if (obj.hasOwnProperty("info"))
			{
				Alert.show(obj.info, "提示");

				//摘牌功能结束，重新加载挂牌页面
				var e:HangPlateEvent = new HangPlateEvent(HangPlateEvent.LOAD_HANGPLATE_DATA);
				e.param = new Object();
				msgDispatcher(e);
			}
			else
			{
				log.info("摘牌失败，返回数据不对.");
				log.debug(obj);
			}

		}

		public function error(f:Fault):void
		{
			log.error("加载[挂牌]摘牌功能数据错误：" + f.faultString + "," + f.faultDetail);
		}


	}
}