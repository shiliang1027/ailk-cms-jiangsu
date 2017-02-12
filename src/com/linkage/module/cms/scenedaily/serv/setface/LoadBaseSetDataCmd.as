package com.linkage.module.cms.scenedaily.serv.setface
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.setface.SetFaceDao;
	import com.linkage.module.cms.scenedaily.domain.setface.SetFaceDM;
	import com.linkage.module.cms.scenedaily.event.setface.SetFaceEvent;

	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-9-3
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LoadBaseSetDataCmd
	{
		private var log:ILogger = Log.getLoggerByClass(SaveBaseSetDataCmd);

		[Inject("setFaceDM")]
		public var dm:SetFaceDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Inject("setFaceDao")]
		public var dao:SetFaceDao;

		public function execute(e:SetFaceEvent):AsyncToken
		{
//			var result:Object;
//			result={"kqiColorPicker": 0x33FF00, "kpiColorPicker": 0x66ff, "piColorPicker": 0xff0099, "NValue": "7"};
//			test(result);
//			return null;
			log.info("base set loadBaseSetData");
			return dao.loadBaseSetData();
		}

		//test
		public function test(data:Object):void
		{
			log.info("基本设置返回值");
			log.info(data);
			dm.baseSetMap = data;
			dispatchMsg(new SetFaceEvent(SetFaceEvent.LOAD_BASESET_DATA_COMP));
		}

		public function result(data:Object):void
		{
			log.info("基本设置返回值");
			log.info(data);
			dm.baseSetMap = data;
			dispatchMsg(new SetFaceEvent(SetFaceEvent.LOAD_BASESET_DATA_COMP));
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString + "," + f.faultDetail);
			Alert.show("加载数据失败");
		}
	}
}