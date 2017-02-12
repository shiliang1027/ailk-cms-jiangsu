package com.linkage.module.cms.scene.view.components.roam
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.domain.roam.RoamDM;
	import com.linkage.module.cms.scene.event.roam.RoamEvent;


	public class RoamViewPM
	{
		private var log:ILogger=Log.getLoggerByClass(RoamViewPM);

		[Inject("roamDM")]
		[Bindable]
		public var _dm:RoamDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;



		public function get dm():RoamDM
		{
			return _dm;
		}

		public function set dm(value:RoamDM):void
		{
			_dm=value;
		}

	}
}