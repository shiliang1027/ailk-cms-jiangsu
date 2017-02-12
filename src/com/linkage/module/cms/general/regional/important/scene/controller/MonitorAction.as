package com.linkage.module.cms.general.regional.important.scene.controller
{
	import com.linkage.module.cms.general.regional.important.scene.SceneMonitroLocalTest;
	import com.linkage.module.cms.general.regional.important.scene.controller.fo.MonitorFO;
	import com.linkage.module.cms.general.regional.important.scene.module.dao.MonitorDAO;
	import com.linkage.module.cms.general.regional.important.scene.module.dao.MonitorDAOImp;
	import com.linkage.module.cms.general.regional.important.scene.module.server.MonitorServer;
	import com.linkage.module.cms.general.regional.important.scene.module.server.MonitorServerImp;

	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	/**
	 *场馆监控Action
	 * @author mengqiang
	 *
	 */
	public class MonitorAction extends EventDispatcher implements IEventDispatcher
	{
		/**
		 * 场馆监控Server
		 */
		private var _monitorServer:MonitorServer=null;
		/**
		 *场馆监控FO
		 */
		private var _monitorFO:MonitorFO=null;
		/**
		 * 场馆监控DAO
		 */
		private var _monitorDAO:MonitorDAO=null;

		private var _monitorId:Object;

		public function MonitorAction(params:Object)
		{
			_monitorId=params.monitorId;

			//1.初始化场馆监控FO
			_monitorFO=new MonitorFO(params);

			//2.初始化场馆监控DAO
			_monitorDAO=new MonitorDAOImp(monitorFO.context);

			//3.初始化场馆监控Server
			_monitorServer=new MonitorServerImp();
		}

		//获取场馆列表信息
		public function getVenueListInfo(success:Function):void
		{
			//本地调试
			if (monitorFO.local)
			{
				var result:Object=SceneMonitroLocalTest.getVenueListInfo();
				success.call(this, result);
				return;
			}
			//服务器运行
			_monitorDAO.getVenueListInfo(_monitorId, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		//获取指定场馆的统计指标
		public function getVenueSegmentList(venueId:String, segmentType:int, success:Function):void
		{
			//本地调试
			if (monitorFO.local)
			{
				var result:Object=SceneMonitroLocalTest.getSegmentList();
				success.call(this, result);
				return;
			}
			//服务器运行
			_monitorDAO.getVenueSegmentList(venueId, segmentType, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		//获取指定场馆指标统计数据
		public function getSegmentData(venueId:String, segmentType:int, queryTime:String, success:Function):void
		{
			//本地调试
			if (monitorFO.local)
			{
				var result:Object=SceneMonitroLocalTest.getSegmentData();
				success.call(this, result);
				return;
			}
			//服务器运行
			_monitorDAO.getSegmentData(venueId, segmentType, queryTime, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		//获取场馆图片或视频
		public function getVenuePicture(venueId:String, success:Function):void
		{
			//本地调试
			if (monitorFO.local)
			{
				var result:Object=SceneMonitroLocalTest.getVenuePicture();
				success.call(this, result);
				return;
			}
			//服务器运行
			_monitorDAO.getVenuePicture(venueId, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		//获取场馆概述信息
		public function getVenueOutlineInfo(venueId:String, queryTime:String, success:Function):void
		{
			//本地调试
			if (monitorFO.local)
			{
				var result:Object=SceneMonitroLocalTest.getVenueOutlineInfo();
				success.call(this, result);
				return;
			}
			//服务器运行
			_monitorDAO.getVenueOutlineInfo(venueId, queryTime, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		//获取场馆的告警过滤器
		public function getVenueAlarmFilter(venueId:String, success:Function):void
		{
			//本地调试
			if (monitorFO.local)
			{
				var result:Object=SceneMonitroLocalTest.getVenueAlarmFilter();
				success.call(this, result);
				return;
			}
			//服务器运行
			_monitorDAO.getVenueAlarmFilter(venueId, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		//获取场馆监控基本信息
		public function getVenueInfo(venueId:String, success:Function):void
		{
			//本地调试
			if (monitorFO.local)
			{
				var result:Object=SceneMonitroLocalTest.getVenueInfo();
				success.call(this, result);
				return;
			}
			//服务器运行
			_monitorDAO.getVenueInfo(venueId, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		//获取场馆的保障方案信息
		public function getVenueEnsureDoc(venueId:String, success:Function):void
		{
			//本地调试
			if (monitorFO.local)
			{
				var result:Object=SceneMonitroLocalTest.getVenueEnsureDoc();
				success.call(this, result);
				return;
			}
			//服务器运行
			_monitorDAO.getVenueEnsureDoc(venueId, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		//获取场馆的赛事信息信息
		public function getVenueRaceInfo(venueId:String, success:Function):void
		{
			//本地调试
			if (monitorFO.local)
			{
				var result:Object=SceneMonitroLocalTest.getVenueRaceInfo();
				success.call(this, result);
				return;
			}
			//服务器运行
			_monitorDAO.getVenueRaceInfo(venueId, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		//获取场馆的所有网元信息
		public function getAllVenueNe(venueId:String, success:Function):void
		{
			//本地调试
			if (monitorFO.local)
			{
				var result:Object=SceneMonitroLocalTest.getAllVenueNe();
				success.call(this, result);
				return;
			}
			//服务器运行
			_monitorDAO.getAllVenueNe(venueId, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		//获取单个网元各个指标的统计数据
		public function getNeSegmentData(moId:String, venueId:String, queryTime:String, success:Function):void
		{
			//本地调试
			if (monitorFO.local)
			{
				var result:Object=SceneMonitroLocalTest.getNeSegmentData();
				success.call(this, result);
				return;
			}
			//服务器运行
			_monitorDAO.getNeSegmentData(moId, venueId, queryTime, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		//获取场馆内指定网元的统计指标数据
		public function getNeSegment(moId:String, venueId:String, success:Function):void
		{
			//本地调试
			if (monitorFO.local)
			{
				var result:Object=SceneMonitroLocalTest.getNeSegment();
				success.call(this, result);
				return;
			}
			//服务器运行
			_monitorDAO.getNeSegment(moId, venueId, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		public function get monitorFO():MonitorFO
		{
			return _monitorFO;
		}

		public function get monitorId():Object
		{
			return _monitorId;
		}

		public function set monitorId(value:Object):void
		{
			_monitorId=value;
		}

	}
}