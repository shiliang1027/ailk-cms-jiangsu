package com.linkage.module.cms.scene.view.components
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.components.requestserver.RequestServerUtil;
	import com.linkage.module.cms.scene.domain.ResMatrixDM;
	import com.linkage.module.cms.scene.event.ResMatrixEvent;

	/**
	 *
	 *
	 * @author hrw (Ailk No.)
	 * @version 1.0
	 * @date 2012-7-31
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ResMatrixCompPM
	{

		private var log:ILogger = Log.getLoggerByClass(ResMatrixCompPM);

		[Inject("resMatrixDM")]
		[Bindable]
		public var dm:ResMatrixDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;
		public function getResMatrixList():void
		{
			log.info("ResMatrixCompPM   getResMatrixList");
//			dispatchMsg(new ResMatrixEvent(ResMatrixEvent.LOAD_BADMATRIX_DATA));
			requestServerUtil.addRequest(new ResMatrixEvent(ResMatrixEvent.LOAD_BADMATRIX_DATA));
			log.info("ResMatrixCompPM   getResMatrixList end");
		}

		public function badMoClick(data:Object):void
		{
			log.info("抛出劣化网元点击事件：BADMO_CLICK！");
			log.info(data);
			if(data.moTypeName == "机房")
			{
				data.neroom = data.moId;
			}
			else if(data.moTypeName == "电路")
			{
				data.circ_name = data.moName;
			}
			var evt:ResMatrixEvent = new ResMatrixEvent(ResMatrixEvent.BADMO_CLICK);
			evt.data = data;
			dispatchMsg(evt);

		}

	}
}

