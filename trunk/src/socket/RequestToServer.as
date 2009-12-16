package socket 
{
	import com.adobe.serialization.json.JSON;
	
	/**
	 * ...
	 * @author zhengzihua
	 */
	public class RequestToServer 
	{
		
		public function RequestToServer() 
		{
			
		}
		public static function login(uid:int):void {
			ServerInfoDeal.sendMsg({"reqType":100001,"uid":0001});
		}
		
	}
	
}