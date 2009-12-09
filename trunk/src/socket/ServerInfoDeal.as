package socket 
{
	import com.utils.DebugTrace;
	import flash.events.StatusEvent;
	import flash.net.LocalConnection;
	
	/**
	 * ...
	 * @author zhengzihua
	 */
	public class ServerInfoDeal 
	{
		private static var mainInstance:Main
		private static var mySend:LocalConnection;
		private static var myRec:LocalConnection;
		public function ServerInfoDeal() 
		{
			
		}
		public static function connectServer(main:Main) {
			mainInstance = main;
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
		public static function farmDeal(str:String) {
			var obj:Object = parseInfo(str);
			dealInfo(mainInstance, obj);
		}
		public static function parseInfo(str:String):Object {
			return "";
		}
		public static function dealInfo(main:Main, obj:Object):void {
			
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