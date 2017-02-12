package com.linkage.module.cms.general.regional.important.scene.module.dao
{
	import com.linkage.module.cms.general.regional.important.scene.module.dao.data.MonitorData;
	import com.linkage.module.cms.general.regional.important.scene.module.dao.data.MonitorDataImp;

	/**
	 *场馆监控DAO实现类
	 * @author mengqiang
	 *
	 */
	public class MonitorDAOImp implements MonitorDAO
	{
		/**
		 * 场馆监控Data
		 */
		private var _monitorData:MonitorData=null;

		public function MonitorDAOImp(context:String)
		{
			//初始化场馆监控Data
			_monitorData=new MonitorDataImp(context);
		}

		public function getVenueListInfo(monitorId:Object, success:Function):void
		{
			_monitorData.getVenueListInfo(monitorId, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		public function getVenueSegmentList(venueId:String, segmentType:int, success:Function):void
		{
			_monitorData.getVenueSegmentList(venueId, segmentType, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		public function getSegmentData(venueId:String, segmentType:int, queryTime:String, success:Function):void
		{
			_monitorData.getSegmentData(venueId, segmentType, queryTime, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		public function getVenuePicture(venueId:String, success:Function):void
		{
			_monitorData.getVenuePicture(venueId, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		public function getVenueOutlineInfo(venueId:String, queryTime:String, success:Function):void
		{
			_monitorData.getVenueOutlineInfo(venueId, queryTime, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		public function getVenueAlarmFilter(venueId:String, success:Function):void
		{
			_monitorData.getVenueAlarmFilter(venueId, function(result:String):void
				{
					success.call(this, result);
				});
		}

		public function getVenueInfo(venueId:String, success:Function):void
		{
			_monitorData.getVenueInfo(venueId, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		public function getVenueEnsureDoc(venueId:String, success:Function):void
		{
			_monitorData.getVenueEnsureDoc(venueId, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		public function getVenueRaceInfo(venueId:String, success:Function):void
		{
			_monitorData.getVenueRaceInfo(venueId, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		public function getAllVenueNe(venueId:String, success:Function):void
		{
			_monitorData.getAllVenueNe(venueId, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		public function getNeSegmentData(neId:String, venueId:String, queryTime:String, success:Function):void
		{
			_monitorData.getNeSegmentData(neId, venueId, queryTime, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		public function getNeSegment(neId:String, venueId:String, success:Function):void
		{
			_monitorData.getNeSegment(neId, venueId, function(result:Object):void
				{
					success.call(this, result);
				});
		}
	}
}