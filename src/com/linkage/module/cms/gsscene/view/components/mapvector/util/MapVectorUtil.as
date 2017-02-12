package com.linkage.module.cms.gsscene.view.components.mapvector.util
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.util.GsSceneConts;
	import com.linkage.module.cms.gsscene.view.components.mapvector.components.MapVectorAlarmLabelTip;
	import com.linkage.module.cms.gsscene.view.components.mapvector.components.MapVectorAreaLabelTip;
	import com.linkage.module.cms.gsscene.view.components.mapvector.components.MapVectorKPILabelTip;
	import com.linkage.module.cms.gsscene.view.components.mapvector.components.MapVectorQuitLabelTip;
	
	public class MapVectorUtil
	{
		private var tip1:MapVectorAlarmLabelTip;
		private var tip2:MapVectorQuitLabelTip;
		private var tip3:MapVectorAreaLabelTip;
		private var tip4:MapVectorKPILabelTip;
		
		//日志
		public static var log:ILogger = Log.getLoggerByClass(MapVectorUtil);
		
		public static function getTipClass(loadMapInfoType:String):String
		{
			var className:String;
			switch(loadMapInfoType)
			{
				case GsSceneConts.loadMapInfoType_alarm:
				{
					//1-表示查询设备，性能告警网元数；
					className = "com.linkage.module.cms.gsscene.view.components.mapvector.components.MapVectorAlarmLabelTip";
					break;
				}
				case GsSceneConts.loadMapInfoType_quit:
				{
					//2-表示退服的2G，3G，4G网元数；
					className = "com.linkage.module.cms.gsscene.view.components.mapvector.components.MapVectorQuitLabelTip";
					break;
				}
				case GsSceneConts.loadMapInfoType_area:
				{
					//3-表示查询区域相关信息;
					className = "com.linkage.module.cms.gsscene.view.components.mapvector.components.MapVectorAreaLabelTip";
					break;
				}
				case GsSceneConts.loadMapInfoType_kpi:
				{
					//4-表示查询某项 指标的值。
					className = "com.linkage.module.cms.gsscene.view.components.mapvector.components.MapVectorKPILabelTip";
					break;
				}
				default:
				{
					className = "com.linkage.module.cms.gsscene.view.components.mapvector.components.MapVectorAlarmLabelTip";
					break;
				}
		    }
			return className;
		}
	}
}

