package com.linkage.module.cms.scenedaily.serv.hangandpick
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.hangandpick.IHangPlateDAO;
	import com.linkage.module.cms.scenedaily.domain.hangandpick.HangPlateDM;
	import com.linkage.module.cms.scenedaily.event.hangandpick.HangPlateEvent;

	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

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
	public class HangPlateGetCmd
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
			log.info("[挂牌]调用接口queryListInfo获取数据结果!");
			return dao.queryListInfo(e.param);
		}

		public function result(obj:Object):void
		{
			log.info("调用[挂牌]接口获取数据结果 success!");
			dm.hangPlates.removeAll();
			dm.hangPlates.addAll(obj as IList);
			dm.hangPlates.refresh();
			log.info(dm.hangPlates);
			//查询数据结束，抛出事件，生成挂牌页面
			var e:HangPlateEvent = new HangPlateEvent(HangPlateEvent.CREATE_HANGPLATE_PAGEHANDLER);
			msgDispatcher(e);
		}

		public function error(f:Fault):void
		{
			log.error("加载[挂牌]数据错误：" + f.faultString + "," + f.faultDetail);
		}

	}
}