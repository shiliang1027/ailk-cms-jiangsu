package com.linkage.module.cms.oneline.view.components.wireless
{
	import com.linkage.module.cms.oneline.domain.wireless.WirelessDM;

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
	public class WirelessViewPM
	{
		[Bindable]
		[Inject("wirelessDM")]
		public var dm:WirelessDM;

		public function WirelessViewPM()
		{
		}
	}
}