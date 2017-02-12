package com.linkage.module.cms.scene.serv
{
	/**
	 *
	 *
	 * @author xudx (69291)
	 * @version 1.0
	 * @date 2012-7-26
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */

	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	
	import com.linkage.module.cms.scene.dao.ITrainTimeDao;
	import com.linkage.module.cms.scene.domain.TrainTimeDM;
	import com.linkage.module.cms.scene.event.compenent.TrainTimeEvent;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	public class TrainTimeLoadDataCmd
	{
		private var log:ILogger = Log.getLoggerByClass(TrainTimeLoadDataCmd);

		[Inject("trainTimeDao")]
		public var dao:ITrainTimeDao;

		[Inject("trainTimeDM")]
		[Bindable]
		public var trainTimeDM:TrainTimeDM;
		[MessageDispatcher]
		public var msgDispatcher:Function;
		public function execute(e:TrainTimeEvent):AsyncToken
		{
			log.info("train cmd load data!");
			return dao.queryThresholdByCon(); //这个方法还不知道叫什么
		}

		public function result(data:Object):void
		{
			log.info("train cmd load data success!");
			log.debug(data);

			trainTimeDM.TTdataList.removeAll();
			trainTimeDM.TTdataList.addAll(data as IList);
			trainTimeDM.TTdataList.refresh();
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("train cmd load data 错误：" + f.faultString + "\n" + f.faultDetail);
			trainTimeDM.TTdataList.removeAll();
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}
	}
}

