package com.linkage.module.cms.topo.view.component.toolbar.action
{
	import com.linkage.module.topo.framework.Constants;
	import com.linkage.module.topo.framework.controller.action.IAction;
	import com.linkage.module.topo.framework.controller.action.canvas.CanvasActionWrapper;
	import com.linkage.module.topo.framework.controller.action.canvas.MultSelectAction;
	import com.linkage.module.topo.framework.controller.action.canvas.PanWheelAction;
	import com.linkage.module.topo.framework.controller.event.ActionEvent;
	import com.linkage.module.topo.framework.view.component.TopoCanvas;
	import com.linkage.module.topo.framework.view.component.toolbar.TopoToolBar;
	import com.linkage.module.topo.framework.view.component.toolbar.action.TopoActionIcon;
	
	import flash.events.MouseEvent;

	/**
	 * 集客拓扑toolbar中高级检索小图标
	 * @author donglm 
	 * @since 2013-11-06
	 */
	public class AdvanceSearchViewIcon extends TopoActionIcon
	{
		// 此模式影响的toolbar
		private var _subToolBar:TopoToolBar = null;
		
		public function AdvanceSearchViewIcon()
		{
			super();
			this.toolTip = "高级检索";
			authKey = "AdvanceSearch";
		}
		
		override protected function initAction(topoCanvas:TopoCanvas):IAction
		{
			var action:IAction = new CanvasActionWrapper(topoCanvas, new MultSelectAction(topoCanvas), new PanWheelAction(topoCanvas));
			action.weight = Constants.WEIGHT_ACTION_SELECT;
			action.key = authKey;
			return action;
		}
		
		override public function onMouseClick(event:MouseEvent = null):void
		{
			if (actionEnable == false)
			{
				if (_subToolBar)
				{
					_subToolBar.visible = true;
				}
			}
			super.onMouseClick(event);
		}
		
		override protected function onActionChanged(event:ActionEvent):void
		{
			// 模式成选择模式了,隐藏下属的工具栏
			if (event.newAction.key != authKey)
			{
				if (_subToolBar)
				{
					_subToolBar.visible = false;
				}
				actionEnable = false;
			}
			this.invalidateSkinState();
		}
		
		/**
		 * 模式下属的工具栏
		 */
		public function set subToolBar(value:TopoToolBar):void
		{
			_subToolBar = value;
			_subToolBar.visible = false;
		}
	}
}