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
	public class PropDataCMD
	{
		private var log:ILogger=Log.getLoggerByClass(PropDataCMD);
		[Inject("transferDevicePanelDAO")]
		public var dao:TransferDevicePanelDAO;
		[Inject("transferDevicePanelDM")]
		public var dm:TransferDevicePanelDM;
		[MessageDispatcher]
		public var dispatchMsg:Function;
		private var now:Number=0;
		
		public function PropDataCMD()
		{
		}
		
		public function execute(e:TransferDevicePanelEvent):AsyncToken
		{
			log.debug("[查询传输面板属性数据]");
			log.debug(dm.queryParam);
			dm.propData.removeAll();
			now=new Date().getMilliseconds();
			return dao.getPropData(dm.queryParam);
		}
		
		public function result(obj:Object):void
		{
			log.debug("[查询传输面板属性数据]成功!耗时：{0}ms", (new Date().getMilliseconds() - now));
			log.debug(obj);
			dm.propData.removeAll();
			if(obj.length>0){
				dm.propData.addAll(obj as ArrayCollection);
			}else{
//				Alert.show("无属性数据");
			}
		}
		
		public function error(f:Fault):void
		{
			log.error("[查询传输面板属性数据]失败：{0}", f.faultString);
//			dm.propData = new ArrayCollection([
//				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"01","alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"alarm_color":0xff0000,"enabled":true},
//				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"03","alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"alarm_color":0xFFA500,"enabled":true},
//				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"01","alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"alarm_color":0xFFFF00,"enabled":true},
//				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"01","alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"alarm_color":0x4169e1,"enabled":true},
//				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"01","alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"alarm_color":0x00ff00,"enabled":true},
//				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"01","alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"alarm_color":0x00ff00,"enabled":true},
//				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"01","alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"alarm_color":0x00ff00,"enabled":true},
//				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"01","alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"alarm_color":0x00ff00,"enabled":true},
//				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"01","alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"alarm_color":0x00ff00,"enabled":true},
//				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"01","alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"alarm_color":0x00ff00,"enabled":true},
//				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"01","alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"alarm_color":0x00ff00,"enabled":true},
//				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"01","alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"alarm_color":0x00ff00,"enabled":true},
//				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"01","alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"alarm_color":0x00ff00,"enabled":true},
//				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"01","alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"alarm_color":0xff0000,"enabled":true},
//				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"12","alarm_num":int(Math.random()*10000),"alarm_level":int(Math.random()*4),"alarm_color":0xff0000,"enabled":true}
//			]);
		}
	}
}