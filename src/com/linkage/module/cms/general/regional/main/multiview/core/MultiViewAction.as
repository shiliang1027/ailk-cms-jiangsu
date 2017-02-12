package com.linkage.module.cms.general.regional.main.multiview.core
{
	import com.linkage.module.cms.general.regional.main.multiview.MultiViewLocalTest;
	import com.linkage.module.cms.general.regional.main.multiview.component.ChartWindow;
	import com.linkage.module.cms.general.regional.main.multiview.data.DataManager;
	import com.linkage.module.cms.general.regional.main.multiview.data.IDataManager;
	import com.linkage.module.cms.general.regional.main.multiview.param.MultiFo;
	
	import mx.logging.ILogger;
	import mx.logging.Log;

	public class MultiViewAction
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.general.regional.main.multiview.core.MultiViewAction");
		/**
		 *业务纬度图表
		 */
		private var _sevChartWindow:ChartWindow=null;
		/**
		 *性能纬度图表
		 */
		private var _proChartWindow:ChartWindow=null;
		/**
		 *多维视图FO
		 */
		private var _multiFo:MultiFo=null;
		/**
		 *数据管理器
		 */
		private var _dataManager:IDataManager=null;

		public function MultiViewAction(param:Object)
		{
			_multiFo=new MultiFo(param);
			_dataManager=new DataManager(_multiFo.mapInfo);
		}

		public function initViewChart():void
		{
			//1.初始化性能纬度指标信息
			initSegmentList(1);

			//2.初始化业务纬度指标信息
			initSegmentList(2);
		}

		//加载告警汇总
		public function loadAlarmTotal(callback:Function):void
		{
			//本地调试
			if (_multiFo.local)
			{
				var result:Object=MultiViewLocalTest.loadAlarmTotal();
				callback.call(this, result);
				return;
			}
			//服务器调试
			_dataManager.loadAlarmTotal(_multiFo.viewId, function(result:Object):void
				{
					callback.call(this, result);
				});
		}

		//加载告警汇总
		public function initSegmentList(segmentType:int):void
		{
			//本地调试
			if (_multiFo.local)
			{
				var result:Object=MultiViewLocalTest.getSegmentList();
				dealWithSegmentList(segmentType, result);
				return;
			}
			//服务器调试
			_dataManager.getSegmentList(_multiFo.viewId, segmentType, function(result:Object):void
				{
					dealWithSegmentList(segmentType, result);
				});
		}

		//处理指标信息
		private function dealWithSegmentList(segmentType:int, data:Object):void
		{
			if (segmentType == 1)
			{
				//1.初始化下拉列表
				_proChartWindow.initComboBoxInfo(_multiFo.baseURL, data);

				//2.获取下拉框列表对应图形值
				initPerfSegmentData();
			}
			else
			{
				//1.初始化下拉列表
				_sevChartWindow.initComboBoxInfo(_multiFo.baseURL, data);

				//2.获取下拉框列表对应图形值
				initBusinessSegmentData();
			}
		}

		//初始化业务纬度信息
		private function initBusinessSegmentData():void
		{
			//本地调试
			if (_multiFo.local)
			{
				var result:Object=MultiViewLocalTest.getSegmentData();
				_sevChartWindow.initChartImageList(result, "Column2D");
				return;
			}
			//服务器调试
			_dataManager.getBusinessSegmentData(_multiFo.viewId, function(result:Object):void
				{
					_sevChartWindow.initChartImageList(result, "Column2D");
				});
		}

		//初始化性能纬度信息
		private function initPerfSegmentData():void
		{
			//本地调试
			if (_multiFo.local)
			{
				var result:Object=MultiViewLocalTest.getSegmentData();
				_proChartWindow.initChartImageList(result, "Line");
				return;
			}
			//服务器调试
			_dataManager.getPerfSegmentData(_multiFo.viewId, function(result:Object):void
				{
					_proChartWindow.initChartImageList(result, "Line");
				});
		}

		//获取告警过滤规则
		public function getAlarmFilter(success:Function):void
		{
			//本地调试
			if (_multiFo.local)
			{
				var result:Object=MultiViewLocalTest.getAlarmFilter();
				success.call(this, result);
				return;
			}
			//服务器调试
			_dataManager.getAlarmFilter(_multiFo.viewId, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		public function set sevChartWindow(value:ChartWindow):void
		{
			_sevChartWindow=value;
		}

		public function set proChartWindow(value:ChartWindow):void
		{
			_proChartWindow=value;
		}

		public function get multiFo():MultiFo
		{
			return _multiFo;
		}
	}
}