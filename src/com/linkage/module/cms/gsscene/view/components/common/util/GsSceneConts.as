package com.linkage.module.cms.gsscene.view.components.common.util
{

	public class GsSceneConts
	{
		public static var Province_KEY:String = "00";
		
		
		//loadMapInfoType
		//加载地图数据的类型
		//1-表示查询设备，性能告警网元数；
		public static var loadMapInfoType_alarm:String = "1";
		//2-表示退服的2G，3G，4G网元数；
		public static var loadMapInfoType_quit:String = "2";
		//3-表示查询区域相关信息;
		public static var loadMapInfoType_area:String = "3";
		//4-表示查询某项 指标的值。
		public static var loadMapInfoType_kpi:String = "4";
		
		
		
		
		
		
		
		//除机房以外 的网元的资源信息链接 （需要参数qryMoId）
		public static var cellDetailURL:String = "cms/resource/moinfo/ResourceMoInfo!queryMoInfo.action";
		
		public static var perfDetailURL:String = "cms/performance/report/permsg!initForm.action";
		
		public static var logicTopoURL:String = "cms/webtopo/topo/topolocate.action";
	}
}