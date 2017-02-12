package com.linkage.module.cms.quitstatnew.domain
{
	import com.linkage.module.cms.quitstatnew.event.QuitStatEvent;
	
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
	public class QuitStatDM
	{
		[Bindable]
		public var citys:ArrayCollection=new ArrayCollection([{label: '选择地市', value: '-10'}]);
		[Bindable]
		public var citysList:ArrayCollection;
		[Bindable]
		public var kpisData:Object;
		[Bindable]
		public var historyList:ArrayCollection=new ArrayCollection();
		[Bindable]
		public var detailList:ArrayCollection=new ArrayCollection();
		[Bindable]
		public var type:String;
		[Bindable]
		public var startTime:String;
		[Bindable]
		public var endTime:String;
		[Bindable]
		public var cityId:String;
		[Bindable]
		public var col:String;
		[Bindable]
		public var thresHoldDyes:ArrayCollection; //所有指标阈值数据
		//渲染颜色
		[Bindable]
		public var levelColorMap:Object={'0': 0X00FF00, '1': 0XFED701, '2': 0XEE9800, '3': 0XFF0000};

		//未配置指标
		[Bindable]
		public var unselList:ArrayCollection=new ArrayCollection();

		//已配置指标
		[Bindable]
		public var selList:ArrayCollection=new ArrayCollection();
		[Bindable]
		public var configs:ArrayCollection=new ArrayCollection([{name: "阈值渲染配置", state: "ThresHoldDye"}, {name: "指标显隐配置", state: "QuotaConfig"}, {name: "多指标渲染配置", state: "MultKpiConfig"}]);
		[Bindable]
		public var renders:ArrayCollection;
		[Bindable]
		public var unRenders:ArrayCollection;
		[Bindable]
		public var saveFlag:Boolean=false;
		public function QuitStatDM()
		{
		}

	}
}