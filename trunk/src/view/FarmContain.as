package view 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author zhengzihua
	 */
	public class FarmContain extends Sprite
	{
		private var objArr:Array=[];
		public function FarmContain() 
		{
		
		}
		override public function addChild(child:DisplayObject):DisplayObject {
			super.addChild(child);
			objArr.push(child);
			sortOnUpdate();
			return child;		
		}
		private function sortOnUpdate():void {
			var num:int = objArr.length;
			if(num>1)objArr.sortOn("y", Array.NUMERIC);
			for (var i:int = 0; i < num && num > 1; i++ ) {
				var mc:Sprite = objArr[i] as Sprite;
				setChildIndex(mc, i);
			}
		}
		
	}
	
}