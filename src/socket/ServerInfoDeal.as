package socket 
{
	import com.adobe.serialization.json.JSON;
	import com.utils.DebugTrace;
	import flash.events.StatusEvent;
	import flash.net.LocalConnection;
	
	/**
	 * ...
	 * @author zhengzihua
	 */
	public class ServerInfoDeal 
	{
		
		private static var mainView:MainView
		private static var mySend:LocalConnection;
		private static var myRec:LocalConnection;
		public function ServerInfoDeal() 
		{
			
		}
		public static function connectServer(view:MainView) {
			mainView = view;
			myRec = new LocalConnection();
			mySend = new LocalConnection();
			myRec.connect("localFarm");
			myRec.client = ServerInfoDeal;
			mySend.addEventListener(StatusEvent.STATUS,onStatus);
		}
		
		static private function onStatus(e:StatusEvent):void 
		{
			switch (e.level) {
				case "status" :
					DebugTrace.dtrace("suc-----------------");
					break;
				case "error" :
					DebugTrace.dtrace("error---------------");
					break;
			}	
		}
		public static function farmDeal(str:String):void {
			DebugTrace.dtrace("code info ServerInfoDeal.as:收到信息："+str)
			var obj:Object = JSON.decode(str);
			dealInfo(mainView, obj);
		}
		public static function dealInfo(mainView:MainView, obj:Object):void {
			DebugTrace.dtrace("code info SeverInfoDeal.as:类型--" + obj.reqType);
			switch(obj.reqType) {
				case "100002"://用户信息
					DealUserInfo.dealUserInfo(mainView, obj);
					break;
				case "100003":
					break;
				default:
					DebugTrace.dtrace("code error ServerInfoDeal.as:没有的类型.")
					break;			
			}
		}
		public static function sendMsg(str:String) {
			try{
				mySend.send("localImitation", "imitationDeal", str);
			}catch (e:Error) {
				DebugTrace.dtrace("error code LocalComm:" + e);
			}
		}
		
	}
	
}
