package view.plant 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author zhengzihua
	 */
	public class PlantInstance extends MovieClip implements IPlant
	{
		private var parentPlant:Plant;
		private var displayMc:MovieClip;//显示的mc
		public function PlantInstance(mc:MovieClip)
		{
			this.displayMc = mc;
			parentPlant = new Plant(mc);
			addChild(mc);
		}
		
		public function reap():void {
			parentPlant.reap();
		}
		public function killWorm():void {
			parentPlant.killWorm();
		}
		public function putWorm():void {
			parentPlant.putWorm();
		}
		public function gotoStatus():void {
			parentPlant.gotoStatus()
		}
		public function delThis():void {
			parentPlant.delThis();
		}
		
		public function get row():int { return parentPlant.row; }
		
		public function set row(value:int):void 
		{
			parentPlant.row = value;
			
		}
		
		public function get cols():int { return parentPlant.cols; }
		
		public function set cols(value:int):void 
		{
			parentPlant.cols = value;
		}
		
	}
	
}