package com.linkage.module.cms.general.regional.important.venue.controller
{
	import com.linkage.module.cms.general.regional.important.venue.VenueLocalTest;
	import com.linkage.module.cms.general.regional.important.venue.controller.fo.VenueFO;
	import com.linkage.module.cms.general.regional.important.venue.module.dao.VenueDAO;
	import com.linkage.module.cms.general.regional.important.venue.module.dao.VenueDAOImp;
	import com.linkage.module.cms.general.regional.important.venue.module.server.VenueServer;
	import com.linkage.module.cms.general.regional.important.venue.module.server.VenueServerImp;

	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	/**
	 *场景监控Action
	 * @author mengqiang
	 *
	 */
	public class VenueAction extends EventDispatcher implements IEventDispatcher
	{
		/**
		 *场景监控FO
		 */
		private var _venueFo:VenueFO=null;
		/**
		 *场景监控Server
		 */
		private var _venueServer:VenueServer=null;
		/**
		 * 场景监控DAO
		 */
		private var _venueDao:VenueDAO=null;

		public function VenueAction(params:Object)
		{
			//1.初始化场景监控FO
			_venueFo=new VenueFO(params);

			//2.初始化场景监控处理类
			_venueServer=new VenueServerImp();

			//3.初始化场景监控数据源
			_venueDao=new VenueDAOImp(venueFo.context);
		}

		//获取场馆信息
		public function getVenueInfo(paramMap:Object, success:Function):void
		{
			//本机运行
			if (_venueFo.local)
			{
				var result:Object=VenueLocalTest.getVenueInfo();
				success.call(this, result);
				return;
			}
			//服务器运行
			_venueDao.getVenueInfo(paramMap, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		//获取场馆性能信息
		public function getVenuePerfInfo(paramMap:Object, success:Function, error:Function):void
		{
			//本机运行
			if (_venueFo.local)
			{
				var result:Object=VenueLocalTest.getVenuePerfInfo();
				success.call(this, result);
				return;
			}
			//服务器运行
			_venueDao.getVenuePerfInfo(paramMap, success, error);
		}

		//获取告警信息
		public function getVenueAlarmInfo(paramMap:Object, success:Function):void
		{
			//本机运行
			if (_venueFo.local)
			{
				var result:Object=VenueLocalTest.getVenueAlarmInfo();
				success.call(this, result);
				return;
			}
			//服务器运行
			_venueDao.getVenueAlarmInfo(paramMap, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		//获取赛事告警信息
		public function getVenMaAla(paramMap:Object, success:Function):void
		{
			//本机运行
			if (_venueFo.local)
			{
				var result:Object=VenueLocalTest.getVenMaAla();
				success.call(this, result);
				return;
			}
			//服务器运行
			_venueDao.getVenMaAla(paramMap, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		//获取场馆性能信息（列表模式）
		public function getVenPerfList(paramMap:Object, success:Function):void
		{
			//本机运行
			if (_venueFo.local)
			{
				var result:Object=VenueLocalTest.getVenPerfList();
				success.call(this, result);
				return;
			}
			//服务器运行
			_venueDao.getVenPerfList(paramMap, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		public function get venueFo():VenueFO
		{
			return _venueFo;
		}
	}
}