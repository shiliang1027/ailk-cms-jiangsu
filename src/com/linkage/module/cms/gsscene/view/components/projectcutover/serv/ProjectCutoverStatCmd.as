package com.linkage.module.cms.gsscene.view.components.projectcutover.serv
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;
    import com.linkage.module.cms.gsscene.view.components.common.event.SceneEvent;
    import com.linkage.module.cms.gsscene.view.components.projectcutover.ProjectCutoverStatDM;
    import com.linkage.module.cms.gsscene.view.components.projectcutover.dao.IProjectCutoverStatDao;
    import com.linkage.module.cms.gsscene.view.components.projectcutover.event.ProjectCutoverStatEvent;
    
    import flash.events.Event;
    
    import mx.collections.IList;
    import mx.rpc.AsyncToken;
    import mx.rpc.Fault;

    public class ProjectCutoverStatCmd
    {
        private var log:ILogger = Log.getLoggerByClass(ProjectCutoverStatCmd);

        [Inject("projectCutoverStatDM")]
        public var dm:ProjectCutoverStatDM;

        [Inject("projectCutoverStatDao")]
        public var dao:IProjectCutoverStatDao;

        [Inject("user")]
        public var user:IUser;

        [MessageDispatcher]
        public var msgDispatcher:Function;

        public function execute(e:ProjectCutoverStatEvent):AsyncToken
        {
            log.info("调用远程方法，加载 工程割接(地市维度) 数据！");
            return dao.loadProjectCutoverData();
        }

        public function result(data:Object):void
        {
            log.info("加载 工程割接(地市维度) 数据成功！");

            dm.projectListCity.removeAll();
            dm.projectListCity.addAll(data['city'] as IList);
            log.info(dm.projectListCity);
			
			msgDispatcher(new Event("REQUEST_COMPLETE"));
        }

        public function error(f:Fault):void
        {
			msgDispatcher(new Event("REQUEST_COMPLETE"));
            log.error("加载 工程割接(地市维度) 数据错误：" + f.faultString + "\n" + f.faultDetail);
        }
    }
}

