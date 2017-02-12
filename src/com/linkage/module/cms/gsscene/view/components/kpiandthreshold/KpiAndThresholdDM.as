package com.linkage.module.cms.gsscene.view.components.kpiandthreshold
{
	import mx.collections.ArrayCollection;

	public class KpiAndThresholdDM
	{
			//private var _KpiAndThresholdList:ArrayCollection = new ArrayCollection();
			
		private var _KpiAndThresholdList:ArrayCollection= new ArrayCollection([
				{resourceName:"kpi趋势01",resourceType:"网元级01",kpiName:"kpiP01",moTypeName:"motype01",cityName:"南京",sceneName:"8",thresholdsUpper:"55",thresholdsFloor:"1",isAlarm:"是",alarmLevel:"一级",colour:"红",isPi:"是"},
				{resourceName:"kpi趋势02",resourceType:"网元级02",kpiName:"kpiP02",moTypeName:"motype02",cityName:"扬州",sceneName:"8",thresholdsUpper:"55",thresholdsFloor:"1",isAlarm:"是",alarmLevel:"三级",colour:"黄",isPi:"否"},
				{resourceName:"kpi趋势03",resourceType:"网元级03",kpiName:"kpiP03",moTypeName:"motype03",cityName:"盐城",sceneName:"8",thresholdsUpper:"55",thresholdsFloor:"1",isAlarm:"否",alarmLevel:"三级",colour:"黄",isPi:"否"},
				{resourceName:"kpi趋势04",resourceType:"网元级04",kpiName:"kpiP04",moTypeName:"motype04",cityName:"徐州",sceneName:"8",thresholdsUpper:"55",thresholdsFloor:"1",isAlarm:"是",alarmLevel:"四级",colour:"绿",isPi:"是"},
				{resourceName:"kpi趋势05",resourceType:"网元级05",kpiName:"kpiP05",moTypeName:"motype05",cityName:"上海",sceneName:"8",thresholdsUpper:"55",thresholdsFloor:"1",isAlarm:"否",alarmLevel:"三级",colour:"黄",isPi:"否"},
				{resourceName:"kpi趋势06",resourceType:"网元级06",kpiName:"kpiP06",moTypeName:"motype06",cityName:"北京",sceneName:"8",thresholdsUpper:"55",thresholdsFloor:"1",isAlarm:"否",alarmLevel:"一级",colour:"红",isPi:"是"},
				{resourceName:"kpi趋势07",resourceType:"网元级07",kpiName:"kpiP07",moTypeName:"motype07",cityName:"昆明",sceneName:"7",thresholdsUpper:"55",thresholdsFloor:"1",isAlarm:"否",alarmLevel:"四级",colour:"绿",isPi:"是"},
				{resourceName:"kpi趋势08",resourceType:"网元级08",kpiName:"kpiP08",moTypeName:"motype08",cityName:"西安",sceneName:"7",thresholdsUpper:"55",thresholdsFloor:"1",isAlarm:"是",alarmLevel:"二级",colour:"橙",isPi:"否"},
				{resourceName:"kpi趋势09",resourceType:"网元级09",kpiName:"kpiP09",moTypeName:"motype09",cityName:"通辽",sceneName:"7",thresholdsUpper:"55",thresholdsFloor:"1",isAlarm:"否",alarmLevel:"四级",colour:"绿",isPi:"否"},
				{resourceName:"kpi趋势10",resourceType:"网元级10",kpiName:"kpiP10",moTypeName:"motype10",cityName:"杭州",sceneName:"7",thresholdsUpper:"55",thresholdsFloor:"1",isAlarm:"是",alarmLevel:"三级",colour:"黄",isPi:"是"},
				{resourceName:"kpi趋势11",resourceType:"网元级11",kpiName:"kpiP11",moTypeName:"motype11",cityName:"苏州",sceneName:"7",thresholdsUpper:"55",thresholdsFloor:"1",isAlarm:"否",alarmLevel:"二级",colour:"橙",isPi:"是"},
				{resourceName:"kpi趋势12",resourceType:"网元级12",kpiName:"kpiP12",moTypeName:"motype12",cityName:"大连",sceneName:"7",thresholdsUpper:"55",thresholdsFloor:"1",isAlarm:"是",alarmLevel:"三级",colour:"黄",isPi:"否"}
			])
			
			public function get KpiAndThresholdList():ArrayCollection
			{
				return _KpiAndThresholdList;
			}
			
			[Bindable]
			public function set KpiAndThresholdList(value:ArrayCollection):void
			{
				_KpiAndThresholdList = value;
			}
		}
	}