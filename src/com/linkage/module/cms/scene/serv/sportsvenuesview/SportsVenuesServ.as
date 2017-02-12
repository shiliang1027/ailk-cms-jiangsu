package com.linkage.module.cms.scene.serv.sportsvenuesview
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.domain.sportsvenuesview.SportsVenuesDM;
	import com.linkage.module.cms.scene.event.sportsvenuesview.SportsVenuesEvent;

	import mx.controls.advancedDataGridClasses.AdvancedDataGridColumn;
	import mx.controls.advancedDataGridClasses.AdvancedDataGridColumnGroup;
	import mx.core.ClassFactory;

	public class SportsVenuesServ
	{
		private var log:ILogger=Log.getLoggerByClass(SportsVenuesServ);

		private var _dm:SportsVenuesDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;
	}
}

