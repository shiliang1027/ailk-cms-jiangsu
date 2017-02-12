package com.linkage.module.cms.groupmonitor.custscene.view
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.groupmonitor.custscene.domain.CustChartDM;
	import com.linkage.module.cms.groupmonitor.custscene.domain.CustSceneDM;
	import com.linkage.module.cms.groupmonitor.custscene.event.CustSceneEvent;
	
	import mx.events.ListEvent;
	
	import spark.components.Group;
	import spark.events.IndexChangeEvent;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-10-11
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class CustSceneViewPM
	{
		private var log:ILogger=Log.getLoggerByClass(CustSceneViewPM);

		private var _columnarGroup:Group;

		private var _disGroup:Group;

		//设备告警流水参数
		[Bindable]
		public var params:Object=new Object();

		public var type:String="1";

		[Inject]
		[Bindable]
		public var dm:CustSceneDM;
		
		[Inject]
		[Bindable]
		public var ccdm:CustChartDM;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function loadBaseTree():void
		{
			var evt:CustSceneEvent=new CustSceneEvent(CustSceneEvent.LOAS_BASE_TREE_DATA);
			evt.param=new Object;
			evt.param.type=type;
			msgDispatcher(evt);
		}

		public function get columnarGroup():Group
		{
			return _columnarGroup;
		}

		public function set columnarGroup(value:Group):void
		{
			_columnarGroup=value;

		}

		[Bindable]
		public function get disGroup():Group
		{
			return _disGroup;
		}

		public function set disGroup(value:Group):void
		{
			_disGroup=value;
		}


//		//处理树上的点击事件
//		public function treeChang(item:Object):void
//		{
//			log.info("name" + String(item.@A) + "cp" + String(item.@cp));
//			if (Boolean(String(item.@cust_id)))
//			{
//				log.info("treeChang load big cust data");
//				var evt1:CustSceneEvent=new CustSceneEvent(CustSceneEvent.LOAS_BIG_CUST_DATA);
//				var param1:Object=new Object();
//				param1.cust_id=String(item.@cust_id);
//				evt1.param=param1;
//				msgDispatcher(evt1);
//			}
//			else if (Boolean(String(item.@servClick)))
//			{
//				var evt:CustSceneEvent=new CustSceneEvent(CustSceneEvent.LOAD_PAGE_TREE_DATA);
//				var param:Object=new Object();
//				param.name=String(item.@A);
//				param.cp=String(item.@cp);
//				evt.param=param;
//				msgDispatcher(evt);
//				
//			}
//			else
//			{
//				log.info("other condition");
//			}
//		}

	}
}