package com.linkage.module.cms.general.regional.important.venue.module.dao
{
	import com.linkage.module.cms.general.regional.important.venue.module.dao.data.VenueData;
	import com.linkage.module.cms.general.regional.important.venue.module.dao.data.VenueDataImp;

	/**
	 *场馆监控DAO实现类
	 * @author mengqiang
	 *
	 */
	public class VenueDAOImp implements VenueDAO
	{
		/**
		 *场景监控data
		 */
		private var veneuData:VenueData=null;

		public function getVenueInfo(param:Object, success:Function):void
		{
			veneuData.getVenueInfo(param, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		public function getVenuePerfInfo(param:Object, success:Function, error:Function):void
		{
			veneuData.getVenuePerfInfo(param, success, error);
		}


		public function getVenueAlarmInfo(param:Object, success:Function):void
		{
			veneuData.getVenueAlarmInfo(param, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		public function getVenMaAla(param:Object, success:Function):void
		{
			veneuData.getVenMaAla(param, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		public function getVenPerfList(param:Object, success:Function):void
		{
			veneuData.getVenPerfList(param, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		public function VenueDAOImp(context:String)
		{
			veneuData=new VenueDataImp(context);
		}
	}
}