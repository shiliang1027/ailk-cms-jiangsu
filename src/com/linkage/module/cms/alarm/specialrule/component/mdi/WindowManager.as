package com.linkage.module.cms.alarm.specialrule.component.mdi
{
	import com.linkage.module.cms.alarm.specialrule.component.RuleAlarmView;
	import com.linkage.system.component.panel.events.WindowEvent;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;

	import flash.events.MouseEvent;

	import mx.containers.ViewStack;

	import spark.components.Group;
	import spark.components.NavigatorContent;
	import spark.components.TabBar;
	import spark.components.VGroup;

	/**
	 *窗口管理
	 * @author mengqiang
	 *
	 */
	public class WindowManager extends Group
	{
		/**
		 *日志记录器

		 */
		private var log:ILogger = Log.getLogger("com.linkage.module.cms.alarm.specialrule.component.mdi.WindowManager");
		private var parentWidth:Number = 0;
		private var pwidthRemote:int = 25;
		private var windowArray:Array = [];
		//窗口宽度和高度

		private var windowWidth:Number = 0;
		private var windowHeight:Number = 0;
		//窗口最小高度
		private var windowMinHeight:Number = 30;
		//纵向展示列数
		private var colsNum:Number = 0;
		private var winsNum:Number = 0;
		//窗口横向纵向偏移
		private var graWidth:Number = 1;
		private var graHeight:Number = 2;
		//最小化时坐标
		private var minCoodY:Number = 0;
		//坐标最小化数组
		private var minArray:Array = [];
		//窗口深度
		private var minDepth:int = 10000;
		//窗口深度
		private var winDepth:int = 1;

		public function initParam(numCols:int, numWins:int):void
		{
			colsNum = numWins > numCols ? numCols : numWins;
			minCoodY = height - windowMinHeight - 3;
			winsNum = numWins;
		}

		//清空容器
		public function clear():void
		{
			colsNum = 0;
			winsNum = 0;
			graWidth = 1;
			graHeight = 2;
			parentWidth = 0;
			minCoodY = 0;
			minArray = [];
			winDepth = 1;
			minDepth = 10000;
			pwidthRemote = 25;
			windowArray = [];
			windowWidth = 0;
			windowHeight = 0;
			windowMinHeight = 30;
			removeAllElements();
		}
		
		//添加窗口
		public function add(window:RuleAlarmView):void
		{
			//添加窗口
			addElement(window);
			window.minWidth = 100;
			window.depth = winDepth++;
			windowArray.push(window);

			//添加布局
			var position:WindowPosition = new WindowPosition();
			position.coordX = 0;
			position.coordY = minCoodY;
			minArray.push(position);
			minCoodY = minCoodY - windowMinHeight;

			//添加事件
			window.addEventListener(WindowEvent.MAXIMIZE, windowMaximize);
			window.addEventListener(WindowEvent.MINIMIZE, windowMinimize);
			window.addEventListener(WindowEvent.RESTORE, windowRestore);
			window.addEventListener(MouseEvent.MOUSE_DOWN, windowMouseDown);
		}

		//垂直布局
		public function vertical():void
		{
			var heightY:Number = getRandomNum();
			resetWindwoWidthHeight(1);
			windowArray.forEach(function(window:RuleAlarmView, index:int, array:Array):void
				{
					window.restoreWindow();
					window.x = 0;
					window.y = heightY;
					window.depth = winDepth++;
					window.width = windowWidth;
					window.height = windowHeight;
					window.visible = true;
					window.isMin = false;

					//更改窗口Y轴坐标
					heightY = heightY + windowHeight + graHeight + getRandomNum();
				});
		}

		//水平布局
		public function horizontal():void
		{
			var widthX:Number = getRandomNum();
			resetWindwoWidthHeight(winsNum);
			windowArray.forEach(function(window:RuleAlarmView, index:int, array:Array):void
				{
					window.restoreWindow();
					window.x = widthX;
					window.y = 0;
					window.depth = winDepth++;
					window.width = windowWidth;
					window.height = windowHeight;
					window.visible = true;
					window.isMin = false;

					//更改窗口X轴坐标
					widthX = widthX + windowWidth + graWidth + getRandomNum();
				});
		}

		//平铺布局
		public function tile():void
		{
			var widthX:Number = getRandomNum();
			var heightY:Number = getRandomNum();
			resetWindwoWidthHeight(colsNum);
			windowArray.forEach(function(window:RuleAlarmView, index:int, array:Array):void
				{
					if (index > 0)
					{
						if (index % colsNum == 0)
						{
							widthX = getRandomNum();
							heightY = heightY + windowHeight + graHeight + getRandomNum();
						}
						else
						{
							widthX = widthX + windowWidth + graWidth + getRandomNum();
						}
					}
					window.restoreWindow();
					window.x = widthX;
					window.y = heightY;
					window.depth = winDepth++;
					window.width = windowWidth;
					window.height = windowHeight;
					window.visible = true;
					window.isMin = false;
				});
		}

		//tab布局 add by hurw at 6.6.2013 不需要
		public function tabWindow():void
		{
			//从当前窗口移除掉所有窗口
			removeAllElements();
			//新生成tab组件
			var vg:VGroup = new VGroup();
			vg.percentWidth = 100;
			vg.percentHeight = 100;
			addElement(vg);
			var tb:TabBar = new TabBar();
			tb.percentWidth = 100;
//			tb.styleName = sceneTabBar;
			var vs:ViewStack = new ViewStack();
			vs.percentWidth = 100;
			vs.percentWidth = 100;
			vs.creationPolicy = "all";
			tb.dataProvider = vs;
			vg.addElement(tb);
			vg.addElement(vs);
			//窗口重新加入
			for each (var win:RuleAlarmView in windowArray)
			{
				var nc:NavigatorContent = new NavigatorContent();
				nc.percentWidth = 100;
				nc.percentWidth = 100;
				nc.label = win.title;
				win.maximizable = false;
				win.minimizable = false;
				win.dragable = false;
				win.resizable = false;
				win.width = parent.width;
				win.height = parent.height;
				nc.addElement(win);
				vs.addElement(nc);
			}
		}


		//平铺布局
		public function orderWindow():void
		{
			windowArray.forEach(function(window:RuleAlarmView, index:int, array:Array):void
				{
					window.restoreWindow();
					window.x = window.windowX + getRandomNum();
					window.y = window.windowY + getRandomNum();
					window.width = window.windowW + getRandomNum();
					window.height = window.windowH + getRandomNum();
					//设置深度
					if (window.windowD > 0)
					{
						window.depth = window.windowD;
//						winDepth = Math.max(winDepth, window.windowD);
					}
					else
					{
						window.depth = winDepth++;
					}
					window.visible = true;
					window.isMin = false;
				});
		}



		//获取随机数
		private function getRandomNum():Number
		{
			var rndNum:Number = Number(Number(Math.random() / 10000).toFixed(5));
			return rndNum == 0 ? 0.00001 : rndNum
		}

		//窗口最大化
		private function windowMaximize(event:WindowEvent):void
		{
			var maxWindow:RuleAlarmView = event.target as RuleAlarmView;
			maxWindow.depth = winDepth++;
			maxWindow.isMin = false;
//			//1.还原其他窗口
			setOtherWindowVisible(false, maxWindow);

			//最小化其他窗口
//			windowMiniOther(maxWindow);

			for each (var coord:WindowPosition in minArray)
			{
				if (coord.windowId == maxWindow.id)
				{
					coord.isUse = false;
					coord.windowId = null;
					break;
				}
			}
		}

		private function windowMiniOther(win:RuleAlarmView):void
		{
			var nominwins:Array = new Array();
			for each (var w:RuleAlarmView in windowArray)
			{
				if (w != win)
				{
					var temp:Boolean = false;
					for each (var coord:WindowPosition in minArray)
					{
						if (coord.isUse && coord.windowId == w.id)
						{
							temp = true;
							break;
						}
					}
					if (!temp)
						nominwins.push(w);
				}
			}
			//最小化剩余的窗口
			if (nominwins.length > 0)
			{
				for each (var w:RuleAlarmView in nominwins)
				{
					w.minimizeButton.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
				}
			}
		}

		//窗口最小化
		private function windowMinimize(event:WindowEvent):void
		{
			var minWindow:RuleAlarmView = event.target as RuleAlarmView;
			minWindow.depth = minDepth++;
			minWindow.isMin = true;
			//1.还原其他窗口
			setOtherWindowVisible(true, minWindow);

			//2.设置当前窗口位置
			for each (var coord:WindowPosition in minArray)
			{
				if (!coord.isUse)
				{
					coord.isUse = true;
					coord.windowId = minWindow.id;
					minWindow.x = coord.coordX;
					minWindow.y = coord.coordY;
					break;
				}
			}
		}

		//窗口还原
		private function windowRestore(event:WindowEvent):void
		{
			var resWindow:RuleAlarmView = event.target as RuleAlarmView;
			resWindow.depth = winDepth++;
			resWindow.isMin = false;
			//1.还原其他窗口
			setOtherWindowVisible(true, resWindow);

			//2.设置当前窗口位置
			for each (var coord:WindowPosition in minArray)
			{
				if (coord.windowId == resWindow.id)
				{
					coord.isUse = false;
					coord.windowId = null;
					break;
				}
			}
		}

		//窗口聚焦
		private function windowMouseDown(event:MouseEvent):void
		{
			var ruleAlarmView:RuleAlarmView = event.currentTarget as RuleAlarmView;
			if (ruleAlarmView.isMin)
			{
				return;
			}
			ruleAlarmView.depth = winDepth++;
		}

		//设置对象是否隐藏
		private function setOtherWindowVisible(isVisible:Boolean, window:RuleAlarmView):void
		{
			windowArray.forEach(function(win:RuleAlarmView, index:int, array:Array):void
				{
					if (window.id != win.id)
					{
						win.visible = isVisible;
						win.includeInLayout = isVisible;
					}
				});
		}

		//获取窗口坐标参数
		public function getWindowParams():String
		{
			var result:String = "";
			windowArray.forEach(function(win:RuleAlarmView, index:int, array:Array):void
				{
					if (index > 0)
					{
						result += ";";
					}
					result += win.windowId + "," + Math.abs(getRect(win).x) + "," + Math.abs(getRect(win).y) + "," + win.height + "," + win.width + "," + win.depth;
				});
			return result;
		}

		//处理windowD 将其减去最小一个的值保存
		public function dealWindowDepth():void
		{
			if (windowArray.length > 0)
			{
				var minWindowD:int = -1;
				for each (var win:RuleAlarmView in windowArray)
				{
					if (minWindowD == -1)
					{
						minWindowD = win.windowD;
					}
					else
					{
						if (minWindowD > win.windowD)
							minWindowD = win.windowD;
					}
				}
				for each (var win:RuleAlarmView in windowArray)
				{
					win.windowD = win.windowD - minWindowD + 3;
					win.depth = win.windowD + 3;
				}
			}
		}

		//重置窗口宽度和高度
		private function resetWindwoWidthHeight(colNums:Number):void
		{
			parentWidth = width - pwidthRemote;
			var numRows:int = Math.ceil(winsNum / colNums);
			windowWidth = int(width / colNums);
			windowHeight = int(height / numRows);
			graWidth = Number(Number((width - windowWidth * colNums) / colNums).toFixed(2));
			graHeight = Number(Number((height - windowHeight * numRows) / numRows).toFixed(2));
		}
	}
}