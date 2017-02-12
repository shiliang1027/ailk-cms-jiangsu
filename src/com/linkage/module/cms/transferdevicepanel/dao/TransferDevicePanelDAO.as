package com.linkage.module.cms.transferdevicepanel.dao
{
	import mx.rpc.AsyncToken;

	/**
	 *
	 *
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2014-5-26
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public interface TransferDevicePanelDAO
	{
		/**
		 * 查询传输面板数据 
		 * @param param(neid,nename)
		 * @return 
		 * [
				{"solt_id": 1, "solt_name": "卡槽1", "solt_no": "01","x":5,"y":5,"width":200,"height":30,"alarm_num":300,"alarm_level":0,"bgcolor":0x00ff00,"state":"enabled_horizontal"}, 
				{"solt_id": 1, "solt_name": "卡槽1", "solt_no": "01","x":210,"y":5,"width":200,"height":30,"alarm_num":300,"alarm_level":0,"bgcolor":0x00ff00,"state":"enabled_horizontal"},
				{"solt_id": 2, "solt_name": "卡槽2", "solt_no": "02","x":5,"y":70,"width":30,"height":200,"alarm_num":300,"alarm_level":1,"bgcolor":0xff0000,"state":"enabled_vertical"},
				{"solt_id": 1, "solt_name": "卡槽1", "solt_no": "01","x":40,"y":70,"width":30,"height":200,"alarm_num":300,"alarm_level":2,"bgcolor":0xFFA500,"state":"enabled_vertical"},
				{"solt_id": 1, "solt_name": "卡槽1", "solt_no": "01","x":75,"y":70,"width":30,"height":200,"alarm_num":300,"alarm_level":0,"bgcolor":0x00ff00,"state":"enabled_vertical"},
				{"solt_id": 1, "solt_name": "卡槽1", "solt_no": "01","x":110,"y":70,"width":30,"height":100,"alarm_num":300,"alarm_level":0,"bgcolor":0x00ff00,"state":"enabled_vertical"},
				{"solt_id": 1, "solt_name": "卡槽1", "solt_no": "01","x":145,"y":70,"width":30,"height":200,"alarm_num":300,"alarm_level":0,"bgcolor":0x00ff00,"state":"enabled_vertical"},
				{"solt_id": 1, "solt_name": "卡槽1", "solt_no": "01","x":180,"y":70,"width":30,"height":200,"alarm_num":300,"alarm_level":0,"bgcolor":0x00ff00,"state":"enabled_vertical"},
				{"solt_id": 1, "solt_name": "卡槽1", "solt_no": "01","x":215,"y":70,"width":30,"height":200,"alarm_num":300,"alarm_level":2,"bgcolor":0xFFA500,"state":"enabled_vertical"},
				{"solt_id": 1, "solt_name": "ABCDEFGH", "solt_no": "01","x":250,"y":70,"width":30,"height":200,"alarm_num":300,"alarm_level":4,"bgcolor":0x4169e1,"state":"enabled_vertical"},
				{"solt_id": 1, "solt_name": "卡槽1", "solt_no": "01","x":285,"y":70,"width":30,"height":200,"alarm_num":300,"alarm_level":0,"bgcolor":0x00ff00,"state":"enabled_vertical"},
				{"solt_id": 1, "solt_name": "卡槽1", "solt_no": "01","x":320,"y":70,"width":30,"height":200,"alarm_num":300,"alarm_level":3,"bgcolor":0xFFFF00,"state":"enabled_vertical"},
				{"solt_id": 1, "solt_name": "", "solt_no": "01","x":355,"y":70,"width":30,"height":200,"alarm_num":300,"alarm_level":0,"bgcolor":0xC1C1C1,"state":"disabled_vertical"},
				{"solt_id": 1, "solt_name": "", "solt_no": "01","x":390,"y":70,"width":30,"height":200,"alarm_num":300,"alarm_level":0,"bgcolor":0xC1C1C1,"state":"disabled_vertical"},
				{"solt_id": 1, "solt_name": "", "solt_no": "01","x":430,"y":70,"width":30,"height":200,"alarm_num":300,"alarm_level":0,"bgcolor":0xC1C1C1,"state":"disabled_vertical"},
				{"solt_id": 1, "solt_name": "", "solt_no": "01","x":470,"y":70,"width":30,"height":200,"alarm_num":300,"alarm_level":0,"bgcolor":0xC1C1C1,"state":"disabled_vertical"},
				{"solt_id": 1, "solt_name": "", "solt_no": "01","x":505,"y":70,"width":30,"height":200,"alarm_num":300,"alarm_level":0,"bgcolor":0xC1C1C1,"state":"disabled_vertical"},
				{"solt_id": 1, "solt_name": "", "solt_no": "01","x":540,"y":70,"width":30,"height":200,"alarm_num":300,"alarm_level":0,"bgcolor":0xC1C1C1,"state":"disabled_vertical"}
		 	]
		 */
		function getSlotData(param:Object):AsyncToken;
		/**
		 * 查询传输面板端口数据 
		 * @param param(neid,nename,slotid)
		 * @return 
		 * [
				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"01","alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"alarm_color":0xff0000,"enabled":true},
				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"03","alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"alarm_color":0xFFA500,"enabled":true},
				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"01","alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"alarm_color":0xFFFF00,"enabled":true},
				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"01","alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"alarm_color":0x4169e1,"enabled":true},
				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"01","alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"alarm_color":0x00ff00,"enabled":true},
				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"01","alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"alarm_color":0x00ff00,"enabled":true},
				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"01","alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"alarm_color":0x00ff00,"enabled":true},
				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"01","alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"alarm_color":0x00ff00,"enabled":true},
				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"01","alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"alarm_color":0x00ff00,"enabled":true},
				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"01","alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"alarm_color":0x00ff00,"enabled":true},
				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"01","alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"alarm_color":0x00ff00,"enabled":true},
				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"01","alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"alarm_color":0x00ff00,"enabled":true},
				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"01","alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"alarm_color":0x00ff00,"enabled":true},
				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"01","alarm_num":int(Math.random()*100),"alarm_level":int(Math.random()*4),"alarm_color":0xff0000,"enabled":true},
				{"ptp_id":1,"ptp_name":"端口1","ptp_no":"12","alarm_num":int(Math.random()*10000),"alarm_level":int(Math.random()*4),"alarm_color":0xff0000,"enabled":true}
			]
		 * 
		 */
		function getPtpData(param:Object):AsyncToken;
		
		/**
		 * 查询传输面板属性信息数据 
		 * @param param(neid,nename,slotid,ptpid)
		 * @return 
		 * 
		 */
		function getPropData(param:Object):AsyncToken;
		
	}
}