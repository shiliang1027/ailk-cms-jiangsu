package com.linkage.module.cms.roamtopic.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.roamtopic.dao.RoamTopicDAO;
	import com.linkage.module.cms.roamtopic.domain.RoamTopicDM;
	import com.linkage.module.cms.roamtopic.event.RoamTopicEvent;
	
	import flashx.textLayout.formats.Float;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.collections.Sort;
	import mx.collections.SortField;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	public class RoamConfigCMD
	{
		private var log:ILogger=Log.getLoggerByClass(RoamConfigCMD);

		[Inject("roamTopicDAO")]
		public var dao:RoamTopicDAO;
		
		[Inject("roamTopicDM")]
		public var dm:RoamTopicDM;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		
		private var type:String = "";
		private var now:Number=0;
		
		public function execute(event:RoamTopicEvent):AsyncToken
		{
			if(dm.type=="4"||dm.type=="5"){
				dm.parameters.type = "1";
			}
			log.debug(dm.parameters);
			return dao.configParam(dm.parameters);
		}
		public function result(result:Object):void
		{
			log.info("config");
			log.info(result);
			dm.text1 = result["text1"];
			dm.text2 = result["text2"];
			dm.text3 = result["text3"];
			dm.text4 = result["text3"];
			dispatchMsg(new RoamTopicEvent("REFRESH_ROMTOPIC_CONFIG"));
		}
		
		public function error(f:Fault):void
		{
			log.error("config 加载漫游表格数据错误：" + f.faultString + "\n" + f.faultDetail);
			Alert.show("config 加载漫游表格数据错误：" + f.faultString + "\n" + f.faultDetail);
		}
	}
}