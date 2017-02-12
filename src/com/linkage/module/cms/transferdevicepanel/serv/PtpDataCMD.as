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
	public class PtpDataCMD
	{
		private var log:ILogger=Log.getLoggerByClass(PtpDataCMD);
		[Inject("transferDevicePanelDAO")]
		public var dao:TransferDevicePanelDAO;
		[Inject("transferDevicePanelDM")]
		public var dm:TransferDevicePanelDM;
		[MessageDispatcher]
		public var dispatchMsg:Function;
		private var now:Number=0;
		
		public function PtpDataCMD()
		{
		}
		
		public function execute(e:TransferDevicePanelEvent):AsyncToken
		{
			dm.loadManager.showLoading();
			log.debug("[查询传输面板端口数据参数]");
			log.debug(dm.queryParam);
			dm.ptpData.removeAll();
			now=new Date().getMilliseconds();
			return dao.getPtpData(dm.queryParam);
		}
		
		public function result(obj:Object):void
		{
			dm.loadManager.hideLoading();
			log.debug("[查询传输面板端口数据]成功!耗时：{0}ms", (new Date().getMilliseconds() - now));
			log.debug(obj);
			dm.ptpData.removeAll();
			if(obj.length>0){
				dm.ptpData.addAll(obj as ArrayCollection);
			}else{
//				Alert.show("无端口数据");
			}
		}
		
		public function error(f:Fault):void
		{
			log.error("[查询传输面板端口数据]失败：{0}", f.faultString);
//			dm.ptpData = new ArrayCollection([
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