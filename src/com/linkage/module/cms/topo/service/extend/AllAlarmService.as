package com.linkage.module.cms.topo.service.extend
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.system.utils.StringUtils;
	import com.linkage.module.topo.framework.data.IDataSource;
	import com.linkage.module.topo.framework.service.extend.alarm.AbstractAlarmRefService;
	import com.linkage.module.topo.framework.view.component.TopoLayer;
	import com.linkage.system.structure.map.IMap;
	
	public class AllAlarmService  extends AbstractAlarmRefService
	{
		
		private var log:ILogger = Log.getLoggerByClass(AllAlarmService);
		// 数据源
		private var _dataSource:IDataSource = null;
		public function AllAlarmService(dataSource:IDataSource)
		{
			super();
			_dataSource = dataSource;
		}
		
		override public function get name():String
		{
			return "拓扑全量告警刷新业务逻辑";
		}
		
		/**
		 * 从拓扑服务模块获取告警
		 * @param topoLayer
		 * @return
		 *
		 */
		override protected function loadTopoLayerAlarms(topoLayer:TopoLayer):Boolean
		{
			if (topoLayer == null)
			{
				return false;
			}
			if (StringUtils.isEmpty(topoLayer.topoId))
			{
				return false;
			}
			
			var startTime:Number = new Date().getTime();
			var loadAlarmTag:String = topoLayer.topoId + ":" + topoLayer.topoViewName + "@default-topo";
			//			log.debug("[刷新告警]Start... {0}", loadAlarmTag);
			
			//			var topoId:String = topoLayer.topoId;
			topoLayer.clearAlarm();
			// 依次刷新
			var tn2IdMap:IMap = topoLayer.topoName2refreshAlarmElementIdArray;
			var tl2IdMap:IMap = topoLayer.topoName2refreshAlarmLinkIdArray;
			//			var extInfo:String = topoCanvas.extInfo;
			var topoNameArray:Array = [];
			tn2IdMap.forEach(function(topoName:String, idArray:Array):void
			{
				topoNameArray.push(topoName);
			});
			var size:int = topoNameArray.length;
			if (size == 0)
			{
				//				log.debug("[刷新告警]没有topoName,无需刷新告警");
				return true;
			}
			var index:int = 0;
			log.info("[refresh alarm]");
			var params:Object=new Object();
			params.topoName="default-topo";
			params.type=topoLayer.topoId;
			params.objIds=Array(tn2IdMap.get(topoNameArray[index])).join(",");
			params.linkIds="";
			params.extInfo=topoLayer.extInfo;
			log.info(params);
			//			refreshAlarm(topoNameArray[index], topoId, tn2IdMap.get(topoNameArray[index]), tl2IdMap.get(topoNameArray[index]), extInfo, afterLoadAlarmsSuccess, afterLoadAlarmsError);
			refreshAlarm(params,afterLoadAlarmsSuccess, afterLoadAlarmsError);
			function refreshAlarm(params:Object, success:Function, error:Function):void
			{
				//				log.debug("[刷新告警] 开始加载 {0} 的告警 ... 数量:{1}", topoName, idArray.length);
				//topoName, topoId, idArray.join(","), (idArray1 != null ? idArray1.join(",") : ""), extInfo
				_dataSource.loadAlarms(params, success, null, error);
			}
			
			// 加载成功后的回调
			function afterLoadAlarmsSuccess(alarms:Object):void
			{
//				topoLayer.alarms=alarms;
				topoLayer.appendAlarms(alarms);
				index++;
				if (index == size)
				{
					topoLayer.triggerAlarmRender();
					//					log.debug("[刷新告警]End. 耗时:{1}s. {0}", loadAlarmTag, (new Date().getTime() - startTime) / 1000.00);
					return;
				}
				var params:Object=new Object();
				params.topoName="default-topo";
				params.type=topoLayer.topoId;
				params.objIds=Array(tn2IdMap.get(topoNameArray[index])).join(",");
				params.linkIds="";
				params.extInfo=topoLayer.extInfo;
				refreshAlarm(params, afterLoadAlarmsSuccess, afterLoadAlarmsError);
			}
			
			// 加载失败后的回调
			function afterLoadAlarmsError():void
			{
				index++;
				if (index == size)
				{
					topoLayer.triggerAlarmRender();
					//					log.debug("[刷新告警]End. 耗时:{1}s. {0}", loadAlarmTag, (new Date().getTime() - startTime) / 1000.00);
					return;
				}
				var params:Object=new Object();
				params.topoName="default-topo";
				params.type=topoLayer.topoId;
				params.objIds=Array(tn2IdMap.get(topoNameArray[index])).join(",");
				params.linkIds="";
				params.extInfo=topoLayer.extInfo;
				refreshAlarm(params, afterLoadAlarmsSuccess, afterLoadAlarmsError);
			}
			
			return true;
		}
	}
}