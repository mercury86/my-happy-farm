package view 
{
	import com.utils.DebugTrace;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import socket.RequestToServer;
	import utils.CoordinateTransform;
	
	/**
	 * ...
	 * @author zhengzihua
	 */
	public class ExpandMc extends Sprite
	{
		private var row:int;
		private var cols:int;
		private var mc:Expand_mc;
		public function ExpandMc() 
		{
			mc = new Expand_mc();
			addChild(mc);
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			reqExpand();
			
		}
		public function putMc(row:int,cols:int):void {
			var p:Array = CoordinateTransform.coorTransform(row, cols);
			mc.x = p[0];
			mc.y = p[1];
		}
		public function reqExpand():void {
			DebugTrace.dtrace("code info ExplantMc.as:点击扩建牌，弹出提示框。");
			var requestExpand:RequestToServer = RequestToServer.getInstance();
			requestExpand.req_expendLand();
		}
	}
	
}