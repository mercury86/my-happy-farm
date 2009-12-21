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
			this.showCloseBtn = true;
		}
		
		override protected function main():void 
		{
			super.main();
			
			var array:Array = new Array();
		
			for (var i:int = 0; i < 50; i++ )
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
			grid = new Grid(this.dialogMc.width,this.dialogMc.height-80);
			grid.x = 80;
			grid.y = 40;
			grid.dataProvider = array;
			this.dialogMc.addChild(grid);
			grid.validateNow();
		}
		
		override protected function addEventFun():void
		{
			super.addEventFun();
			
			grid.addEventListener(MouseEvent.CLICK, doItemClick);
			this.dialogMc.current_btn.addEventListener(MouseEvent.CLICK,doCurrent);
			this.dialogMc.history_btn.addEventListener(MouseEvent.CLICK,doHistory);
		}
		
		private function showGrid(array:Array):void 
		{
			grid.dataProvider = array;
			grid.validateNow();
		}
		
		private function doCurrent(e:MouseEvent):void 
		{
			showGrid(new Array());
		}
		
		private function doHistory(e:MouseEvent):void 
		{
			showGrid(new Array());
		}
	
		private function doItemClick(event:Event):void
		{
			var item:WarehouseItem = new WarehouseItem();
			var gridItem:GridItem = event.target as GridItem;
			if (gridItem == null) return;
			
			item.warehouseVO = gridItem.gridDataDispVO.item as WarehouseVO;
			this.addChild(item);
			
		}
		
		override protected function removEvent():void
		{
			super.removEvent();
			grid.removeEventListener(MouseEvent.CLICK,doItemClick);
		}
		
		override protected function dispose():void
		{
			super.dispose();
		}
		
	}

}