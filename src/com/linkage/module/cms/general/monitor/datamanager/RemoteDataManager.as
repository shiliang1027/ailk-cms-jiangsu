package com.linkage.module.cms.general.monitor.datamanager
{
	import mx.collections.ArrayList;
	import mx.rpc.remoting.RemoteObject;

	/**
	 * 获取数据的接口
	 * @author czm
	 *
	 */
	public interface RemoteDataManager
	{

		/**
		 * 设置服务名
		 *
		 */
		function setEndPoint(context:String):void;

		/**
		 * 获取全部属地信息
		 * @return
		 */
		function getCityInfo(success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 供首页使用，
		 * 获取全省各个地市告警，工程，工单，投诉预警信息统计概况
		 * @param specIdList 要查询的专业列表
		 * @param alarmLevel 告警过滤级别（1只统计1级告警数，2只统计2级告警数，1，2统计1级和二级告警总数）
		 * @return
		 */
		function getDataView(specIdList:ArrayList, alarmLevel:String, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 概况监控一级视图使用，
		 * 用于获取全省各个业务域各网元类型资源统计数据
		 *
		 * @return
		 */
		function getAllProvinceResources(specIdList:ArrayList, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 概况监控一级视图使用，
		 * 用于获取全省所有告警信息统计数据
		 * @return
		 */
		function getAllProvinceAlarms(specIdList:ArrayList, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 概况监控一级视图使用，
		 * 用于获取全省所有基站小区退服告警统计数据
		 * @return
		 */
		function getAllProvinceOutService(success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 概况监控一级视图使用，
		 * 用于获取全省指定KPI指标的统计数据
		 * @param startTime 统计指标开始时间
		 * @param stopTime 统计指标结束时间
		 * @param subjectIdList 统计指标列表
		 * @return
		 */
		function getKpiPerfData(startTime:String, stopTime:String, subjectIdList:ArrayList, specIdList:ArrayList, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 概况监控一级视图使用，
		 * 用于获取全省指定KPI指标的统计数据
		 * @param startTime 统计指标开始时间
		 * @param stopTime 统计指标结束时间
		 * @param subjectIdList 统计指标列表
		 * @return
		 */
		function getKpiPerfDataBaseView(startTime:String, stopTime:String, subjectIdList:ArrayList, specIdList:ArrayList, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 概况监控一级视图使用，
		 * 用于按照15分钟、30分钟、60分钟粒度，展示对应粒度的KPI性能指标
		 * @param startTime 统计指标开始时间
		 * @param stopTime 统计指标结束时间
		 * @param subjectIdList 统计指标列表
		 * @return
		 */
		function getKpiPerfDataByInterval(startTime:String, stopTime:String, subjectIdList:ArrayList, specIdList:ArrayList, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 概况监控一级视图使用，
		 * 用于关联各个地市告警总数统计数据
		 * @return
		 */
		function getMatrixAlarmList(specIdList:ArrayList, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 概况监控一级、二级视图使用，
		 * 用于获取KPI性能数据图标展示需要的数据
		 * @param cityId 属地信息
		 * @param moTypeId 网元类型
		 * @param moId 网元标识符
		 * @param perfTypeId KPI指标ID
		 * @param statTime 统计结束时间点
		 * @param queryModel 查询模式，1：正常模式，2：同比，环比模式
		 * @return
		 */
		function getKpiGraphics(cityId:String, moTypeId:String, moId:String, perfTypeId:String, statTime:String, specIdList:ArrayList, queryModel:int, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 概况监控一级视图使用，
		 * 用于获取top N 统计数据
		 * @return
		 */
		function getKpiTopNList(specIdList:ArrayList, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 概况监控一级视图使用，
		 * 用于获取展现TOP N 图标时的使用
		 * @param n
		 * @param cityId
		 * @param moTypeId
		 * @param perfTypeIdList
		 * @param statTime
		 * @return
		 */
		function getTopNGraphicsData(specIdList:ArrayList, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 概况监控一级视图使用，
		 * 获取全省及各个地市各个专业的工程信息
		 * @return
		 */
		function getAllProvinceProjectData(specIdList:ArrayList, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 概况监控一级视图使用，
		 * 获取全省各个专业以及各个专业各个地市的统计数据
		 * @return
		 */
		function getAllProvinceDispatchData(specIdList:ArrayList, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 概况监控一级视图使用，
		 * 获取全省告警投诉信息
		 * @return
		 */
		function getAllProvinceComplaintDispatch(specIdList:ArrayList, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 概况监控一级视图使用，
		 * 获取全省坏小区统计信息
		 * @return
		 */
		function getAllBadCellData(success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 概况监控一级视图使用
		 * 获取全省工单流水信息
		 * @return
		 */
		function getAllProvinceCurrDispach(specIdList:ArrayList, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 概况监控一级视图使用
		 * 获取全省工程流水信息
		 * @return
		 */
		function getAllProvinceCurrPorject(specIdList:ArrayList, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 概况监控二级视图使用，
		 * 用于获取指定地市各个业务域各网元类型资源统计数据
		 * @param cityId
		 * @return
		 */
		function getCityResources(cityId:String, specIdList:ArrayList, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 概况监控二级视图使用，
		 * 用于获取指定地市及所属行政区各个专业域的告警信息
		 * @param cityId
		 * @return
		 */
		function getCityAllCityAlarms(cityId:String, specIdList:ArrayList, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 概况监控二级视图使用，
		 * 用于获取指定地市及所属行政区基站退服统计信息
		 * @param cityId
		 * @return
		 */
		function getCityAllOutService(cityId:String, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 概况监控二级视图使用，列表方式呈现
		 * 获取指定地市及其所属行政区，指定KPI指标的统计数据
		 * @param cityId 城市属地
		 * @param startTime 统计数据开始时间，时间格式为字符串表示的长整型（时间毫秒数）
		 * @param stopTime 统计数据结束时间，时间格式为字符串表示的长整型（时间毫秒数）
		 * @param subjectIdList 待统计的KPI列表
		 * @return
		 */
		function getCityKpiPerfData(cityId:String, startTime:String, stopTime:String, subjectIdList:ArrayList, specIdList:ArrayList, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 概况监控二级视图使用，以15、30、60分钟粒度划分，列表方式呈现
		 * 获取指定地市及其所属行政区指定KPI指标的统计数据
		 * @param cityId 城市属地ID
		 * @param startTime 统计数据开始时间，时间格式为字符串表示的长整型（时间毫秒数）
		 * @param stopTime 统计数据结束时间，时间格式为字符串表示的长整型（时间毫秒数）
		 * @param subjectIdList 待统计的KPI列表
		 * @return
		 */
		function getCityKpiPerfDataByInterval(cityId:String, startTime:String, stopTime:String, subjectIdList:ArrayList, specIdList:ArrayList, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 二级视图使用
		 * 用户获取指定地市的TOP N数据
		 * @param cityId
		 * @return
		 */
		function getCityTopNList(cityId:String, specIdList:ArrayList, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 二级视图使用
		 * 用于获取指定地市的topN 图标信息
		 * @param cityId 本地网ID
		 * @param specIdList 要查询的专业列表
		 * @return
		 */
		function getCityTopNGraphics(cityId:String, specIdList:ArrayList, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 概况监控二级视图使用，
		 * 获取指定地市各专业域的告警
		 * @param cityId 城市属地ID
		 * @return
		 */
		function getCityMatrixAlarmList(cityId:String, specIdList:ArrayList, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 概况监控二级视图使用，
		 * 获取指定地市的工程统计信息
		 * @param cityId 城市属地ID
		 * @return
		 */
		function getCityProjectData(cityId:String, specIdList:ArrayList, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 概况监控二级视图使用，
		 * 获取指定地市的工单统计信息
		 * @param cityId
		 * @return
		 */
		function getCityDispatchData(cityId:String, specIdList:ArrayList, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 概况监控二级视图使用，
		 * 获取指定地市的集中投诉预警信息
		 * @param cityId
		 * @return
		 */
		function getCityComplaintDispatch(cityId:String, specIdList:ArrayList, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 概况监控二级视图使用
		 * 获取指定地市及其所属行政区坏小区统计数据
		 * @param cityId
		 * @return
		 */
		function getCityBadCellData(cityId:String, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 概况监控二级视图使用
		 * 获取指定地市及其所属区县的工程流水信息
		 * @param cityId
		 * @return
		 */
		function getCityCurrProject(cityId:String, specIdList:ArrayList, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 概况监控二级视图使用
		 * 获取指定地市机器所属区县工单流水信息
		 * @param cityId
		 * @return
		 */
		function getCityCurrDispatch(cityId:String, specIdList:ArrayList, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 三级视图使用，
		 * 获取指定区县的退服统计数据
		 * @param areaId
		 * @return
		 */
		function getAreaOutServiceData(cityId:String, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 三级视图使用，
		 * 获取指定区县的劣化小区列表数据
		 * @param areaId
		 * @return
		 */
		function getAreaBadCellData(cityId:String, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 三级视图使用，
		 * 获取当前属地下所有基站统计数据
		 * @param areaId
		 * @return
		 */
		function getBtsStatData(cityId:String, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 三级视图使用，
		 * 获取当前属地下所有基站的信息
		 * @param areaId
		 * @return
		 */
		function getBtsInfoData(cityId:String, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 三级视图使用，
		 * 获取单个网元的信息，包括其告警，性能及资源相关信息
		 * @param moId
		 * @return
		 */
		function getNeInfoMap(moId:String, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 读取配置的视图显示信息
		 * @param typeId
		 * @return
		 */
		function getViewConfigXML(typeId:String, url:String, succ:Function, err:Function):void;

		/**
		 * 根据传入的设备名称和设备类型名称获取网元信息
		 * @param typeName 设备类型名称
		 * @param moName 设备名称
		 * @return
		 */
		function queryMoInfo(typeName:String, moName:String, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 根据本地网ID，查询所有下级属地
		 * @param pcityId 本地网ID
		 * @return
		 */
		function queryNextCity(pcityId:String, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 根据属地和设备类型查询网元
		 * @param cityId 本地网ID
		 * @param moTypeId 设备类型ID
		 * @return
		 */
		function queryMoByType(cityId:String, moTypeId:String, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 查询网元性能指标
		 * @param moTypeId 网元类型ID
		 * @param moId 网元编号
		 * @return
		 */
		function queryPerfByMo(moTypeId:String, moId:String, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 查询所有网元类型
		 * @return
		 */
		function querMoType(success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 获取属地区域信息
		 * 
		 * @param cityId : 本地网Id
		 * @return [{"city_id":"属地ID","border_info":[{"meridian":"经度","
		 *         dimension":"纬度"},……],"type":"1","gis_id":""},……]
		 */
		function getCityLocation(cityId:String,success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 获取本地网中心经纬度信息
		 * cityId : 本地网Id
		 * @return
		 */
		function getLocationByCityId(cityId:String,success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 查询属地覆盖区域
		 * @param cityId 属地Id
		 * @return
		 */
		function getCoverRegionDataByCityId(cityId:String,success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 概况监控二级视图视图使用
		 * 获取二级视图概况信息
		 * @param cityId
		 * @param specId
		 * @return
		 */
		function getCityDataView(cityId:String, specId:ArrayList, alarmLevel:String, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 概况监控一级视图使用
		 * 获取全省投诉预警图表数据
		 * @param specIdList 要查询的专业列表
		 * @return
		 */
		function getProvinceComplaintDispatchGraphics(specId:ArrayList, success:Function, complete:Function = null, error:Function = null):void; 
		
		/**
		 * 概况监控二级视图使用
		 * 获取地市及区县集中投诉预警图表数据
		 * @param cityId 本地网Id
		 * @param specIdList 要查询的专业列表
		 * @return
		 */
		function getCityComplaintDispatchGraphics(cityId:String, specId:ArrayList, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 获取某个投诉指标的趋势图
		 * @param cityName 属地名称，如："南京"
		 * @param bigSpecName 投诉指标大类名称，如："话音基本业务"
		 * @param smallSpecName 投诉指标小类名称，如:"网络覆盖"
		 * @return [{lebel=2011-08-06 10:34}, {lebel=2011-08-06 10:49}, {seriesName=南京_话音基本业务_网络覆盖}, {value=55}, {value=44}]
		 */
		function getComplaintDispatchChart(cityName:String,bigSpecName:String,smallSpecName:String, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 查询某个属地下所有有性能告警的网元信息
		 * @param cityId 属地Id（本地网Id或者区县Id）
		 * @param levelType 告警等级（如果为空，则返回所有级别的告警，如果有值，则只查询指定的告警等级）
		 * @param cityType 属地类型（0代表本地网，1代表区县）
		 * @param specIdList 要查询的专业列表
		 * @return [{"spec":"交换",devList:[{mo_name:"NJGS8",level:"1"},{mo_name:"NJGS16",level:"2"},{mo_name:"NJGS24",level:"3"}]},
		 * {"spec":"3G无线",devList:[{mo_name:"NJGS8",level:"1"},{mo_name:"NJGS16",level:"2"},{mo_name:"NJGS24",level:"3"}]},
		 * {"spec":"2G无线",devList:[{mo_name:"NJGS8",level:"1"},{mo_name:"NJGS16",level:"2"},{mo_name:"NJGS24",level:"3"}]},
		 * {"spec":"数据",devList:[{mo_name:"NJGS8",level:"1"},{mo_name:"NJGS16",level:"2"},{mo_name:"NJGS24",level:"3"}]}
		 * ];
		 */
		function getProvincePerfAlarmNe(cityId:String,cityType:String,specId:ArrayList, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 查询性能趋势图指标配置表
		 * @return
		 */
		function getPerfChartConfigInfo(success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 获取覆盖范围数据
		 * 
		 * @param paramMap
		 *            {"monitor_id":"场景ID","mo_type_id":"网元类型"}
		 * @return 如果为MSC/BSC/RNC：{"网元名称":["4323(GIS对象ID)","4325(GIS对象ID)",......
		 *         ],......};如果为BTS：{"bts":["4323(GIS对象ID)","4325(GIS对象ID)",......
		 *         ]};如果为NODEB：{"nodeb":["4323(GIS对象ID)","4325(GIS对象ID)",...... ]}
		 */
		function getCoverData(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 获取全省业务质量监控信息
		 * @return List<Map> [{title:"点对点短信",name:["区域","MO短信业务成功率","MT短信业务成功率","短信发送延时"],column:[city,a,b,c],dataList:[{"全省"，"92%","63","7"},{"苏州"，"85%","76%","6"}]}
		 * ,{title:"短信SP下发",name:["区域","MT短信业务成功率","MO短信业务成功率","SP到短信网管提交成功率"]，column:[city,a,b,c],dataList:[{"全省"，"92%","63","7"},{"苏州"，"85%","76%","99%"}]}
		 * 
		 * ]
		 */
		function getProvinceQosMonitorInfo(success:Function, complete:Function = null, error:Function = null):void;
		
		
		/**
		 * 获取地市业务质量监控信息
		 * @param cityId : 本地网ID
		 * @return List<Map> [{title:"点对点短信",name:["区域","MO短信业务成功率","MT短信业务成功率","短信发送延时"],column:[city,a,b,c],dataList:[{"南京鼓楼"，"92%","63","7"},{"南京建邺"，"85%","76%","6"}]}
		 * ,{title:"短信SP下发",name:["区域","MT短信业务成功率","MO短信业务成功率","SP到短信网管提交成功率"]，column:[city,a,b,c],dataList:[{"南京鼓楼"，"92%","63","7"},{"南京建邺"，"85%","76%","99%"}]}
		 * 
		 * ]
		 */
		function getCityQosMonitorInfo(cityId:String, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 获取地市工程网元信息
		 * @param cityId : 本地网ID
		 * 
		 */
		function getProjBtsInfo(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 获取指定网元信息，其中包含网元id,网元名称，属地id，属地名称，区县id，区县名称
		 * @param neId 网元名称
		 * @return {mo_id:"网元Id"，mo_name:"网元名称",city_id:"属地Id"，
		 * city_name:"属地名称"，county_id："区县Id"，county_name:区县名称}
		 */
		function getNeInfo(neId:String, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 通过过滤条件获取工单信息
		 * @param cityId 属地Id
		 * @param cityLayer 属地级别，2为本地网，3为区县
		 * @param alarmLevel 告警等级，取值是1，2，或者空字串、或者null。如果为空字符串或者null,则返回一级和二级告警级别的工单
		 * @return
		 */
		function getFilterDispatchInfo(cityId:String,cityLayer:String,alarmLevel:String, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 通过过滤条件获取属地下的工程信息
		 * @param cityId 属地Id
		 * @param cityLayer属地级别，2为本地网，3为区县
		 * @return
		 */
		function getFilterProjInfo(cityId:String,cityLayer:String, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 统计基站监控的资源数据
		 * @param specIdList
		 * @return
		 */
		function getBtsResourceStat(specIdList:ArrayList, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 统计基站监控的资源数据
		 * @param specIdList
		 * @return
		 */
		function getCityBtsResourceStat(cityId:String, specIdList:ArrayList, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 查询当前用户的属地信息
		 * @param paramMap 包含属性area_id
		 * @return
		 */
		function getAreaCity(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 查询某类型网元列表
		 * @param paramMap 包含属性area_id
		 * @return
		 */
		function getDevListByType(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
	}
}