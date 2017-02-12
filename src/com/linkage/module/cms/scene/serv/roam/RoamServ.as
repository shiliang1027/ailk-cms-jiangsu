package com.linkage.module.cms.scene.serv.roam
{
	import com.linkage.module.cms.scene.domain.roam.RoamDM;
	import com.linkage.module.cms.scene.event.roam.RoamEvent;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;

	public class RoamServ
	{
		private var log:ILogger = Log.getLoggerByClass(RoamServ);

		[Inject("roamDM")]
		[Bindable]
		public var dm:RoamDM;


	}
}

