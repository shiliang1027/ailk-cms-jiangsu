package com.linkage.module.cms.gsscene.view.components.kpicustom.domain
{
	import mx.collections.ArrayCollection;

	/**
	 *
	 *
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-11-14
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class KpiCustomDM
	{
		[Bindable]
		public var moTypes:ArrayCollection=new ArrayCollection();
		[Bindable]
		public var kpis:ArrayCollection=new ArrayCollection();
		[Bindable]
		public var moOrAreas:ArrayCollection=new ArrayCollection();

		[Bindable]
		public var kpisData:ArrayCollection=new ArrayCollection();

		public function KpiCustomDM()
		{
		}
	}
}