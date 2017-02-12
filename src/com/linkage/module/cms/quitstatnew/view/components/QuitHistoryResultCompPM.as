package com.linkage.module.cms.quitstatnew.view.components
{
	import com.linkage.module.cms.quitstatnew.domain.QuitStatDM;

	/**
	 * 
	 *
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-10-23
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class QuitHistoryResultCompPM
	{
		[Inject("quitStatDM")]
		[Bindable]
		public var dm:QuitStatDM;
		public function QuitHistoryResultCompPM()
		{
		}
	}
}