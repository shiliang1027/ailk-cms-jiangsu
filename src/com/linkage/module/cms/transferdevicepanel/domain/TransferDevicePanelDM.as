package com.linkage.module.cms.transferdevicepanel.domain
{
	import com.linkage.module.cms.components.loadmanager.LoadManager;
	
	import mx.collections.ArrayCollection;

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
	public class TransferDevicePanelDM
	{
		public var loadManager:LoadManager;
		[Bindable]
		public var parameters:*;
		public var queryParam:*=new Object();
		[Bindable]
		public var propColumns:Array=new Array();
		[Bindable]
		public var refreshTimes:ArrayCollection = new ArrayCollection([
			{"name":"不刷新","value":-1},
			{"name":"0.5","value":0.5},
			{"name":"1","value":1},
			{"name":"2","value":2},
			{"name":"3","value":3},
			{"name":"4","value":4},
			{"name":"5","value":5},
			{"name":"10","value":10},
			{"name":"15","value":15},
			{"name":"20","value":20},
			{"name":"25","value":25},
			{"name":"30","value":30},
			{"name":"40","value":40},
			{"name":"60","value":60}
		]);
		[Bindable]
		public var slotData:ArrayCollection=new ArrayCollection();
		
		[Bindable]
		public var ptpData:ArrayCollection=new ArrayCollection();
		
		[Bindable]
		public var propData:ArrayCollection=new ArrayCollection();
		

		public function TransferDevicePanelDM()
		{
		}
	}
}