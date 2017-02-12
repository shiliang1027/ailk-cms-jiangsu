package com.linkage.module.cms.oneline.serv.wireless
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.oneline.dao.wireless.IGisHotDAO;
	import com.linkage.module.cms.oneline.domain.wireless.GisHotDM;
	import com.linkage.module.cms.oneline.domain.wireless.IUser;
	import com.linkage.module.cms.oneline.event.wireless.GisHotEvent;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 * GIS热图右侧列表数据服务
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
	public class GisHotCellDataCMD
	{
		private var log:ILogger=Log.getLoggerByClass(GisHotCellDataCMD);
		
		[Inject("user")]
		public var user:IUser;
		
		[Inject("gisHotDAO")]
		public var dao:IGisHotDAO;
		
		[Inject("gisHotDM")]
		public var dm:GisHotDM;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		
		private var def:String;
		
		public function execute(e:GisHotEvent):AsyncToken
		{
			log.debug("[查询GIS热图右侧列表数据]");
			if(!e.param){
				e.param = new Object();
			}
			def = e.param.def;
			e.param.areaId=user.areaId;
			log.debug(e.param);
			if(e.param.cityIds){
				log.info("getHotSpotCell");
				return dao.getHotSpotCell(e.param);
			}
			log.info("queryMapContainsMo");
			return dao.queryMapContainsMo(e.param);
		}
		
		/**
		 *
		 * @param obj
		 *
		 */
		public function result(obj:Object):void
		{
			log.debug("[查询GIS热图右侧列表数据结果]");
			var item:*;
			var picList:ArrayCollection;
			dm.picLayerList.removeAll();
			if(def == "0"){
				log.info("def == 0");
				if(dm.picLayerList.length<1){
					picList = new ArrayCollection();
					for each(item in obj.grid){
						picList.addItem({"name":item.kpiName,"selected":true,"id":item.kpiId});
					}
					
					dm.picLayerList.addItem({typeName:"自定义热点小区",datas:picList});
				}
				
				dm.hotspots1 = ArrayCollection(obj.grid);
				dm.hotspots.addItem({typeName:"自定义热点小区",datas:obj.gis});
			}else if(def == "1"){
				log.info("def == 1");
//				if(dm.picLayerList.length<1){
					picList = new ArrayCollection();
					for each(item in obj.grid){
						picList.addItem({"name":item.kpiName,"selected":true,"id":item.kpiId});
					}
					dm.picLayerList.addItem({typeName:"动态发现热点区域",datas:picList});
//				}
				dm.hotspots2 = ArrayCollection(obj.grid);
				dm.hotspots.addItem({typeName:"动态发现热点区域",datas:obj.gis});
				dm.biaoji = 1;
				
//				dm.hotspots3 = ArrayCollection(obj.historyGrid);//汪炜，2013-8-12，历史热点区域
				
				log.info("-------------加载小区信息--dm.hotspots----------------" +dm.hotspots.length );
				log.info(dm.hotspots);
				log.info("-------------加载小区信息--dm.hotspots.datas----------------"  );
				log.info(obj.gis);
				
			}
			dispatchMsg(new GisHotEvent(GisHotEvent.LOADHOTSPOTCELLDATACOMPLETE));
			if(dm.queryGisInfoFlag){//只有当点击的是历史热点时才不刷新页面的图形。mod by 汪炜。
				dm.hotspots.refresh();
			}
		}
		
		public function error(f:Fault):void
		{
			log.error("[查询GIS热图右侧列表数据]失败：" + f.faultString + "::" +f.faultDetail);
			//			dm.kpiCollectData = new ArrayCollection([{time:"11-15 00:00",value:"20.2",up_threshold:"53",down_threshold:"23"},{time:"11-15 01:00",value:"25.2",up_threshold:"53",down_threshold:"23"},{time:"11-15 02:00",value:"23.2",up_threshold:"53",down_threshold:"23"},{time:"11-15 03:00",value:"23.2",up_threshold:"53",down_threshold:"23"},{time:"11-15 04:00",value:"23.2",up_threshold:"53",down_threshold:"23"},{time:"11-15 05:00",value:"28.2",up_threshold:"53",down_threshold:"23"},{time:"11-15 06:00",value:"23.2",up_threshold:"53",down_threshold:"23"}]);
//			if(def == "0"){
//				dm.hotspots.addItem({typeName:"自定义热点小区",datas:new ArrayCollection([{kpiId:"1",kpiName:"掉话率",def:"0",infos:[{mo_id:"1",mo_name:"网元1",cityName:"南京",num:"30"},{mo_id:"2",mo_name:"网元2",cityName:"苏州",num:"50"},{mo_id:"2",mo_name:"网元2",cityName:"苏州",num:"50"},{mo_id:"2",mo_name:"网元2",cityName:"苏州",num:"50"},{mo_id:"2",mo_name:"网元2",cityName:"苏州",num:"50"},{mo_id:"2",mo_name:"网元2",cityName:"苏州",num:"50"},{mo_id:"2",mo_name:"网元2",cityName:"苏州",num:"50"},{mo_id:"2",mo_name:"网元2",cityName:"苏州",num:"50"},{mo_id:"2",mo_name:"网元2",cityName:"苏州",num:"50"},{mo_id:"2",mo_name:"网元2",cityName:"苏州",num:"50"}]},{kpiId:"2",kpiName:"切换成功率",def:"0",infos:[{mo_id:"1",mo_name:"网元1",cityName:"南京",num:"30"},{mo_id:"2",mo_name:"网元2",cityName:"苏州",num:"50"}]},{kpiId:"2",kpiName:"切换成功率",def:"0",infos:[{mo_id:"1",mo_name:"网元1",cityName:"南京",num:"30"},{mo_id:"2",mo_name:"网元2",cityName:"苏州",num:"50"}]},{kpiId:"2",kpiName:"切换成功率",def:"0",infos:[{mo_id:"1",mo_name:"网元1",cityName:"南京",num:"30"},{mo_id:"2",mo_name:"网元2",cityName:"苏州",num:"50"}]},{kpiId:"2",kpiName:"切换成功率",def:"0",infos:[{mo_id:"1",mo_name:"网元1",cityName:"南京",num:"30"},{mo_id:"2",mo_name:"网元2",cityName:"苏州",num:"50"}]}])});
//			}else if(def == "1"){
//				dm.hotspots.addItem({typeName:"动态发现热点区域",datas:new ArrayCollection([{kpiId:"1",kpiName:"掉话率",def:"1",infos:[{mo_id:"1",mo_name:"网元1",cityName:"南京",num:"30"},{mo_id:"2",mo_name:"网元2",cityName:"苏州",num:"50"}]}])});
//			}
			dispatchMsg(new GisHotEvent(GisHotEvent.LOADHOTSPOTCELLDATAERROR));
		}
	}
}