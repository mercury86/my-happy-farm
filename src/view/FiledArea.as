package view 
{
	import com.event.EventZheng;
	import data.EventConst;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author zhengzihua
	 */
	public class FiledArea extends Sprite
	{
		private var field:Field;
		private var crop:Plant;
		private var row:int;
		private var cols:int;
		
		public function FiledArea() 
		{
			addEvent();
		}
		private function addEvent():void {
			addEventListener(MouseEvent.CLICK, onClick);
			addEventListener(MouseEvent.ROLL_OVER, onOver);
			addEventListener(MouseEvent.ROLL_OUT, onOut);
		}
		
		private function onOut(e:MouseEvent):void 
		{
			
		}
		
		private function onOver(e:MouseEvent):void 
		{
			
		}
		
		private function onClick(e:MouseEvent):void 
		{
			Main.mainControl.onAreaClick();
		}
		public function hoeing():void {
			field.hoeing();
		}
		public function watering():void {
			field.watering();
		}
		public function killWeed():void {
			field.killWeed();
		}
		public function putWeed():void {
			field.putWeed();
		}
		public function reap():void {
			crop.reap();
		}
		public function killWorm():void {
			crop.killWorm();
		}
		public function putWorm():void {
			crop.putWorm();
		}
	}
	
}