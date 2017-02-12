package com.linkage.module.cms.gsscene.view.components.resmatrix.event
{
	import flash.events.Event;

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
	public class ResMatrixEvent extends Event
	{

		public static const LOAD_RESMATRIX_DATA:String = "LOAD_RESMATRIX_DATA"; //������Դ����

		public static const LOAD_BADMATRIX_DATA:String = "LOAD_BADMATRIX_DATA"; //�����ӻ��������(�ص��ע��Ԫ)

		public static const CREATE_BADMATRIX_GRID:String = "CREATE_BADMATRIX_GRID"; //����ӻ�����

		public static const CMS_SCENE_EMGYRESOURCE_GETMOINFOLIST:String = "CMS_SCENE_EMGYRESOURCE_GETMOINFOLIST"; //获取设备资源网元信息列表

		public static const CMS_SCENE_EMGYRESOURCE_SHOWMOINFOLIST:String = "CMS_SCENE_EMGYRESOURCE_SHOWMOINFOLIST"; //显示设备资源网元信息列表

		public static const BADMO_CLICK:String = "BADMO_CLICK";
		public static const EQU_ALARMINFO:String = "EQU_ALARMINFO";

		public static const CMS_SCENE_EMGYRESOURCE_SEARCHDETAILBYMOTYPENAME:String = "CMS_SCENE_EMGYRESOURCE_SEARCHDETAILBYMOTYPENAME"; //告警网元数查询
		public static const CMS_SCENE_EMGYRESOURCE_SHOWDETAILBYMOTYPENAME:String = "CMS_SCENE_EMGYRESOURCE_SHOWDETAILBYMOTYPENAME"; //告警网元数查询
		
		public static const CMS_SCENE_EMGYRESOURCE_ALARMWARNNUMS:String = "CMS_SCENE_EMGYRESOURCE_ALARMWARNNUMS"; //告警网元数查询（分一级二级查询）
		private var _data:Object = null;

		public function ResMatrixEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}

		public function get data():Object
		{
			return _data;
		}

		public function set data(value:Object):void
		{
			_data = value;
		}

	}
}