package view 
{
	import com.event.EventZheng;
	import data.EventConst;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author zhengzihua
	 */
	public class BottomBar extends MovieClip
	{
		private var _operate:String="";
		public function BottomBar(cx:int,cy:int) 
		{
			x = cx;
			y = cy;
			addEvent();
		}
		private function addEvent():void {
			
			select_mc.addEventListener(MouseEvent.CLICK, function (e:MouseEvent):void { operate = "select" } );
			hoeing_mc.addEventListener(MouseEvent.CLICK, function (e:MouseEvent):void { operate = "hoeing" } );
			watering_mc.addEventListener(MouseEvent.CLICK, function (e:MouseEvent):void { operate = "watering"} );
			killWorm_mc.addEventListener(MouseEvent.CLICK, function (e:MouseEvent):void { operate = "killWorm" } );
			killWeed_mc.addEventListener(MouseEvent.CLICK, function (e:MouseEvent):void { operate = "killWeed" } );
			reap_mc.addEventListener(MouseEvent.CLICK, function (e:MouseEvent):void { operate = "reap" } );
		}
		public function get operate():String { return _operate; }
		
		public function set operate(value:String):void 
		{
			_operate = value;
			MainView.mainData.operate = value;
		}
		
	}
	
}