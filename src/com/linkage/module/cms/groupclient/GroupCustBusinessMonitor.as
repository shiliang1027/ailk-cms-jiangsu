// ActionScript file
import com.linkage.module.cms.components.loadmanager.LoadManager;
import com.linkage.module.cms.groupclient.control.GroupCustBusinessModuleControl;
import com.linkage.module.cms.groupclient.event.RealMonitorPerfCompEvent;
import com.linkage.system.logging.ILogger;
import com.linkage.system.logging.ILoggingTarget;
import com.linkage.system.logging.Log;
import com.linkage.system.logging.LogEventLevel;
import com.linkage.system.logging.targets.MonsterTarget2;

import mx.events.EffectEvent;
import mx.events.FlexEvent;

public var parameters:Object;
public var loadManager:LoadManager;

private var control:GroupCustBusinessModuleControl=null;

private static var log:ILogger = Log.getLogger("com.linkage.module.cms.groupclient.control.GroupBusinessMonitor");

protected function groupMonitorModule_creationCompleteHandler(event:FlexEvent):void
{
	//初始化日志
	var target:ILoggingTarget = new MonsterTarget2();
	target.level = LogEventLevel.INFO;
	target.filters = ["com.linkage.module.cms.groupclient*"];
	Log.addTarget(target);
	log.info('日志初始化完成~');
	// TODO Auto-generated method stub
	System.useCodePage=true;
	parameters=parentApplication.parameters;
	styleManager.loadStyleDeclarations2(parameters["styleUrl"], true);
	styleManager.loadStyleDeclarations2(parameters["topoStyle"], true);
	loadManager=parentApplication.loadManager;
	Config.init();
	control=new GroupCustBusinessModuleControl(this);
	//集客性能查询
	control.queryCustBusiness();
}

protected function fadeEffect_effectEndHandler(event:EffectEvent):void
{
}
protected function runMonitorPerf_perfQueryHandler(event:RealMonitorPerfCompEvent):void
{
	control.perfQuery(event.param);
}


protected function runMonitorPerf_serverQueryHandler(event:RealMonitorPerfCompEvent):void
{
	control.perfServerTypeQuery();
}
protected function runMonitorPerf_serverTargetQueryHandler(event:RealMonitorPerfCompEvent):void
{
	control.perfServerTargetQuery(event.param);
}

protected function runHistoryMonitorPerf_perfQueryHandler(event:RealMonitorPerfCompEvent):void
{
	control.hisPerfQuery(event.param);
}
protected function runHistoryMonitorPerf_serverQueryHandler(event:RealMonitorPerfCompEvent):void
{
	control.hisPerfServerTypeQuery();
}


protected function runHistoryMonitorPerf_serverTargetQueryHandler(event:RealMonitorPerfCompEvent):void
{
	control.hisPerfServerTargetQuery(event.param);
}
