package com.linkage.module.cms.scenedaily.view.components.setface
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.setface.SetFaceDao;
	import com.linkage.module.cms.scenedaily.domain.setface.SetFaceDM;
	import com.linkage.module.cms.scenedaily.event.setface.SetFaceEvent;

	import mx.collections.ArrayCollection;
	import mx.controls.Alert;

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
	public class HealthSetViewPM
	{
		private var log:ILogger = Log.getLoggerByClass(HealthSetViewPM);

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Inject("setFaceDM")]
		[Bindable]
		public var dm:SetFaceDM;

		//符号
		[Bindable]
		public var characterList:ArrayCollection = new ArrayCollection([{"key": "-1", "character": "请选择"}, {"key": "1", "character": "<"}, {"key": "2", "character": "<="}, {"key": "3", "character": "="}, {"key": "4", "character": ">"}, {"key": "5", "character": ">="}]);


		//发送时间的参数
		public var param:Object = new Object();

		//加载数据
		public function loadData():void
		{
			dispatchMsg(new SetFaceEvent(SetFaceEvent.LOAD_HEALTHSET_DATA));
		}

		//校验数据格式
		public function validataData(data:Object, title:String):Boolean
		{
			//每个配置第一列时间不能为空
			var c1:Boolean = checkNoRelation(data.health2, data.health3, data.health4, data.health5, "1", "健康度算法健康数据");
			if (!c1)
			{
				return false;
			}
			var c2:Boolean = checkNoRelation(data.subhealth2, data.subhealth3, data.subhealth4, data.subhealth5, "2", "健康度算法亚健康数据");
			if (!c2)
			{
				return false;
			}
			var c3:Boolean = checkNoRelation(data.nohealth2, data.nohealth3, data.nohealth4, data.nohealth5, "3", "健康度算法不健康数据");
			if (!c3)
			{
				return false;
			}
			var c4:Boolean = checkNoRelation(data.prehealth2, data.prehealth3, data.prehealth4, data.prehealth5, "1", "健康预测算法健康数据");
			if (!c4)
			{
				return false;
			}
			var c5:Boolean = checkNoRelation(data.presubhealth2, data.presubhealth3, data.presubhealth4, data.presubhealth5, "2", "健康预测算法亚健康数据");
			if (!c5)
			{
				return false;
			}
			var c7:Boolean = checkNoRelation(data.prenohealth2, data.prenohealth3, data.prenohealth4, data.prenohealth5, "3", "健康预测算法不健康数据");
			if (!c7)
			{
				return false;
			}
			if ("" == data.health1 || "" == data.subhealth1 || "" == data.nohealth1)
			{
				Alert.show("时间设置不能为空");
				return false;
			}

			//每一列不能同时为空
			if ("" == data.health3 && "" == data.health5)
			{
				Alert.show("健康列记录数不能同时配置空");
				return false;
			}
			if ("" == data.subhealth3 && "" == data.subhealth5)
			{
				Alert.show("亚健康列记录数不能同时配置空");
				return false;
			}
			if ("" == data.nohealth3 && "" == data.nohealth5)
			{
				Alert.show("不健康列记录数不能同时配置空");
				return false;
			}

			//每一列有符号必须有数值，不配置值则不能选符号
			if (("-1" != data.health2 && "" == data.health3) || ("-1" != data.health4 && "" == data.health5))
			{
				Alert.show("健康列记录数为空则不能选择对应的符号");
				return false;
			}
			if (("-1" != data.subhealth2 && "" == data.subhealth3) || ("-1" != data.subhealth4 && "" == data.subhealth5))
			{
				Alert.show("亚健康列记录数为空则不能选择对应的符号");
				return false;
			}
			if (("-1" != data.nohealth2 && "" == data.nohealth3) || ("-1" != data.nohealth4 && "" == data.nohealth5))
			{
				Alert.show("不健康列记录数为空则不能选择对应的符号");
				return false;
			}

			if (("-1" == data.health2 && "" != data.health3) || ("-1" == data.health4 && "" != data.health5))
			{
				Alert.show("健康列没选择对应操作符");
				return false;
			}
			if (("-1" == data.subhealth2 && "" != data.subhealth3) || ("-1" == data.subhealth4 && "" != data.subhealth5))
			{
				Alert.show("亚健康列没选择对应操作符");
				return false;
			}
			if (("-1" == data.nohealth2 && "" != data.nohealth3) || ("-1" == data.nohealth4 && "" != data.nohealth5))
			{
				Alert.show("不健康列没选择对应操作符");
				return false;
			}

			//不能有交集  时间配置相同时则校验
			//比较健康 亚健康行
			if (int(data.health1) == int(data.subhealth1))
			{
				if ("" != data.health3 && "" != data.subhealth3)
				{
					if (int(data.health3) == int(data.subhealth3))
					{
						if (("2" == data.health2 || "3" == data.health2 || "5" == data.health2) && ("2" == data.subhealth2 || "3" == data.subhealth2 || "5" == data.subhealth2))
						{
							Alert.show("健康度算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}
					else if (int(data.health3) > int(data.subhealth3))
					{
						Alert.show("健康度算法数据有交集,或者设置的不符合逻辑，请重新填写！");
						return false;
					}
				}
				if ("" != data.health5 && "" != data.subhealth5)
				{
					if (int(data.health5) == int(data.subhealth5))
					{
						if (("2" == data.health4 || "3" == data.health4 || "5" == data.health4) && ("2" == data.subhealth4 || "3" == data.subhealth4 || "5" == data.subhealth4))
						{
							Alert.show("健康度算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}
					else if (int(data.health5) > int(data.subhealth5))
					{
						Alert.show("健康度算法数据有交集,或者设置的不符合逻辑，请重新填写！");
						return false;
					}
				}

				if ("" != data.health3 && "" != data.subhealth5)
				{
					if (int(data.health3) == int(data.subhealth5))
					{
						if (("2" == data.health2 || "3" == data.health2 || "5" == data.health2) && ("2" == data.subhealth4 || "3" == data.subhealth4 || "5" == data.subhealth4))
						{
							Alert.show("健康度算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}
					else if (int(data.health3) > int(data.subhealth5))
					{
						Alert.show("健康度算法数据有交集,或者设置的不符合逻辑，请重新填写！");
						return false;
					}
				}


				if ("" != data.health5 && "" != data.subhealth3)
				{
					if (int(data.health5) == int(data.subhealth3))
					{
						if (("2" == data.health4 || "3" == data.health4 || "5" == data.health4) && ("2" == data.subhealth2 || "3" == data.subhealth2 || "5" == data.subhealth2))
						{
							Alert.show("健康度算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}
					else if (int(data.health5) > int(data.subhealth3))
					{
						Alert.show("健康度算法数据有交集,或者设置的不符合逻辑，请重新填写！");
						return false;
					}
				}


			}

			//比较健康  不健康航
			if (int(data.health1) == int(data.nohealth1))
			{
				if ("" != data.health3 && "" != data.nohealth3)
				{
					if (int(data.health3) == int(data.nohealth3))
					{
						if (("2" == data.health2 || "3" == data.health2 || "5" == data.health2) && ("2" == data.nohealth2 || "3" == data.nohealth2 || "5" == data.nohealth2))
						{
							Alert.show("健康度算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}
					else if (int(data.health3) > int(data.nohealth3))
					{
						Alert.show("健康度算法数据有交集,或者设置的不符合逻辑，请重新填写！");
						return false;
					}
				}

				if ("" != data.health5 && "" != data.nohealth5)
				{
					if (int(data.health5) == int(data.nohealth5))
					{
						if (("2" == data.health4 || "3" == data.health4 || "5" == data.health4) && ("2" == data.nohealth4 || "3" == data.nohealth4 || "5" == data.nohealth4))
						{
							Alert.show("健康度算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}
					else if (int(data.health5) > int(data.nohealth5))
					{
						Alert.show("健康度算法数据有交集,或者设置的不符合逻辑，请重新填写！");
						return false;
					}
				}

				if ("" != data.health3 && "" != data.nohealth5)
				{
					if (int(data.health3) == int(data.nohealth5))
					{
						if (("2" == data.health2 || "3" == data.health2 || "5" == data.health2) && ("2" == data.nohealth4 || "3" == data.nohealth4 || "5" == data.nohealth4))
						{
							Alert.show("健康度算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}
					else if (int(data.health3) > int(data.nohealth5))
					{
						Alert.show("健康度算法数据有交集,或者设置的不符合逻辑，请重新填写！");
						return false;
					}

				}


				if ("" != data.health5 && "" != data.nohealth3)
				{
					if (int(data.health5) == int(data.nohealth3))
					{
						if (("2" == data.health4 || "3" == data.health4 || "5" == data.health4) && ("2" == data.nohealth2 || "3" == data.nohealth2 || "5" == data.nohealth2))
						{
							Alert.show("健康度算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}
					else if (int(data.health5) > int(data.nohealth3))
					{
						Alert.show("健康度算法数据有交集,或者设置的不符合逻辑，请重新填写！");
						return false;
					}
				}

			}
			//比较不健康  亚健康行
			if (int(data.nohealth1) == int(data.subhealth1))
			{
				if ("" != data.nohealth3 && "" != data.subhealth3)
				{
					if (int(data.nohealth3) == int(data.subhealth3))
					{
						if (("2" == data.nohealth2 || "3" == data.nohealth2 || "5" == data.nohealth2) && ("2" == data.subhealth2 || "3" == data.subhealth2 || "5" == data.subhealth2))
						{
							Alert.show("健康度算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}
					else if (int(data.nohealth3) < int(data.subhealth3))
					{
						Alert.show("健康度算法数据有交集,或者设置的不符合逻辑，请重新填写！");
						return false;
					}
				}

				if ("" != data.nohealth5 && "" != data.subhealth5)
				{
					if (int(data.nohealth5) == int(data.subhealth5))
					{
						if (("2" == data.nohealth4 || "3" == data.nohealth4 || "5" == data.nohealth4) && ("2" == data.subhealth4 || "3" == data.subhealth4 || "5" == data.subhealth4))
						{
							Alert.show("健康度算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}
					else if (int(data.nohealth5) < int(data.subhealth5))
					{
						Alert.show("健康度算法数据有交集,或者设置的不符合逻辑，请重新填写！");
						return false;
					}
				}

				if ("" != data.nohealth3 && "" != data.subhealth5)
				{
					if (int(data.nohealth3) == int(data.subhealth5))
					{
						if (("2" == data.nohealth2 || "3" == data.nohealth2 || "5" == data.nohealth2) && ("2" == data.subhealth4 || "3" == data.subhealth4 || "5" == data.subhealth4))
						{
							Alert.show("健康度算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}
					else if (int(data.nohealth3) < int(data.subhealth5))
					{
						Alert.show("健康度算法数据有交集,或者设置的不符合逻辑，请重新填写！");
						return false;
					}
				}

				if ("" != data.nohealth5 && "" != data.subhealth3)
				{
					if (int(data.nohealth5) == int(data.subhealth3))
					{
						if (("2" == data.nohealth4 || "3" == data.nohealth4 || "5" == data.nohealth4) && ("2" == data.subhealth2 || "3" == data.subhealth2 || "5" == data.subhealth2))
						{
							Alert.show("健康度算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}
					else if (int(data.nohealth5) < int(data.subhealth3))
					{
						Alert.show("健康度算法数据有交集,或者设置的不符合逻辑，请重新填写！");
						return false;
					}
				}

			}

			//健康预测算法
			//每个配置第一列时间不能为空
			if ("" == data.prehealth1 || "" == data.presubhealth1 || "" == data.prenohealth1)
			{
				Alert.show("预测病例记录数不能为空");
				return false;
			}

			//每一列不能同时为空
			if ("" == data.prehealth3 && "" == data.prehealth5)
			{
				Alert.show("预测健康列记录数不能同时配置空");
				return false;
			}
			if ("" == data.presubhealth3 && "" == data.presubhealth5)
			{
				Alert.show("预测亚健康列记录数不能同时配置空");
				return false;
			}
			if ("" == data.prenohealth3 && "" == data.prenohealth5)
			{
				Alert.show("预测不健康列记录数不能同时配置空");
				return false;
			}

			//每一列有符号必须有数值，不配置值则不能选符号
			if (("-1" != data.prehealth2 && "" == data.prehealth3) || ("-1" != data.prehealth4 && "" == data.prehealth5))
			{
				Alert.show("预测健康列记录数为空则不能选择对应的符号");
				return false;
			}
			if (("-1" != data.presubhealth2 && "" == data.presubhealth3) || ("-1" != data.presubhealth4 && "" == data.presubhealth5))
			{
				Alert.show("预测亚健康列记录数为空则不能选择对应的符号");
				return false;
			}
			if (("-1" != data.prenohealth2 && "" == data.prenohealth3) || ("-1" != data.prenohealth4 && "" == data.prenohealth5))
			{
				Alert.show("预测不健康列记录数为空则不能选择对应的符号");
				return false;
			}
			if (("-1" == data.prehealth2 && "" != data.prehealth3) || ("-1" == data.prehealth4 && "" != data.prehealth5))
			{
				Alert.show("预测健康列没选择对应操作符");
				return false;
			}
			if (("-1" == data.presubhealth2 && "" != data.presubhealth3) || ("-1" == data.presubhealth4 && "" != data.presubhealth5))
			{
				Alert.show("预测亚健康列没选择对应操作符");
				return false;
			}
			if (("-1" == data.prenohealth2 && "" != data.prenohealth3) || ("-1" == data.prenohealth4 && "" != data.prenohealth5))
			{
				Alert.show("预测不健康列没选择对应操作符");
				return false;
			}

			//日粒度预算特殊处理第6行
			if ("day" == param.savetype)
			{
				var c6:Boolean = checkNoRelation(data.presubhealthand2, data.presubhealthand3, data.presubhealthand4, data.presubhealthand5, "2", "健康预测算法亚健康数据");
				if (!c6)
				{
					return false;
				}
				if ("" == data.presubhealthand1)
				{
					Alert.show("预测预测病例记录数不能为空");
					return false;
				}
				if (("-1" != data.presubhealthand2 && "" == data.presubhealthand3) || ("-1" != data.presubhealthand4 && "" == data.presubhealthand5))
				{
					Alert.show("预测亚健康列记录数为空则不能选择对应的符号");
					return false;
				}
				if (("-1" == data.presubhealthand2 && "" != data.presubhealthand3) || ("-1" == data.presubhealthand4 && "" != data.presubhealthand5))
				{
					Alert.show("预测亚健康列没选择对应操作符");
					return false;
				}
				if ("" == data.subhealthand3 && "" == data.subhealthand5)
				{
					Alert.show("预测不健康列记录数不能同时配置空");
					return false;
				}

				//数据不能有交集
				//比较预算健康亚健康行
				if (int(data.prehealth1) == int(data.presubhealthand1))
				{
					if ("" != data.prehealth3 && "" != data.presubhealthand3)
					{
						if (int(data.prehealth3) == int(data.presubhealthand3))
						{
							if (("2" == data.prehealth2 || "3" == data.prehealth2 || "5" == data.prehealth2) && ("2" == data.presubhealthand2 || "3" == data.presubhealthand2 || "5" == data.presubhealthand2))
							{
								Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
								return false;
							}
						}
						else if (int(data.prehealth3) > int(data.presubhealthand3))
						{
							Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}

					if ("" != data.prehealth5 && "" != data.presubhealthand5)
					{
						if (int(data.prehealth5) == int(data.presubhealthand5))
						{
							if (("2" == data.prehealth4 || "3" == data.prehealth4 || "5" == data.prehealth4) && ("2" == data.presubhealthand4 || "3" == data.presubhealthand4 || "5" == data.presubhealthand4))
							{
								Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
								return false;
							}
						}
						else if (int(data.prehealth5) > int(data.presubhealthand5))
						{
							Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}

					if ("" != data.prehealth3 && "" != data.presubhealthand5)
					{
						if (int(data.prehealth3) == int(data.presubhealthand5))
						{
							if (("2" == data.prehealth2 || "3" == data.prehealth2 || "5" == data.prehealth2) && ("2" == data.presubhealthand4 || "3" == data.presubhealthand4 || "5" == data.presubhealthand4))
							{
								Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
								return false;
							}
						}
						else if (int(data.prehealth3) > int(data.presubhealthand5))
						{
							Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}

					}

					if ("" != data.prehealth5 && "" != data.presubhealthand3)
					{
						if (int(data.prehealth5) == int(data.presubhealthand3))
						{
							if (("2" == data.prehealth4 || "3" == data.prehealth4 || "5" == data.prehealth4) && ("2" == data.presubhealthand2 || "3" == data.presubhealthand2 || "5" == data.presubhealthand2))
							{
								Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
								return false;
							}
						}
						else if (int(data.prehealth5) > int(data.presubhealthand3))
						{
							Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}

				}

				//比较预算不健康亚健康航
				if (int(data.prenohealth1) == int(data.presubhealthand1))
				{
					if ("" != data.prenohealth3 && "" != data.presubhealthand3)
					{
						if (int(data.prenohealth3) == int(data.presubhealthand3))
						{
							if (("2" == data.prenohealth2 || "3" == data.prenohealth2 || "5" == data.prenohealth2) && ("2" == data.presubhealthand2 || "3" == data.presubhealthand2 || "5" == data.presubhealthand2))
							{
								Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
								return false;
							}
						}
						else if (int(data.prenohealth3) < int(data.presubhealthand3))
						{
							Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}

					if ("" != data.prenohealth5 && "" != data.presubhealthand5)
					{
						if (int(data.prenohealth5) == int(data.presubhealthand5))
						{
							if (("2" == data.prenohealth4 || "3" == data.prenohealth4 || "5" == data.prenohealth4) && ("2" == data.presubhealthand4 || "3" == data.presubhealthand4 || "5" == data.presubhealthand4))
							{
								Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
								return false;
							}
						}
						else if (int(data.prenohealth5) < int(data.presubhealthand5))
						{
							Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}

					if ("" != data.prenohealth3 && "" != data.presubhealthand5)
					{
						if (int(data.prenohealth3) == int(data.presubhealthand5))
						{
							if (("2" == data.prenohealth2 || "3" == data.prenohealth2 || "5" == data.prenohealth2) && ("2" == data.presubhealthand4 || "3" == data.presubhealthand4 || "5" == data.presubhealthand4))
							{
								Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
								return false;
							}
						}
						else if (int(data.prenohealth3) < int(data.presubhealthand5))
						{
							Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}

					if ("" != data.prenohealth5 && "" != data.presubhealthand3)
					{
						if (int(data.prenohealth5) == int(data.presubhealthand3))
						{
							if (("2" == data.prenohealth4 || "3" == data.prenohealth4 || "5" == data.prenohealth4) && ("2" == data.presubhealthand2 || "3" == data.presubhealthand2 || "5" == data.presubhealthand2))
							{
								Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
								return false;
							}
						}
						else if (int(data.prenohealth5) < int(data.presubhealthand3))
						{
							Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}

				}

				//日的 预算 亚健康不能有交集  时间配置相同时则校验
				if (int(data.presubhealth1) == int(data.presubhealthand1))
				{
					Alert.show("预算亚健康的两个时间值不能相同");
					return false;
				}
					//				else if(int(data.presubhealth1) > int(data.presubhealthand1))
					//				{
					//					if()
					//					{
					//					
					//					}
					//				}
					//				else if(int(data.presubhealth1) < int(data.presubhealthand1))
					//				{
					//				
					//				}
			}

			//日周月共有的比较				
			//比较预算健康不健康行
			if (int(data.prehealth1) == int(data.prenohealth1))
			{
				if ("" != data.prehealth3 && "" != data.prenohealth3)
				{
					if (int(data.prehealth3) == int(data.prenohealth3))
					{
						if (("2" == data.prehealth2 || "3" == data.prehealth2 || "5" == data.prehealth2) && ("2" == data.prenohealth2 || "3" == data.prenohealth2 || "5" == data.prenohealth2))
						{
							Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}
					else if (int(data.prehealth3) > int(data.prenohealth3))
					{
						Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
						return false;
					}
				}

				if ("" != data.prehealth5 && "" != data.prenohealth5)
				{
					if (int(data.prehealth5) == int(data.prenohealth5))
					{
						if (("2" == data.prehealth4 || "3" == data.prehealth4 || "5" == data.prehealth4) && ("2" == data.prenohealth4 || "3" == data.prenohealth4 || "5" == data.prenohealth4))
						{
							Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}
					else if (int(data.prehealth5) > int(data.prenohealth5))
					{
						Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
						return false;
					}
				}


				if ("" != data.prehealth3 && "" != data.prenohealth5)
				{
					if (int(data.prehealth3) == int(data.prenohealth5))
					{
						if (("2" == data.prehealth2 || "3" == data.prehealth2 || "5" == data.prehealth2) && ("2" == data.prenohealth4 || "3" == data.prenohealth4 || "5" == data.prenohealth4))
						{
							Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}
					else if (int(data.prehealth3) > int(data.prenohealth5))
					{
						Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
						return false;
					}
				}

				if ("" != data.prehealth5 && "" != data.prenohealth3)
				{
					if (int(data.prehealth5) == int(data.prenohealth3))
					{
						if (("2" == data.prehealth4 || "3" == data.prehealth4 || "5" == data.prehealth4) && ("2" == data.prenohealth2 || "3" == data.prenohealth2 || "5" == data.prenohealth2))
						{
							Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}
					else if (int(data.prehealth5) > int(data.prenohealth3))
					{
						Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
						return false;
					}
				}

			}

			//比较预算健康亚健康行
			if (int(data.prehealth1) == int(data.presubhealth1))
			{
				if ("" != data.prehealth3 && "" != data.presubhealth3)
				{
					if (int(data.prehealth3) == int(data.presubhealth3))
					{
						if (("2" == data.prehealth2 || "3" == data.prehealth2 || "5" == data.prehealth2) && ("2" == data.presubhealth2 || "3" == data.presubhealth2 || "5" == data.presubhealth2))
						{
							Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}
					else if (int(data.prehealth3) > int(data.presubhealth3))
					{
						Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
						return false;
					}
				}

				if ("" != data.prehealth5 && "" != data.presubhealth5)
				{
					if (int(data.prehealth5) == int(data.presubhealth5))
					{
						if (("2" == data.prehealth4 || "3" == data.prehealth4 || "5" == data.prehealth4) && ("2" == data.presubhealth4 || "3" == data.presubhealth4 || "5" == data.presubhealth4))
						{
							Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}
					else if (int(data.prehealth5) > int(data.presubhealth5))
					{
						Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
						return false;
					}
				}

				if ("" != data.prehealth3 && "" != data.presubhealth5)
				{
					if (int(data.prehealth3) == int(data.presubhealth5))
					{
						if (("2" == data.prehealth2 || "3" == data.prehealth2 || "5" == data.prehealth2) && ("2" == data.presubhealth4 || "3" == data.presubhealth4 || "5" == data.presubhealth4))
						{
							Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}
					else if (int(data.prehealth3) > int(data.presubhealth5))
					{
						Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
						return false;
					}
				}

				if ("" != data.prehealth5 && "" != data.presubhealth3)
				{
					if (int(data.prehealth5) == int(data.presubhealth3))
					{
						if (("2" == data.prehealth4 || "3" == data.prehealth4 || "5" == data.prehealth4) && ("2" == data.presubhealth2 || "3" == data.presubhealth2 || "5" == data.presubhealth2))
						{
							Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}
					else if (int(data.prehealth5) > int(data.presubhealth3))
					{
						Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
						return false;
					}
				}

			}

			//比较预算不健康亚健康航
			if (int(data.prenohealth1) == int(data.presubhealth1))
			{
				if ("" != data.prenohealth3 && "" != data.presubhealth3)
				{
					if (int(data.prenohealth3) == int(data.presubhealth3))
					{
						if (("2" == data.prenohealth2 || "3" == data.prenohealth2 || "5" == data.prenohealth2) && ("2" == data.presubhealth2 || "3" == data.presubhealth2 || "5" == data.presubhealth2))
						{
							Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}
					else if (int(data.prenohealth3) < int(data.presubhealth3))
					{
						Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
						return false;
					}
				}

				if ("" != data.prenohealth5 && "" != data.presubhealth5)
				{
					if (int(data.prenohealth5) == int(data.presubhealth5))
					{
						if (("2" == data.prenohealth4 || "3" == data.prenohealth4 || "5" == data.prenohealth4) && ("2" == data.presubhealth4 || "3" == data.presubhealth4 || "5" == data.presubhealth4))
						{
							Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}
					else if (int(data.prenohealth5) < int(data.presubhealth5))
					{
						Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
						return false;
					}
				}

				if ("" != data.prenohealth3 && "" != data.presubhealth5)
				{
					if (int(data.prenohealth3) == int(data.presubhealth5))
					{
						if (("2" == data.prenohealth2 || "3" == data.prenohealth2 || "5" == data.prenohealth2) && ("2" == data.presubhealth4 || "3" == data.presubhealth4 || "5" == data.presubhealth4))
						{
							Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}
					else if (int(data.prenohealth3) < int(data.presubhealth5))
					{
						Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
						return false;
					}
				}

				if ("" != data.prenohealth5 && "" != data.presubhealth3)
				{
					if (int(data.prenohealth5) == int(data.presubhealth3))
					{
						if (("2" == data.prenohealth4 || "3" == data.prenohealth4 || "5" == data.prenohealth4) && ("2" == data.presubhealth2 || "3" == data.presubhealth2 || "5" == data.presubhealth2))
						{
							Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
							return false;
						}
					}
					else if (int(data.prenohealth5) < int(data.presubhealth3))
					{
						Alert.show("健康度预测算法数据有交集,或者设置的不符合逻辑，请重新填写！");
						return false;
					}
				}

			}

			return true;
		}

		//校验一行数据必须有交集 或者趋于无限
		private function checkNoRelation(da2:String, da3:String, da4:String, da5:String, flag:String, type:String):Boolean
		{
			var data2:int = int(da2);
			var data3:int = int(da3);
			var data4:int = int(da4);
			var data5:int = int(da5);
			if ("1" == flag)
			{
				if ("" == da3)
				{
					if (data4 > 3)
					{
						Alert.show(type + "不符合逻辑");
						return false;
					}
				}
				if ("" == da5)
				{
					if (data2 > 3)
					{
						Alert.show(type + "不符合逻辑");
						return false;
					}
				}
			}
			if ("2" == flag)
			{
				if ("" == da3)
				{
					if (data4 != 3)
					{
						Alert.show(type + "不符合逻辑");
						return false;
					}
				}
				if ("" == da5)
				{
					if (data2 != 3)
					{
						Alert.show(type + "不符合逻辑");
						return false;
					}
				}
			}
			if ("3" == flag)
			{
				if ("" == da3)
				{
					if (data4 < 3)
					{
						Alert.show(type + "不符合逻辑");
						return false;
					}
				}
				if ("" == da5)
				{
					if (data2 < 3)
					{
						Alert.show(type + "不符合逻辑");
						return false;
					}
				}
			}
			if ("" != da3 && "" != da5)
			{
				if (data3 > data5)
				{
					if (data2 > data4)
					{
						Alert.show(type + "不符合逻辑");
						return false;
					}
				}
				else if (data3 < data5)
				{
					if (data2 < data4)
					{
						Alert.show(type + "不符合逻辑");
						return false;
					}
				}
				else
				{
					Alert.show("配置" + type + "时请用一个数据为空的方式来代替两数相等的配置方法");
					return false;
				}
			}
			return true;
		}

		//save 日粒度设置
		public function saveDaySet():void
		{
			var flag:Boolean = false;
			if ("day" == param.savetype)
			{
				flag = validataData(param.data, "小时");
			}
			else if ("week" == param.savetype)
			{
				flag = validataData(param.data, "周");
			}
			else if ("month" == param.savetype)
			{
				flag = validataData(param.data, "月");
			}
			if (flag)
			{
				var evt:SetFaceEvent = new SetFaceEvent(SetFaceEvent.SAVE_HEALTHSET_DATA);
				evt.param = param;
				dispatchMsg(evt);
			}
		}

	}
}