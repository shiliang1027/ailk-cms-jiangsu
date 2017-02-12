package com.linkage.module.cms.viewroam.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.system.utils.StringUtils;
	import com.linkage.module.cms.viewroam.dao.ViewRoamDAO;
	import com.linkage.module.cms.viewroam.domain.ViewRoamDM;
	import com.linkage.module.cms.viewroam.event.ViewRoamEvent;
	import com.linkage.system.core.lk_internal;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.collections.Sort;
	import mx.collections.SortField;
	import mx.controls.Alert;
	import mx.controls.DateField;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	
	/**
	 *
	 *
	 * @author gengsan (71951)
	 * @version 1.0
	 * @date 2014-11-03
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ViewRoamCMD
	{
		private var log:ILogger=Log.getLoggerByClass(ViewRoamCMD);
		
		[Inject("viewRoamDAO")]
		public var dao:ViewRoamDAO;
		
		[Inject("viewRoamDM")]
		public var dm:ViewRoamDM;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		
		private var now:Number=0;
		
		public function execute(event:ViewRoamEvent):AsyncToken
		{
			log.debug("[查询查看性能数据]");
			log.debug(dm.parameters);
			now=new Date().getMilliseconds();
			return dao.queryPerfs(dm.parameters);
		}
		
		public function result(result:Object):void
		{
			log.debug("[查询查看性能数据]成功!耗时：{0}ms", (new Date().getMilliseconds() - now));
			dm.leftMenuData.removeAll();
			dm.viewRoamData.removeAll();
			dm.viewRoamCharData.removeAll();
			dm.viewRoamConfigData.removeAll();
			
			dm.leftMenuData = ArrayCollection(result["config"]);//左侧菜单
			log.debug(dm.leftMenuData);
			
			dm.viewRoamConfigData = new ArrayCollection([{show_name:"  时 间   ",perf_type_id:"time"}]);
			dm.viewRoamConfigData.addAll(ArrayCollection(result["config"]));//左侧菜单
			log.debug(dm.viewRoamConfigData);
			
			dm.viewRoamData = ArrayCollection(result["listData"]);//表格数据
			
			var sort:Sort = new Sort();
			sort.fields = [new SortField("time",true)];
			dm.viewRoamData.sort = sort;
			dm.viewRoamData.refresh();
			log.debug(dm.viewRoamData);
			
			dm.viewRoamCharData = dm.viewRoamData;//图表数据
			log.debug(dm.viewRoamCharData);
			
			dispatchMsg(new ViewRoamEvent("VIEWROAM_REFRESH"));
		}
		public function error(f:Fault):void
		{
			log.error("加载性能数据错误：" + f.faultString + "\n" + f.faultDetail);
			Alert.show("加载性能数据错误：" + f.faultString + "\n" + f.faultDetail);
		}
	}
}