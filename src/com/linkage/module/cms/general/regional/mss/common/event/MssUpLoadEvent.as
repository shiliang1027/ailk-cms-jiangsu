package com.linkage.module.cms.general.regional.mss.common.event
{
	import flash.events.Event;

	/**
	 *信息发布上传照片
	 * @author mengqiang
	 *
	 */
	public class MssUpLoadEvent extends Event
	{
		/**
		 * 信息发布上传照片
		 */
		public static const MSS_UPLOAD:String="mss_upload";
		/**
		 *上传照片数组
		 */
		private var _uploadArray:Array=null;

		public function MssUpLoadEvent(type:String, uploadArray:Array, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_uploadArray=uploadArray;
		}

		public function get uploadArray():Array
		{
			return _uploadArray;
		}
	}
}