package com.linkage.module.cms.gsscene.viewnew
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.event.SceneEvent;
	
	import mx.collections.ArrayCollection;

	/**
	 * 该as的描述信息
	 * @author shiliang(66614) Tel:18661205639
	 * @version 1.0
	 * @since 2014-11-3 上午10:59:02
	 * @category com.linkage.module.cms.gsscene.viewnew
	 * @copyright 南京联创科技 网管开发部
	 */
	public class History
	{
		private var log:ILogger = Log.getLoggerByClass(History);
		[MessageDispatcher]
		public var dispatcher:Function;
		
		private var hisArray:Array = new Array();
		public function History()
		{
		}
		
		public function addHistory(e:SceneEvent):void{
			log.debug("add:{0}",hisArray.indexOf(e));
			log.debug(e);
//			if(hisArray.indexOf(e)==-1){
				hisArray.push(e);
//			}
		}
		public function goBack(index:int=-1):void{
			var e:SceneEvent;
			if(hisArray.length<=1){
				return;
			}
			for(var i:int=0;i<Math.abs(index);i++){
				hisArray.pop();
			}
			if(hisArray.length>0){
				e = hisArray.slice(-1)[0];
			}
			log.debug("goBack");
			log.debug(e);
			if(e){
				if(e.param){
					e.param.his=true;
				}else{
					e.param = new Object;
					e.param.his=true;
				}
				dispatcher(e);
			}
		}
	}
}