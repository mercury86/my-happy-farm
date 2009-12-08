package  
{
	import com.event.EventZheng;
	import data.EventConst;
	import flash.events.EventDispatcher;
	
	/**
	 * ...
	 * @author zhengzihua
	 */
	public class MainData extends EventDispatcher
	{
		private var _login:Boolean;
		private var _isMyFarm:Boolean;
		private var _operate:String;
		public function MainData() 
		{
			
		}
		
		public function get operate():String { return _operate; }
		
		public function set operate(value:String):void 
		{
			_operate = value;
			var event:EventZheng = new EventZheng(EventConst.EVENT_CHANGE_OPERATE);
			event.obj.operate = value;
			dispatchEvent(event);
			
		}
		
		public function get login():Boolean { return _login; }
		
		public function set login(value:Boolean):void 
		{
			_login = value;
		}
		
		public function get isMyFarm():Boolean { return _isMyFarm; }
		
		public function set isMyFarm(value:Boolean):void 
		{
			_isMyFarm = value;
		}
		
	}
	
}