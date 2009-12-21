package view.warehouse 
{
	import data.vo.GridDataDispVO;
	import data.vo.WarehouseVO;
	import flash.events.MouseEvent;
	
	import flash.events.Event;
	
	import utils.grid.Grid;
	import utils.grid.GridItem;
	
	import view.DialogBase;
	import view.GetMovieClip;
	
	/**
	 * ...
	 * @author ...
	 */
	public class WarehouseDialog extends DialogBase
	{
		
		private var grid:Grid = null;
		
		public function WarehouseDialog() 
		{
			this.dialogMcName = "testDialog";
		}
		
		override protected function main():void 
		{
			super.main();
			
			var array:Array = new Array();
		
			for (var i:int = 0; i < 17; i++ )
			{
				var gridDataDispVO:GridDataDispVO = new GridDataDispVO();
				
				gridDataDispVO.item_bg_mc = GetMovieClip.getMovieClip("warehouse_mc");
				
				var warehouseVO:WarehouseVO = new WarehouseVO();
				warehouseVO.count = i * 100;
				
				gridDataDispVO.item = warehouseVO;
				
				var tempVO:WarehouseVO = gridDataDispVO.item as WarehouseVO;
				
				gridDataDispVO.item_bg_mc.num_txt.text = tempVO.count;
				array.push(gridDataDispVO);
			}
			
			createChild(array);
		}
		
		private function createChild(array:Array):void
		{
			grid = new Grid(this.dialogMc.width,this.dialogMc.height);
			grid.x = 80;
			grid.y = 40;
			grid.dataProvider = array;
			this.dialogMc.addChild(grid);
			grid.validateNow();
		}
		
		override protected function addEventFun():void
		{
			super.addEventFun();
			
			grid.addEventListener(MouseEvent.CLICK,doItemClick);
		}
	
		private function doItemClick(event:Event):void
		{
			var item:WarehouseItem = new WarehouseItem();
			trace(event.target)
			var gridItem:GridItem = event.target as GridItem;
			if(gridItem is GridItem)
			{
				item.warehouseVO = gridItem.gridDataDispVO.item as WarehouseVO;
				this.addChild(item);
			}
		}
		
		override protected function removEvent():void
		{
			super.addEventFun();
			grid.removeEventListener(Grid.ITEM_CLICK,doItemClick);
		}
		
		override protected function dispose():void
		{
			super.dispose();
		}
		
	}

}