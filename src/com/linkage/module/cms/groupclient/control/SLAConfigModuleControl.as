package com.linkage.module.cms.groupclient.control
{
	import com.linkage.module.cms.components.loadmanager.LoadManager;
	import com.linkage.module.cms.groupclient.SLAConfigModule;
	import com.linkage.module.cms.groupclient.data.SLADataManager;
	import com.linkage.module.cms.groupclient.data.SLADataManagerBS;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;
	import com.linkage.system.logging.targets.DeMonsterTarget;
	import com.linkage.system.utils.StringUtils;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.containers.FormItem;
	import mx.controls.Alert;
	import mx.events.ListEvent;
	import mx.events.ValidationResultEvent;
	import mx.rpc.events.FaultEvent;
	import mx.validators.NumberValidator;
	import mx.validators.NumberValidatorDomainType;
	import mx.validators.Validator;
	
	import spark.components.TextInput;

	/**
	 * SLA设置控制类
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-6-27 上午11:43:54
	 * @category com.linkage.module.cms.groupclient.control
	 * @copyright 南京联创科技 网管开发部
	 */
	public class SLAConfigModuleControl extends EventDispatcher
	{
		private var app:SLAConfigModule;
		private var dataManager:SLADataManager;
		private var loadManager:LoadManager;
		// log
		private static var log:ILogger=Log.getLogger("com.linkage.module.cms.groupclient.control.SLAConfigControl");
		private var user:Object;

		public function SLAConfigModuleControl(app:SLAConfigModule, target:IEventDispatcher=null)
		{
			super(target);
			this.app=app;
			loadManager = app.loadManager;
			dataManager=new SLADataManagerBS(String(app.parameters["urlContext"]));
		}

		public function initData():void
		{
			loadManager.showLoading();
			var param:Object=new Object();
			dataManager.getSLAXml(param, getSLAXmlHandler);
			dataManager.getSafeLevel(param, getSafeLevelHandler);
		}

		private function getSLAXmlHandler(result:Object):void
		{
			try
			{
				log.info("[getSLAXmlHandler]result:" + result.toString());
				app.treeData=new XML(result.toString());
			}
			catch (e:Error)
			{
				Alert.show(e.message.toString(), "ERROR");
				return;
			}
			app.tree.validateNow();
			app.tree.expandItem(app.treeData[0], true);
			app.tree.selectedItem=app.treeData.children()[0];
			app.tree.dispatchEvent(new ListEvent(ListEvent.CHANGE));
		}

		private var formTextArray:Array;
		private var formValidArray:Array;

		private function getSafeLevelHandler(result:Object):void
		{
			formTextArray=new Array();
			formValidArray=new Array();
			for each (var data:Object in result)
			{
				log.info("[getSafeLevelHandler]id:" + data["id"] + ",name:" + data["name"]);
				var formItem:FormItem=new FormItem();
				formItem.label=data["name"] + "不可用时长不超过";
				var valueInput:TextInput=new TextInput();
				valueInput.id=data["id"];
				valueInput.text="0";
				formItem.addElement(valueInput);
				app.configForm.addElement(formItem);
				var numberValidator:NumberValidator=new NumberValidator();
				numberValidator.source=valueInput;
				numberValidator.property="text";
				numberValidator.integerError="请输入数字";
				//numberValidator.domain=NumberValidatorDomainType.REAL;
				numberValidator.required=true;
				formValidArray.push(numberValidator);
				formTextArray.push(valueInput);
			}
			var param:Object=new Object();
			dataManager.getSLAConfig(param,getSLAConfigHandler);
		}
		private var SLAConfigDataArray:Array = new Array;
		private function getSLAConfigHandler(result:Object):void{
			for(var key:String in result){
				log.info("[getSLAConfigHandler]key:"+key+","+result[key]);
				SLAConfigDataArray[key]=result[key];
			}
			showConfigValue();
		}
		
		public function showConfigValue():void{
			var servType:String = String(app.selectNode.@id);
			for each (var valueInput:TextInput in formTextArray)
			{
				var value:String = "0";
				if(SLAConfigDataArray[servType] && SLAConfigDataArray[servType][valueInput.id]){
					value = String(SLAConfigDataArray[servType][valueInput.id]);
				}
				log.info("[showConfigValue]id:"+valueInput.id+",value:"+value);
				valueInput.text = value;
			}
			loadManager.hideLoading();
		}

		public function saveConfig():void
		{
			var validatorErrorArray:Array=Validator.validateAll(formValidArray);
			if (validatorErrorArray.length > 0)
			{
				var err:ValidationResultEvent;
				var errorMessageArray:Array=[];
				for each (err in validatorErrorArray)
				{
					var errField:String=FormItem(err.currentTarget.source.parent).label
					errorMessageArray.push(errField + ": " + err.message);
				}
				Alert.show(errorMessageArray.join("\n\n"), "表单错误", Alert.OK);
				return;
			}
			
			var param:Object=new Object();
			param.servType=String(app.selectNode.@id);
			var valueObj:Object=new Object();
			for each (var valueInput:TextInput in formTextArray)
			{
				
				if(StringUtils.isEmpty(valueInput.text)){
					continue;
				}
				log.info("[saveConfig]id:" + valueInput.id + ",value:" + valueInput.text);
				valueObj[valueInput.id]=valueInput.text;
			}
			param.value=valueObj;
			var flag:String="0";
			if(SLAConfigDataArray[param.servType]){
				flag = "1";
			}
			SLAConfigDataArray[param.servType]=valueObj;
			param.flag=flag;
			log.info("[saveConfig param]servType:" + param.servType + ",value:" + param.value+",flag:"+param.flag);
			dataManager.addSLA(param,addSLAHandler,onComplete,onError);
			loadManager.showLoading("正在提交，请稍后");
		}
		
		private function addSLAHandler(result:Object):void{
			loadManager.hideLoading();
			log.info("[addSLAHandler]result:"+result);
			Alert.show(Number(result)==1?"保存成功":"保存失败","提示");
		}
		
		public function resetConfig():void
		{
			for each (var valueInput:TextInput in formTextArray)
			{
				valueInput.text = "0";
				log.info("[resetConfig]id:" + valueInput.id + ",value:" + valueInput.text);
			}
		}
		
		private function onComplete():void{
			
		}
		private function onError(event:FaultEvent):void{
			loadManager.hideLoading();
		}
	}
}