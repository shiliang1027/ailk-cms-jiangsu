package com.linkage.module.cms.gsscene.view.components.emgyresource.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;
	import com.linkage.module.cms.gsscene.view.components.emgyresource.event.EmpyEvent;
	import com.linkage.module.cms.gsscene.view.components.resmatrix.ResMatrixDM;
	import com.linkage.module.cms.gsscene.view.components.resmatrix.dao.IResMatrixDAO;
	
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	public class EnpyQueryNumCmdTest
	{
		private var log:ILogger = Log.getLoggerByClass(EnpyQueryNumCmdTest);
		
		[Inject("resMatrixDAO")]
		public var dao:IResMatrixDAO;
		
		[Inject("resMatrixDM")]
		public var dm:ResMatrixDM;
		
		[Inject("user")]
		public var user:IUser;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		
		public function execute(e:EmpyEvent):AsyncToken
		{
			log.info(user);
			return dao.exportNeInfoNum(user);
		}
		
		public function result(obj:Object):void
		{
			log.info("调用接口[导出资源数据]数据结果 success!");
			log.info(obj);
			if(obj<50000){
			var url:String = user.context + "/gsscene/panels/panelsAction!exportNeInfo.action?logicalType=" + user.logicalType + "&cityId=" + user.cityId + "&level=" + user.level + "&areaId=" +user.areaId;
			navigateToURL(new URLRequest(url));	
			}else{
				Alert.show("导出数量大于上限50000条，无法导出！", "记录数超出上限");
			}
			
		}
		
		public function error(f:Fault):void
		{
			log.error("导出资源数据错误：" + f.faultString + "\n" + f.faultDetail);
			
		}
	}
}