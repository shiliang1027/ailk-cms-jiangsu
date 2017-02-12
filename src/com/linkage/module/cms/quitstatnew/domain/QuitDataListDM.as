package com.linkage.module.cms.quitstatnew.domain
{
	import mx.collections.ArrayCollection;

	/**
	 * 
	 *
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-10-22
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class QuitDataListDM
	{
		[Bindable]
		public var kpiType:String;
		[Bindable]
		public var kpiList:ArrayCollection;
		public function QuitDataListDM(kpiType:String=null,kpiList:ArrayCollection=null)
		{
			this.kpiType = kpiType;
			this.kpiList = kpiList;
		}
	}
}