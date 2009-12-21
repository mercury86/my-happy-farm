package data.vo 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author ...
	 */
	public class GridDataDispVO
	{
		
		public function GridDataDispVO() 
		{
			
		}
		
		private var _item:Object;
		private var _item_bg_mc:MovieClip
		
		public function get item():Object { return _item; }
		
		public function set item(value:Object):void 
		{
			_item = value;
		}
		
		public function get item_bg_mc():MovieClip { return _item_bg_mc; }
		
		public function set item_bg_mc(value:MovieClip):void 
		{
			_item_bg_mc = value;
		}
		
	}

}