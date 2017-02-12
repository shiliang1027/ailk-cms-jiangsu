package com.linkage.module.cms.oneline.serv.wireless
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.oneline.dao.wireless.IGisHotDAO;
	import com.linkage.module.cms.oneline.domain.wireless.GisHotDM;
	import com.linkage.module.cms.oneline.domain.wireless.IUser;
	import com.linkage.module.cms.oneline.event.wireless.GisHotEvent;
	
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 * GIS热图左侧地市列表数据服务
	 *
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-12-10
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class GisHotCitysDataCMD
	{
		private var log:ILogger=Log.getLoggerByClass(GisHotCitysDataCMD);
		
		[Inject("user")]
		public var user:IUser;
		
		[Inject("gisHotDAO")]
		public var dao:IGisHotDAO;
		
		[Inject("gisHotDM")]
		public var dm:GisHotDM;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		private var map:Array = new Array();
		
		public function execute(e:GisHotEvent):AsyncToken
		{
			log.debug("[查询GIS热图地市列表数据]");
			if(!e.param){
				e.param = new Object();
			}
			e.param.areaId=user.areaId;
			log.debug(e.param);
			return dao.getCitys(e.param);
		}
		
		/**
		 *
		 * @param obj
		 *
		 */
		public function result(obj:Object):void
		{
			log.debug("[查询GIS热图地市列表数据结果]");
			log.debug(obj);
			map.push({city_id:"00",city_name:"全省",children:new ArrayCollection()});
			for each(var item:* in obj){
//				if(item.parent_id != "00"){
					var parent:* = getParent(item.parent_id);
					if(parent){
						if(!parent.children){
							parent.children = new ArrayCollection();
						}
						ArrayCollection(parent.children).addItem(item);
					}
//				}else{
//					item.children = new ArrayCollection();
//					map.push(item);
//				}
			}
			dm.citys = new ArrayCollection(map);
			dispatchMsg(new GisHotEvent(GisHotEvent.LOADCITYSDATACOMPLETE));
		}
		
		private function getParent(parent_id:Object):*{
			var parent:*;
			for each(var item:* in map){
				if(item.city_id == parent_id){
					parent = item;
					break;
				}else if(item.children){
					for each(var child:* in item.children){
						if(child.city_id == parent_id){
							parent = child;
							break;
						}
					}
				}
			}
//			map.forEach(function callback(item:*, index:int, array:Array):void{
//				if(item.city_id == parent_id){
//					parent = item;
//				}
//			});
			return parent;
		}
		
		public function error(f:Fault):void
		{
			log.error("[查询GIS热图地市列表数据]失败：" + f.faultString + "::" +f.faultDetail);
			//			dm.kpiCollectData = new ArrayCollection([{time:"11-15 00:00",value:"20.2",up_threshold:"53",down_threshold:"23"},{time:"11-15 01:00",value:"25.2",up_threshold:"53",down_threshold:"23"},{time:"11-15 02:00",value:"23.2",up_threshold:"53",down_threshold:"23"},{time:"11-15 03:00",value:"23.2",up_threshold:"53",down_threshold:"23"},{time:"11-15 04:00",value:"23.2",up_threshold:"53",down_threshold:"23"},{time:"11-15 05:00",value:"28.2",up_threshold:"53",down_threshold:"23"},{time:"11-15 06:00",value:"23.2",up_threshold:"53",down_threshold:"23"}]);
//			dm.citys = new ArrayCollection([{cityId:"1",cityName:"南京",children:[{cityId:"01",cityName:"南京市区"},{cityId:"02",cityName:"南京鼓楼"}]},{cityId:"2",cityName:"苏州",children:[{cityId:"01",cityName:"苏州市区"},{cityId:"02",cityName:"苏州其它"}]}]);
			dispatchMsg(new GisHotEvent(GisHotEvent.LOADCITYSDATAERROR));
		}
	}
}