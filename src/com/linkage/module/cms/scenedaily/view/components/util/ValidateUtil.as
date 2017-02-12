package com.linkage.module.cms.scenedaily.view.components.util
{
	import mx.controls.Alert;
	import mx.validators.NumberValidator;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-9-3
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ValidateUtil
	{
		//匹配整数
		private var patternInt:RegExp=/^-?\d+$/g;

		//匹配浮点数
		private var patternFloat:RegExp=/^(-?\d+)(\.\d+)?$/g;

		//校验是不为空数字
		public function validateNumber(str:String, title:String):Boolean
		{
			return true;
		}

		//校验是数字
		public function validateNumber2(str:String, title:String):Boolean
		{
			if (!isNull(str))
			{
				if (null != patternInt.exec(str) || null != patternFloat.exec(str))
				{
					return true;
				}
				else
				{
					Alert.show(title + "不是数字");
					return false;
				}
			}
			else
			{
				Alert.show(title + "不能为空");
				return false;
			}

		}

		//判断是否为空
		public function isNull(str:String):Boolean
		{
			if ("" == str || null == str)
			{
				return true;
			}
			else
			{
				return false;
			}
		}

	}
}