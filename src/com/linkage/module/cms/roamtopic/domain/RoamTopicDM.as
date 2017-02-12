package com.linkage.module.cms.roamtopic.domain
{
	import mx.collections.ArrayCollection;
	
	/**
	 *
	 *
	 * @author gengsan (71951)
	 * @version 1.0
	 * @date 2014-12-16
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class RoamTopicDM
	{
		[Bindable]
		public var parameters:Object = new Object();
		
		[Bindable]
		private var _time:String = new String();
		
		private var _provinceName:String = new String();
		private var _provinceId:String = new String();
		
		private var _selectIndex:int = new int();
		
		//漫游类型，分为国际漫游，省际漫游，省内漫游等三种
		private var _roamTopicType:String = new String();
		
		private var _isproChartClick:Boolean = false;
		
		//右上角表结构的动态定义
		private var _roamDGConfig:ArrayCollection = new ArrayCollection();
		
		//右侧表格数据
		private var _roamTopicDG:ArrayCollection = new ArrayCollection();
		
		private var _inDatas:ArrayCollection = new ArrayCollection();
		
		private var _outDatas:ArrayCollection = new ArrayCollection();
		
		//左下角的图表
		private var _roamTopicCHART:ArrayCollection = new ArrayCollection();
		
		//时间
		private var _roamTopicDate:String = new String();
		
		//漫游类型，分为国际漫游，省际漫游，省内漫游等三种
		private var _type:String = new String();
		
		private var _isSuc:String = new String();
		
		private var _text1:String = new String();
		private var _text2:String = new String();
		private var _text3:String = new String();
		private var _text4:String = new String();
		
		
		public function set roamTopicType(value:String):void{
			_roamTopicType = value;
		}
		[Bindable]
		public function get roamTopicType():String{
			return _roamTopicType;
		}
		
		public function set roamDGConfig(value:ArrayCollection):void{
			_roamDGConfig = value;
		}
		[Bindable]
		public function get roamDGConfig():ArrayCollection{
			return _roamDGConfig;
		}
		
		public function set roamTopicDG(value:ArrayCollection):void{
			_roamTopicDG = value;
		}
		[Bindable]
		public function get roamTopicDG():ArrayCollection{
			return _roamTopicDG;
		}
		
		public function set roamTopicCHART(value:ArrayCollection):void{
			_roamTopicCHART = value;
		}
		[Bindable]
		public function get roamTopicCHART():ArrayCollection{
			return _roamTopicCHART;
		}
		
		public function set roamTopicDate(value:String):void{
			_roamTopicDate = value;
		}
		[Bindable]
		public function get roamTopicDate():String{
			return _roamTopicDate;
		}
		public function set time(value:String):void{
			_time = value;
		}
		
		[Bindable]
		public function get time():String{
			return _time;
		}

		[Bindable]
		public function get provinceName():String
		{
			return _provinceName;
		}

		public function set provinceName(value:String):void
		{
			_provinceName = value;
		}
		
		public function set provinceId(value:String):void
		{
			_provinceId = value;
		}

		[Bindable]
		public function get provinceId():String
		{
			return _provinceId;
		}

		[Bindable]
		public function get selectIndex():int
		{
			return _selectIndex;
		}

		public function set selectIndex(value:int):void
		{
			_selectIndex = value;
		}

		[Bindable]
		public function get text4():String
		{
			return _text4;
		}

		public function set text4(value:String):void
		{
			_text4 = value;
		}

		[Bindable]
		public function get text1():String
		{
			return _text1;
		}

		public function set text1(value:String):void
		{
			_text1 = value;
		}

		[Bindable]
		public function get text2():String
		{
			return _text2;
		}

		public function set text2(value:String):void
		{
			_text2 = value;
		}

		[Bindable]
		public function get text3():String
		{
			return _text3;
		}

		public function set text3(value:String):void
		{
			_text3 = value;
		}

		[Bindable]
		public function get isSuc():String
		{
			return _isSuc;
		}

		public function set isSuc(value:String):void
		{
			_isSuc = value;
		}

		[Bindable]
		public function get type():String
		{
			return _type;
		}

		public function set type(value:String):void
		{
			_type = value;
		}

		[Bindable]
		public function get isproChartClick():Boolean
		{
			return _isproChartClick;
		}

		public function set isproChartClick(value:Boolean):void
		{
			_isproChartClick = value;
		}

		[Bindable]
		public function get inDatas():ArrayCollection
		{
			return _inDatas;
		}

		public function set inDatas(value:ArrayCollection):void
		{
			_inDatas = value;
		}
		
		[Bindable]
		public function get outDatas():ArrayCollection
		{
			return _outDatas;
		}

		public function set outDatas(value:ArrayCollection):void
		{
			_outDatas = value;
		}

		


	}
}