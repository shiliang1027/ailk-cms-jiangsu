package com.linkage.module.cms.scenedaily.serv.impkpi
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.impkpi.ImpProKpiDao;
	import com.linkage.module.cms.scenedaily.domain.common.IUser;
	import com.linkage.module.cms.scenedaily.domain.impkpi.ImpProKpiDM;
	import com.linkage.module.cms.scenedaily.event.SceneDailyEvent;
	import com.linkage.module.cms.scenedaily.event.impkpi.ImpProKpiEvent;

	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-8-21
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class GetImpKpiDataCmd
	{
		private var log:ILogger = Log.getLoggerByClass(GetImpKpiDataCmd);
		[Inject("impProKpiDM")]
		public var impProKpiDM:ImpProKpiDM;
		[Inject("impProKpiDao")]
		public var impProKpiDao:ImpProKpiDao;
		[Inject("user")]
		public var user:IUser;
		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:ImpProKpiEvent):AsyncToken
		{
			log.debug("[重点指标性能]:指标概览cmd捕获事件...");
			return impProKpiDao.getImpKpiGeneralInfo(e.indexPage, e.perPageCount, e.perfName);
		}

		public function result(data:Object):void
		{
			log.debug("[重点指标性能]kpidata result...");
			impProKpiDM.indexPage = data.indexPage;
			impProKpiDM.pageCounts = data.pageCounts;

			if (data.hasOwnProperty("counts"))
				impProKpiDM.counts = data.counts;

			log.debug("重点指标：页数信息...");

			impProKpiDM.kpiResultData.removeAll();
			impProKpiDM.kpiResultData.addAll(data.data as IList);
			impProKpiDM.kpiResultData.refresh();


			var e:SceneDailyEvent;
			var param:Object = new Object;
			if (impProKpiDM.kpiResultData.length > 0)
			{
				log.debug("[重点指标性能]外派第一条数据信息。。。");
				e = new SceneDailyEvent(SceneDailyEvent.LOAD_IMP_PRO_KPI_EVENT);
				//将指定指标kpiId moTypeId perfGroupName  kpiValue 放入user中

//				param.kpiValue = impProKpiDM.kpiResultData.getItemAt(0)['kpiValue'];

				if (user.kpiId == null || user.kpiId.length == 0)
				{
//					param.kpiId = impProKpiDM.kpiResultData.getItemAt(0)['kpiId'];
//					param.moTypeId = impProKpiDM.kpiResultData.getItemAt(0)['moTypeId'];
//					param.perfGroupName = impProKpiDM.kpiResultData.getItemAt(0)['perfGroupName'];
//					param.kpiValue = impProKpiDM.kpiResultData.getItemAt(0)['kpiValue'];
//
//					log.info("user 中如果不存在kpiId指标[{0}]，那么默认第一个指标[{1}]", user.kpiId, param.kpiId);
//					user.kpiId = param.kpiId;
//					user.moTypeId = param.moTypeId;
//					user.kpiValue = param.kpiValue;
//					user.kpiName = param.perfGroupName;
				}
				else
				{
					//TODO 未判断该指标是否存在于当前查询出来的集合中
					log.info("user 中如果存在指标，那么还使用该指标[{0}]", user.kpiId);
					param.kpiId = user.kpiId;
					param.moTypeId = user.moTypeId;
					param.perfGroupName = user.kpiName;

					user.kpiValue = ""; //先置空kpiValue;
					for each (var kpi:Object in impProKpiDM.kpiResultData)
					{
						if (kpi.hasOwnProperty("kpiId") && kpi.kpiId == user.kpiId)
						{
							user.kpiValue = kpi.kpiValue; //变动后，指标值也变动
							param.kpiValue = kpi.kpiValue;
							break;
						}
					}
					if (user.kpiValue == "")
					{
						log.info("查询的结果集中不存在跳转的指标[{0}]！！！", user.kpiId);
					}
						//					param.kpiValue = user.kpiValue;
				}

				param.interval = user.interval;
				param.viewType = user.viewType;
				param.isHealthOrThreshold = user.isHealthOrThreshold;
				param.resId = user.resId;
				param.resType = user.resType;
				param.statisticsDate = user.gatherTime;


				e.param = param;
				msgDispatcher(e);
			}
			else
			{
				log.info("如果不存在指标，那么置空user中相关指标数据:");
				user.kpiId = null;
				user.moTypeId = null;
				user.kpiValue = "";
				user.kpiName = "";
				e = new SceneDailyEvent(SceneDailyEvent.LOAD_IMP_PRO_KPI_EVENT);
				param.kpiId = null;
				param.moTypeId = null;
				param.perfGroupName = "";
				param.kpiValue = "";
				param.interval = user.interval;
				param.viewType = user.viewType;
				param.isHealthOrThreshold = user.isHealthOrThreshold;
				param.resId = user.resId;
				param.resType = user.resType;
				param.statisticsDate = user.gatherTime;
				e.param = param;
				msgDispatcher(e);
			}

			var e2:ImpProKpiEvent = new ImpProKpiEvent(ImpProKpiEvent.SHOW_IMP_PRO_KPI_DATA);
			msgDispatcher(e2);
		}

		public function error(f:Fault):void
		{
			log.error("[重点指标性能]:cmd返回失败..." + f.faultString + "," + f.faultDetail);
		}
	}
}


