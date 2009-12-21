package utils.grid
{
	import data.vo.GridDataDispVO;
	import flash.display.MovieClip;
	
	import flash.display.Sprite;
	
	import view.friend.HeadPhoto;
	
	public class GridItem extends Sprite
	{
		
		private var _gridDataDispVO:GridDataDispVO;
		
		public function GridItem(gridDataDispVO:GridDataDispVO)
		{
			this.mouseChildren = false;
			this._gridDataDispVO = gridDataDispVO;
			this.addChild(gridDataDispVO.item_bg_mc);
			
			var head_photo:HeadPhoto = new HeadPhoto(gridDataDispVO.item_bg_mc.img_mc);
			head_photo.loadPhoto("1.jpg");
		}
		
		public function get gridDataDispVO():GridDataDispVO { return _gridDataDispVO; }
		
	}
}