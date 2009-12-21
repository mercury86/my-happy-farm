package view.warehouse
{
	import data.vo.WarehouseVO;
	import view.friend.HeadPhoto;
	
	import view.DialogBase;
	
	public class WarehouseItem extends DialogBase
	{
		public var warehouseVO:WarehouseVO;
		
		public function WarehouseItem()
		{
			this.dialogMcName = "warehouse_item_mc";
			this.showCloseBtn = true;
		}
		
		
		override protected function main():void 
		{
			var head_photo:HeadPhoto = new HeadPhoto(this.dialogMc.head_img_mc);
			head_photo.loadPhoto("1.jpg");
		}
	
		
		override protected function addEventFun():void
		{
			super.addEventFun();
		}
	
		override protected function removEvent():void
		{
			super.removEvent();
		}
		
		override protected function dispose():void
		{
			super.dispose();
		}
	}
}