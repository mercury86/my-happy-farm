package socket 
{
	import com.event.EventZheng;
	import com.utils.BatchLoad;
	import com.utils.DebugTrace;
	import data.EventConst;
	
	/**
	 * 收到登陆数据，导入植物素材
	 * @author zhengzihua
	 */
	public class DealLoginInfo 
	{
		
		private static var instance:DealLoginInfo;
		public function DealLoginInfo(signleton:SingletonRequest) 
		{
			
		}
		public static function getInstance():DealLoginInfo {
			if (instance == null) {
				instance = new DealLoginInfo(new SingletonRequest());
			}else {
				DebugTrace.dtrace("code info DealLoginInfo.as:已经实例化")
			}
			return instance;
		}
		public function dealLogin(obj:Object):void {
			var num:int = obj.resources.plantNum;
			var url:String = obj.resources.plantUrl;
			var loadArr:Array = [];
			for (var i:int = 0; i < num; i++ ) {
				loadArr.push(url + "/plant_" + i + ".swf");
			}
			DebugTrace.dtrace("code info DealLoginInfo.as:素材数"+num)
			DebugTrace.dtrace("code info DealLoginInfo.as:素材路径" + url);
			DebugTrace.dtrace("code info DealLoginInfo.as:loadArr---" + loadArr);
			var batchLoad:BatchLoad = new BatchLoad(loadArr, "same", EventConst.EVENT_LIB_LOADCOMPLETE);
			batchLoad.load();
			batchLoad.addEventListener(EventConst.EVENT_LIB_LOADCOMPLETE, loaded);
			function loaded(e:EventZheng):void {
				batchLoad.removeEventListener(EventConst.EVENT_LIB_LOADCOMPLETE, loaded);
				Main.thisStage.dispatchEvent(new EventZheng(EventConst.EVENT_LIB_LOADCOMPLETE));
				DebugTrace.dtrace("code info DealLoginInfo.as:素材导入完成------------------------");
			}
		}
	}
	
}
class SingletonRequest{}