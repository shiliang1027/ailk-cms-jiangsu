package com.linkage.module.cms.gsscene.view.components.kpicustom.view
{
	import com.linkage.module.cms.gsscene.view.components.kpicustom.domain.KpiCustomDM;

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
	public class KpiCustomViewPM
	{
		[Bindable]
		[Inject("kpiCustomDM")]
		public var dm:KpiCustomDM;

		public function KpiCustomViewPM()
		{
		}
	}
}