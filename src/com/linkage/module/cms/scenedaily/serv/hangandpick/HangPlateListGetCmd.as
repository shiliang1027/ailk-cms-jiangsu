package com.linkage.module.cms.scenedaily.serv.hangandpick
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.hangandpick.IHangPlateDAO;
	import com.linkage.module.cms.scenedaily.domain.hangandpick.HangPlateListDM;
	import com.linkage.module.cms.scenedaily.event.hangandpick.HangPlateListEvent;

	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 * 获取挂牌列表数据
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-11-27
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class HangPlateListGetCmd
	{
		private var log:ILogger = Log.getLoggerByClass(HangPlateListGetCmd);


		[Inject("hangPlateListDM")]
		public var dm:HangPlateListDM;

		[Inject("hangPlateDAO")]
		public var dao:IHangPlateDAO;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:HangPlateListEvent):AsyncToken
		{
			log.info("[挂牌列表]调用接口loadListingMoData获取数据结果!");
			return dao.loadListingMoData(e.param);
		}

		public function result(obj:Object):void
		{
			log.info("调用[挂牌列表]接口获取数据结果 success!");
			log.info(obj);
			dm.hangPlateList.removeAll();
			dm.hangPlateList.addAll(obj as IList);
			log.info(dm.hangPlateList);
		}

		public function error(f:Fault):void
		{
			log.error("加载[挂牌列表]数据错误：" + f.faultString + "," + f.faultDetail);
		}
	}
}