package com.linkage.module.cms.oneline.domain.wireless
{
	import mx.collections.ArrayCollection;

	/**
	 * 
	 *
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-11-22
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class WirelessDM
	{
		[Bindable]
		public var kpis:ArrayCollection = new ArrayCollection();
		[Bindable]
		public var moKpis:ArrayCollection = new ArrayCollection();
		[Bindable]
		public var kpiCollectData:ArrayCollection = new ArrayCollection();
		[Bindable]
		public var tabs:ArrayCollection = new ArrayCollection([{id:"1",name:"地市列表"}]);
		[Bindable]
		public var matrixDatas:ArrayCollection = new ArrayCollection();
		[Bindable]
		public var kpiGDData:Object = new Object();
		[Bindable]
		public var levelColorMap:Object={'4': 0X4169E1, '3': 0XFED701, '2': 0XEE9800, '1': 0XFF0000,'0':0X00FF00};
		
		public function WirelessDM()
		{
		}
	}
}