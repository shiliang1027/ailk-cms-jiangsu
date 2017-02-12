package com.linkage.module.cms.transferdevicepanel.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.transferdevicepanel.dao.TransferDevicePanelDAO;
	import com.linkage.module.cms.transferdevicepanel.domain.TransferDevicePanelDM;
	import com.linkage.module.cms.transferdevicepanel.event.TransferDevicePanelEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2014-5-27
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SlotDataCMD
	{
		private var log:ILogger=Log.getLoggerByClass(SlotDataCMD);
		[Inject("transferDevicePanelDAO")]
		public var dao:TransferDevicePanelDAO;
		[Inject("transferDevicePanelDM")]
		public var dm:TransferDevicePanelDM;
		[MessageDispatcher]
		public var dispatchMsg:Function;
		private var now:Number=0;

		public function SlotDataCMD()
		{
		}

		public function execute(e:TransferDevicePanelEvent):AsyncToken
		{
			log.debug("[查询传输面板数据参数]");
			log.debug(dm.queryParam);
			now=new Date().getMilliseconds();
			return dao.getSlotData(dm.queryParam);
		}

		public function result(obj:Object):void
		{
			log.debug("[查询传输面板数据]成功!耗时：{0}ms", (new Date().getMilliseconds() - now));
			log.debug(obj);
			dm.slotData.removeAll();
			if (obj.length > 0)
			{
				dm.slotData.addAll(obj as ArrayCollection);
				log.debug(dm.slotData);
			}
			else
			{
//				Alert.show("无面板数据");
			}
		}

		public function error(f:Fault):void
		{
			log.error("[查询传输面板数据]失败：{0}", f.faultString);
			dm.slotData.removeAll();
//			dm.slotData.addAll(new ArrayCollection([
//				{"slot_id": 1, "slot_name": "卡槽1", "slot_no": "","x":0,"y":0,"width":200,"height":30,"alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"bgcolor":0x00ff00,"state":"enabled_horizontal","fontdirection":"left"}, 
//				{"slot_id": 1, "slot_name": "卡槽1", "slot_no": "03,11","x":30,"y":80,"width":200,"height":30,"alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"bgcolor":0x00ff00,"state":"enabled_horizontal","fontdirection":"left,right"},
//				{"slot_id": 2, "slot_name": "卡槽2", "slot_no": "02","x":263,"y":80,"width":200,"height":30,"alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"bgcolor":0xff0000,"state":"enabled_horizontal","fontdirection":"left"},
//				{"slot_id": 1, "slot_name": "卡槽1", "slot_no": "01","x":496,"y":80,"width":200,"height":30,"alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"bgcolor":0xFFA500,"state":"enabled_horizontal","fontdirection":"top"},
//				{"slot_id": 1, "slot_name": "卡槽1", "slot_no": "04","x":30,"y":160,"width":606,"height":30,"alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"bgcolor":0x00ff00,"state":"enabled_horizontal","fontdirection":"right"},
//				{"slot_id": 1, "slot_name": "卡槽1", "slot_no": "09","x":30,"y":240,"width":150,"height":30,"alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"bgcolor":0x00ff00,"state":"enabled_horizontal","fontdirection":"bottom"},
//				{"slot_id": 1, "slot_name": "卡槽1", "slot_no": "10,20","x":212,"y":240,"width":150,"height":30,"alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"bgcolor":0xc1c1c1,"state":"disabled_horizontal","fontdirection":"left,top"},
//				{"slot_id": 1, "slot_name": "卡槽1", "slot_no": "11,21,22","x":394,"y":240,"width":150,"height":30,"alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"bgcolor":0x00ff00,"state":"disabled_horizontal","fontdirection":"top,top,bottom"},
//				{"slot_id": 1, "slot_name": "卡槽1", "slot_no": "12,31","x":576,"y":240,"width":150,"height":30,"alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"bgcolor":0xFFA500,"state":"disabled_horizontal","fontdirection":"left,bottom"}]));
		}
	}
}