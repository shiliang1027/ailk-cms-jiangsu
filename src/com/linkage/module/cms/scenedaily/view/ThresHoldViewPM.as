package com.linkage.module.cms.scenedaily.view
{
	import com.linkage.module.cms.scenedaily.domain.threshold.ThresHoldDM;
	import com.linkage.module.cms.scenedaily.event.threshold.ThresHoldEvent;

	import mx.collections.ArrayCollection;

	import org.spicefactory.lib.reflect.types.Void;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-9-5
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ThresHoldViewPM
	{
		[Bindable]
		[Inject("thresHoldDM")]
		public var dm:ThresHoldDM;

		public var liduReMap:Object = {"1": "采集粒度阈值", "2": "小时粒度阈值", "3": "日粒度阈值", "4": "周粒度阈值", "5": "月粒度阈值"};

		[MessageDispatcher]
		public var dispatchMsg:Function;

		//指标分类
		[Bindable]
		public var kpiTypeList:ArrayCollection = new ArrayCollection([{"key": "0", "value": "请选择"}, {"key": "1", "value": "GSM客户感知指标"}, {"key": "2", "value": "TD客户感知指标"}, {"key": "3", "value": "全专业质量指标"}, {"key": "4", "value": "业务量指标"}]);

		//判断一个数是否在两书之间
		//d1比较数  d2被比较数里的小数字  d3被比价数大数字
		public function mixed(d1:int, c1:int, d2:int, c2:int, d3:int, c3:int):Boolean
		{
			if (d1 == d2)
			{
				if ((c1 == 2 || c1 == 3 || c1 == 5) && (c2 == 2 || c2 == 3 || c2 == 5))
				{
					return true;
				}
			}
			if (d1 == d3)
			{
				if ((c1 == 2 || c1 == 3 || c1 == 5) && (c3 == 2 || c3 == 3 || c3 == 5))
				{
					return true;
				}
			}
			if (d2 < d1 && d1 < d3)
			{
				return true;
			}
			return false;
		}

		//导出
		public function exportData():void
		{
			dispatchMsg(new ThresHoldEvent(ThresHoldEvent.EXPORT_THRESHOLD_DATAS));
		}

		//导入
		public function importData():void
		{
			dispatchMsg(new ThresHoldEvent(ThresHoldEvent.IMPORT_THRESHOLD_DATAS));
		}

	}
}