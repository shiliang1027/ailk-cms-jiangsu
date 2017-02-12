package com.linkage.module.cms.quitstatnew.view
{
	import com.linkage.module.cms.quitstatnew.domain.QuitStatDM;
	
	import flash.utils.Dictionary;
	
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
	public class QuitDataViewPM
	{
		[Inject("quitStatDM")]
		[Bindable]
		public var dm:QuitStatDM;
		[Bindable]
		public var kpis:ArrayCollection = new ArrayCollection();
		
		public var kpisMap:Dictionary = new Dictionary();
		
		
		public function QuitDataViewPM()
		{
		}
	}
}