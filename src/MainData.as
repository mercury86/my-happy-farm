package  
{
	import com.event.EventZheng;
	import com.utils.DebugTrace;
	import data.EventConst;
	import flash.events.EventDispatcher;
	
	/**
	 * ...
	 * @author zhengzihua
	 */
	public class MainData extends EventDispatcher
	{
		private var _login:Boolean;
		private var _farmID:int;
		private var _operate:String;
		private var _bgUrl:String;
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
			DebugTrace.dtrace("code info MainData.as:当前操作为" + value);
		}
		
		public function get login():Boolean { return _login; }
		
		public function set login(value:Boolean):void 
		{
			_login = value;
		}
		
		public function get farmID():int { return _farmID; }
		
		public function set farmID(value:int):void 
		{
			_farmID = value;
		}
		
		public function get bgUrl():String { return _bgUrl; }
		
		public function set bgUrl(value:String):void 
		{
			_bgUrl = value;
			var event:EventZheng = new EventZheng(EventConst.EVENT_CHANGE_BG);
			event.obj.bgUrl = value;
			dispatchEvent(event);
		}
		
	}
	
}