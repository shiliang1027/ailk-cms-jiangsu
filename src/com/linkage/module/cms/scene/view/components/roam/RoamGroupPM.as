package com.linkage.module.cms.scene.view.components.roam
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.system.utils.StringUtils;
	import com.linkage.module.cms.scene.domain.roam.RoamDM;
	import com.linkage.module.cms.scene.event.roam.RoamEvent;

	import flash.utils.Timer;

	import mx.collections.ArrayList;
	import mx.controls.Alert;
	import mx.effects.AnimateProperty;

	import org.spicefactory.lib.reflect.types.Void;

	import spark.components.Group;

	public class RoamGroupPM
	{
		private var log:ILogger=Log.getLoggerByClass(RoamGroupPM);

		[Inject("roamDM")]
		[Bindable]
		public var dm:RoamDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		private var _showLegendConfigWindow:Boolean=false;

		//地图查询参数
		public var queryParam:Object=new Object();

		public var defColor:uint=0xcccccc;

		private var _columnarGroup:Group;

		private var _animate:AnimateProperty=null;

		public var cityName:String;

		public function RoamGroupPM():void
		{
			_animate=new AnimateProperty();
			_animate.property="scaleY";
			_animate.fromValue=0;
			_animate.toValue=1;
			_animate.duration=2000;
		}


		//设置参数加载数据
		public function onRoamTabChange(param:Object):void
		{
			log.debug("begin onRoamTabChange");
			queryParam.roam=param.roam;
			queryParam.type=param.type;
			queryParam.defCity=param.defCityId;
			//queryParam.roamType = dm.roamType;
			//if (!queryParam.roamType)
			//{
			//queryParam.roamType=String(dm.roamTypes.roam_in);
			//}
			//var date:Date=param.date;
//			if (queryParam.roamType && queryParam.roamType == String(dm.roamTypes.roam_in))
//			{
			//date.setHours(param.hour, 0, 0, 0);
			//queryParam.time=String(date.getTime() / 1000);
			queryParam.time="";
//			else
//			{
//				queryParam.time=date.getTime() / 1000;
//			}
			showLegendConfigWindow=false;
			loadLegendData();
		}

		public function loadLegendData():void
		{
			var evt:RoamEvent=new RoamEvent(RoamEvent.LOAD_LEGEND_DATA);
			log.info("[查询loadLegendData]参数" + queryParam);
			evt.param=queryParam;
			dispatchMsg(evt);
		}

		//根据每个地区的漫游数量获取地区渲染颜色
		public function getRoamColor(roamNum:Number):uint
		{
			if (!dm.colorLegends)
			{
				log.info("图例为空");
				return 0;
			}
			for each (var legend:Object in dm.colorLegends)
			{
				//var leftOper:String=String(legend.left);
				var leftValue:Number=Number(legend.left);
				//var rightOper:String=String(legend.right_oper);
				var rightValue:Number=Number(legend.right);
				log.info("[fillcolor]leftValue:" + leftValue + ",rightOper:" + rightValue);
				if (roamNum >= leftValue && roamNum < rightValue)
				{
					return uint("0x" + legend.color);
				}
			}
			return 0;
		}

		//根据城市改变趋势图
		public function loadDataByCity(city:String):void
		{
			queryParam.defCity=city;
			showLegendConfigWindow=false;
			//加载趋势图
			var evt:RoamEvent=new RoamEvent(RoamEvent.LOAD_RAOM_CHART_DATA);
			evt.param=queryParam;
			dispatchMsg(evt);
			//loadLegendData();
		}

		//根据时间查询历史
		public function queryByTime(param:Object):void
		{
			var date:Date=param.date;
//			if (queryParam.roamType && queryParam.roamType == String(dm.roamTypes.roam_in))
//			{
			date.setHours(param.hour, 0, 0, 0);
			queryParam.time=String(date.getTime() / 1000);
//			}
//			else
//			{
//				queryParam.time=date.getTime() / 1000;
//			}
			loadLegendData();
		}


		//保存图例配置
		public function saveLegend(param:Object):void
		{
			var evt:RoamEvent=new RoamEvent(RoamEvent.SAVE_ROAM_LEGEND_DATA);
			evt.param=param;
			dispatchMsg(evt);
		}

		[MessageHandler(selector="saveScenceRoamLegendDataComplete")]
		public function saveComplete(event:RoamEvent):void
		{
			loadLegendData();
			Alert.show(dm.result);
		}

		public function get columnarGroup():Group
		{
			return _columnarGroup;
		}

		public function set columnarGroup(value:Group):void
		{
			_columnarGroup=value;
		}

		[Bindable]
		public function get showLegendConfigWindow():Boolean
		{
			return _showLegendConfigWindow;
		}

		public function set showLegendConfigWindow(value:Boolean):void
		{
			_showLegendConfigWindow=value;
		}

		public function get animate():AnimateProperty
		{
			return _animate;
		}

		public function set animate(value:AnimateProperty):void
		{
			_animate=value;
		}


	}
}