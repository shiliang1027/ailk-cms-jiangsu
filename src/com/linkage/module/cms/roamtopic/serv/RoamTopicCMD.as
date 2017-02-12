package com.linkage.module.cms.roamtopic.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.roamtopic.dao.RoamTopicDAO;
	import com.linkage.module.cms.roamtopic.domain.RoamTopicDM;
	import com.linkage.module.cms.roamtopic.event.RoamTopicEvent;
	import com.linkage.module.cms.roamtopic.view.RoamTopicPM;
	
	import flashx.textLayout.formats.Float;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.collections.Sort;
	import mx.collections.SortField;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	
	/**
	 *
	 *
	 * @author gengsan (71951)
	 * @version 1.0
	 * @date 2014-12-16
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class RoamTopicCMD
	{
		private var log:ILogger=Log.getLoggerByClass(RoamTopicCMD);

		[Inject("roamTopicDAO")]
		public var dao:RoamTopicDAO;
		
		[Inject("roamTopicDM")]
		public var dm:RoamTopicDM;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		
		private var type:String = "";
		private var now:Number=0;
		
		public function execute(event:RoamTopicEvent):AsyncToken
		{
			log.debug("[开始查询漫游数据:...~]"+dm.parameters.type);
			
			if(dm.type=="5"){
				type = "5";
				dm.parameters.type = "4";
			}
			
			log.debug(dm.parameters);
			now=new Date().getMilliseconds();
			return dao.queryRomTopicData(dm.parameters);
		}
		public function result(result:Object):void
		{
			if(type == "5"){
				dm.parameters.type="4";
			}
			log.debug("[查询漫游数据成功！]");
			log.info(result);
			var obj:Object = new Object();
			if("1"==dm.parameters.type || dm.type == "4"|| type == "5"){
				obj.headerText="省份";
				
				log.info((result as ArrayCollection).getItemAt(0));
				var timeT = (result as ArrayCollection).getItemAt(0)['inDatas'][0]['time'];
				dm.parameters.time = (result as ArrayCollection).getItemAt(0)['inDatas'][0]['time'];
				dm.inDatas = (result as ArrayCollection).getItemAt(0)['inDatas'][0][timeT];
				dm.outDatas = (result as ArrayCollection).getItemAt(0)['outDatas'][0][timeT];
				log.info("表格");
				log.info(dm.inDatas);
				log.info(dm.outDatas);
			}
			if("2"==dm.parameters.type){
				obj.headerText="地市";
				
				log.info((result as ArrayCollection).getItemAt(0));
				var timeT = (result as ArrayCollection).getItemAt(0)['time'];
				dm.parameters.time = (result as ArrayCollection).getItemAt(0)['time'];
				dm.roamTopicDG = (result as ArrayCollection).getItemAt(0)[timeT];
				log.info("表格");
				log.info(dm.roamTopicDG);
			}
			obj.dataField = "city_name";
			dm.roamDGConfig = new ArrayCollection();
			dm.roamDGConfig.addItem(obj);
			if("2"==dm.roamTopicType){
				obj = new Object();
				obj.headerText="登记用户数";
				obj.dataField = "login_num";
				dm.roamDGConfig.addItem(obj);
				obj = new Object();
				obj.headerText="较日常变化率";
				obj.dataField = "huanbi";
				dm.roamDGConfig.addItem(obj);
			}
			obj = new Object();
			if(dm.selectIndex == 0){
				obj.headerText="漫入用户";
				obj.dataField = "user_num";
				dm.roamDGConfig.addItem(obj);
				
				/*增加一列    4G漫入*/
				obj = new Object();
				obj.headerText="4G漫入";
				obj.dataField = "lte_num";
				dm.roamDGConfig.addItem(obj);
				
				if("2"==dm.roamTopicType){
					obj = new Object();
					obj.headerText="漫入用户占比";
					obj.dataField = "zhanbi";
					dm.roamDGConfig.addItem(obj);
				}
			}else{
				obj.headerText="漫出用户";
				obj.dataField = "user_num_out";
				dm.roamDGConfig.addItem(obj);
				if("2"==dm.roamTopicType){
					obj = new Object();
					obj.headerText="漫出用户占比";
					obj.dataField = "zhanbi_out";
					dm.roamDGConfig.addItem(obj);
				}
			}
			log.info("表格字段");
			log.info(dm.roamDGConfig);
			if((result as IList).length == 0){
				dm.roamTopicCHART = new ArrayCollection();
				dm.roamTopicDG = new ArrayCollection();
				dispatchMsg(new RoamTopicEvent("REFRESH_ROMTOPIC"));
				return;
			}
			
			log.info("--+="+dm.roamTopicType+"=="+dm.parameters.type);
			//国际进入省内的，左下角的趋势图不变
			if("1" == dm.roamTopicType && "1"!=dm.parameters.type){
				dispatchMsg(new RoamTopicEvent("REFRESH_ROMTOPIC"));
				return;
			}
			
			if("4" == dm.roamTopicType && "4" == dm.parameters.type){
				dispatchMsg(new RoamTopicEvent("REFRESH_ROMTOPIC"));
				return;
			}
			
			log.info(dm.roamTopicType +"-------"+dm.parameters.type);
			if(dm.isproChartClick == true){
				dispatchMsg(new RoamTopicEvent("REFRESH_ROMTOPIC"));
				dm.isproChartClick = false;
				return;
			}
			dm.roamTopicCHART = new ArrayCollection();
			
			log.info(result);
			log.info(dm.parameters.type);
			log.info("图表数据");
			if("2"==dm.parameters.type){
				for(var i:int = (result as ArrayCollection).length - 1; i>=0; i--){
					
					var object:Object = (result as ArrayCollection).getItemAt(i);
					object.columnData = object[object["time"]] as ArrayCollection;
					object.defaulttime = object["time"];
					object.time = object["time"].toString().substr(0,10);
					
					object.user_num = Math.floor(parseFloat(object["user_num"].toString())/1000)/10;
					object.user_num_out = Math.floor(parseFloat(object["user_num_out"].toString())/1000)/10;
					object.lte_num = Math.floor(parseFloat(object["lte_num"].toString())/1000)/10;
					dm.roamTopicCHART.addItem(object);
				}
				var sort:Sort = new Sort();
				sort = new Sort();
				sort.fields = [new SortField("time",true)];
				dm.roamTopicCHART.sort = sort;
				log.info("图表");
				log.info(dm.roamTopicCHART);
				dispatchMsg(new RoamTopicEvent("REFRESH_ROMTOPIC"));
			}else{
				
				var length = (result as ArrayCollection).getItemAt(0)['inDatas'].length - 1;
				log.info((result as ArrayCollection).getItemAt(0)['inDatas']);
				for(var i:int = length; i>=0; i--){
					
					var object:Object = (result as ArrayCollection).getItemAt(0)['inDatas'][i];
					object.columnData = object[object["time"]] as ArrayCollection;
					object.defaulttime = object["time"];
					object.time = object["time"].toString().substr(0,10);
					
					object.user_num = Math.floor(parseFloat(object["user_num"].toString())/1000)/10;
					object.user_num_out = Math.floor(parseFloat(object["user_num_out"].toString())/1000)/10;
					object.lte_num = Math.floor(parseFloat(object["lte_num"].toString())/1000)/10;
					dm.roamTopicCHART.addItem(object);
				}
				var sort:Sort = new Sort();
				sort = new Sort();
				sort.fields = [new SortField("time",true)];
				dm.roamTopicCHART.sort = sort;
				log.info("图表");
				log.info(dm.roamTopicCHART);
				dispatchMsg(new RoamTopicEvent("REFRESH_ROMTOPIC"));
			}
			
		}
		
		public function error(f:Fault):void
		{
			log.error("加载漫游表格数据错误：" + f.faultString + "\n" + f.faultDetail);
			Alert.show("加载漫游表格数据错误：" + f.faultString + "\n" + f.faultDetail);
		}
	}
}