package com.linkage.module.cms.groupclientalarm.relation.renderer
{
	import com.linkage.module.cms.groupclientalarm.relation.resource.css.skins.DropDownListRenderer;
	import com.linkage.module.cms.groupclientalarm.relation.resource.imagesclass.IconParam;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;

	import flash.events.MouseEvent;

	import mx.collections.ArrayCollection;
	import mx.controls.Image;
	import mx.controls.advancedDataGridClasses.AdvancedDataGridHeaderRenderer;
	import mx.controls.advancedDataGridClasses.AdvancedDataGridListData;
	import mx.core.ClassFactory;

	import spark.components.DropDownList;
	import spark.events.IndexChangeEvent;

	/**
	 *表头下拉框渲染器
	 * @author mengqiang
	 *
	 */
	public class HeaderSelectRenderer extends AdvancedDataGridHeaderRenderer
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger = Log.getLogger("com.linkage.module.cms.groupclientalarm.relation.renderer.HeaderSelectRenderer");
		/**
		 *向下图片按钮
		 */
		private var underImg:Image = null;
		/**
		 *漏斗图片按钮
		 */
		private var filterImg:Image = null;
		/**
		 *下拉框
		 */
		private var dropDownList:DropDownList = null;
		/**
		 *下拉框数据
		 */
//		private var array:ArrayCollection = new ArrayCollection([{key: '1', label: '升序'}, {key: '2', label: '降序'}, {key: '3', label: '筛选'}]);
		private var array:ArrayCollection = new ArrayCollection([{key: '1', label: '筛选'}]);

		public function HeaderSelectRenderer()
		{
			super();

			//初始化下拉框按钮
			underImg = new Image();
			underImg.width = 12;
			underImg.height = 12;
			underImg.buttonMode = true;
			underImg.source = IconParam.underIcon;
			underImg.addEventListener(MouseEvent.CLICK, dropDownListOpen);
			addChild(underImg);
		}

		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);

			//设置下拉图片坐标
			underImg.x = unscaledWidth - underImg.width;
			underImg.y = (unscaledHeight - underImg.height) / 2;

			//设置漏斗图片坐标
			if (filterImg != null)
			{
				filterImg.x = unscaledWidth - filterImg.width;
				filterImg.y = (unscaledHeight - filterImg.height) / 2;
			}

			//设置下拉框宽度
			if (dropDownList != null)
			{
				dropDownList.setActualSize(unscaledWidth, unscaledHeight);
			}
		}

		//下拉框发生变更时调用
		private function comboBoxChange(event:IndexChangeEvent):void
		{
			//1.获取下拉框响应值
			var title:String = listData.label;
			var value:String = dropDownList.selectedItem.key;
			var field:String = (listData as AdvancedDataGridListData).dataField;
			log.warn("comboBoxChange  value="+value);

			//2.初始化漏斗
			if (filterImg == null)
			{
				filterImg = new Image();
				filterImg.width = 12;
				filterImg.height = 12;
				filterImg.visible = false;
				filterImg.includeInLayout = false;
				filterImg.source = IconParam.filterIcon;
				addChild(filterImg);

			}

			//3.调用父类方法
			parentDocument.headerSelectChange(value, field, title, function():void
				{
					underImg.visible = false;
					filterImg.visible = true;
					underImg.includeInLayout = false;
					filterImg.includeInLayout = true;
				}, function():void
				{
					underImg.visible = true;
					filterImg.visible = false;
					underImg.includeInLayout = true;
					filterImg.includeInLayout = false;
				});

			//4.还原默认状态
			dropDownList.selectedIndex = -1;
		}

		//展开下拉框
		private function dropDownListOpen(event:MouseEvent):void
		{
			//初始化下拉框
			if (dropDownList == null)
			{
				dropDownList = new DropDownList();
				dropDownList.buttonMode = true;
				dropDownList.dataProvider = array;
				dropDownList.styleName = "headerFilter";
				dropDownList.itemRenderer = new ClassFactory(DropDownListRenderer);
				dropDownList.addEventListener(IndexChangeEvent.CHANGE, comboBoxChange);
				addChild(dropDownList);
			}
			dropDownList.openDropDown();
		}
	}
}