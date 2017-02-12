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

	public class RoamConfigSaveCMD
	{
		private var log:ILogger=Log.getLoggerByClass(RoamConfigSaveCMD);

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
			log.debug(event.param);
			return dao.configSaveParam(event.param);
		}
		public function result(result:String):void
		{
			log.info("config save");
			log.info(result);
			dm.isSuc = result;
			dispatchMsg(new RoamTopicEvent("REFRESH_ROMTOPIC_CONFIG_SAVE"));
		}
		
		public function error(f:Fault):void
		{
			log.error("config save 加载漫游表格数据错误：" + f.faultString + "\n" + f.faultDetail);
			Alert.show("config save加载漫游表格数据错误：" + f.faultString + "\n" + f.faultDetail);
		}
	}
}