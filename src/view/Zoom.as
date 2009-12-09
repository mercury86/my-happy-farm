package view 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author zhengzihua
	 */
	public class Zoom extends MovieClip
	{
		private var mc:Sprite;
		private var scale:int;
		public function Zoom(mc:Sprite,scale:int) 
		{
			this.mc = mc;
			this.scale = scale;
		}
		public function zoomIn(mc:Sprite,scale:int):void {
			trace("放大");
		}
		public function zoomOut(mc:Sprite,scale:int):void {
			trace("缩小");
		}
		
	}
	
}