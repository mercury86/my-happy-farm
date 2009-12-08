package view.plant 
{
	import flash.display.MovieClip;
	
	/**
	 * Plant类用来将所有植物的共性集合起来
	 * @author zhengzihua
	 */
	public class Plant extends MovieClip
	{
		private var _row:int;
		private var _cols:int;
		private var displayMc:MovieClip;
		public function Plant(mc:MovieClip) 
		{
			displayMc = mc;
		}
		public function reap():void {
			
		}
		public function killWorm():void {
			
		}
		public function putWorm():void {
			
		}
		public function gotoStatus():void {
			
		}
		public function delThis():void {
			
		}
		public function get row():int { return _row; }
		
		public function set row(value:int):void 
		{
			_row = value;
		}
		
		public function get cols():int { return _cols; }
		
		public function set cols(value:int):void 
		{
			_cols = value;
		}
		
	}
	
}