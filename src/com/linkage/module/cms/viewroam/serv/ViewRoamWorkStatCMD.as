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
	public class ViewRoamWorkStatCMD
	{
		private var log:ILogger=Log.getLoggerByClass(ViewRoamWorkStatCMD);
		
		[Inject("viewRoamDAO")]
		public var dao:ViewRoamDAO;
		
		[Inject("viewRoamDM")]
		public var dm:ViewRoamDM;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		
		private var now:Number=0;
		
		public function execute(event:ViewRoamEvent):AsyncToken
		{
			log.debug("[查询工程状态]");
			log.debug(dm.parameters);
			now=new Date().getMilliseconds();
			return dao.getworkStatForFlex(dm.parameters.neid);
		}
		
		public function result(result:Object):void
		{
			log.debug("[查询工程状态]成功!耗时：{0}ms", (new Date().getMilliseconds() - now));
			if(String(result)=="在网"){
				dispatchMsg(new ViewRoamEvent(ViewRoamEvent.LOAD_DATA));
			}else{
				Alert.show("此网元为工程或其他非在网状态，无性能数据","提示");
				dm.viewRoamData.removeAll();
				dispatchMsg(new ViewRoamEvent("VIEWROAM_HIDE"));
				dispatchMsg(new ViewRoamEvent("VIEWROAM_REFRESH"));

			}
		}
		public function error(f:Fault):void
		{
			log.error("查询工程状态：" + f.faultString + "\n" + f.faultDetail);
			Alert.show("查询工程状态：" + f.faultString + "\n" + f.faultDetail);
		}
	}
}