package com.linkage.module.cms.scenedaily.domain.worstmo
{
	import mx.collections.ArrayCollection;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-9-5
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class WorstMoSetDM
	{
		//最差网元数据集合
		private var _worstMoList:ArrayCollection = new ArrayCollection();
		//获取适配网元类型列表
		private var _worstPerMoList:ArrayCollection = new ArrayCollection();
		//指标关系
		private var _relationShip:String;
		//网元适配类型
		private var _perMoType:String;
		//保存返回提示信息
		private var _worstMoResultStr:String;

		public function get worstMoList():ArrayCollection
		{
			return _worstMoList;
		}

		[Bindable]
		public function set worstMoList(value:ArrayCollection):void
		{
			_worstMoList = value;
		}

		public function get relationShip():String
		{
			return _relationShip;
		}

		public function set relationShip(value:String):void
		{
			_relationShip = value;
		}

		public function get perMoType():String
		{
			return _perMoType;
		}

		public function set perMoType(value:String):void
		{
			_perMoType = value;
		}

		public function get worstMoResultStr():String
		{
			return _worstMoResultStr;
		}

		public function set worstMoResultStr(value:String):void
		{
			_worstMoResultStr = value;
		}

		public function get worstPerMoList():ArrayCollection
		{
			return _worstPerMoList;
		}

		[Bindable]
		public function set worstPerMoList(value:ArrayCollection):void
		{
			_worstPerMoList = value;
		}


	}
}