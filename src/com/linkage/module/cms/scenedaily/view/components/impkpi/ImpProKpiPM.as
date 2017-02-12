package com.linkage.module.cms.scenedaily.view.components.impkpi
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.domain.impkpi.ImpProKpiDM;
	import com.linkage.module.cms.scenedaily.event.SceneDailyEvent;
	import com.linkage.module.cms.scenedaily.event.impkpi.ImpProKpiEvent;

	import mx.collections.ArrayCollection;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-8-20
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ImpProKpiPM
	{
		private var log:ILogger = Log.getLoggerByClass(ImpProKpiPM);
		[Inject("impProKpiDM")]
		[Bindable]
		public var impProKpiDM:ImpProKpiDM;
		[MessageDispatcher]
		public var msgDispatcher:Function;

		/**
		 * 获取重点性能指标展示列表
		 */
		public function getImpProKpiList(indexPage:int, perPageCount:int, perfName:String):void
		{
			var e:ImpProKpiEvent = new ImpProKpiEvent(ImpProKpiEvent.GET_IMP_PRO_KPI_DATA);
			e.indexPage = indexPage;
			e.perPageCount = perPageCount;
			e.perfName = perfName;
			msgDispatcher(e);
		}

		/**
		 * 根据类型获取已选择/未选择指标列表
		 */
		public function getImpKpiByType(status:int):void
		{
			//未选择
			if (status == 0)
			{
				var e1:ImpProKpiEvent = new ImpProKpiEvent(ImpProKpiEvent.GET_IMP_PRO_KPI_NOT_SELECT_DATA);
				e1.status = status;
				msgDispatcher(e1);
			}
			//已选择
			if (status == 1)
			{
				var e2:ImpProKpiEvent = new ImpProKpiEvent(ImpProKpiEvent.GET_IMP_PRO_KPI_IS_SELECT_DATA);
				e2.status = status;
				msgDispatcher(e2);
			}

		}

		/**
		 * 保存重点性能指标设置结果集
		 */
		public function saveImpKpiList(isSelectDataList:ArrayCollection, viewType:String):void
		{
			var e:ImpProKpiEvent = new ImpProKpiEvent(ImpProKpiEvent.ADD_IMP_PRO_KPI_DATA);
			for (var i:int = 0; i < isSelectDataList.length; i++)
			{
				isSelectDataList[i].order = i;
				isSelectDataList[i].viewType = viewType;
			}

			e.isSelectDataList = isSelectDataList;
			msgDispatcher(e);
		}

		/**
		 * 重点性能指标对外派发事件
		 * kpiId：指标ID
		 * moTypeId:网元类型
		 * perfGroupName：指标名称
		 * kpiValue：指标值
		 * interval：统计粒度(1:日,2:周,3:月)
		 * viewType：视图层次(1:领导,2:管理,3:一线)
		 * isHealthOrThreshold：健康度、阀值劣化(1：健康度，2：阀值劣化)
		 * resId:资源Id
		 * resType:资源类型 1:resId为省份Id 2:resId为地市Id3:resId为网元Id
		 * statisticsDate:统计时间
		 */
		public function addEvent(param:Object):void
		{
			var e:SceneDailyEvent = new SceneDailyEvent(SceneDailyEvent.LOAD_IMP_PRO_KPI_EVENT);
			log.debug("外派事件参数列表：");
			e.param = param;
			this.msgDispatcher(e);
		}
	}
}

